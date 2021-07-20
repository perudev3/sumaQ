<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SucursalsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mae_sucursals')->insert([
            'sucursals_name' => 'Principal',
            'sucursals_address' => 'Direccion #14 principal',
            'sucursals_is_active' => 1,
        ]);
        
        DB::table('mae_sucursals')->insert([
            'sucursals_name' => 'Secundaria',
            'sucursals_address' => 'Secu #333',
            'sucursals_is_active' => 1,
        ]);
        
        DB::table('mae_sucursals')->insert([
            'sucursals_name' => 'Sucursal Inactiva',
            'sucursals_address' => 'Inactivishon #44',
            'sucursals_is_active' => 0,
        ]);
    }
}
