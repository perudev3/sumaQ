<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class tbl_inventories extends Model
{
    protected $fillable = [
        'products_id','sucursals_id','inventories_image_url','inventories_codigo','sales_id', 'layaway_id', 'sizes_id','purchase_orders_id','user_id'
    ];

    protected $primaryKey = "inventories_id";

    public function products()
    {
        return $this->belongsTo('App\tbl_products','products_id');
    }

    public function sizes()
    {
        return $this->belongsTo('App\mae_size','sizes_id');
    }

    public function sales()
    {
        return $this->belongsTo('App\tbl_sales','sales_id');
    }

}
