<?php

namespace App\Models;

class Transportation extends MyModel {
 
    protected $table = "transportations";
    protected $casts = [
        'id' => 'integer'
    ];
  
    public function translations() {
        return $this->hasMany(TransportationTranslation::class, 'transportation_id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        return $transformer;
    }   

    protected static function boot() {
        parent::boot();

        static::deleting(function(Transportation $transportation) {
            foreach ($transportation->translations as $translation) {
                $translation->delete();
            }
        });
        
        static::deleted(function (Transportation $transportation) {
           
        });
    }

}
