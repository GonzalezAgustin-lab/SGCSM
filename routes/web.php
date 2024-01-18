<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\PermisosController;
use App\Http\Controllers\PersonaController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\PuestoController;
use App\Http\Controllers\EquipamientoController;
use App\Http\Controllers\IncidenteController;
use App\Http\Controllers\VisitaController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\MedicoController;
use App\Http\Controllers\PlanoController;
use App\Http\Controllers\ProyectoController;
use App\Http\Controllers\PoliticaController;
use App\Http\Controllers\InstructivoController;
use App\Http\Controllers\QADController;
use App\Http\Controllers\CalendarioController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\SoftwareController;
use App\Http\Controllers\EventosController;
use App\Http\Controllers\AlmuerzoController;
use App\Http\Controllers\PowerBIController;
use App\Http\Controllers\VentaController;
use App\Http\Controllers\CompraController;
use App\Http\Controllers\CalidadController;
use App\Http\Controllers\CostoController;
use App\Http\Controllers\ProduccionController;
use App\Http\Controllers\RrhhController;
use App\Http\Controllers\FrecuenciasController;
use App\Http\Controllers\SolicitudController;
use App\Http\Controllers\EquipoMantController;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\LocalizacionController;
use App\Http\Controllers\EstadoController;
use App\Http\Controllers\FallaController;
use App\Http\Controllers\TipoEquipoController;
use App\Http\Controllers\MantenimientoController;
use App\Http\Controllers\Equipo_mantController;

//****************Rutas de Autenticación**********************
Auth::routes();

//****************Rutas del Menú Inicial**********************
Route::get('/home', [HomeController::class, 'index']);
Route::get('/', [HomeController::class, 'index']);
Route::get('/internos', [HomeController::class, 'internos']);
Route::get('notificaciones', [HomeController::class, 'notificaciones'])->name('notificaciones');

Route::middleware(['auth'])->group(function () {
    //****************Rutas de Permisos**********************
    Route::resource('permisos', PermisosController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_permiso/{id}', [PermisosController::class, 'destroy_permiso'])->name('destroy_permiso');
    Route::get('select_autorizado', [PermisosController::class, 'select_autorizado'])->name('select_autorizado');
    Route::get('select_tipo_permiso', [PermisosController::class, 'select_tipo_permiso'])->name('select_tipo_permiso');
});

//****************Rutas de Recepción**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('persona', PersonaController::class)->middleware('role:administrador|recepcion|rrhh');
    Route::get('destroy_contacto/{id}', [PersonaController::class, 'destroy_contacto'])->name('destroy_contacto');
});

//****************Rutas de Empleados**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('empleado', EmpleadoController::class)->middleware('role:administrador|rrhh');
    Route::get('showUpdateAreaXJefe/{id_ja}', [EmpleadoController::class, 'showUpdateAreaXJefe'])->name('showUpdateAreaXJefe');
    Route::get('deleteAreaXJefe/{id_ja}', [EmpleadoController::class, 'deleteAreaXJefe'])->name('deleteAreaXJefe');
    Route::get('obtenerNuevoListadoAreaXJefe/{idJefe}', [EmpleadoController::class, 'obtenerNuevoListadoAreaXJefe'])->name('obtenerNuevoListadoAreaXJefe');
    Route::get('showStoreAreaXJefe/{id_ja}', [EmpleadoController::class, 'showStoreAreaXJefe'])->name('showStoreAreaXJefe');
    Route::get('storeRelacionJefeXArea/{jefeId}/{areaId}/{turnoId}', [EmpleadoController::class, 'storeRelacionJefeXArea'])->name('storeRelacionJefeXArea');
    Route::get('/novedades', [HomeController::class, 'novedades'])->middleware('role:administrador|rrhh');
    Route::post('/store_novedades', [HomeController::class, 'store_novedades'])->middleware('role:administrador|rrhh');
    Route::get('destroy_empleado/{id}', [EmpleadoController::class, 'destroy_empleado'])->name('destroy_empleado');
    Route::get('selectAreasTurnos', [EmpleadoController::class, 'selectAreasTurnos']);
    Route::get('selectAreaEmpleados', [EmpleadoController::class, 'selectAreaEmpleados']);
});

