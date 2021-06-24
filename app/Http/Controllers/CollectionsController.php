<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\mae_collections;

class CollectionsController extends Controller
{
    public function GetCollections()
    {
        return mae_collections::all();
    }

    public function PostCollections(Request $request){

       $images = $request->file('collections_image_url');
       
        $colletion=mae_collections::create([
            'collections_name'=>$request['collections_name'],
        ]);
        $cont = 0;
        foreach($images as $img){

            $custom_name = 'colletion-'.$colletion->collections_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
            if  ($cont === 0){
                $colletion->collections_image_url = $custom_name;
            }else{
                break;
            }
            $img->move(public_path().'/img_collection',$custom_name);
            $colletion->update();
            $cont++;
        }

        if ($colletion==true) {
            return [ "status" => "success", "message" => "Categoria Creada con Exito"];
        }else{
            return [ "status" => "error", "message" => "Error al Registrar la Categoria"];
        }
    }

    public function SearchCollection(Request $request)
    {
        $collections_name = $request->collections_name;

        return mae_collections::where('collections_name', 'like', '%'.$collections_name.'%')->get();
    }

    public function EditCollections(Request $request)
    {
        $image = $request->file('collections_image_url');

        if ($image==true) {
            $collections_id = $request->collections_id;
            $cont = 0;
            foreach($image as $img){

                $custom_name = 'collections-'.$collections_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
                if  ($cont === 0){
                    $collections=mae_collections::where('collections_id', $collections_id)->update([
                        'collections_name'=>$request['collections_name'],
                        'collections_image_url' => $custom_name,
                    ]);
                }else{
                    break;
                }
                $img->move(public_path().'/img_collection',$custom_name);
                $cont++;
            }

            if ($collections==true) {
                return [ "status" => "success", "message" => "Coleccion Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar la Coleccion"];
            }
        }else{
            $collections_id = $request->collections_id;
            $collections=mae_collections::where('collections_id', $collections_id)->update([
                'collections_name'=>$request['collections_name'],
            ]);

            if ($collections==true) {
                return [ "status" => "success", "message" => "Coleccion Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar la Coleccion"];
            }
        }
    }
}
