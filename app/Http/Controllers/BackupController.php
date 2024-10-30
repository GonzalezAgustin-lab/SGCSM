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
}