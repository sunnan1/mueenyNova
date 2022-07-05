<?php

namespace App\Models;

class AvailabilityTimeTranslation extends MyModel {

    protected $table = "availability_time_translations";

    public function avaibilityTime()
    {
        return $this->belongsTo(AvailabilityTime::class , 'availability_time_id' , 'id');
    }
}
