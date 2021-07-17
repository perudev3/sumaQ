<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class tbl_inventories extends Model
{
    protected $fillable = [
        'products_id','sucursals_id','inventories_image_url','inventories_codigo','sales_id','purchase_orders_id','user_id'
    ];

    protected $primaryKey = "inventories_id";
}
