<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateMantenimientoPreventivoRequest;
use App\Http\Requests\StoreMantenimientoPreventivoRequest;
use App\MantenimientoPreventivo;
use Illuminate\Http\Request;
Use Session;
use DB;

class MantenimientoPreventivoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $mantenimientos_preventivos_query = MantenimientoPreventivo::Relaciones_index($request);
        $mantenimientos_preventivos = $mantenimientos_preventivos_query->paginate(20);

        return view('mantenimientoPreventivo.index', 
            ['mantenimientos_preventivos' => $mantenimientos_preventivos,]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMantenimientoPreventivoRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(MantenimientoPreventivo $mantenimientoPreventivo)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MantenimientoPreventivo $mantenimientoPreventivo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMantenimientoPreventivoRequest $request, MantenimientoPreventivo $mantenimientoPreventivo)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(MantenimientoPreventivo $mantenimientoPreventivo)
    {
        //
    }

    public function show_store_mant_prev(){
        return view('mantenimientoPreventivo.create');       
    }

    public function show_mostrar_equipos_mant(){
        $equipos = MantenimientoPreventivo::getEquiposMantenimientoConLocalizacionYArea();

        return view('mantenimientoPreventivo.show_equipo', ['equipos' => $equipos,]);
    }

    public function select_tablas_mant_prog(){
        return [MantenimientoPreventivo::getFrecuencias(),
        MantenimientoPreventivo::getEquiposMantenimiento()];
    }   

    public function store_mant_prev(Request $request){

        $activo = ($request['activo'] == 'on') ? 1 : 0;

        $mantenimientoPreventivo = new MantenimientoPreventivo;
        $mantenimientoPreventivo->nombre = $request['nombre'];
        $mantenimientoPreventivo->equipo = $request['equipo'];
        $mantenimientoPreventivo->frecuencia = $request['frecuencia'];
        $mantenimientoPreventivo->ultima_fecha_mantenimiento = $request['ultima_fecha_mantenimiento'];
        $mantenimientoPreventivo->fecha_de_inicio = $request['fecha_de_inicio'];
        $mantenimientoPreventivo->descripcion = $request['descripcion'];
        $mantenimientoPreventivo->activo = $activo;

        $mantenimientoPreventivo->save();

        return redirect ('mantenimientoPreventivo');
    }

    public function getMantProg($idMantProg){
        return DB::table('mantenimientos_preventivos')
            ->leftjoin('frecuencias', 'frecuencias.id', 'mantenimientos_preventivos.frecuencia')
            ->select('mantenimientos_preventivos.id as id',
                'mantenimientos_preventivos.nombre as nombre',
                'mantenimientos_preventivos.equipo as equipo',
                'mantenimientos_preventivos.descripcion as descripcion',
                'mantenimientos_preventivos.activo as activo',
                'mantenimientos_preventivos.ultima_fecha_mantenimiento as ult_fech_mant',
                'mantenimientos_preventivos.fecha_de_inicio as fecha_de_inicio',
                'mantenimientos_preventivos.created_at as fecha_de_creacion',
                'mantenimientos_preventivos.updated_at as fecha_de_actualizacion',
                'frecuencias.id as frecuencia')
            ->where('mantenimientos_preventivos.id', $idMantProg)
            ->orderBy('mantenimientos_preventivos.id', 'asc')
            ->limit(1)
            ->get();
    }

    public function show_edit_mant_prev($id){
        return view('mantenimientoPreventivo.edit', ['mant_prev' => $id]);
    }

    public function edit_mant_prev(Request $request){

        MantenimientoPreventivo::editMantProg($request['idMantProg1'], $request['nombre1'], $request['descripcion1'], $request['equipo1'], $request['fecha_de_inicio1'], $request['frecuencia1'], $request['activo1']);
        
        Session::flash('message','Mantenimiento editado con éxito');
        Session::flash('alert-class', 'alert-success');
        return redirect ('mantenimientoPreventivo');
    }
}