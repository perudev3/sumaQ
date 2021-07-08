<?php

namespace App\Http\Controllers;

use App\tbl_customers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    
    public function findByPhone(Request $request, $phone){

        //$customer = tbl_customers::where('customers_phone', $phone)->first();

        $customer = DB::table('tbl_customers')
                    ->select('tbl_customers.*', 'tbl_addresses.*')
                    ->join('tbl_addresses','tbl_addresses.addresses_id', '=', 'tbl_customers.addresses_id')
                    ->where('tbl_customers.customers_phone', '=', $phone)
                    ->first();

        return response()->json(['customer' => $customer]);

    }

}
