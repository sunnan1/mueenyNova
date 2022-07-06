<?php

namespace App\Models;

class LocationTranslation extends MyModel {

    protected $table = "location_translations";


    public function location()
    {
        return $this->belongsTo(Location::class , 'location_id' , 'id');
    }
}
