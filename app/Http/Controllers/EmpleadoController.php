<?php

namespace App\Http\Controllers;

use Krucas\Notification\Middleware\NotificationMiddleware;
use Krucas\Notification\Facades\Notification;
use Illuminate\Routing\Controller;
use Illuminate\Database\Seeder;
use Illuminate\Http\Request;
use App\JefeXArea;
use App\Empleado;
use App\Persona;
use App\User;
Use Session;
use Auth;
use DB;

class EmpleadoController extends Controller{

    public function index(Request $request){
        $empleados = Empleado::Relacion()->get();

        return view ('empleado.index', array('empleados' => $empleados));
    }
    
    public function store(Request $request){
        $aux= DB::table('personas')->where('personas.dni',$request['dni'])->first();

        if($aux){
            Session::flash('message','DNI ingresado ya se encuentra asignado');
            Session::flash('alert-class', 'alert-warning');
            return redirect()->back()->withInput();
        }

        $activo = ($request['actividadCreate'] == 'on') ? 1 : 0;
        $jefe = ($request['esJefeCreate'] == 'on') ? 1 : 0;

        $empleado = new Empleado;
        $empleado->nombre_p = $request['nombre'];
        $empleado->apellido = $request['apellido'];
        $empleado->dni = $request['dni'];
        $empleado->interno = $request['interno'];
        $empleado->correo = $request['correo'];
        $empleado->fe_nac = $request['fe_nac'];
        $empleado->fe_ing = $request['fe_ing'];
        $empleado->area = $request['area'];
        $empleado->activo = $activo;
        $empleado->jefe = $jefe;
        $empleado->activo = 1;
        $empleado->save();

        Session::flash('message','Empleado agregado con éxito');
        Session::flash('alert-class', 'alert-success');

        return redirect('empleado');
    }
    
    public function show($id){}

    public function edit($id){
        $empleados = DB::table('personas')
        ->leftjoin('area','personas.area','area.id_a')
        ->where('personas.id_p',$id)
        ->first();

        $area = DB::table('area')->get();
        
        return view ('empleado.edit', ['empleado' => $empleados], ['area' => $area]);
    }
    
    public function update(Request $request, $id){
        $activo = ($request['actividad'] == 'on') ? 1 : 0;
        $jefe = ($request['esJefe'] == 'on') ? 1 : 0;

        if(!$activo) {
            //elimino todas las filas en las que el usuario tenia permisos 
            DB::table('model_has_roles')
                ->leftjoin('users', 'users.id', 'model_has_roles.model_id')
                ->leftjoin('personas', 'personas.usuario', 'users.id')
                ->where('personas.id_p', $request['id_p'])
                ->delete();
            //elimino usuario si descativo la persona
            DB::table('users')
                ->join('personas', 'users.id', '=', 'personas.usuario')
                ->where('personas.id_p', $request['id_p'])
                ->delete();
        }

        $empleado = DB::table('personas')
            ->where('personas.id_p',$request['id_p'])
            ->update([
                'nombre_p' => $request['nombre'],
                'apellido' => $request['apellido'],
                'dni' => $request['dni'],
                'interno' => $request['interno'],
                'correo' => $request['correo'],
                'fe_nac' => $request['fe_nac'],
                'fe_ing' => $request['fe_ing'],
                'area' => $request['area'],
                'activo' => $activo,
                'jefe' => $jefe,
            ]);      

        Session::flash('message','Empleado modificado con éxito');
        Session::flash('alert-class', 'alert-success');
        return redirect('empleado');
    }

    public function destroy_empleado(Request $request, $id){
        $empleado = Empleado::find($id);
        $empleado->activo = 0;
        $empleado->save();

         return response()->json([
        'message' => 'Empleado eliminado con éxito'
        ]);       
    }

    public function selectAreaEmpleados(){
        return DB::table('area')->get();
    }  

    public function showUpdateAreaXJefe($id){
        $idsJAs = Empleado::showAreaXJefeUpdate($id);
        return view('empleado.update', ['idsJAs' => $idsJAs, 'idJefe' => $id]);
    }

    public function obtenerNuevoListadoAreaXJefe($id){
        $idsJAs = Empleado::showAreaXJefeUpdate($id);
        return view('empleado.update', ['idsJAs' => $idsJAs, 'idJefe' => $id]);
    }
}