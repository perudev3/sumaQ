<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_products;

class SalesController extends Controller
{
    public function index()
    {
        $name_view='GENERAR VENTA';
        return view('processes_tables.tbl_sales', compact('name_view'));
    }

    public function Data_Products(Request $request)
    {
        return  \DB::table('tbl_inventories')
                    ->select('tbl_products.*', 'tbl_inventories.*')
                    ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                    ->where('tbl_inventories.inventories_codigo', $request['codigo_inventorie'])
                    ->get();
    }

    public function Data_Products_Pedidos(Request $request)
    {
        $array_data = $request->data_pedidos;

        foreach ($array_data as $key => $value) {
            return tbl_products::where('products_id',$value)->get();
        }
    }
}
