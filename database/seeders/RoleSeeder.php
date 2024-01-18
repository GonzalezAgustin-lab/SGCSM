<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $role1 = Role::create(['name' => 'Administrador']);
        $role2 = Role::create(['name' => 'Jefe-Mantenimiento']);
        $role3 = Role::create(['name' => 'Empleado-Mantenimiento']);
        $role4 = Role::create(['name' => 'Jefe-GarantiaDeCalidad']);
        $role5 = Role::create(['name' => 'Empleado-Mantenimiento-Asigna-Solicitudes']);
        $role6 = Role::create(['name' => 'Empleado-Mantenimiento-Ve-Solicitudes']);
        $role7 = Role::create(['name' => 'Ver-Todas-Las-Solicitudes']);
        $role8 = Role::create(['name' => 'Ver-Todas-Las-Solicitudes-Y-Proyectos']);
        $role9 = Role::create(['name' => 'Empleado-Mantenimiento-Ve-Proyectos']);
        $role10 = Role::create(['name' => 'Empleado-Mantenimiento-Ve-Solicitudes-Recibe-Repuestos']);
        $role11 = Role::create(['name' => 'Empleado-Mantenimiento-Ve-Proyectos-Asigna']);
        $role12 = Role::create(['name' => 'ver-proyectos']);

        Permission::create(['name' => 'ver_solicitante'])->syncRoles([$role1]);
        Permission::create(['name' => 'ver_encargado'])->syncRoles([$role1]);
        Permission::create(['name' => 'actualizar-solicitud'])->syncRoles([$role1,$role2,$role3,$role6,$role9,$role10,$role11]);
        Permission::create(['name' => 'asignar-solicitud'])->syncRoles([$role1,$role2,$role5,$role11]);
        Permission::create(['name' => 'agregar-equiposmant'])->syncRoles([$role1,$role4,$role2]);
        Permission::create(['name' => 'editar-equiposmant'])->syncRoles([$role1,$role4,$role2]);
        Permission::create(['name' => 'eliminar-solicitud'])->syncRoles([$role1,$role2]);
        Permission::create(['name' => 'ver-todas-las-solicitudes'])->syncRoles([$role2,$role6,$role7]);
        Permission::create(['name' => 'ver-solicitudes-asignadas'])->syncRoles([$role3]);
        Permission::create(['name' => 'reporte-solicitudes'])->syncRoles([$role1,$role3,$role2,$role5,$role6,$role7,$role8,$role9,$role10,$role11]);
        Permission::create(['name' => 'ver-solicitudes-sin-asignar'])->syncRoles([$role5]);
        Permission::create(['name' => 'ver-todas-las-solicitudes-y-proyectos'])->syncRoles([$role1,$role8,$role9,$role10,$role11]);
        Permission::create(['name' => 'ver-proyectos']);
        Permission::create(['name' => 'correo-de-repuestos'])->syncRoles([$role10]);

    }
}
