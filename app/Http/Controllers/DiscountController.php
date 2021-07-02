<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use DB;
use App\mae_discounts;
use App\tbl_products;
use App\tbl_group_discounts;

class DiscountController extends Controller
{
    public function GetDiscounts()
    {
        return mae_discounts::all();
    }

    public function GetGroupDiscounts()
    {
        return  \DB::table('tbl_group_discounts')
                    ->select('*')
                    ->join('mae_collections','mae_collections.collections_id', '=', 'tbl_group_discounts.collections_id')
                    ->join('tbl_products','tbl_products.products_id', '=', 'tbl_group_discounts.products_id')
                    ->join('mae_categories','mae_categories.categories_id', '=', 'tbl_group_discounts.categories_id')
                    ->join('mae_discounts','mae_discounts.discounts_id', '=', 'tbl_group_discounts.discounts_id')                    
                    ->groupBy(DB::raw('tbl_group_discounts.group_discounts_name'))
                    ->get();
    }

    public function PostDiscounts(Request $request)
    {
        $user=\Auth::user();
       
        $discount=mae_discounts::create([
            'discounts_name' => $request['discounts_name'],
            'discounts_porcentaje' => $request['discounts_porcentaje'],
            'discounts_start_date' => $request['discounts_start_date'],
            'discounts_end_date' => $request['discounts_end_date'],
            'user_id' => $user->id,
            'discounts_stock_max' => $request['discounts_stock_max']

        ]);

        if ($discount==true) {
            return [ "status" => "success", "message" => "Descuento creado con Exito"];
        }else{
            return [ "status" => "error", "message" => "Error al Registrar el descuento"];
        }
    }
    
    public function SearchDiscounts(Request $request)
    {
        $discounts_name = $request->discounts_name;

        return mae_discounts::where('discounts_name', 'like', '%'.$discounts_name.'%')->get();
    }

    public function EditDiscounts(Request $request)
    {
        $discounts_id = $request->discounts_id;   
        $user=\Auth::user();    
        $discount=mae_discounts::where('discounts_id', $discounts_id)->update([
            'discounts_name' => $request['discounts_name'],
            'discounts_porcentaje' => $request['discounts_porcentaje'],
            'discounts_start_date' => $request['discounts_start_date'],
            'discounts_end_date' => $request['discounts_end_date'],
            'user_id' => $user->id,
            'discounts_stock_max' => $request['discounts_stock_max']

        ]);

        if ($discount==true) {
            return [ "status" => "success", "message" => "Descuento Actualizado con Exito"];
        }else{
            return [ "status" => "error", "message" => "Error al Actualizar el descuento"];
        }
    }

    public function CreateGroupDiscounts(Request $request)
    {
        $porcentaje=mae_discounts::where('discounts_id', $request['discounts_id'])->first();
        $list_products= $request->data_listproducts;

        for ($i=0; $i < count($list_products); $i++) { 
            $group_discount = tbl_group_discounts::create([
                'group_discounts_name' => $request->group_discounts_name,
                'discounts_id' => $request->discounts_id,
                'products_id' => $list_products[$i],
                'categories_id' => $request->categories_id,
                'collections_id' => $request->collections_id,
            ]);
        }


        for ($i=0; $i < count($list_products); $i++) { 

            $products=tbl_products::where('products_id', $list_products[$i])->first();
            $desc = ($products->products_price*$porcentaje->discounts_porcentaje)/100;
            $products_net_price = $products->products_price - $desc;

            tbl_products::where('products_id', $list_products[$i])->update([
                'products_net_price' => $products_net_price,
                'discounts_id' =>  $request->discounts_id,
            ]);
        }

        if ($group_discount) {
            return ['status'=>'success'];
        }
    }
}
