<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\mae_category;

class CategoryController extends Controller
{
    public function GetCategories()
    {
        return mae_category::all();
    }

    public function PostCategories(Request $request){

       $images = $request->file('categories_image_url');
       
        $category=mae_category::create([
            'categories_name'=>$request['categories_name'],
        ]);
        $cont = 0;
        foreach($images as $img){

            $custom_name = 'category-'.$category->categories_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
            if  ($cont === 0){
                $category->categories_image_url = $custom_name;
            }else{
                break;
            }
            $img->move(public_path().'/img_category',$custom_name);
            $category->update();
            $cont++;
        }

        if ($category==true) {
            return [ "status" => "success", "message" => "Categoria Creada con Exito"];
        }else{
            return [ "status" => "error", "message" => "Error al Registrar la Categoria"];
        }
    }


    public function SearchCategory(Request $request)
    {
        $categories_name = $request->categories_name;

        return mae_category::where('categories_name', 'like', '%'.$categories_name.'%')->get();
    }

    public function EditCategories(Request $request)
    {
        $image = $request->file('categories_image_url');

        if ($image==true) {
            $categories_id = $request->categories_id;
            $cont = 0;
            foreach($image as $img){

                $custom_name = 'category-'.$categories_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
                if  ($cont === 0){
                    $category=mae_category::where('categories_id', $categories_id)->update([
                        'categories_name'=>$request['categories_name'],
                        'categories_image_url' => $custom_name,
                    ]);
                }else{
                    break;
                }
                $img->move(public_path().'/img_category',$custom_name);
                $cont++;
            }

            if ($category==true) {
                return [ "status" => "success", "message" => "Categoria Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar la Categoria"];
            }
        }else{
            $categories_id = $request->categories_id;
            $category=mae_category::where('categories_id', $categories_id)->update([
                'categories_name'=>$request['categories_name'],
            ]);

            if ($category==true) {
                return [ "status" => "success", "message" => "Categoria Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar la Categoria"];
            }
        }
    }
}
