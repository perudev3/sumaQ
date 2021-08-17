<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_layaway extends Model
{
    protected $fillable = [
        'user_id',
        'sucursals_id',
        'customers_id',
        'layaway_payment_method',
        'layaway_entrega_date',
        'layaway_despacho_date',
        'layaway_canceled_date',
        'layaway_canceled_reason',
        'layaway_payment_date',
        'layaway_status'
    ];


    protected $primaryKey = "layaway_id";

    public function customers()
    {
        return $this->belongsTo('App\tbl_customers','customers_id')->groupBy('customers_name');
    }

    public function sucursals()
    {
        return $this->belongsTo('App\mae_sucursals','sucursals_id');
    }

    public function layaway_profits()
    {
        return $this->hasMany('App\tbl_layaway_profits','layaway_id');
    }
}
