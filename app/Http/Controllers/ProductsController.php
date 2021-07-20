<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\tbl_products;
use App\mae_category;
use App\mae_materials;
use App\mae_collections;
use App\mae_discounts;
use App\tbl_inventories;

class ProductsController extends Controller
{
    public function GetProducts()
    {        
        return  tbl_products::with(['discountsGroup' => function($query) {
            return $query->with('discounts');
        }])
        ->with(['category', 'collection', 'material'])->get();
    }

    public function PostProducts(Request $request)
    {
        $images = $request->file('products_image_url');
            $products= tbl_products::create([
                'products_name' => $request['products_name'],
                'collections_id' => $request['collections_id'],
                'categories_id' => $request['category_id'],
                'materials_id' => $request['materials_id'],
                'products_caracts' => $request['products_caracts'],
                'products_price' => $request['products_price'],
                'products_is_active'=> $request['products_is_active'],
    
            ]);

            $cont = 0;
            foreach($images as $img){

                $custom_name = 'products-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
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

    public function PutProducts(Request $request){

        // Obtenemos el producto
        $producto = tbl_products::findOrFail($request->products_id);

        $producto->update([
            'products_name' => $request['products_name'],
            'collections_id' => $request['collections_id'],
            'categories_id' => $request['category_id'],
            'material_id' => $request['materials_id'],
            'products_caracts' => $request['products_caracts'],
            'products_price' => $request['products_price'],
            'products_is_active'=> $request['products_is_active'],
        ]);

        // Si el usuario modifico la imagen
        if($request->hasFile('products_image_url')){

            // Si el producto tiene ya una imagen
            if($producto->products_image_url != null && $producto->products_image_url != ""){
                // Borramos la imagen anterior
                unlink(public_path()."/img_products/".$producto->products_image_url);
            }

           
            // Obtenemos la imagen
            $img = $request->products_image_url;
            // Formamos el nombre de la imagen
            $custom_name = 'products-'.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
            // Movemos la imagen al directorio
            $img->move(public_path().'/img_products',$custom_name);
            // Guardamos el nombre de la imagen en la base de datos
            $producto->products_image_url = $custom_name;
            $producto->update();

        }

        return ['status'=>'success' , 'message'=>'Producto Editado'];

    }

    public function SearchProducts(Request $request)
    {
        $products_name = $request->products_name;

        return tbl_products::where('products_name', 'like', '%'.$products_name.'%')->get();
    }

    public function GetListProducts(Request $request)
    {
        return tbl_products::where('categories_id', $request['categories_id'])->where('collections_id', $request['collections_id'])->get();
    }
}
