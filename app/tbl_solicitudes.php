<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_solicitudes extends Model
{
    protected $fillable = [
        'solictudes_fecha',
        'solicitudes_from',
        'sucursals_id',
        'solicitudes_subject',
        'solicitudes_message',
        'cantidad',
        'products_id',
     ];
 
    protected $primaryKey = "solicitudes_id";

    public function To()
    {
        return $this->belongsTo('App\mae_sucursals','sucursals_id');
    }

    public function products()
    {
        return $this->belongsTo('App\tbl_products','products_id');
    }

}
