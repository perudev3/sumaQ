<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_districts extends Model
{
    protected $table= 'tbl_districts';

    protected $fillable = [
       'districts_name',
       'districts_delivery_price'
    ];

    protected $primaryKey='districts_id';
}
