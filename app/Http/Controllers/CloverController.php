<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class CloverController extends Controller
{
    public function authorization()
    {
        $response = Http::post(
            'https://sandbox.dev.clover.com/oauth/token?client_id=QSMBNNHEBAEGM&client_secret=e3c07213-5128-2ff7-ba66-69d35c173dbd&code=7692fae7-aed9-fd4d-070c-e2e4b8f1aef6'
        );
        
        return dd($response);
    }
}
