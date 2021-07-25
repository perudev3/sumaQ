<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_purchase_orders;

class ChartController extends Controller
{
    public function ChartProvider()
    {
        $mounth = [1,2,3,4,5,6,7,8,9,10,11,12];
        $providers = [];
        $dbCount = tbl_purchase_orders::select(\DB::raw('MONTH(created_at) as `mes`'), \DB::raw('COUNT(*) as `qty`'))
                                ->groupBy(\DB::raw('mes'))
                                ->get()
                                ->mapWithKeys(function ($item) {
                                    return [$item['mes'] => $item['qty']];
                                })
                                ->toArray();
        foreach (range(1, 12) as $month) {
            $dbCount[$month] = array_key_exists($month, $dbCount)?$dbCount[$month]:0;
        }
        
        return response()->json($dbCount);
        
    }
}
