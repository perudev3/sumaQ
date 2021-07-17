<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class mae_discounts extends Model
{

    protected $fillable = [
       'discounts_name', 'discounts_porcentaje','discounts_start_date','discounts_end_date','user_id','discounts_stock_max'
    ];
    
    protected $primarykey="discounts_id";
}
