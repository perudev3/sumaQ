<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_layaway_details extends Model
{
    protected $fillable = [
        'layaway_id',
        'customers_id',
        'products_id',
        'sucursals_id'
     ];
 
     protected $primaryKey = "layaway_details_id";
 
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
         return $this->belongsTo('App\tbl_layaway','layaway_id');
     }
}
