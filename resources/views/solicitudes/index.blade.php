@extends('solicitudes.layouts.layout')
@section('content')

<!-- alertas -->

<div class="content">
  <div class="row" style="justify-content: center">
    <div id="alert" class="alert alert-success col-md-10 text-center" style="display: none"></div>
  </div>
</div>

@if(Session::has('message'))
  <div class="container" id="div.alert">
    <div class="row">
      <div class="col-1"></div>
      <div class="alert {{Session::get('alert-class')}} col-10 text-center" role="alert">
        {{Session::get('message')}}
      </div>
    </div>
  </div>
@endif

<!-- barra para buscar solicitudes -->
<div class="col">
  <div class="form-group">
    <form  method="GET">
      <div style="display: inline-block;">
        <label for="id_solicitud" style="display: block; margin-bottom: 5px;"><h6>ID:</h6></label>
        <input type="text" class="form-control" name="id_solicitud" id="id_solicitud" autocomplete="off" value="{{$id_solicitud}}">
      </div>
      <div style="display: inline-block;">
        <label for="titulo" style="display: block; margin-bottom: 5px;"><h6>Titulo:</h6></label>
        <input type="text" class="form-control" name="titulo" id="titulo" autocomplete="off" value="{{$titulo}}">
      </div>
      <div style="display: inline-block;">
        <label for="tipo" style="display: block; margin-bottom: 5px;"><h6>Tipo:</h6></label>
        <select class="form-control" name="id_tipo_solicitud"  id="id_tipo_solicitud">
          <option value="0">{{'Todos'}} </option>
          @foreach($tiposSolicitudes as $tipoSolicitud)
            @if($tipoSolicitud->id == $id_tipo_solicitud)
              <option value="{{$tipoSolicitud->id}}" selected>{{$tipoSolicitud->nombre}} </option>
            @else
              <option value="{{$tipoSolicitud->id}}">{{$tipoSolicitud->nombre}} </option>
            @endif
          @endforeach
        </select>
      </div>
      <div style="display: inline-block;">
        <label for="id_equipo" style="display: block; margin-bottom: 5px;"><h6>Equipo:</h6></label>
        <input type="text" class="form-control" name="id_equipo" id="id_equipo" autocomplete="off" value="{{$id_equipo}}">
      </div>
      <div style="display: inline-block;">
        <label for="estado" style="display: block; margin-bottom: 5px;"><h6>Estado:</h6></label>
        <select class="form-control" name="id_estado"  id="id_estado">
          <option value="0">{{'Todos'}} </option>
          @foreach($estados as $estado)
            @if($estado->id == $id_estado)
              <option value="{{$estado->id}}" selected>{{$estado->nombre}} </option>
            @else
              <option value="{{$estado->id}}">{{$estado->nombre}} </option>
            @endif
          @endforeach
        </select>
      </div>
      <div style="display: inline-block;">
        <label for="solicitante" style="display: block; margin-bottom: 5px;"><h6>Solicitante:</h6></label>
        <select class="form-control" name="id_solicitante"  id="id_solicitante">
          <option value="0">{{'Todos'}} </option>
          @foreach($usuarios as $usuario)
            @if($usuario->idPersona == $id_solicitante)
              <option value="{{$usuario->idPersona}}" selected>{{$usuario->name}} </option>
            @else
              <option value="{{$usuario->idPersona}}">{{$usuario->name}} </option>
            @endif
          @endforeach
        </select>
      </div>
      <div style="display: inline-block;">
        <label for="fecha" style="display: block; margin-bottom: 5px;"><h6>Fecha:</h6></label>
        <input class="form-control" type="date" id="fecha" name="fecha">
      </div>
      <div style="display: inline-block;">
        <label for="encargado" style="display: block; margin-bottom: 5px;"><h6>Encargado:</h6></label>
        <select class="form-control" name="id_encargado" id="id_encargado">
          <option value="0">{{'Todos'}} </option>
          @foreach($usuarios as $usuario)
            @foreach($model_as_roles as $model_as_rol)
              @if(($model_as_rol->role_id == 21 || $model_as_rol->role_id == 24 || $model_as_rol->role_id == 25 || $model_as_rol->role_id == 30) and $usuario->idUsuario == $model_as_rol->model_id)
                @if($usuario->idPersona == $id_encargado)
                  <option value="{{$usuario->idPersona}}" selected>{{$usuario->name}} </option>
                @else
                  <option value="{{$usuario->idPersona}}">{{$usuario->name}} </option>
                @endif
              @endif
            @endforeach
          @endforeach
        </select>
      </div>
      &nbsp
      <div style="display: inline-block;">
        <button type="submit" class="btn btn-default"> Buscar</button>
      </div>
    </form>          
  </div>
