<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\tbl_products;
use App\mae_category;
use App\mae_materials;
use App\mae_collections;
use App\mae_discounts;

class ProductsController extends Controller
{
    public function GetProducts()
    {        
        return  \DB::table('tbl_products')
                    ->select('tbl_products.*', 'mae_collections.*','mae_materials.*', 'mae_categories.*')
                    ->join('mae_collections','mae_collections.collections_id', '=', 'tbl_products.collections_id')
                    ->join('mae_materials','mae_materials.materials_id', '=', 'tbl_products.material_id')
                    ->join('mae_categories','mae_categories.categories_id', '=', 'tbl_products.category_id')
                    ->get();
    }

    public function PostProducts(Request $request)
    {
        $images = $request->file('products_image_url');
        if ($request['discounts_id'] == true) {
            $porcentaje=mae_discounts::where('discounts_id', $request['discounts_id'])->first();
            $desc = ($request['products_price']*$porcentaje->discounts_porcentaje)/100;
            $products_net_price = $request['products_price']-$desc;

            $products= tbl_products::create([
                'products_name' => $request['products_name'],
                'collections_id' => $request['collections_id'],
                'category_id' => $request['category_id'],
                'material_id' => $request['materials_id'],
                'products_caracts' => $request['products_caracts'],
                'products_size' => $request['products_size'],
                'products_price' => $request['products_price'],
                'products_net_price' => $products_net_price,
                'discounts_id' => $request['discounts_id'],
                'products_is_active'=> $request['products_is_active'],
    
            ]);

            $cont = 0;
            foreach($images as $img){

                $custom_name = 'products-'.'-'.\Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
                if  ($cont === 0){
                    $products->products_image_url = $custom_name;
                }else{
                    break;
                }
                $img->move(public_path().'/img_products',$custom_name);
                $products->update();
                $cont++;
            }
    

            if ($products==true) {
                return ['status'=>'success' , 'message'=>'Producto Registrado'];
            }
        }else{

            $products= tbl_products::create([
                'products_name' => $request['products_name'],
                'collections_id' => $request['collections_id'],
                'category_id' => $request['category_id'],
                'material_id' => $request['materials_id'],
                'products_caracts' => $request['products_caracts'],
                'products_size' => $request['products_size'],
                'products_price' => $request['products_price'],
                'products_is_active'=> $request['products_is_active'],    
            ]);

            $cont = 0;
            foreach($images as $img){

                $custom_name = 'products-'.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
                if  ($cont === 0){
                    $products->products_image_url = $custom_name;
                }else{
                    break;
                }
                $img->move(public_path().'/img_products',$custom_name);
                $products->update();
                $cont++;
            }

            if ($products==true) {
                return ['status'=>'success' , 'message'=>'Producto Registrado'];
            }
        }
        


        
    }

    public function SearchProducts(Request $request)
    {
        $products_name = $request->products_name;

        return tbl_products::where('products_name', 'like', '%'.$products_name.'%')->get();
    }

    public function GenerateQR($id)
    {
        $product = tbl_products::where('products_id', $id)->get();
        return view('generate_QR.product_qr', compact('product'));
    }

    public function GetListProducts(Request $request)
    {
        return tbl_products::where('category_id', $request['categories_id'])->where('collections_id', $request['collections_id'])->get();
    }
}
