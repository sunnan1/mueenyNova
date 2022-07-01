<?php

namespace App\Models;

class CategoryTranslation extends MyModel {

    protected $table = "category_translations";


    public function category()
    {
        return $this->belongsTo(Category::class , 'category_id' , 'id');
    }
}
