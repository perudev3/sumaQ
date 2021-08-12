<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_inventories;

class DashboardController extends Controller
{
    public function GetData()
    {
        return tbl_inventories::with(['products','sales'])->get();
    }
}
