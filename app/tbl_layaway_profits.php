<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_layaway_profits extends Model
{
    protected $fillable = [
        'layaway_id',
        'total_bussines_layaway',
        'total_cancel_layaway'
    ];

    protected $primaryKey = "layaway_profits_id";
}
