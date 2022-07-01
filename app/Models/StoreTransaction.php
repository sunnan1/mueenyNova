<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class StoreTransaction extends MyModel
{
    public $stauses = [
        'hold' => 0,
        'received' => 1,
    ];
}
