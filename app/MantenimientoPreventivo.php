<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use DB;

class MantenimientoPreventivo extends Model
{
    public $table = "mantenimientos_preventivos";

    public function scopeRelaciones_index($query){
        $query->leftjoin('frecuencias', 'frecuencias.id', 'mantenimientos_preventivos.frecuencia')
        ->select('mantenimientos_preventivos.id as id',
            'mantenimientos_preventivos.nombre as nombre',
            'mantenimientos_preventivos.equipo as equipo',
            'mantenimientos_preventivos.descripcion as descripcion',
            'mantenimientos_preventivos.activo as activo',
            'mantenimientos_preventivos.ultima_fecha_mantenimiento as ult_fech_mant',
            'mantenimientos_preventivos.fecha_de_inicio as fecha_de_inicio',
            'mantenimientos_preventivos.created_at as fecha_de_creacion',
            'mantenimientos_preventivos.updated_at as fecha_de_actualizacion',
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
        DB::table('mantenimientos_preventivos')
            ->where('mantenimientos_preventivos.id', $id)
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
