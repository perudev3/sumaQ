<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_customer_users extends Model
{
    protected $fillable = [
        'identification_document',
        'movil',
        'address',
        'area',
        'id'
    ];

    protected $primaryKey = "customer_users_id";

    public function user()
    {
        return $this->belongsTo('App\User','id'); 
    }
}
