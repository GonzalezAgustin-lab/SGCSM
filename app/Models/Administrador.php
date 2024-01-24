<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Notifications\MyResetPassword;
use Spatie\Permission\Traits\HasRoles;

class Administrador extends Authenticatable
{
    use Notifiable;
    use HasRoles;

    protected $table = "users"; // Asegúrate de que coincida con la tabla en tu base de datos

    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function scopeName($query, $name)
    {
        if($name){
        return $query -> where('name','LIKE',"%$name%");
        }
    }
    public function scopeID($query, $id)
    {
        if($id){
        return $query -> where('id','LIKE',"%$id%");
        }
    }
}
