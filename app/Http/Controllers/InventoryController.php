<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
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
            return tbl_inventories::with([
                'products' => function($query){
                    return $query->with(['discountsGroup','category', 'collection', 'material']);
                }
            ])
            ->where('inventories_codigo', 'like', "%$codigo%")
            ->where('sucursals_id', session('sucursal_id'))
            ->get();
    }


    public function GenerateQRInventorie($products_id)
    {
        $product = tbl_inventories::with('products','sizes','sales')
                                    ->where('products_id', $products_id)
                                    ->where('sales_id', NULL)
                                    ->where('layaway_id', NULL)
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
                ->where('tbl_inventories.layaway_id', NULL)
                ->get();
        return view('generate_QR.by_inventorie_qr', compact('product'));
    }

    public function DetailsInventory($products_id)
    {
        /* $listainventory = tbl_inventories::with(['products' => function($query) {
                                    return $query->with(['category', 'collection', 'material', 'discountsGroup']);
                                }])
                                ->with(['sizes', 'sales'])
                                ->where('products_id', $products_id)
                                ->where('sales_id', NULL)
                                ->orderBy('inventories_id')
                                ->get(); */
        $listainventory = tbl_inventories::with(['products' => function($query) {
                                    return $query->with(['collection', 'material', 'discountsGroup']);
                                }])
                                ->with(['sizes', 'sales', 'layaway'])
                                ->where('products_id', $products_id)
                                ->orderBy('inventories_id')
                                ->get();
                                
         
        $product = tbl_products::with(['category', 'collection', 'material', 'discountsGroup'])
                                ->where('products_id', $products_id)
                                ->first();

        return [
            'lista' => $listainventory,
            'product' => $product,
        ];
    }

    public function InvetarioAdd(Request $request)
    {
        $inputs_add = $request->inputs_add;
        $user = Auth::user();
        foreach ($inputs_add as $key => $value) {
            $size = mae_size::create([ 'medidas' => $value['medidas'] ]);
            
            for ($i=0; $i < $value['cantidad']; $i++) { 
                $inventario = tbl_inventories::create([
                    'products_id' => $request->products_id,
                    'sucursals_id' => session('sucursal_id'),
                    'inventories_codigo' =>Str::random(4),
                    'sizes_id' => $size->sizes_id,
                    'user_id' => $user->id
                ]);
            }
        }  
    }

    public function UploadImageInventorie(Request $request)
    {
        $dir = public_path()."/img_inventories/";
        $image = $request->file('inventories_image_url');
        $date = Carbon::now();
        $name = 'inventories-'.Str::uuid()->toString().'-'.$date->format('Y-m-d').'.'.$image->getClientOriginalExtension();
        $inventories = tbl_inventories::where('inventories_codigo', $request['inventories_codigo'])->update([
            'inventories_image_url'=>$name,
        ]);
        $image->move($dir,$name);

        if ($inventories==true) {
            return [ "status" => "success", "message" => "Imagen Subido con Exito"];
        }
    }
}
