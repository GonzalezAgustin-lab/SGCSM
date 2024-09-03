@extends('mantenimientoPreventivo.layouts.layout')
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
      
    </form>          
  </div>
</div>
<!-- tabla de datos -->
<div class="col-md-12">             
  <table class="table table-striped table-bordered ">
    <thead>
      
    </thead>
    <tbody>

    </tbody>
  </table>

  <style>
  .btnEliminar{
      background: transparent; /* Fondo transparente */
      border: none; /* Sin borde */
      padding: 0; /* Sin padding */
      cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
      outline: none; /* Elimina el borde de enfoque */
  }

  .btnEliminar:focus {
      outline: none; /* Elimina el borde de enfoque cuando el botón está enfocado */
  }
  </style>

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

  <div class="modal fade" id="show3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog estilo" role="document">
      <div class="modal-content">
        <form id="myForm3" method="POST" enctype="multipart/form-data">
          {{csrf_field()}}
          <div id="modalshow3" class="modal-body">
            <!-- Datos -->
          </div>
          <div id="modalfooter3" class="modal-footer">
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
  var ruta_create = '{{ route('store_mant_prev') }}';
  var closeButton = $('<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>');
  var saveButton = $('<button type="submit" class="btn btn-info" id="saveButton" onclick="fnSaveMantPrev()">Guardar</button>');

  function fnSaveMantPrev() {
    var form = document.getElementById('myForm');
    if (form.checkValidity()) {
      $('#saveButton').prop('disabled', true);
      $('#myForm').submit();
    } else {
      console.log('El formulario no es válido. Completar los campos requeridos antes de enviar.');
    }
  }

  //modal store
  function fnOpenModalStore() {
    var myModal = new bootstrap.Modal(document.getElementById('show2'));
    var url = window.location.origin + "/show_store_mant_prev/";
    $.get(url, function(data) {
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
        var htmlSelectFrecuencia = '<option value="">Seleccione </option>'
        var htmlSelectEquipo = '<option value="">Seleccione </option>'

        htmlSelectFrecuencia += data[0].map(item => `<option value="${item.id}">${item.nombre}</option>`).join('');
        htmlSelectEquipo += data[1].map(equipo => `<option value="${equipo.id}">${equipo.id}</option>`).join(''); 

        $('#equipo').html(htmlSelectEquipo);  
        $('#frecuencia').html(htmlSelectFrecuencia);   
      });
    });
  } 

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
        modalDialog.style.width = '90%'; // Añade esta línea
        modalDialog.style.maxWidth = '90%'; // Añade esta línea
      },
    });
  }

</script>

@stop