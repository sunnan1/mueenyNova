<?php

namespace App\Models;

class ServiceAvailabilityTime extends MyModel {
 
    protected $table = "service_availability_time";
    
    protected $casts = [
        'id' => 'integer',
        'availability_time_id' => ''
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->availability_time_id;
        $transformer->name = $this->availability_time;
        return $transformer;
    }     


    protected static function boot() {
        parent::boot();

        static::deleting(function(ServiceAvailabilityTime $serviceAvailabilityTime) {
            
        });
        
        static::deleted(function (ServiceAvailabilityTime $serviceAvailabilityTime) {
           
        });
    }

}
