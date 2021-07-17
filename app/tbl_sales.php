<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class tbl_sales extends Model
{
    protected $fillable = [
        'user_id',
        'sucursals_id',
        'customers_id',
        'sales_payment_method',
        'sales_entrega_date',
        'sales_despacho_date',
        'sales_canceled_date',
        'sales_canceled_reason',
        'sales_payment_date',
        'sales_status'
    ];


    protected $primaryKey = "sales_id";

}
