<?php

namespace App\Models;

class Category extends MyModel {
 
    protected $table = "categories";
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'image' => 'string'
    ];
   
    public function translations() {
        return $this->hasMany(CategoryTranslation::class, 'category_id');
    }

    public function childs()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    
    public function treeTransform(){
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->partner = $this->partner == 1? true : false;
        $transformer->image = url("public/uploads/categories/$this->image");
        if (!$this->parent_id) {
            $transformer->childrens = $this->childrens ?: [];
            $transformer->no_of_sub = count($transformer->childrens);
        }
        
        return $transformer;
    }

    public function transformList()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->image = url("public/uploads/categories/$this->image");
        $transformer->has_childs = $this->parent_id ? false : true;
        $transformer->partner = $this->partner;
        return $transformer;
    }
  

    protected static function boot() {
        parent::boot();

        static::deleting(function(Category $category) {
            foreach ($category->translations as $translation) {
                $translation->delete();
            }
            foreach ($category->childs as $child) {
                $child->delete();
            }
            
        });
        
        static::deleted(function (Category $category) {
            $category->deleteUploaded('categories', $category->image);
        });
    }

}
