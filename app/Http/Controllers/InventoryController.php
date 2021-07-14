<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InventoryController extends Controller
{
    public function GetInventario()
    {
        return  DB::table('tbl_inventories')
                    ->select('tbl_purchase_orders.*', 'tbl_products.*', 'tbl_inventories.*', 'users.*', 'mae_sucursals.*')
                    ->join('tbl_purchase_orders', 'tbl_purchase_orders.purchase_orders_id', 'tbl_inventories.purchase_orders_id')
                    ->join('tbl_products', 'tbl_products.products_id', 'tbl_inventories.products_id')
                    ->join('mae_sucursals', 'tbl_inventories.sucursals_id', 'mae_sucursals.sucursals_id')
                    ->join('users', 'users.id', 'tbl_inventories.user_id')
                    ->where('tbl_inventories.sucursals_id', session('sucursal')[0]['sucursals_id']) // Solo mostrar las de la sucursal elegida
                    ->get();
    }

    public function findByInventoryCode($codigo){

        return DB::table('tbl_inventories')
            ->select('tbl_inventories.*', 'tbl_products.*')
            ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
            ->where('inventories_codigo', 'like', "%$codigo%")
            ->where('sucursals_id', session('sucursal')[0]['sucursals_id']) // Solo mostrar las de la sucursal elegida
            ->get();

    }


    public function GenerateQRInventorie($codigo)
    {
        return view('generate_QR.inventorie_qr', compact('codigo'));
    }
}
