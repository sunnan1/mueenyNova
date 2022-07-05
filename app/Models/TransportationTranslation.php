<?php

namespace App\Models;

class TransportationTranslation extends MyModel {

    protected $table = "transportation_translations";

    public function transportation()
    {
        return $this->belongsTo(Transportation::class , 'transportation_id' , 'id');
    }
}
