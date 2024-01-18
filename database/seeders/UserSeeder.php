<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Agustin Gonzalez',
            'email' => 'agusgonzalez603@hotmail.com',
            'password' => bcrypt('123456')
        ])->assignRole('Administrador');

        User::create([
            'name' => 'Matias Retamozo',
            'email' => 'matias.retamozo@lafedar.com',
            'password' => bcrypt('123456')
        ])->assignRole('Administrador');

        /*User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');

        User::create([
            'name' => '',
            'email' => '',
            'password' => bcrypt('123456')
        ])->assignRole('');*/

    }
}
