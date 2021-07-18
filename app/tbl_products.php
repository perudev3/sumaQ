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
        'material_id', 
        'products_caracts',
        'products_size',
        'products_price',
        'products_net_price',
        'discounts_id',
        'products_is_active'
    ];

    protected $primaryKey = "products_id";

    public function countInventory()
    {
        return $this->hasMany('App\tbl_inventories', 'products_id')->where([
            'sales_id' => NULL,
            'sucursals_id' => session('sucursals_id'),
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
        return $this->belongsTo('App\mae_materials','material_id');
    }

    public function discountsGroup()
    {
        return $this->hasMany('App\tbl_group_discounts','products_id');
    }


}
