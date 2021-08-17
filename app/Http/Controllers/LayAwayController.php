<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_products;
use App\tbl_addresses;
use App\tbl_customers;
use App\tbl_layaway;
use App\tbl_layaway_details;
use App\tbl_inventories;
use App\purchase_order_details;
use App\tbl_layaway_profits;
use Carbon\Carbon;

class LayAwayController extends Controller
{
    public function index()
    {
        $name_view='GENERAR LAYAWAY';
        return view('processes_tables.tbl_layaway', compact('name_view'));
    }

    public function Data_Products(Request $request)
    {
        return  \DB::table('tbl_inventories')
                    ->select('tbl_products.*', 'tbl_inventories.*')
                    ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                    ->where('tbl_inventories.inventories_codigo', $request['codigo_inventorie'])
                    ->get();
    }

    public function Data_Products_Pedidos(Request $request)
    {
        $array_data = $request->data_pedidos;

        $data = [];

        for ($i=0; $i < count($array_data) ; $i++) {    
            $row  = tbl_inventories::with([
                'products' => function($query){
                        return $query->with(['discountsGroup'=> function($query){
                            return $query->with('discounts');
                        }
                    ]);
                }
            ])->where('inventories_codigo', $array_data[$i])->first();
            
            $data[] = $row;
        }

        return response()->json($data);        
    }

    public function PostLayaway(Request $request)
    {
        $user = \Auth::user();
        $array = $request->data_pedidos;
        $address_cadena = $request->address;
        $cadena = explode(",", $address_cadena);
        
        $tbl_addresses = tbl_addresses::create([
            'addresses_first_line' =>  $cadena[0],
            'addresses_second_line' =>  $cadena[1],
            'addresses_reference' =>  $request->addresses_reference,
        ]);

        $tbl_customers = tbl_customers::create([
            'customers_name' => $request->customers_name,
            'customers_mail' => $request->customers_mail,
            'customers_phone' => $request->customers_phone,
            'addresses_id' => $tbl_addresses->addresses_id,

        ]);


        $tbl_layaway = tbl_layaway::create([
            'user_id' => $user->id,
            'sucursals_id' => session('sucursal')[0]->sucursals_id,
            'customers_id' => $tbl_customers->customers_id,
            'layaway_payment_method' => $request->layaway_payment_method,
            'layaway_payment_date' => $request->layaway_payment_date,
            'layaway_status' => 0,
        ]);

        $tbl_layaway_profits = tbl_layaway_profits::create([
            'layaway_id' => $tbl_layaway->layaway_id,
            'total_bussines_layaway' => $request['total_bussines_layaway'],
            'total_cancel_layaway' => $request['total_cancel_layaway'],
        ]);


        for ($i=0; $i < count($array) ; $i++) { 

            $inventario = tbl_inventories::with('products')->where('inventories_codigo',$array[$i])->get();
            foreach ($inventario as $key) {
                $tbl_layaway_details = tbl_layaway_details::create([
                    'layaway_id' => $tbl_layaway->layaway_id,
                    'customers_id' => $tbl_customers->customers_id,
                    'products_id' => $key->products->products_id,
                ]);
    
                $inventario = tbl_inventories::where('inventories_codigo',$array[$i])->update([
                    'layaway_id' => $tbl_layaway->layaway_id,
                ]);
            }

        }
        
        

        if ($tbl_addresses && $tbl_customers && $tbl_layaway_details == true) {
            return ['status' => 'success'];
        }
    }

    public function GetLayawayDetails()
    {
        $id_sucursal = session('sucursal')[0]->sucursals_id;        
        return tbl_layaway::with([ 'customers', 'sucursals', 'layaway_profits'])
                        ->where('sucursals_id', $id_sucursal)
                        ->get();
        
    }

    public function GetLayawayDate(Request $request)
    {
        $id_sucursal = session('sucursal')[0]->sucursals_id;
        return tbl_layaway::with([ 'customers', 'sucursals', 'layaway_profits'])
                         ->where('sucursals_id', $id_sucursal)
                         ->whereDay('created_at', $request['day'])
                         ->get();
    }

    public function GetLayawayMonth(Request $request)
    {
        $id_sucursal = session('sucursal')[0]->sucursals_id;
        return tbl_layaway::with([ 'customers', 'sucursals', 'layaway_profits'])
                         ->where('sucursals_id', $id_sucursal)
                         ->whereMonth('created_at', $request['month'])
                         ->get();
    }

    public function GetLayawayYear(Request $request)
    {
        $id_sucursal = session('sucursal')[0]->sucursals_id;
        return tbl_layaway::with([ 'customers', 'sucursals', 'layaway_profits'])
                         ->where('sucursals_id', $id_sucursal)
                         ->whereYear('created_at', $request['year'])
                         ->get();
    }

    public function findByLayawayDetailsDate(Request $request)
    {       
            return tbl_layaway_details::with(['products','customers','sucursals','layaway'])
                                ->where('customers.customers_name',$request->customers_name)
                                ->whereBetween('created_at', [$request['date_init'], $request['date_end']])
                                ->get();
    }

    public function UpdateStatus(Request $request)
    {
        $date=Carbon::now();
        if ($request['status']==1) {
            $tbl_layaway = tbl_layaway::where('layaway_id', $request['layaway_id'])->update([
                'layaway_status' => $request['status'],
                'layaway_despacho_date' => $date,
            ]);
    
            if ($tbl_layaway==true) {
                return ['status' => 'success'];
            };
        }else{
            if ($request['status']==2) {
                $tbl_layaway = tbl_layaway::where('layaway_id', $request['layaway_id'])->update([
                    'layaway_status' => $request['status'],
                    'layaway_entrega_date' => $date,
                ]);
        
                if ($tbl_layaway==true) {
                    return ['status' => 'success'];
                };
            }else{
                if ($request['status']==3) {
                    $tbl_layaway = tbl_layaway::where('layaway_id', $request['layaway_id'])->update([
                        'layaway_status' => $request['status'],
                        'layaway_canceled_date' => $date,
                        'layaway_canceled_reason' => $request['layaway_canceled_reason'],
                    ]);
            
                    if ($tbl_layaway==true) {
                        return ['status' => 'success'];
                    };
                }
            }
    
        }
        
    }    
}
