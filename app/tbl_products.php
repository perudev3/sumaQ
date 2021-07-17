<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_products extends Model
{
    protected $fillable = [
        'products_image_url','products_name', 'products_image_url','collections_id','category_id', 'material_id', 'products_caracts','products_size','products_price','products_net_price','discounts_id','products_is_active'
    ];

    protected $primaryKey = "products_id";

}
