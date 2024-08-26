@extends('layouts.app')
@section('content')

<div class="container text-center" >

    <br><br><br>
  
    <div class="row">
        <br><br>
        <div class="col-md-6 text-center">
            <br>
            <a href="/solicitudes"> <img  src="{{ URL::to('/img/solicitudes.png') }}" height="140"></a>
            <h2 style="color: #3b557a">Solicitudes</h2>
        </div>
        <div class="col-md-6 text-center">
            <br>
            <a href="/equipos_mant"> <img  src="{{ URL::to('/img/equipos.png') }}" height="140"></a>
            <h2 style="color: #3b557a">Equipos</h2>
        </div>
        <div class="col-md-6 text-center">
            <br>
            <a href="/mantenimientoPreventivo"> <img  src="{{ URL::to('/img/mantenimientoPreventivo.png') }}" height="140"></a>
            <h2 style="color: #3b557a">Mantenimiento Preventivo</h2>
        </div>
        <div class="col-md-6 text-center">
            <br>
            <a href="/parametros_mantenimiento"> <img  src="{{ URL::to('/img/parametros.png') }}" height="140"></a>
            <h2 style="color: #3b557a">Parametros</h2>
        </div>

    </div>
</div>
<div id="footer-lafedar"></div>

@stop