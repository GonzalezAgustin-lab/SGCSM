<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateMantenimientoPreventivoRequest;
use App\Http\Requests\StoreMantenimientoPreventivoRequest;
use App\MantenimientoPreventivo;
use Illuminate\Http\Request;


class MantenimientoPreventivoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('mantenimientoPreventivo.index');
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

    public function select_tablas(){
        return [MantenimientoPreventivo::getFrecuencias(),
        MantenimientoPreventivo::getEquiposMantenimiento()];
    }   

    public function store_mant_prev(Request $request){

        $activo = ($request['activo'] == 'on') ? 1 : 0;

        $mantenimientoPreventivo = new MantenimientoPreventivo;
        $mantenimientoPreventivo->nombre = $request['nombre'];
        $mantenimientoPreventivo->frecuencia = $request['frecuencia'];
        $mantenimientoPreventivo->ultima_fecha_mantenimiento = $request['ultima_fecha_mantenimiento'];
        $mantenimientoPreventivo->fecha_de_inicio = $request['fecha_de_inicio'];
        $mantenimientoPreventivo->descripcion = $request['descripcion'];
        $mantenimientoPreventivo->activo = $activo;

        $mantenimientoPreventivo->save();

        return redirect ('mantenimientoPreventivo');
    }

}