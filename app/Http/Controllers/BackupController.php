<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\Process\Process;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Exception\ProcessFailedException;

class BackupController extends Controller
{
    public function indexBackup(Request $request)
    {
        return view('backup.index');
    }

    public function indexRestore(Request $request)
    {
        return view('restore.index');
    }

    public function exportBackup()
    {
        try {
            $databaseName = config('database.connections.mysql.database');
            $username = config('database.connections.mysql.username');
            $password = config('database.connections.mysql.password');
            $host = config('database.connections.mysql.host');
            
            if (empty($databaseName)) {
                throw new \Exception('Nombre de base de datos no configurado');
            }

            $backupPath = storage_path('app/backups');
            if (!file_exists($backupPath)) {
                mkdir($backupPath, 0777, true);
            } else {
                chmod($backupPath, 0777);
            }

            $filename = "{$databaseName}_" . date('Y_m_d_His') . ".sql";
            $filePath = str_replace('\\', '/', $backupPath . '/' . $filename);

            touch($filePath);
            chmod($filePath, 0777);

            $command = [
                'C:\\xampp\\mysql\\bin\\mysqldump',
                "-u{$username}",
                "--databases",        // Incluye CREATE DATABASE y USE DATABASE
                "--add-drop-database",// Agrega DROP DATABASE IF EXISTS
                "--routines",         // Incluye procedimientos almacenados y funciones
                "--triggers",         // Incluye triggers
                "--events",           // Incluye eventos
                "--add-drop-table",   // Agrega DROP TABLE IF EXISTS
                "--create-options",   // Incluye opciones de CREATE TABLE
                "--set-charset",      // Configura el charset
                "--no-tablespaces"    // Evita problemas de permisos con tablespaces
            ];

            if (!empty($password)) {
                $command[] = "-p{$password}";
            }

            $command[] = "-h{$host}";
            $command[] = $databaseName;
            $command[] = "--result-file={$filePath}";

            \Log::info('Comando a ejecutar: ' . implode(' ', $command));

            $process = new Process($command);
            $process->setTimeout(3600);
            
            $process->mustRun();

            if (file_exists($filePath) && filesize($filePath) > 0) {
                $header = "-- Base de datos: `{$databaseName}`\n";
                $header .= "-- Fecha de exportación: " . date('Y-m-d H:i:s') . "\n";
                $header .= "-- Servidor: {$host}\n\n";
                
                $content = file_get_contents($filePath);
                file_put_contents($filePath, $header . $content);

                return response()->download($filePath)->deleteFileAfterSend(true);
            } else {
                throw new \Exception('El archivo de backup no se generó correctamente');
            }

        } catch (ProcessFailedException $exception) {
            \Log::error('Error en backup de base de datos: ' . $exception->getMessage());
            \Log::error('Comando intentado: ' . implode(' ', $command));
            \Log::error('Working directory: ' . getcwd());
            return back()->with('error', 'Error al exportar la base de datos: ' . $exception->getMessage());
        } catch (\Exception $e) {
            \Log::error('Error general en backup: ' . $e->getMessage());
            return back()->with('error', 'Error inesperado: ' . $e->getMessage());
        }
    }
    
    public function importBackup(Request $request)
    {
        $request->validate([
            'backup_file' => [
                'required',
                'file',
                function ($attribute, $value, $fail) {
                    if (strtolower($value->getClientOriginalExtension()) !== 'sql') {
                        $fail('El archivo debe ser un archivo SQL válido.');
                    }
                },
            ]
        ], [
            'backup_file.required' => 'Por favor, selecciona un archivo de respaldo.',
            'backup_file.file' => 'Debe ser un archivo.',
        ]);

        try {
            $databaseName = config('database.connections.mysql.database');
            $username = config('database.connections.mysql.username');
            $password = config('database.connections.mysql.password');
            $host = config('database.connections.mysql.host');

            if (empty($databaseName)) {
                throw new \Exception('Nombre de base de datos no configurado');
            }

            // Almacena el archivo
            $originalName = $request->file('backup_file')->getClientOriginalName();
            $filename = 'import_' . time() . '_' . preg_replace('/[^a-zA-Z0-9.]/', '_', $originalName);
            $filePath = $request->file('backup_file')->storeAs('backups', $filename);
            $fullPath = storage_path('app/' . $filePath);

            if (!file_exists($fullPath) || !is_readable($fullPath)) {
                throw new \Exception('No se puede acceder al archivo de respaldo');
            }

            // Leer el contenido del archivo SQL
            $sqlContent = file_get_contents($fullPath);
            
            // Dividir el contenido en declaraciones SQL individuales
            $statements = $this->splitSqlFile($sqlContent);
            
            // Crear la base de datos si no existe
            $createDbCommand = sprintf(
                '"C:\\xampp\\mysql\\bin\\mysql.exe" --user=%s --host=%s %s -e "CREATE DATABASE IF NOT EXISTS %s"',
                escapeshellarg($username),
                escapeshellarg($host),
                !empty($password) ? '--password=' . escapeshellarg($password) : '',
                escapeshellarg($databaseName)
            );

            exec($createDbCommand, $output, $returnVar);
            if ($returnVar !== 0) {
                throw new \Exception('No se pudo crear la base de datos');
            }

            // Conexión PDO para ejecutar las consultas
            $dsn = "mysql:host=$host;dbname=$databaseName;charset=utf8mb4";
            $pdo = new \PDO($dsn, $username, $password, [
                \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
                \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4"
            ]);

            // Desactivar restricciones de llaves foráneas
            $pdo->exec('SET FOREIGN_KEY_CHECKS=0');
            
            // Ejecutar cada declaración SQL por separado
            foreach ($statements as $index => $statement) {
                try {
                    if (trim($statement) != '') {
                        $pdo->exec($statement);
                    }
                } catch (\PDOException $e) {
                    $lineNumber = $index + 1;
                    \Log::error("Error en la línea $lineNumber: " . $e->getMessage());
                    \Log::error("SQL problemático: " . $statement);
                    throw new \Exception("Error en la línea $lineNumber: " . $e->getMessage() . "\nSQL: " . substr($statement, 0, 100) . "...");
                }
            }

            // Reactivar restricciones de llaves foráneas
            $pdo->exec('SET FOREIGN_KEY_CHECKS=1');

            // Elimina el archivo temporal
            Storage::delete($filePath);

            return redirect()->route('restore')->with('success', 'Base de datos restaurada exitosamente');

        } catch (\Exception $e) {
            \Log::error('Error en restauración: ' . $e->getMessage());
            return redirect()->route('restore')->with('error', 'Error: ' . $e->getMessage());
        }
    }

    private function splitSqlFile($sql) {
        $lines = explode("\n", $sql);
        $statements = [];
        $currentStatement = '';

        foreach ($lines as $line) {
            // Ignorar comentarios
            if (preg_match('/^--/', trim($line)) || preg_match('/^\/\*/', trim($line))) {
                continue;
            }

            // Añadir la línea al statement actual
            $currentStatement .= $line . "\n";

            // Si encontramos un punto y coma al final de la línea (ignorando espacios y comentarios)
            if (preg_match('/;\s*$/', trim($line))) {
                // Limpiar el statement y añadirlo al array si no está vacío
                $statement = trim($currentStatement);
                if (!empty($statement)) {
                    $statements[] = $statement;
                }
                $currentStatement = '';
            }
        }

        // Añadir el último statement si existe
        if (trim($currentStatement) != '') {
            $statements[] = trim($currentStatement);
        }

        return $statements;
    }
}