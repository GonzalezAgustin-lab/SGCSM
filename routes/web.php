<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\SolicitudController;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\LocalizacionController;
use App\Http\Controllers\EstadoController;
use App\Http\Controllers\Tipo_EquipoController;
use App\Http\Controllers\Tipo_SolicitudController;
use App\Http\Controllers\Equipo_mantController;

//****************Rutas de Autenticación**********************
Auth::routes();

//****************Rutas del Menú Inicial**********************
Route::get('/home', [HomeController::class, 'index']);
Route::get('/', [HomeController::class, 'index']);

//****************Solicitudes**********************
Route::get('mantenimiento', [HomeController::class, 'mantenimiento']);
Route::middleware(['auth'])->group(function () {
    Route::resources([
        'solicitudes' => SolicitudController::class,
        'historico_solicitudes' => SolicitudController::class
    ]);

    Route::get('show_store_solicitud', [SolicitudController::class, 'show_store_solicitud'])->name('show_store_solicitud');
    Route::post('store_solicitud', [SolicitudController::class, 'store_solicitud'])->name('store_solicitud');

    Route::get('show_assing_solicitud/{solicitud}', [SolicitudController::class, 'show_assing_solicitud'])
        ->name('show_assing_solicitud');
    Route::post('assing_solicitud', [SolicitudController::class, 'assing_solicitud'])
        ->name('assing_solicitud');

    Route::get('show_update_solicitud/{solicitud}', [SolicitudController::class, 'show_update_solicitud'])
        ->name('show_update_solicitud');
    Route::post('update_solicitud', [SolicitudController::class, 'update_solicitud'])->name('update_solicitud');

    Route::get('show_edit_solicitud/{solicitud}', [SolicitudController::class, 'show_edit_solicitud'])->name('show_edit_solicitud');
    Route::post('edit_solicitud', [SolicitudController::class, 'edit_solicitud'])->name('edit_solicitud');

    Route::get('show_reclamar_solicitud/{solicitud}', [SolicitudController::class, 'show_reclamar_solicitud'])->name('show_reclamar_solicitud');
    Route::post('reclaim_solicitud', [SolicitudController::class, 'reclaim_solicitud'])->name('reclaim_solicitud');

    Route::get('show_mostrar_equipos_mant', [SolicitudController::class, 'show_mostrar_equipos_mant'])->name('show_mostrar_equipos_mant');
    Route::post('mostrar_equipos_mant', [SolicitudController::class, 'mostrar_equipos_mant'])->name('mostrar_equipos_mant');

    Route::get('show_solicitud/{solicitud}', [SolicitudController::class, 'show_solicitud'])->name('show_solicitud');
    Route::get('aprobar_solicitud/{solicitud}', [SolicitudController::class, 'aprobar_solicitud']);
    Route::get('destroy_solicitud/{solicitud}', [SolicitudController::class, 'destroy_solicitud']);

    Route::get('select_tablas', [SolicitudController::class, 'select_tablas'])->name('select_tablas');
    Route::get('select_estado', [SolicitudController::class, 'select_estado'])->name('select_estado');
    Route::get('select_users', [SolicitudController::class, 'select_users'])->name('select_users');
    Route::get('select_equipos', [SolicitudController::class, 'select_equipos'])->name('select_equipos');
    Route::get('getHistoricos/{solicitud}', [SolicitudController::class, 'getHistoricos'])->name('getHistoricos');
    Route::get('getSolicitud/{idSolicitud}', [SolicitudController::class, 'getSolicitud'])->name('getSolicitud');
});

//****************Equipos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('equipos_mant', Equipo_mantController::class);

    Route::get('show_store_equipo_mant', [Equipo_mantController::class, 'show_store_equipo_mant'])->name('show_store_equipo_mant');
    Route::post('store_equipo_mant', [Equipo_mantController::class, 'store_equipo_mant'])->name('store_equipo_mant');

    Route::get('show_update_equipo_mant/{equipo_mant}', [Equipo_mantController::class, 'show_update_equipo_mant'])->name('show_update_equipo_mant');
    Route::post('update_equipo_mant', [Equipo_mantController::class, 'update_equipo_mant'])->name('update_equipo_mant');

    Route::get('select_tipo_equipo', [Equipo_mantController::class, 'select_tipo_equipo'])->name('select_tipo_equipo');
    Route::get('select_area_localizacion', [Equipo_mantController::class, 'select_area_localizacion'])->name('select_area_localizacion');
});

