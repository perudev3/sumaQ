<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class mae_roles extends Model
{
    protected $fillable = [
        'rol_name',
    ];


    protected $primaryKey = "roles_id";
}
