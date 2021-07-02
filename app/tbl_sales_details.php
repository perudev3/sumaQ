<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_sales_details extends Model
{
    protected $table= 'tbl_sales_details';

    protected $fillable = [
       'sales_id',
       'customers_id',
       'products_id',
       'office_id'
    ];

    protected $primaryKey='sales_details_id';
}
