<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_products;
use App\tbl_addresses;
use App\tbl_customers;
use App\tbl_sales;
use App\tbl_sales_details;
use App\tbl_inventories;
use App\purchase_order_details;

class SalesController extends Controller
{
    public function index()
    {
        $name_view='GENERAR VENTA';
        return view('processes_tables.tbl_sales', compact('name_view'));
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
            $row = \DB::table('tbl_inventories')
                    ->select('tbl_products.*', 'tbl_inventories.*')
                    ->join('tbl_products','tbl_products.products_id', '=', 'tbl_inventories.products_id')
                    ->where('tbl_inventories.inventories_codigo', $array_data[$i])
                    ->first();
            
            $data[] = $row;
        }

        return response()->json($data);

        
    }

    public function PostSales(Request $request)
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


        $tbl_sales = tbl_sales::create([
            'user_id' => $user->id,
            'sucursals_id' => 1,
            'customers_id' => $tbl_customers->customers_id,
            'sales_payment_method' => $request->sales_payment_method,
            'sales_payment_date' => $request->sales_payment_date,
            'sales_status' => 0,
        ]);


        for ($i=0; $i < count($array) ; $i++) { 
            $purchase_orders_id = tbl_inventories::select('purchase_orders_id', 'products_id')
                                                    ->where('inventories_codigo', $array[$i])
                                                    ->first();
            
            $total_products_details = purchase_order_details::select('total_products')
                                                                ->where('purchase_orders_id', $purchase_orders_id->purchase_orders_id)
                                                                ->where('products_id', $purchase_orders_id->products_id)
                                                                ->first();

            $result = $total_products_details->total_products - 1;
            purchase_order_details::where('purchase_orders_id', $purchase_orders_id->purchase_orders_id)
                                    ->where('products_id', $purchase_orders_id->products_id)
                                    ->update([
                                        'total_products' => $result,
                                    ]);
            $tbl_sales_details = tbl_sales_details::create([
                'sales_id' => $tbl_sales->sales_id,
                'customers_id' => $tbl_customers->customers_id,
                'products_id' => $purchase_orders_id->products_id,
            ]);

        }
        
        

        if ($tbl_addresses && $tbl_customers && $tbl_sales_details == true) {
            return ['status' => 'success'];
        }
        
        
    }

}
