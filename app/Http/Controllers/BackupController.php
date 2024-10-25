<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\Process\Process;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Exception\ProcessFailedException;

class BackupController extends Controller
{
    public function index(Request $request)
    {
        return view('backup.index');
    }

    public function exportBackup()
    {
        try {
            // Obtener configuración de la base de datos
            $databaseName = config('database.connections.mysql.database');
            $username = config('database.connections.mysql.username');
            $password = config('database.connections.mysql.password');
            $host = config('database.connections.mysql.host');
            
            // Verificar que tenemos toda la información necesaria
            if (empty($databaseName)) {
                throw new \Exception('Nombre de base de datos no configurado');
            }

            // Crear el directorio con permisos adecuados
            $backupPath = storage_path('app/backups');
            if (!file_exists($backupPath)) {
                mkdir($backupPath, 0777, true);
            } else {
                chmod($backupPath, 0777);
            }

            $filename = "{$databaseName}_" . date('Y_m_d_His') . ".sql";
            $filePath = str_replace('\\', '/', $backupPath . '/' . $filename);

            // Asegurar que el archivo se pueda crear
            touch($filePath);
            chmod($filePath, 0777);

            // Construir el comando mysqldump
            $command = [
                'C:\\xampp\\mysql\\bin\\mysqldump',
                "-u{$username}"
            ];

            // Agregar password solo si existe
            if (!empty($password)) {
                $command[] = "-p{$password}";
            }

            // Agregar host y nombre de base de datos
            $command[] = "-h{$host}";
            $command[] = $databaseName;
            $command[] = "--result-file={$filePath}";

            // Debug - Imprimir comando (comentar en producción)
            \Log::info('Comando a ejecutar: ' . implode(' ', $command));

            $process = new Process($command);
            $process->setTimeout(3600);
            
            // Ejecutar el proceso
            $process->mustRun();

            // Verificar si el archivo existe y tiene contenido
            if (file_exists($filePath) && filesize($filePath) > 0) {
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
}