<?php

namespace App\Models;

class Service extends MyModel {
 
    protected $table = "services";
    
    protected $casts = [
        'id' => 'integer',
        'is_remotely' => 'boolean',
        'has_availability_times' => 'boolean',
        'main_category_id' => 'integer',
        'sub_category_id' => 'integer',
        'efficiency_level_id' => 'integer',
    ];

    public function serviceAvailabilityTimes()
    {
       return $this->hasMany(ServiceAvailabilityTime::class, 'service_id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->is_remotely = $this->is_remotely;
        $transformer->has_availability_times = $this->has_availability_times;
        $transformer->main_category_id = $this->main_category_id;
        $transformer->main_category = $this->main_category;
        $transformer->sub_category_id = $this->sub_category_id;
        $transformer->sub_category = $this->sub_category;
        $transformer->efficiency_level_id = $this->efficiency_level_id;
        $transformer->efficiency_level = $this->efficiency_level;
        if ($this->has_availability_times) {
            $transformer->availability_times = $this->availability_times;
        }
        return $transformer;
    }     


    protected static function boot() {
        parent::boot();

        static::deleting(function(Service $service) {
            foreach ($service->serviceAvailabilityTimes as $serviceAvailabilityTime) {
                $serviceAvailabilityTime->delete();
            }
        });
        
        static::deleted(function (Service $service) {
           
        });
    }

}
