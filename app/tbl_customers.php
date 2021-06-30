<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tbl_customers extends Model
{
    protected $table= 'tbl_customers';

    protected $fillable = [
        'customers_name',
        'customers_mail',
        'customers_phone',
        'addresses_id'
    ];

    protected $primaryKey='customers_id';
}
