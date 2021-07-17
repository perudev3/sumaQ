<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_group_discounts extends Model
{

    protected $fillable = [
        'group_discounts_name',
        'discounts_id',
        'products_id',
        'categories_id',
        'collections_id'
    ];

    protected $primaryKey = "group_discounts_id";

}
