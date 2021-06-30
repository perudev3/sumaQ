<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\tbl_districts;

class DistrictsController extends Controller
{
    public function GetDistricts()
    {
        return tbl_districts::all();
    }
}
