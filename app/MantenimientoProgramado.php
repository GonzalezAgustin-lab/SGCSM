<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use DB;

class MantenimientoProgramado extends Model
{
    public $table = "mantenimientos_programados";

    public function scopeRelaciones_index($query){
        $query->leftjoin('frecuencias', 'frecuencias.id', 'mantenimientos_programados.frecuencia')
        ->select('mantenimientos_programados.id as id',
            'mantenimientos_programados.nombre as nombre',
            'mantenimientos_programados.equipo as equipo',
            'mantenimientos_programados.descripcion as descripcion',
            'mantenimientos_programados.activo as activo',
            'mantenimientos_programados.ultima_fecha_mantenimiento as ult_fech_mant',
            'mantenimientos_programados.fecha_de_inicio as fecha_de_inicio',
            'mantenimientos_programados.created_at as fecha_de_creacion',
            'mantenimientos_programados.updated_at as fecha_de_actualizacion',
            'frecuencias.nombre as frecuencia');
        return $query;
    }

    public static function getFrecuencias(){
        return DB::table('frecuencias')->get();
    }

    public static function getEquiposMantenimiento(){
        return DB::table('equipos_mant')->get();
    }

    public static function editMantProg($id, $nombre, $descripcion, $equipo, $fecha_de_inicio, $frecuencia, $activo){
        $activoAux;

        if($activo == "on"){
            $activoAux = 1;
        }else {
            $activoAux = 0;
        }
        //dd($activo ,$activoAux);
        DB::table('mantenimientos_programados')
            ->where('mantenimientos_programados.id', $id)
            ->update([
                'nombre' => $nombre, 
                'descripcion' => $descripcion, 
                'equipo' => $equipo, 
                'fecha_de_inicio' => $fecha_de_inicio,
                'frecuencia' => $frecuencia,
                'ultima_fecha_mantenimiento' => null,
                'activo' => $activoAux]);

    }
}
