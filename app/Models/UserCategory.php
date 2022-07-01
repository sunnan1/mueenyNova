<?php

namespace App\Models;

class UserCategory extends MyModel {
 
    protected $table = "user_category";
    protected $casts = [
        'category_id'  => 'integer'
    ];

    public function treeTransform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->category_id;
        $transformer->name = $this->name;
        if (!$this->parent_id) {
            $transformer->childrens = $this->childrens ?: [];
        }
        return $transformer;
    }
    

}
