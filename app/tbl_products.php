<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_products extends Model
{
    protected $fillable = [
        'products_image_url',
        'products_name', 
        'products_image_url',
        'collections_id',
        'categories_id',
        'materials_id', 
        'products_caracts',
        'products_price',
        'products_net_price',
        'discounts_id',
        'products_discount',
        'products_is_active',
        'suplidor'
    ];

    protected $primaryKey = "products_id";

    public function countInventory()
    {
        return $this->hasMany('App\tbl_inventories', 'products_id')->where([
            'sales_id' => NULL,
            'layaway_id' => NULL,
            'sucursals_id' => session('sucursal')[0]->sucursals_id,
        ])->orderBy('products_id', 'desc');
    }

    public function category()
    {
        return $this->belongsTo('App\mae_category','categories_id');
    }

    public function collection()
    {
        return $this->belongsTo('App\mae_collections','collections_id');
    }

    public function material()
    {
        return $this->belongsTo('App\mae_materials','materials_id');
    }

    public function discountsGroup()
    {
        return $this->hasMany('App\tbl_group_discounts','products_id');
    }


}
