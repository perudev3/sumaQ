<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        // Si no existe la sesion de sucursal
        if(!$request->session()->exists('sucursal_id')) {
            return redirect()->route('sucursal.seleccionar.get');
        }

        $name_view = 'HOME';
        return view('home', compact('name_view'));
    }

   
}
