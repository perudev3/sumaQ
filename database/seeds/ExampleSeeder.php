<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class ExampleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->insertSucursals();
        $this->insertCategories();
        $this->insertCollections();
        $this->insertMaterials();
    }


    public function insertMaterials()
    {
        DB::table('mae_materials')->insert([
            'materials_name' => 'Oro',
            'materials_image_url' => 'none.png',
        ]);
        DB::table('mae_materials')->insert([
            'materials_name' => 'Plata',
            'materials_image_url' => 'none.png',
        ]);
        DB::table('mae_materials')->insert([
            'materials_name' => 'Bronce',
            'materials_image_url' => 'none.png',
        ]);
    }


    public function insertCollections()
    {
        DB::table('mae_collections')->insert([
            'collections_name' => 'Coleccion por defecto',
            'collections_image_url' => 'collection.png',
        ]);
    }


    public function insertCategories()
    {
        DB::table('mae_categories')->insert([
            'categories_name' => 'Ropa',
            'categories_image_url' => 'none.png',
        ]);
        
        DB::table('mae_categories')->insert([
            'categories_name' => 'Videojuegos',
            'categories_image_url' => 'none.png',
        ]);
        
        DB::table('mae_categories')->insert([
            'categories_name' => 'Joyeria',
            'categories_image_url' => 'none.png',
        ]);
    }
    
    
    public function insertSucursals()
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