//****************Rutas de Puestos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('puesto', PuestoController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_puesto/{id}', [PuestoController::class, 'destroy_puesto'])->name('destroy_puesto');
});

// **************** EQUIPAMIENTO **********************
Route::middleware(['auth'])->group(function () {
    Route::get('/sistemas', [HomeController::class, 'sistemas'])->middleware('role:administrador|ingenieria');
    Route::resource('equipamiento', EquipamientoController::class)->middleware('role:administrador|ingenieria');
    Route::get('listado_ip', [EquipamientoController::class, 'listado_ip'])->middleware('role:administrador|ingenieria');
    Route::get('select_puesto', [EquipamientoController::class, 'select_puesto'])->name('select_puesto');
    Route::post('/store_relacion', [EquipamientoController::class, 'store_relacion'])->middleware('role:administrador');
    Route::get('destroy_relacion/{relacion}', [EquipamientoController::class, 'destroy_relacion'])->middleware('role:administrador');
    Route::get('select_tipo_equipamiento', [EquipamientoController::class, 'select_tipo_equipamiento'])->name('select_tipo_equipamiento');
    Route::get('select_ips', [EquipamientoController::class, 'select_ips'])->name('select_ips');
    Route::get('modal_editar_equipamiento/{id}', [EquipamientoController::class, 'modal_editar_equipamiento'])
        ->name('modal_editar_equipamiento')
        ->middleware('role:administrador');
});

//****************Rutas de Incidentes**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('incidente', IncidenteController::class)->middleware('role:administrador|jefe|mantenimiento|seguridad');
    Route::get('destroy_incidente/{id}', [IncidenteController::class, 'destroy_incidente'])->name('destroy_incidente');
    Route::get('select_area_incidente', [IncidenteController::class, 'select_area_incidente'])->name('select_area_incidente');
});

//****************Rutas de Visitas**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('visita', VisitaController::class)->middleware('role:administrador|jefe|seguridad');
    Route::get('destroy_visita/{id}', [VisitaController::class, 'destroy_visita'])->name('destroy_visita');
    Route::get('select_area_visita', [VisitaController::class, 'select_area_visita'])->name('select_area_visita');
});

//****************Rutas de Usuarios**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('usuario', UsuarioController::class)->middleware('role:administrador');
    Route::get('destroy_usuario/{id}', [UsuarioController::class, 'destroy_usuario'])->name('destroy_usuario');
    Route::get('select_roles', [UsuarioController::class, 'select_roles'])->name('select_roles');
});

//****************Rutas de Roles**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('rol', RolController::class)->middleware('role:administrador');
    Route::get('destroy_rol/{id}', [RolController::class, 'destroy_rol'])->name('destroy_rol');
});

//****************Rutas de Médicos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('medico', MedicoController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_medico/{id}', [MedicoController::class, 'destroy_medico'])->name('destroy_medico');
    Route::get('select_especialidades', [MedicoController::class, 'select_especialidades'])->name('select_especialidades');
});

//****************Rutas de Planos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('plano', PlanoController::class)->middleware('role:administrador|jefe|proyectos|rrhh');
    Route::get('destroy_plano/{id}', [PlanoController::class, 'destroy_plano'])->name('destroy_plano');
});

//****************Rutas de Proyectos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('proyecto', ProyectoController::class)->middleware('role:administrador|jefe|proyectos|rrhh');
    Route::get('destroy_proyecto/{id}', [ProyectoController::class, 'destroy_proyecto'])->name('destroy_proyecto');
    Route::get('select_responsable_proyecto', [ProyectoController::class, 'select_responsable_proyecto'])->name('select_responsable_proyecto');
});

//****************Rutas de Políticas**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('politica', PoliticaController::class)->middleware('role:administrador|jefe|calidad|rrhh');
    Route::get('destroy_politica/{id}', [PoliticaController::class, 'destroy_politica'])->name('destroy_politica');
});

//****************Rutas de Instructivos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('instructivo', InstructivoController::class)->middleware('role:administrador|jefe|calidad|rrhh');
    Route::get('destroy_instructivo/{id}', [InstructivoController::class, 'destroy_instructivo'])->name('destroy_instructivo');
});

