<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\mae_materials;

class MaterialController extends Controller
{
    public function GetMaterials()
    {
        return mae_materials::all();
    }

    public function PostMaterials(Request $request){

       $images = $request->file('materials_image_url');
       
        $material = mae_materials::create([
            'materials_name' => $request->materials_name,
        ]);

        foreach($images as $img){

            $custom_name = 'material-'.$material->materials_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
            
            $img->move(public_path('img_material'), $custom_name);
            
            $material->materials_image_url = $custom_name;
            $material->save();
            
            break;
        }

        if ($material==true) {
            return [ "status" => "success", "message" => "Material Creada con Exito"];
        }else{
            return [ "status" => "error", "message" => "Error al Registrar el Material"];
        }
    }

    public function SearchMaterials(Request $request)
    {
        $materials_name = $request->materials_name;

        return mae_materials::where('materials_name', 'like', '%'.$materials_name.'%')->get();
    }

    public function EditMaterials(Request $request)
    {
        $image = $request->file('materials_image_url');

        if ($image==true) {
            $materials_id = $request->materials_id;
            $cont = 0;
            foreach($image as $img){

                $custom_name = 'materials-'.$materials_id.'-'.Str::uuid()->toString().'.'.$img->getClientOriginalExtension();
                if  ($cont === 0){
                    $materials=mae_materials::where('materials_id', $materials_id)->update([
                        'materials_name'=>$request['materials_name'],
                        'materials_image_url' => $custom_name,
                    ]);
                }else{
                    break;
                }
                $img->move(public_path().'/img_material',$custom_name);
                $cont++;
            }

            if ($materials==true) {
                return [ "status" => "success", "message" => "Material Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar el Material"];
            }
        }else{
            $materials_id = $request->materials_id;
            $materials=mae_materials::where('materials_id', $materials_id)->update([
                'materials_name'=>$request['materials_name'],
            ]);

            if ($materials==true) {
                return [ "status" => "success", "message" => "Material Actualizada"];
            }else{
                return [ "status" => "error", "message" => "Error al Actualizar el Material"];
            }
        }
    }
}
