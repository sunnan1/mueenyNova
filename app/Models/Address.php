<?php

namespace App\Models;

class Address extends MyModel {
 
    protected $table = "addresses";
    
    protected $casts = [
        'id' => 'integer',
        'lat' => 'double',
        'lng' => 'double'
    ];

    public $types = [
        'client' => 1,
        'service_provider' => 2
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->lat = $this->lat;
        $transformer->lng = $this->lng;
        $transformer->description = $this->description;

        return $transformer;
    }

    protected static function boot() {
        parent::boot();

        static::deleting(function(Address $address) {
          
        });
        
        static::deleted(function (Address $address) {
           
        });
    }

}
