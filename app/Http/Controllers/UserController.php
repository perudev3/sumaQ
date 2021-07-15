<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\User;

class UserController extends Controller
{
    public function GetUsers()
    {
        return User::all();
    }

    public function PostUsers(Request $request)
    {
        $user=User::create([
            'name' => $request->name, 
            'email' => $request->email, 
            'password' => Hash::make($request->password),
        ]);

        if ($user==true) {
            return [ 'status'=>'success', 'menssage'=>'Usuario Creado' ];
        }
    }
}