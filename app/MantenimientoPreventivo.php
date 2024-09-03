<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use DB;

class MantenimientoPreventivo extends Model
{
    public $table = "mantenimientos_preventivos";
    public static function getFrecuencias(){
        return DB::table('frecuencias')->get();
    }

    public static function getEquiposMantenimiento(){
        return DB::table('equipos_mant')->get();
    }

    public static function getEquiposMantenimientoConLocalizacionYArea(){
        return DB::table('equipos_mant')
        ->leftJoin('localizaciones', 'localizaciones.id', 'equipos_mant.id_localizacion')
        ->leftJoin('area', 'area.id_a', 'equipos_mant.id_area')
        ->select('equipos_mant.id as id', 'equipos_mant.marca as marca', 'equipos_mant.modelo as modelo', 'equipos_mant.descripcion as descripcion',
        'localizaciones.nombre as localizacion', 'area.nombre_a as area')
        ->orderBy('id', 'asc')
        ->get();
    }
}
