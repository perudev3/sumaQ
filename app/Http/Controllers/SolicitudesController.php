<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\tbl_solicitudes;

class SolicitudesController extends Controller
{

    public function GetSolicitudes()
    {
        return tbl_solicitudes::with('To')
                                ->where('solicitudes_from', session('sucursal')[0]->sucursals_id)
                                ->get();
    }

    public function GetSolicitante()
    {

        return  DB::table('tbl_solicitudes')->select('tbl_solicitudes.*', 'mae_sucursals.*','tbl_products.*')
                                            ->join('mae_sucursals', 'tbl_solicitudes.solicitudes_from', '=', 'mae_sucursals.sucursals_id')
                                            ->join('tbl_products', 'tbl_solicitudes.products_id', '=', 'tbl_products.products_id')
                                            ->where('tbl_solicitudes.sucursals_id', session('sucursal')[0]->sucursals_id)
                                            ->get();
    }

    public function PostSolicitudes(Request $request)
    {
        $solicitud = tbl_solicitudes::create([
            'solictudes_fecha' => $request->solicitudes_fecha,
            'solicitudes_from' => $request->solicitudes_from,
            'sucursals_id' => $request->solicitudes_to,
            'solicitudes_subject' => $request->solicitudes_subject,
            'solicitudes_message' => $request->solicitudes_message,
            'cantidad' => $request->cantidad,
        ]);

        if ($solicitud==true) {
            return ['status' => 'success', 'message' => 'Solicitud Enviada'];
        }
    }


}
