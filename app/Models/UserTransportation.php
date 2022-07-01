<?php

namespace App\Models;

class UserTransportation extends MyModel {
 
    protected $table = "user_transportation";
    
    protected $casts = [
        'id' => 'integer',
        'transportation_id' => 'integer'
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->transportation_id = $this->transportation_id;
        $transformer->transportation = $this->transportation;
        return $transformer;
    }

    protected static function boot() {
        parent::boot();

        static::deleting(function(UserTransportation $userTransportation) {
          
        });
        
        static::deleted(function (UserTransportation $userTransportation) {
           
        });
    }

}
