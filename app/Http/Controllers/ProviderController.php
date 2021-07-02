<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\mae_providers;

class ProviderController extends Controller
{
    public function GetProvider()
    {
        return mae_providers::all();
    }

    public function PostProvider(Request $request)
    {
        
        $category=mae_providers::create([
            'providers_name' => $request['providers_name'],
            'providers_id_number' => $request['providers_id_number'],
            'providers_address' => $request['providers_address'],
            'providers_encargado' => $request['providers_encargado'],
            'providers_mobile' => $request['providers_mobile'],
            'providers_is_active' => $request['providers_is_active'],
        ]);

        if ($category) {
            return ['status'=>'success', 'message'=>'Proveedor Registrado'];
        }

    }

    public function SearchProviders(Request $request)
    {
        $providers_name = $request->providers_name;

        return mae_providers::where('providers_name', 'like', '%'.$providers_name.'%')->get();
    }


    public function EditProviders(Request $request)
    {
        $providers_id = $request->providers_id;
        $providers=mae_providers::where('providers_id', $providers_id)->update([
            'providers_name' => $request['providers_name'],
            'providers_id_number' => $request['providers_id_number'],
            'providers_address' => $request['providers_address'],
            'providers_encargado' => $request['providers_encargado'],
            'providers_mobile' => $request['providers_mobile'],
            'providers_is_active' => $request['providers_is_active'],
        ]);

        if ($providers) {
            return ['status'=>'success', 'message'=>'Proveedor ACtualizado'];
        }
    }

}