</div>
<!-- tabla de datos -->
<div class="col-md-12">             
  <table class="table table-striped table-bordered ">
    <thead>
      <th class="text-center"><input type="checkbox" id="checkAll" onclick="checkAll()"> Seleccionar</th>
      <th class="text-center">ID</th>
      <th class="text-center">Titulo</th>
      <th class="text-center">Tipo de solicitud</th>
      <th class="text-center">Equipo</th>
      <th class="text-center">Estado</th>     
      <th class="text-center">Fecha de emision</th> 
      <!--<th class="text-center">Fecha de finalizacion</th> -->
      <th class="text-center">Solicitante</th>
      <th class="text-center">Encargado</th>  
      <th class="text-center">Acciones</th>        
    </thead>
    <tbody>
        <?php //dd($solicitudes); ?>
        @foreach($solicitudes as $solicitud)
          <tr>
            <td><label><input type="checkbox" id="cbox1" value="first_checkbox"></label><br></td>
            <td>{{$solicitud->id}}</td>
            <td>{{$solicitud->titulo}}</td>
            <td>{{$solicitud->tipo_solicitud}}</td>
            <td>
              @if($solicitud->id_equipo)
                <p>{{$solicitud->id_equipo}}</p>
              @else
                <p style="color:gainsboro">N/A</p>
              @endif
            </td>
            <td>{{$solicitud->estado}}</td>
            <td>{{ \Carbon\Carbon::parse($solicitud->fechaEmision)->format('d/m/Y') }}</td>
            @if($solicitud->fechaFinalizacion)
              <!--<td>{{ \Carbon\Carbon::parse($solicitud->fechaFinalizacion)->format('d/m/Y') }}</td>  --> 
            @else     
              <!--<td></td>  --> 
            @endif  
            <td>{{$solicitud->nombre_solicitante}} {{$solicitud->apellido_solicitante}}</td>
            <td style="display: none;">{{$solicitud->descripcion}}</td>
            <td>
              @if($solicitud->nombre_encargado)
                {{$solicitud->nombre_encargado}} {{$solicitud->apellido_encargado}}
              @else
                <p style="color:gainsboro">Sin asignar</p>
              @endif
            </td>
            <td>
              <div class="text-center">
                <div class="btn-group" style="display: flex; flex-wrap: wrap; justify-content: center;">
                  <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                    <button id="detalle" class="btn btn-info btn-sm" onclick='fnOpenModalShow({{$solicitud->id}})' title="show">Detalles</button>
                  </div>
                  <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                    <button id="actualizar" class="btn btn-info btn-sm" onclick='fnOpenModalUpdate({{$solicitud->id}})' title="update">Actualizar</button>
                  </div>
                  @if(!$solicitud->nombre_encargado)
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <button id="asignar" class="btn btn-info btn-sm" onclick='fnOpenModalAssing({{$solicitud->id}})' title="assing">Asignar</button>
                    </div>
                  @endif
                  @if($solicitud->estado == "Aprob. pendiente" && $solicitud->id_solicitante == $personaAutenticada->id_p)
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <a href="{{url('aprobar_solicitud', $solicitud->id)}}" class="btn btn-info btn-sm" title="aprobar" onclick="return confirm ('Está seguro que desea aprobar esta solicitud?')" data-position="top" data-delay="50" data-tooltip="aprobar">Aprobar</a>
                    </div>
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <button id="reclamar" class="btn btn-info btn-sm" onclick='fnOpenModalReclaim({{$solicitud->id}})' title="reclaim">Reclamar</button>
                    </div>
                  @endif
                  @if($solicitud->estado == "Abierta" && $solicitud->id_solicitante == $personaAutenticada->id_p)
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <button class="btn btn-info btn-sm" onclick='fnOpenModalEdit({{$solicitud->id}})' title="edit"  data-tipo="{{$solicitud->tipo_solicitud}}" id="edit-{{$solicitud->id}}">Editar</button>
                    </div>
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <a href="{{url('destroy_solicitud', $solicitud->id)}}" class="btn btn-danger btn-sm" title="Borrar" onclick="return confirm('Está seguro que desea eliminar esta solicitud?')" data-position="top" data-delay="50" data-tooltip="Borrar">X</a>
                    </div>
                  @else
                    <div class="btn-container" style="margin-bottom: 5px; margin-right: 5px;">
                      <a href="{{url('destroy_solicitud', $solicitud->id)}}" class="btn btn-danger btn-sm" title="Borrar" onclick="return confirm('Está seguro que desea eliminar esta solicitud?')" data-position="top" data-delay="50" data-tooltip="Borrar">X</a>
                    </div>
                  @endif
                </div>
              </div>
            </td>
          </tr>
        @endforeach
    </tbody>
  </table>

  {{ $solicitudes->appends($_GET)->links() }}
  <br>

  <div class="modal fade" id="show2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog estilo" role="document">
      <div class="modal-content">
        <form id="myForm" method="POST" enctype="multipart/form-data">
          {{csrf_field()}}
          <div id="modalshow" class="modal-body">
            <!-- Datos -->
          </div>
          <div id="modalfooter" class="modal-footer">
            <!-- Footer -->
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="show4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog estilo" role="document">
      <div class="modal-content">
        <form id="myForm4" method="POST" enctype="multipart/form-data">
          {{csrf_field()}}
          <div id="modalshow4" class="modal-body">
            <!-- Datos -->
          </div>
          <div id="modalfooter4" class="modal-footer">
            <!-- Footer -->
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Incluir archivos CSS de Select2 -->
<link href="{{ asset('select2/dist/css/select2.min.css') }}" rel="stylesheet" />
<script src="{{ asset('select2/dist/js/select2.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script>
  // Obtén el campo de entrada de fecha por su ID
  var fechaInput = document.getElementById('fecha');

  // Verifica si hay un valor guardado en el almacenamiento local (localStorage)
  if (localStorage.getItem('fechaValue')) {
    // Restaura el valor guardado en el campo de entrada de fecha
    fechaInput.value = localStorage.getItem('fechaValue');
  }

  // Escucha el evento 'change' del campo de entrada de fecha
  fechaInput.addEventListener('change', function() {
    // Guarda el valor seleccionado en el almacenamiento local (localStorage)
    localStorage.setItem('fechaValue', fechaInput.value);
  });
