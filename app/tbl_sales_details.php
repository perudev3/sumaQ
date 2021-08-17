<?php

namespace App;
use \DB;
use Illuminate\Database\Eloquent\Model;

class tbl_sales_details extends Model
{

    protected $fillable = [
       'sales_id',
       'customers_id',
       'products_id',
       'sucursals_id'
    ];

    protected $primaryKey = "sales_details_id";

    public function products()
    {
        return $this->belongsTo('App\tbl_products','products_id');
    }

    public function customers()
    {
        return $this->belongsTo('App\tbl_customers','customers_id')->groupBy('customers_name');
    }

    public function sucursals()
    {
        return $this->belongsTo('App\mae_sucursals','sucursals_id');
    }

    public function sales()
    {
        return $this->belongsTo('App\tbl_sales','sales_id');
    }

}