//****************Rutas de QAD**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('qad', QADController::class)->middleware('role:administrador|jefe|calidad|rrhh');
    Route::get('destroy_qad/{id}', [QADController::class, 'destroy_qad'])->name('destroy_qad');
});

//****************Rutas de Calendario**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('calendario', CalendarioController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_calendario/{id}', [CalendarioController::class, 'destroy_calendario'])->name('destroy_calendario');
});

//****************Rutas de Eventos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('eventos', EventController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_evento/{id}', [EventController::class, 'destroy_evento'])->name('destroy_evento');
});

//****************Rutas de Software**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('software', SoftwareController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_software/{id}', [SoftwareController::class, 'destroy_software'])->name('destroy_software');
});

//****************Rutas de Eventos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('eventos', EventosController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_evento/{id}', [EventosController::class, 'destroy_evento'])->name('destroy_evento');
});

//****************Rutas de Almuerzos**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('almuerzos', AlmuerzoController::class)->middleware('role:administrador|jefe|rrhh');
    Route::get('destroy_almuerzo/{id}', [AlmuerzoController::class, 'destroy_almuerzo'])->name('destroy_almuerzo');
});

//***********************************Power BI*************************************
Route::get('powerbis', 'HomeController@powerbis');

//****************Ventas**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('ventas', VentaController::class)->middleware('role:administrador|venta');
    Route::post('store_venta', [VentaController::class, 'store_venta'])->name('agregar-powerbi')->middleware('role:administrador|venta');
    Route::get('destroy_venta/{venta}', [VentaController::class, 'destroy_venta'])->middleware('role:administrador|venta');
    Route::post('update_venta', [VentaController::class, 'update_venta'])->middleware('role:administrador|venta')->name('update_ventas');
});

//****************Compras**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('compras', CompraController::class)->middleware('role:administrador|compra');
    Route::post('store_compra', [CompraController::class, 'store_compra'])->name('agregar-powerbi')->middleware('role:administrador|compra');
    Route::get('destroy_compra/{compra}', [CompraController::class, 'destroy_compra'])->middleware('role:administrador|compra');
    Route::post('update_compra', [CompraController::class, 'update_compra'])->middleware('role:administrador|compra')->name('update_compras');
});

//****************Calidad**********************
Route::middleware(['auth'])->group(function () {
    Route::resource('calidades', CalidadController::class)->middleware('role:administrador|calidad');
    Route::post('store_calidad', [CalidadController::class, 'store_calidad'])->name('agregar-powerbi')->middleware('role:administrador|calidad');
    Route::get('destroy_calidad/{calidad}', [CalidadController::class, 'destroy_calidad'])->middleware('role:administrador|calidad');
    Route::post('update_calidad', [CalidadController::class, 'update_calidad'])->middleware('role:administrador|calidad')->name('update_calidades');
});

//****************Costos***********************
Route::middleware(['auth'])->group(function () {
    Route::resource('costos', CostoController::class)->middleware('role:administrador|costo');
    Route::post('store_costo', [CostoController::class, 'store_costo'])->name('agregar-powerbi')->middleware('role:administrador|costo');
    Route::get('destroy_costo/{costo}', [CostoController::class, 'destroy_costo'])->middleware('role:administrador|costo');
    Route::post('update_costo', [CostoController::class, 'update_costo'])->middleware('role:administrador|costo')->name('update_costos');
});

//****************Produccion***********************
Route::middleware(['auth'])->group(function () {
    Route::resource('producciones', ProduccionController::class)->middleware('role:administrador|produccion');
    Route::post('store_produccion', [ProduccionController::class, 'store_produccion'])->name('agregar-powerbi')->middleware('role:administrador|produccion');
    Route::get('destroy_produccion/{produccion}', [ProduccionController::class, 'destroy_produccion'])->middleware('role:administrador|produccion');
    Route::post('update_produccion', [ProduccionController::class, 'update_produccion'])->middleware('role:administrador|produccion')->name('update_producciones');
});

