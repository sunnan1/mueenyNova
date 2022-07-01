<?php

namespace App\Models;

class Certification extends MyModel {
 
    protected $table = "certifications";
    
    protected $casts = [
        'id' => 'integer'
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->description = $this->description;
        $transformer->earning_year = $this->earning_year;
        $transformer->image = url("public/uploads/certifications/$this->image");
        return $transformer;
    }


    protected static function boot() {
        parent::boot();

        static::deleting(function(Certification $certification) {
          
        });
        
        static::deleted(function (Certification $certification) {
           $certification->deleteUploaded('certifications', $certification->image);
        });
    }

}
