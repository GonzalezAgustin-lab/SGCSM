<?php
// Ruta: app/Models/Administrador.php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;

class Administrador extends Authenticatable
{
    use Notifiable;
    use HasRoles;

    protected $table = "administradores"; // Asegúrate de que coincida con la tabla en tu base de datos

    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