//****************Rrhhs***********************
Route::middleware(['auth'])->group(function () {
    Route::resource('rrhhs', RrhhController::class)->middleware('role:administrador|rrhh');
    Route::post('store_rrhh', [RrhhController::class, 'store_rrhh'])->name('agregar-powerbi')->middleware('role:administrador|rrhh');
    Route::get('destroy_rrhh/{rrhh}', [RrhhController::class, 'destroy_rrhh'])->middleware('role:administrador|rrhh');
    Route::post('update_rrhh', [RrhhController::class, 'update_rrhh'])->middleware('role:administrador|rrhh')->name('update_rrhhs');
});

//***********************************Frecuencias*************************************
Route::get('/frecuencias', [FrecuenciasController::class, 'index']);

//****************Mantenimiento**********************
Route::get('mantenimiento', [HomeController::class, 'mantenimiento']);
Route::middleware(['auth'])->group(function () {
    Route::resources([
        'solicitudes' => SolicitudController::class,
        'historico_solicitudes' => SolicitudController::class
    ]);

    Route::get('show_store_solicitud', [SolicitudController::class, 'show_store_solicitud'])->name('show_store_solicitud');
    Route::post('store_solicitud', [SolicitudController::class, 'store_solicitud'])->name('store_solicitud');

    Route::get('show_assing_solicitud/{solicitud}', [SolicitudController::class, 'show_assing_solicitud'])
        ->middleware('role:administrador|Jefe-Mantenimiento|Empleado-Mantenimiento-Asigna-Solicitudes|Empleado-Mantenimiento-Ve-Proyectos|Empleado-Mantenimiento-Ve-Proyectos-Asigna')
        ->name('show_assing_solicitud');
    Route::post('assing_solicitud', [SolicitudController::class, 'assing_solicitud'])
        ->middleware('role:administrador|Jefe-Mantenimiento|Empleado-Mantenimiento-Asigna-Solicitudes|Empleado-Mantenimiento-Ve-Proyectos|Empleado-Mantenimiento-Ve-Proyectos-Asigna')
        ->name('assing_solicitud');

    Route::get('show_update_solicitud/{solicitud}', [SolicitudController::class, 'show_update_solicitud'])
        ->middleware('role:administrador|Jefe-Mantenimiento|Empleado-Mantenimiento|Empleado-Mantenimiento-Asigna-Solicitudes|Empleado-Mantenimiento-Ve-Solicitudes|Empleado-Mantenimiento-Ve-Proyectos|Ver-Todas-Las-Solicitudes-Y-Proyectos|Empleado-Mantenimiento-Ve-Proyectos-Asigna')
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

Route::middleware(['auth'])->group(function () {
    Route::resource('equipos_mant', Equipo_mantController::class)->middleware('role:administrador,Jefe-GarantiaDeCalidad,Jefe-Mantenimiento,Empleado-Mantenimiento');

    Route::get('show_store_equipo_mant', [Equipo_mantController::class, 'show_store_equipo_mant'])->middleware('role:administrador,Jefe-GarantiaDeCalidad')->name('show_store_equipo_mant');
    Route::post('store_equipo_mant', [Equipo_mantController::class, 'store_equipo_mant'])->middleware('role:administrador,Jefe-GarantiaDeCalidad')->name('store_equipo_mant');

    Route::get('show_update_equipo_mant/{equipo_mant}', [Equipo_mantController::class, 'show_update_equipo_mant'])->middleware('role:administrador,Jefe-GarantiaDeCalidad')->name('show_update_equipo_mant');
    Route::post('update_equipo_mant', [Equipo_mantController::class, 'update_equipo_mant'])->middleware('role:administrador,Jefe-GarantiaDeCalidad')->name('update_equipo_mant');

    Route::get('select_tipo_equipo', [Equipo_mantController::class, 'select_tipo_equipo'])->name('select_tipo_equipo');
    Route::get('select_area_localizacion', [Equipo_mantController::class, 'select_area_localizacion'])->name('select_area_localizacion');
});

Route::get('parametros_mantenimiento', 'HomeController@parametros_mantenimiento');
Route::middleware(['auth'])->group(function () {
    Route::resource('areas', AreaController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_area', [AreaController::class, 'show_store_area'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_area');
    Route::post('store_area', [AreaController::class, 'store_area'])->name('store_area');
    Route::get('show_update_area/{area}', [AreaController::class, 'show_update_area'])->name('show_update_area');
    Route::post('update_area', [AreaController::class, 'update_area'])->name('update_area');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('localizaciones', LocalizacionController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_localizacion', [LocalizacionController::class, 'show_store_localizacion'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_localizacion');
    Route::post('store_localizacion', [LocalizacionController::class, 'store_localizacion'])->name('store_localizacion');
    Route::get('show_update_localizacion/{localizacion}', [LocalizacionController::class, 'show_update_localizacion'])->name('show_update_localizacion');
    Route::post('update_localizacion', [LocalizacionController::class, 'update_localizacion'])->name('update_localizacion');

    Route::get('select_area', [LocalizacionController::class, 'select_area'])->name('select_area');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('estados', EstadoController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_estado', [EstadoController::class, 'show_store_estado'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_estado');
    Route::post('store_estado', [EstadoController::class, 'store_estado'])->name('store_estado');
    Route::get('show_update_estado/{estado}', [EstadoController::class, 'show_update_estado'])->name('show_update_estado');
    Route::post('update_estado', [EstadoController::class, 'update_estado'])->name('update_estado');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('fallas', FallaController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_falla', [FallaController::class, 'show_store_falla'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_falla');
    Route::post('store_falla', [FallaController::class, 'store_falla'])->name('store_falla');
    Route::get('show_update_falla/{falla}', [FallaController::class, 'show_update_falla'])->name('show_update_falla');
    Route::post('update_falla', [FallaController::class, 'update_falla'])->name('update_falla');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('tipos_equipos', Tipo_EquipoController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_tipo_equipo', [Tipo_EquipoController::class, 'show_store_tipo_equipo'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_tipo_equipo');
    Route::post('store_tipo_equipo', [Tipo_EquipoController::class, 'store_tipo_equipo'])->name('store_tipo_equipo');
    Route::get('show_update_tipo_equipo/{tipo_equipo}', [Tipo_EquipoController::class, 'show_update_tipo_equipo'])->name('show_update_tipo_equipo');
    Route::post('update_tipo_equipo', [Tipo_EquipoController::class, 'update_tipo_equipo'])->name('update_tipo_equipo');
    Route::get('show_delete_falla_te/{falla}', [Tipo_EquipoController::class, 'show_delete_falla_te'])->name('show_delete_falla_te');
    Route::post('delete_falla_te', [Tipo_EquipoController::class, 'delete_falla_te'])->name('delete_falla_te');
    Route::get('show_assing_tipo_equipo/{tipo_equipo}', [Tipo_EquipoController::class, 'show_assing_tipo_equipo'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_assing_tipo_equipo');
    Route::post('assing_tipo_equipo', [Tipo_EquipoController::class, 'assing_tipo_equipo'])->middleware('role:administrador|Jefe-Mantenimiento')->name('assing_tipo_equipo');

    Route::get('select_fallas', [Tipo_EquipoController::class, 'select_fallas'])->name('select_fallas');
});

Route::middleware(['auth'])->group(function () {
    Route::resource('tipos_solicitudes', Tipo_SolicitudController::class)->middleware('role:administrador|Jefe-Mantenimiento');
    Route::get('show_store_tipo_solicitud', [Tipo_SolicitudController::class, 'show_store_tipo_solicitud'])->middleware('role:administrador|Jefe-Mantenimiento')->name('show_store_tipo_solicitud');
    Route::post('store_tipo_solicitud', [Tipo_SolicitudController::class, 'store_tipo_solicitud'])->name('store_tipo_solicitud');
    Route::get('show_update_tipo_solicitud/{tipo_solicitud}', [Tipo_SolicitudController::class, 'show_update_tipo_solicitud'])->name('show_update_tipo_solicitud');
    Route::post('update_tipo_solicitud', [Tipo_SolicitudController::class, 'update_tipo_solicitud'])->name('update_tipo_solicitud');
});