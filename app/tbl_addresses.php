<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_addresses extends Model
{

    protected $fillable = [
        'addresses_first_line',
        'addresses_second_line',
        'addresses_reference',
        'districts_id',
    ];

    protected $primaryKey = "addresses_id";

}
