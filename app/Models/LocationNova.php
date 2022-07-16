<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LocationNova extends Model
{
    use HasFactory;

    public function location()
    {
        return $this->belongsTo(LocationNova::class , 'parent_id' , 'id');
    }
}
