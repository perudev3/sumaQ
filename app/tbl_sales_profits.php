<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_sales_profits extends Model
{
    protected $fillable = [
        'sales_id',
        'total_bussines'
    ];

    protected $primaryKey = "sales_profits_id";

}
