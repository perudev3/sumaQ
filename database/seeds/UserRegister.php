<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserRegister extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Testing',
            'email' => 'test@gmail.com',
            'password' => Hash::make('testing456'),
        ]);
    }
}
