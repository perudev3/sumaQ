<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\tbl_products;
use App\mae_providers;
use App\tbl_purchase_orders;
use App\purchase_order_details;
use Carbon\Carbon;
use App\tbl_inventories;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ControllerPurchase_Orders extends Controller
{
    public function SearchProducto($products_name)
    {
        return tbl_products::where('products_name', 'LIKE', '%'.$products_name.'%')->get();
    }

    public function SearchProveedor($providers_name)
    {
        return mae_providers::where('providers_name', 'LIKE', '%'.$providers_name.'%')->get();
    }

    public function GetPurchaseOrder()
    {
        return  DB::table('tbl_purchase_orders')
                    ->select('tbl_purchase_orders.*', 'mae_providers.*', 'users.*')
                    ->join('mae_providers','mae_providers.providers_id', '=', 'tbl_purchase_orders.providers_id')
                    ->join('users','users.id', '=', 'tbl_purchase_orders.purchase_orders_solicited_by')
                    ->get();
    }

    public function GetPedidos(Request $request)
    {
        return  DB::table('tbl_purchase_orders')
                    ->select('purchase_order_details.*', 'tbl_purchase_orders.*', 'tbl_products.*')
                    ->join('purchase_order_details','purchase_order_details.purchase_orders_id', '=', 'tbl_purchase_orders.purchase_orders_id')
                    ->join('tbl_products','tbl_products.products_id', '=', 'purchase_order_details.products_id')
                    ->where('purchase_order_details.purchase_orders_id', $request['purchase_orders_id'])
                    ->get();
    }

    public function CreateListOrder(Request $request)
    {
        $data_order= $request->data_order_details;
        $purchase_orders=tbl_purchase_orders::create([
            'purchase_orders_solicited_by'=> $request['purchase_orders_solicited_by'],
            'purchase_orders_status' =>0,
            'purchase_orders_solicited_date'=> Carbon::parse($request['purchase_orders_solicited_date']),
            'providers_id'=> $request['providers_id'],
            'preview_arrival_date'=> Carbon::parse($request['preview_arrival_date']),
            'purchase_orders_observation'=> $request['purchase_orders_observation'],
            'purchase_orders_total_price'=> $request['purchase_orders_total_price'],
        ]);

        foreach($data_order as $data){ 
            $purchase_order_details=purchase_order_details::create([
                'purchase_orders_id'=>$purchase_orders->purchase_orders_id,
                'products_id'=>$data['products_id'],
                'total_products'=> $data['total_products'],
                'total_price'=>$data['products_price']*$data['total_products'],
            ]);
        }
        

        if ($purchase_orders==true && $purchase_order_details==true) {
            return ['status'=>'success', 'message'=>'Orden Registrada Exitosamente'];
        }else{
            return ['status'=>'error', 'message'=>'error al registrar la orden'];
        }
    }


    public function Confirm_Order(Request $request)
    {
        $user = Auth::user();
        $date = Carbon::now();
        $tbl_purchase_orders=tbl_purchase_orders::where('purchase_orders_id', $request['purchase_orders_id'])->update([
            'purchase_orders_status' =>1,
            'purchase_orders_confirmed_by' => $user->id,
            'purchase_orders_confirmed_at' => Carbon::parse($date->format('d-m-Y')),
        ]);

        if ($tbl_purchase_orders) {
            return ['status'=>'success'];
        }
    }


    public function Recibido_Order(Request $request)
    {
        $user = Auth::user();
        $date = Carbon::now();
        $tbl_purchase_orders=tbl_purchase_orders::where('purchase_orders_id', $request['purchase_orders_id'])->update([
            'purchase_orders_status' =>2,
            'purchase_orders_received_by' => $user->id,
            'purchase_orders_arrived_at' => Carbon::parse($date->format('d-m-Y')),
        ]);

        $products_orders=purchase_order_details::where('purchase_orders_id', $request['purchase_orders_id'])->get();

        foreach ($products_orders as $data ) {
            $tbl_inventories=tbl_inventories::create([
                'products_id' => $data->products_id,
                'inventories_codigo' => Str::random(4),
                'purchase_orders_id' => $request['purchase_orders_id'],
                'user_id' => $user->id
            ]);
        }

        if ($tbl_inventories) {
            return ['status'=>'success'];
        }
    }

    public function UpdatePedido(Request $request)
    {
        $data_order= $request->data_order_details;
        tbl_purchase_orders::where('purchase_orders_id', $request['purchase_orders_id'])->update([
            'purchase_orders_complain' => $request['purchase_orders_complain'],
        ]);
        foreach ($data_order as $data ) {

            $response=purchase_order_details::where('purchase_orders_id', $request['purchase_orders_id'])->update([
                'products_id'=>$data['products_id'],
                'total_products'=> $data['total_products'],
                'total_price'=>$data['products_price']*$data['total_products'],
            ]);
        }

        if ($response==true) {
            return ['status' => 'success'];
        }
    }
}