</script>
<script>
  function manejarSeleccion(idEquipo) {
    $('#equipo').val(idEquipo).trigger('change');
    $('#equipo1').val(idEquipo).trigger('change');
  }

  var ruta = '{{ route('mostrar_equipos_mant') }}';
  var ruta_create = '{{ route('store_solicitud') }}';
  var ruta_update = '{{ route('update_solicitud') }}';
  var ruta_edit = '{{ route('edit_solicitud') }}';
  var ruta_assing = '{{ route('assing_solicitud') }}';
  var ruta_reclaim = '{{ route('reclaim_solicitud') }}';
  var closeButton = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>');
  var saveButton = $('<button type="submit" class="btn btn-info" id="saveButton" onclick="fnSaveSolicitud()">Guardar</button>');
  var saveButton2 = $('<button type="submit" class="btn btn-info" id="saveButton2" onclick="fnSaveSolicitud2()">Guardar</button>');


  function fnSaveSolicitud() {
    var form = document.getElementById('myForm');
    if (form.checkValidity()) {
      $('#saveButton').prop('disabled', true);
      $('#myForm').submit();
    } else {
      console.log('El formulario no es válido. Completar los campos requeridos antes de enviar.');
    }
  }

  function fnSaveSolicitud2() {
    var form = document.getElementById('myForm4');
    if (form.checkValidity()) {
      $('#saveButton2').prop('disabled', true);
      $('#myForm4').submit();
    } else {
      console.log('El formulario no es válido. Completar los campos requeridos antes de enviar.');
    }
  }
  
  function getSolicitud(idSolicitud) {
    return new Promise(function(resolve, reject) {
      $.ajax({
        url: window.location.protocol + '//' + window.location.host + "/getSolicitud/" + idSolicitud,
        method: 'GET',
        success: function(data) {
          resolve(data);
        },
        error: function(error) {
          reject(error);
        }
      });
    });
  }

  var solicitud;
  //modal edit
  async function fnOpenModalEdit(id) {
    var myModal = new bootstrap.Modal(document.getElementById('show4'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_edit_solicitud/" + id,
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow4").empty();
        // Establecer el contenido del modal
        $("#modalshow4").html(data);

        // Borrar contenido anterior
        $("#modalfooter4").empty();
        // Agregar el botón "Cerrar y Guardar" al footer
        $("#modalfooter4").append(closeButton);
        $("#modalfooter4").append(saveButton2);

        // Cambiar la acción del formulario
        $('#myForm4').attr('action', ruta_edit);

        // Mostrar el modal
        myModal.show();

        // Cambiar el tamaño del modal a "modal-lg"
        var modalDialog = myModal._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-sm');
        modalDialog.classList.remove('modal-lg');
      },
    });
    try {
      solicitud = await getSolicitud(id);
    } catch (error) {
      console.error('Error al obtener la solicitud:', error);
    }
  }

  $('#show4').on('show.bs.modal', function (event){
    $.get('select_tablas/',function(data){
      var divDescripcion = $('#div_descripcion1')
      divDescripcion.hide();
      var htmlSelectArea = '<option value="">Seleccione </option>'
      var htmlSelectLocalizacion = '<option value="">Seleccione </option>'
      var htmlSelectTipoSolicitud = '<option value="">Seleccione </option>'
      var htmlSelectEquipo = '<option value="">Seleccione </option>'
      var htmlDescripcionEquipo = ''
      // [0]=areas [1]=localizaciones [2]=tipo_solicitudes [3]=equipos_mant [5]=tipos_equipos

      var equipoPrecargado = false;
      var areaPrecargada = false;
      var tipoPrecargado = false;

      var tipoSolicitudSelected;
      var equipoSelected;
      var areaSelected;

      data[2].forEach(tipo_solicitud => {
        if (tipo_solicitud.nombre === solicitud[0].nombreTipoSolicitud) {
          htmlSelectTipoSolicitud += `<option value="${tipo_solicitud.id}" selected>${tipo_solicitud.nombre}</option>`;
          tipoPrecargado = true;
        } else {
          htmlSelectTipoSolicitud += `<option value="${tipo_solicitud.id}">${tipo_solicitud.nombre}</option>`;
        }
      });
          
      data[0].forEach(item => {
        if ((item.id_a === solicitud[0].idAreaProyecto) || (item.id_a === solicitud[0].idAreaEquipo) || (item.id_a === solicitud[0].idAreaEdilicio)) {
          htmlSelectArea += `<option value="${item.id_a}" selected>${item.nombre_a}</option>`;
          areaPrecargada = true;
        } else {
          htmlSelectArea += `<option value="${item.id_a}">${item.nombre_a}</option>`;
        }
      });

      data[3].forEach(equipo => {
        if (equipo.id === solicitud[0].idEquipo) {
          htmlSelectEquipo += `<option value="${equipo.id}" selected>${equipo.id}</option>`;
          equipoPrecargado = true;
        } else {
          htmlSelectEquipo += `<option value="${equipo.id}">${equipo.id}</option>`;
        }
      });

      $('#tipo_solicitud1').on('change', function () {
        tipoSolicitudSelected = $(this).val();
        const divEquipo = $('#div_equipo1');
        if (!tipoSolicitudSelected) {
          divEquipo.show();
          document.getElementById("localizacion1").setAttribute("required", "required");
        } 
        else if (tipoSolicitudSelected == 1) {
          divEquipo.show();
          document.getElementById("localizacion1").setAttribute("required", "required");
        } 
        else if (tipoSolicitudSelected == 2) {
          divEquipo.hide();
          divDescripcion.hide();
          document.getElementById("localizacion1").setAttribute("required", "required");
        }
        else if (tipoSolicitudSelected == 3) {
          divEquipo.hide();
          divDescripcion.hide();
          $('#div_localizacion1').hide();
          document.getElementById("localizacion1").removeAttribute("required");
        }
        $('#area1').prop('disabled', false);
        $('#localizacion1').prop('disabled', false);
        $('#descripcion_equipo1').prop('disabled', false);
      }); 

      $('#equipo1').on('change', function () {
        var equipoSelected = $(this).val();
        if (!equipoSelected) {
          $('#div_descripcion1').hide();
          $('#area1').prop('disabled', false);
          $('#localizacion1').prop('disabled', false);
        } else {
          for (var k = 0; k < data[3].length; k++) {
            if (equipoSelected == data[3][k].id) {
              var aux_tipo_equipo = data[3][k].id_tipo;
              // Obtener el id_area y id_localizacion del equipo seleccionado
              var idAreaEquipo = data[3][k].id_area;
              var idLocalizacionEquipo = data[3][k].id_localizacion;
              var htmlDescripcionEquipo = data[3][k].descripcion;
              // Establecer el valor de id_area en el select de área
              $('#descripcion_equipo1').val(htmlDescripcionEquipo).trigger('change');
              $('#area1').val(idAreaEquipo).trigger('change');
              // Establecer el valor de id_localizacion en el select de localización, o seleccionar la opción vacía si es nulo
              if (idLocalizacionEquipo) {
                $('#localizacion1').val(idLocalizacionEquipo).trigger('change');
              } else {
                // Agregar la opción "No aplica" en el select de localización
                $('#localizacion1').append('<option value="0">No aplica</option>');
                $('#localizacion1').val('0').trigger('change');
              }
              $('#area1').prop('disabled', true);
              $('#localizacion1').prop('disabled', true);
              $('#descripcion_equipo1').prop('disabled', true);
            }
          }
          $('#tipo_solicitud1').val('1');
          $('#div_localizacion1').show();
          $('#div_descripcion1').show();
        }
      });

      $('#area1').on('change', function () {
        areaSelected = $(this).val();

        // Obtener las localizaciones correspondientes al área seleccionada y agregarlas al select correspondiente
        let htmlSelectLocalizacion = '<option value="">Seleccione</option>';
        data[1].forEach(localizacion => {
          if (localizacion.id_area == areaSelected) {
            if ((localizacion.id === solicitud[0].idLocalizacionEquipo) || (localizacion.id === solicitud[0].idLocalizacionEdilicio)){
              htmlSelectLocalizacion += `<option value="${localizacion.id}" selected>${localizacion.nombre}</option>`;

            }else{
              htmlSelectLocalizacion += `<option value="${localizacion.id}">${localizacion.nombre}</option>`;
            }
          }
        });

        if(!areaSelected){
          $('#div_localizacion1').hide();
        } else{
          if (tipoSolicitudSelected == 3) {
            $('#div_localizacion1').hide();
          }
          else{
            $('#div_localizacion1').show();
          }
          $('#localizacion1').html(htmlSelectLocalizacion);
        }
      });
      
      $('#idSolicitud1').val(solicitud[0].idSolicitud);
      $('#estado1').val(solicitud[0].estado);
      $('#titulo1').val(solicitud[0].titulo);
      $("#descripcion1").val(solicitud[0].descripcion);
      $('#tipo_solicitud1').html(htmlSelectTipoSolicitud);
      $('#equipo1').select2();
      $('#equipo1').html(htmlSelectEquipo); 
      $('#area1').html(htmlSelectArea);
      $('#localizacion1').html(htmlSelectLocalizacion);

      if(tipoPrecargado){
        $('#tipo_solicitud1').trigger('change');
      }

      if(equipoPrecargado){
        $('#equipo1').trigger('change');
        $('#descripcion_equipo1').val(solicitud[0].descripcionEquipo);
      }

      if(areaPrecargada){
        $('#area1').trigger('change');
      }
    });
  });

  //modal store
  function fnOpenModalShowEquipos() {
    var myModal3 = new bootstrap.Modal(document.getElementById('show3'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_mostrar_equipos_mant/",
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow3").empty();
        // Establecer el contenido del modal
        $("#modalshow3").html(data);

        // Borrar contenido anterior
        $("#modalfooter3").empty();

        // Agregar el botón "Cerrar" al footer del modal interno
        $("#modalfooter3").append(closeButton);

        // Agregar listener al botón "Cerrar" del modal secundario
        closeButton.click(function(event) {
          event.stopPropagation();
          myModal3.hide();
        });

        // Mostrar el modal
        myModal3.show();

        var modalDialog = myModal3._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-sm');
        modalDialog.classList.add('modal-lg');
        modalDialog.style.width = '100%'; // Añade esta línea
        modalDialog.style.maxWidth = '100%'; // Añade esta línea
      },
    });
  }

  //modal store
  function fnOpenModalStore() {
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    var url = window.location.origin + "/show_store_solicitud/";
    var closeButton2 = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>');
    $.get(url, function(data) {
      // Borrar contenido anterior
      $("#modalshow").empty();

      // Establecer el contenido del modal
      $("#modalshow").html(data);

      // Borrar contenido anterior
      $("#modalfooter").empty();

      // Agregar el botón "Cerrar y Guardar" al footer
      $("#modalfooter").append(closeButton2);
      $("#modalfooter").append(saveButton);

      // Cambiar la acción del formulario
      $('#myForm').attr('action', ruta_create);

      // Mostrar el modal
      myModal.show();

      // Cambiar el tamaño del modal a "modal-lg"
      var modalDialog = myModal._element.querySelector('.modal-dialog');
      modalDialog.classList.remove('modal-sm');
      modalDialog.classList.remove('modal-lg');
    });

    $('#show2').on('show.bs.modal', function (event){
      $.get('select_tablas/',function(data){
        var divDescripcion = $('#div_descripcion')
        divDescripcion.hide();
        var htmlSelectArea = '<option value="">Seleccione </option>'
        var htmlSelectLocalizacion = '<option value="">Seleccione </option>'
        var htmlSelectTipoSolicitud = '<option value="">Seleccione </option>'
        var htmlSelectEquipo = '<option value="">Seleccione </option>'
        var htmlDescripcionEquipo = ''
        // [0]=areas [1]=localizaciones [2]=tipo_solicitudes [3]=equipos_mant [5]=tipos_equipos

        htmlSelectArea += data[0].map(item => `<option value="${item.id_a}">${item.nombre_a}</option>`).join('');
        htmlSelectTipoSolicitud += data[2].map(tipo_solicitud => `<option value="${tipo_solicitud.id}">${tipo_solicitud.nombre}</option>`).join('');
        htmlSelectEquipo += data[3].map(equipo => `<option value="${equipo.id}">${equipo.id}</option>`).join('');

        var tipoSolicitudSelected;
        var equipoSelected;
        var areaSelected;

        $("#equipo").select2();
        $('#equipo').html(htmlSelectEquipo);
        $('#tipo_solicitud').html(htmlSelectTipoSolicitud);
        $('#area').html(htmlSelectArea);
        $('#localizacion').html(htmlSelectLocalizacion);

        $('#tipo_solicitud').on('change', function () {
          tipoSolicitudSelected = $(this).val();
          const divEquipo = $('#div_equipo');

          if (!tipoSolicitudSelected) {
            divEquipo.show();
            document.getElementById("localizacion").setAttribute("required", "required");
          } 
          else if (tipoSolicitudSelected == 1) {
            divEquipo.show();
            document.getElementById("localizacion").setAttribute("required", "required");
          } 
          else if (tipoSolicitudSelected == 2) {
            divEquipo.hide();
            divDescripcion.hide();
            document.getElementById("localizacion").setAttribute("required", "required");
          }
          else if (tipoSolicitudSelected == 3) {
            divEquipo.hide();
            divDescripcion.hide();
            $('#div_localizacion').hide();
            document.getElementById("localizacion").removeAttribute("required");
          }
          $('#area').prop('disabled', false);
          $('#localizacion').prop('disabled', false);
          $('#descripcion_equipo').prop('disabled', false);
        }); 

        $('#equipo').on('change', function () {
          var equipoSelected = $(this).val();
          if (!equipoSelected) {
            $('#div_descripcion').hide();
            $('#area').prop('disabled', false);
            $('#localizacion').prop('disabled', false);
          } else {
            for (var k = 0; k < data[3].length; k++) {
              if (equipoSelected == data[3][k].id) {
                var aux_tipo_equipo = data[3][k].id_tipo;
                // Obtener el id_area y id_localizacion del equipo seleccionado
                var idAreaEquipo = data[3][k].id_area;
                var idLocalizacionEquipo = data[3][k].id_localizacion;
                var htmlDescripcionEquipo = data[3][k].descripcion;
                // Establecer el valor de id_area en el select de área
                $('#descripcion_equipo').val(htmlDescripcionEquipo).trigger('change');
                $('#area').val(idAreaEquipo).trigger('change');
                // Establecer el valor de id_localizacion en el select de localización, o seleccionar la opción vacía si es nulo
                if (idLocalizacionEquipo) {
                  $('#localizacion').val(idLocalizacionEquipo).trigger('change');
                } else {
                  // Agregar la opción "No aplica" en el select de localización
                  $('#localizacion').append('<option value="0">No aplica</option>');
                  $('#localizacion').val('0').trigger('change');
                }
                $('#area').prop('disabled', true);
                $('#localizacion').prop('disabled', true);
                $('#descripcion_equipo').prop('disabled', true);
              }
            }
            $('#tipo_solicitud').val('1');
            $('#div_localizacion').show();
            $('#div_descripcion').show();
          }
        });

        $('#area').on('change', function () {
          areaSelected = $(this).val();

          // Obtener las localizaciones correspondientes al área seleccionada y agregarlas al select correspondiente
          let htmlSelectLocalizacion = '<option value="">Seleccione</option>';
          data[1].forEach(localizacion => {
            if (localizacion.id_area == areaSelected) {
              htmlSelectLocalizacion += `<option value="${localizacion.id}">${localizacion.nombre}</option>`;
            }
          });

          if(!areaSelected){
            $('#div_localizacion').hide();
          } else{
            if (tipoSolicitudSelected == 3) {
              $('#div_localizacion').hide();
            }
            else{
              $('#div_localizacion').show();
            }
            $('#localizacion').html(htmlSelectLocalizacion);
          }
        });
      });
    });
  }
    
  function checkAll() {
    // Obtén el estado actual del checkbox "checkAll"
    var checkAllCheckbox = document.getElementById("checkAll");
    var isChecked = checkAllCheckbox.checked;

    // Obtén todos los checkboxes generados por el bucle
    var checkboxes = document.querySelectorAll("input[type='checkbox'][id^='cbox1']");

    // Marca o desmarca todos los checkboxes según el estado del checkbox "checkAll"
    for (let i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = isChecked;
    }

    // Si alguno de los checkboxes generados se desmarca, desmarca también el checkbox "checkAll"
    for (let i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener("change", function() {
        if (!this.checked) {
          checkAllCheckbox.checked = false;
        }
      });
    }

    checkAllCheckbox.addEventListener("change", function() {
      for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = this.checked;
      } 
    });

    for (let i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener("change", function() {
        var allChecked = true;
        for (let j = 0; j < checkboxes.length; j++) {
          if (!checkboxes[j].checked) {
            allChecked = false;
            break;
          }
        }
        checkAllCheckbox.checked = allChecked;
      });
    }
  }
  
  function getHistoricos(id) {
    return new Promise(function(resolve, reject) {
      $.ajax({
        url: window.location.protocol + '//' + window.location.host + "/getHistoricos/" + id,
        method: 'GET',
        success: function(data) {
          resolve(data);
        },
        error: function(error) {
          reject(error);
        }
      });
    });
  }

  $(document).ready(function(){
    $("#id").keyup(function(){
      _this = this;
      $.each($("#test tbody tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
          $(this).hide();
        else
          $(this).show();
      });
    });
  });

  //Duracion de alerta (agregado, elimnado, editado)
  $("solicitud").ready(function(){
    setTimeout(function(){
      $("div.alert").fadeOut();
    }, 5000 ); // 5 secs

  });

  //modal show
  function fnOpenModalShow(id) {
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_solicitud/" + id,
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow").empty();
        // Establecer el contenido del modal
        $("#modalshow").html(data);

        // Borrar contenido anterior
        $("#modalfooter").empty();

        // Agregar el botón "Cerrar" al footer
        $("#modalfooter").append(closeButton);

        // Mostrar el modal
        myModal.show();

        // Cambiar el tamaño del modal a "modal-lg"
        var modalDialog = myModal._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-sm');
        modalDialog.classList.add('modal-lg');
      },
    });
  }

  //modal update
  function fnOpenModalUpdate(id){
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_update_solicitud/" + id,
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow").empty();
        // Establecer el contenido del modal
        $("#modalshow").html(data);

        // Borrar contenido anterior
        $("#modalfooter").empty();

        // Agregar el botón "Cerrar y Guardar" al footer
        $("#modalfooter").append(closeButton);
        $("#modalfooter").append(saveButton);

        // Cambiar la acción del formulario
        $('#myForm').attr('action', ruta_update);

        // Mostrar el modal
        myModal.show();

        // Cambiar el tamaño del modal a "modal-lg"
        var modalDialog = myModal._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-sm');
        modalDialog.classList.add('modal-lg');
      },
    });
  }
  $('#show2').on('show.bs.modal', function (event) {
    $.get('select_estado/',function(data){
      var html_select = '<option value="">Seleccione </option>'

      for(var i = 0; i<data.length; i ++){
        html_select += '<option value ="'+data[i].id+'">'+data[i].nombre+'</option>';
      }
      $('#estado').html(html_select);

      $('#rep').on('change', function() {
        if ($(this).is(':checked')) {
          $('#divDescRep').show();
        } else {
          $('#divDescRep').hide();
        }
      });
    });
  });

  //modal assing
  function fnOpenModalAssing(id){
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_assing_solicitud/" + id,
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow").empty();
        // Establecer el contenido del modal
        $("#modalshow").html(data);

        // Borrar contenido anterior
        $("#modalfooter").empty();
        // Agregar el botón "Cerrar y Guardar" al footer

        $("#modalfooter").append(closeButton);
        $("#modalfooter").append(saveButton);

        // Cambiar la acción del formulario
        $('#myForm').attr('action', ruta_assing);

        // Mostrar el modal
        myModal.show();

        // Cambiar el tamaño del modal a "modal-sm"
        var modalDialog = myModal._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-lg');
        modalDialog.classList.add('modal-sm');
      },
    });
    $('#show2').on('show.bs.modal', function (event) {
      $.get('select_users/',function(data){
        var html_select = '<option value="">Seleccione </option>'
        for(var i = 0; i<data[0].length; i ++){
          for(var k = 0; k<data[1].length; k ++){
            if((data[0][i].id == data[1][k].model_id) && (data[1][k].role_id == 21 || data[1][k].role_id == 24 || data[1][k].role_id == 30)){
              html_select += '<option value ="'+data[0][i].id+'">'+data[0][i].name+'</option>';
            }
          }
        }
        $('#user').html(html_select);
      });
    });
  }
  
  function fnOpenModalReclaim(id){
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    $.ajax({
      url: window.location.protocol + '//' + window.location.host + "/show_reclamar_solicitud/" + id,
      type: 'GET',
      success: function(data) {
        // Borrar contenido anterior
        $("#modalshow").empty();
        // Establecer el contenido del modal
        $("#modalshow").html(data);

        // Borrar contenido anterior
        $("#modalfooter").empty();

        // Agregar el botón "Cerrar y Guardar" al footer
        $("#modalfooter").append(closeButton);
        $("#modalfooter").append(saveButton);

        // Cambiar la acción del formulario
        $('#myForm').attr('action', ruta_reclaim);

        // Mostrar el modal
        myModal.show();

        // Cambiar el tamaño del modal a "modal-lg"
        var modalDialog = myModal._element.querySelector('.modal-dialog');
        modalDialog.classList.remove('modal-sm');
        modalDialog.classList.add('modal-lg');
      },
    });
  }

  // Obtener el valor del parámetro "idsolicitud" de la URL
  var urlParams = new URLSearchParams(window.location.search);
  var idSolicitud = urlParams.get('idsolicitud');

  // Obtener el valor del parámetro "source" de la URL
  var source = urlParams.get('source');

  // Verificar si el acceso proviene del correo electrónico
  if (source === 'email') {
    // Ejecutar la función correspondiente con el valor de "idSolicitud"
    fnOpenModalReclaim(idSolicitud);
  }else if(source === 'detalle'){
    fnOpenModalShow(idSolicitud);
  }

</script>

@stop