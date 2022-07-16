<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryNova extends Model
{
    use HasFactory;

    public function category()
    {
        return $this->belongsTo(CategoryNova::class, 'parent_id' , 'id');
    }
}
