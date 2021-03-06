<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_purchase_orders extends Model
{

    protected $fillable = [
        'purchase_orders_solicited_by',
        'purchase_orders_status',
        'purchase_orders_solicited_date',
        'providers_id',
        'preview_arrival_date',
        'purchase_orders_confirmed_by',
        'purchase_orders_confirmed_at',
        'purchase_orders_received_by',
        'purchase_orders_arrived_at',
        'purchase_orders_observation',
        'purchase_orders_is_ok',
        'purchase_orders_complain',
        'purchase_orders_total_price'
    ];

    protected $primaryKey = "purchase_orders_id";

    public function provider()
    {
        return $this->belongsTo('App\mae_providers','providers_id');
    }

}
