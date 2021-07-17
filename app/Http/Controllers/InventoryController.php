<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\tbl_inventories;

class InventoryController extends Controller
{
    public function GetInventario()
    {
        $inventory = DB::table('tbl_inventories')
                    ->select('tbl_purchase_orders.*', 'tbl_products.*', 'tbl_inventories.*', 'users.*')
                    ->join('tbl_purchase_orders', 'tbl_purchase_orders.purchase_orders_id', 'tbl_inventories.purchase_orders_id')
                    ->join('tbl_products', 'tbl_products.products_id', 'tbl_inventories.products_id')
                    ->join('users', 'users.id', 'tbl_inventories.user_id')
                    ->where('sucursals_id', session('sucursal_id')) // Solo mostrar las de la sucursal elegida
                    ->where('sales_id', NULL)
                    ->groupBy('tbl_inventories.products_id')
                    ->paginate(18);

        return [
            'inventory' => $inventory->items(),
            'count' => $inventory->total()
        ];
    }

    public function findByInventoryCode($codigo){

        return DB::table('tbl_inventories')
            ->select('tbl_inventories.*', 'tbl_products.*')
            ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
            ->where('inventories_codigo', 'like', "%$codigo%")
            ->where('sucursals_id', session('sucursal_id')) // Solo mostrar las de la sucursal elegida
            ->get();

    }


    public function GenerateQRInventorie($codigo)
    {
        return view('generate_QR.inventorie_qr', compact('codigo'));
    }
}
