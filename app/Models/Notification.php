<?php

namespace App\Models;

class Notification extends MyModel
{
    protected $table = "notifications";
    protected $guarded = [];
    protected $casts = [
        'id' => 'string'
    ];
    
}
