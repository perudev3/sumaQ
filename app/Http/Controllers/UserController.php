<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\User;
use App\mae_roles;
use App\tbl_customer_users;

class UserController extends Controller
{
    public function GetUsers()
    {
        return tbl_customer_users::with([
            'user'=>function($query){
                return $query->with('roles');
            }
        ])->get();
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

        tbl_customer_users::create([
            'identification_document' => $request->identification_document, 
            'movil' => $request->movil, 
            'address' => $request->address, 
            'area' => $request->area, 
            'id' => $user->id,
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

        tbl_customer_users::where('id', $request['id'])->update([
            'identification_document' => $request->identification_document, 
            'movil' => $request->movil, 
            'address' => $request->address, 
            'area' => $request->area,
        ]);

        return ['status' => 'success'];
    }
}