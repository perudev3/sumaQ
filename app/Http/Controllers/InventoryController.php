<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\tbl_inventories;
use App\tbl_products;

class InventoryController extends Controller
{
    public function GetInventario()
    {
            return tbl_products::with(['countInventory', 'category'])->get();
            
    }

    public function findByInventoryCode($codigo){

        return DB::table('tbl_inventories')
            ->select('tbl_inventories.*', 'tbl_products.*')
            ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
            ->where('inventories_codigo', 'like', "%$codigo%")
            ->where('sucursals_id', session('sucursal_id')) // Solo mostrar las de la sucursal elegida
            ->get();

    }


    public function GenerateQRInventorie($products_id)
    {
        $product =DB::table('tbl_inventories')
                ->select('tbl_inventories.*', 'tbl_products.*')
                ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                ->where('tbl_inventories.products_id', $products_id)
                ->where('tbl_inventories.sales_id', NULL)
                ->get();
        return view('generate_QR.inventorie_qr', compact('product'));
    }

    public function DetailsInventory($products_id)
    {
       /* return  DB::table('tbl_inventories')
                ->select('tbl_inventories.*', 'tbl_products.*')
                ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                ->where('tbl_inventories.products_id', $products_id)
                ->where('tbl_inventories.sales_id', NULL)
                ->get();*/
        $listainventory = tbl_inventories::with(['products' => function($query) {
                                    return $query->with('category', 'collection', 'material', 'discountsGroup');
                                }])
                                ->with('sizes')
                                ->where('products_id', $products_id)
                                ->where('sales_id', NULL)
                                ->get();
        $product = tbl_inventories::with(['products' => function($query) {
                                    return $query->with('category', 'collection', 'material', 'discountsGroup');
                                }])
                                ->with('sizes')
                                ->where('products_id', $products_id)
                                ->where('sales_id', NULL)
                                ->first();

        return [
            'lista' => $listainventory,
            'product' => $product,
        ];
    }
}
