<?php

namespace App\Models;

class AvailabilityTime extends MyModel {
 
    protected $table = "availability_times";
    protected $casts = [
        'id' => 'integer'
    ];
  
    public function translations() {
        return $this->hasMany(AvailabilityTimeTranslation::class, 'availability_time_id');
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

        static::deleting(function(AvailabilityTime $availabilityTime) {
            foreach ($availabilityTime->translations as $translation) {
                $translation->delete();
            }
        });
        
        static::deleted(function (AvailabilityTime $availabilityTime) {
           
        });
    }

}