//****************Parametros**********************
Route::get('parametros_mantenimiento', [HomeController::class, 'parametros_mantenimiento']);
Route::middleware(['auth'])->group(function () {
    Route::resource('areas', AreaController::class);
    Route::get('show_store_area', [AreaController::class, 'show_store_area'])->name('show_store_area');
    Route::post('store_area', [AreaController::class, 'store_area'])->name('store_area');
    Route::get('show_update_area/{area}', [AreaController::class, 'show_update_area'])->name('show_update_area');
    Route::post('update_area', [AreaController::class, 'update_area'])->name('update_area');
});

//****************Localizaciones**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('localizaciones', LocalizacionController::class);
    Route::get('show_store_localizacion', [LocalizacionController::class, 'show_store_localizacion'])->name('show_store_localizacion');
    Route::post('store_localizacion', [LocalizacionController::class, 'store_localizacion'])->name('store_localizacion');
    Route::get('show_update_localizacion/{localizacion}', [LocalizacionController::class, 'show_update_localizacion'])->name('show_update_localizacion');
    Route::post('update_localizacion', [LocalizacionController::class, 'update_localizacion'])->name('update_localizacion');
    Route::get('select_area', [LocalizacionController::class, 'select_area'])->name('select_area');
});

//****************Estados**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('estados', EstadoController::class);
    Route::get('show_store_estado', [EstadoController::class, 'show_store_estado'])->name('show_store_estado');
    Route::post('store_estado', [EstadoController::class, 'store_estado'])->name('store_estado');
    Route::get('show_update_estado/{estado}', [EstadoController::class, 'show_update_estado'])->name('show_update_estado');
    Route::post('update_estado', [EstadoController::class, 'update_estado'])->name('update_estado');
});

//****************Tipo de equipamientos****************
Route::middleware(['auth'])->group(function () {
    Route::resource('tipos_equipos', Tipo_EquipoController::class);
    Route::get('show_store_tipo_equipo', [Tipo_EquipoController::class, 'show_store_tipo_equipo'])->name('show_store_tipo_equipo');
    Route::post('store_tipo_equipo', [Tipo_EquipoController::class, 'store_tipo_equipo'])->name('store_tipo_equipo');
    Route::get('show_update_tipo_equipo/{tipo_equipo}', [Tipo_EquipoController::class, 'show_update_tipo_equipo'])->name('show_update_tipo_equipo');
    Route::post('update_tipo_equipo', [Tipo_EquipoController::class, 'update_tipo_equipo'])->name('update_tipo_equipo');
    Route::get('show_assing_tipo_equipo/{tipo_equipo}', [Tipo_EquipoController::class, 'show_assing_tipo_equipo'])->name('show_assing_tipo_equipo');
    Route::post('assing_tipo_equipo', [Tipo_EquipoController::class, 'assing_tipo_equipo'])->name('assing_tipo_equipo');
});

//****************Tipo de soliciudes****************
Route::middleware(['auth'])->group(function () {
    Route::resource('tipos_solicitudes', Tipo_SolicitudController::class);
    Route::get('show_store_tipo_solicitud', [Tipo_SolicitudController::class, 'show_store_tipo_solicitud'])->name('show_store_tipo_solicitud');
    Route::post('store_tipo_solicitud', [Tipo_SolicitudController::class, 'store_tipo_solicitud'])->name('store_tipo_solicitud');
    Route::get('show_update_tipo_solicitud/{tipo_solicitud}', [Tipo_SolicitudController::class, 'show_update_tipo_solicitud'])->name('show_update_tipo_solicitud');
    Route::post('update_tipo_solicitud', [Tipo_SolicitudController::class, 'update_tipo_solicitud'])->name('update_tipo_solicitud');
});

//****************Empleados**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('empleado', EmpleadoController::class);
    Route::get('showUpdateAreaXJefe/{id_ja}',[EmpleadoController::class, 'showUpdateAreaXJefe'])->name('showUpdateAreaXJefe');
    Route::get('deleteAreaXJefe/{id_ja}', [EmpleadoController::class, 'deleteAreaXJefe'])->name('deleteAreaXJefe');
    Route::get('obtenerNuevoListadoAreaXJefe/{idJefe}', [EmpleadoController::class, 'obtenerNuevoListadoAreaXJefe'])->name('obtenerNuevoListadoAreaXJefe');
    Route::get('showStoreAreaXJefe/{id_ja}', [EmpleadoController::class, 'showStoreAreaXJefe'])->name('showStoreAreaXJefe');
    Route::get('destroy_empleado/{id}', [EmpleadoController::class, 'destroy_empleado'])->name('destroy_empleado');
    Route::get('selectAreaEmpleados', [EmpleadoController::class, 'selectAreaEmpleados']);
  });
