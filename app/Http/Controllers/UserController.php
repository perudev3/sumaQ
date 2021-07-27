<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\User;
use App\mae_roles;

class UserController extends Controller
{
    public function GetUsers()
    {
        return User::with('roles')->get();
    }

    public function GetRoles()
    {
        return mae_roles::all();
    }

    public function PostUsers(Request $request)
    {
        $user=User::create([
            'roles_id' => $request->roles_id, 
            'name' => $request->name, 
            'email' => $request->email, 
            'password' => Hash::make($request->password),
        ]);

        if ($user==true) {
            return [ 'status'=>'success', 'menssage'=>'Usuario Creado' ];
        }
    }

    public function UpdateUser(Request $request){
        User::where('id', $request['id'])->update([
            'roles_id' => $request->roles_id, 
            'name' => $request->name, 
            'email' => $request->email,
        ]);

        return ['status' => 'success'];
    }
}