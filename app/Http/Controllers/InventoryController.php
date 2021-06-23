<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InventoryController extends Controller
{
    public function GetInventario()
    {
        return  \DB::table('tbl_inventories')
                    ->select('tbl_purchase_orders.*', 'tbl_products.*', 'purchase_order_details.*', 'tbl_inventories.*')
                    ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                    ->join('tbl_purchase_orders','tbl_purchase_orders.purchase_orders_id', '=', 'tbl_inventories.purchase_orders_id')
                    ->join('purchase_order_details','purchase_order_details.purchase_orders_id', '=', 'tbl_purchase_orders.purchase_orders_id')
                    ->get();
    }


    public function GenerateQRInventorie($codigo)
    {
        return view('generate_QR.inventorie_qr', compact('codigo'));
    }
}
