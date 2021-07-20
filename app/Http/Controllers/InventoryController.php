<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\tbl_inventories;
use App\tbl_products;
use App\mae_size;

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

    public function GenerateQRByInventorie($inventories_codigo)
    {
        $product =DB::table('tbl_inventories')
                ->select('tbl_inventories.*', 'tbl_products.*')
                ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                ->where('tbl_inventories.inventories_codigo', $inventories_codigo)
                ->where('tbl_inventories.sales_id', NULL)
                ->get();
        return view('generate_QR.by_inventorie_qr', compact('product'));
    }

    public function DetailsInventory($products_id)
    {
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

    public function InvetarioAdd(Request $request)
    {
        $user = Auth::user();
        $size = mae_size::create([ 'medidas' => $request['medidas'] ]);

        for ($i=0; $i < $request['cantidad']; $i++) { 
            $inventario = tbl_inventories::create([
                'products_id' => $request['products_id'],
                'inventories_codigo' =>Str::random(4),
                'sizes_id' => $size->sizes_id,
                'user_id' => $user->id
            ]);
        }

        if ($inventario==true) {
            return ['status'=>'success'];
        }
    }
}
