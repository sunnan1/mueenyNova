<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GeneratePoint extends Model
{
    protected $table = 'generated_points';

    public $stauses = [
        'pending' => 1,
        'active' => 2,
        'returned' => 3,
    ];
}
