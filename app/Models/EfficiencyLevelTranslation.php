<?php

namespace App\Models;

class EfficiencyLevelTranslation extends MyModel {

    protected $table = "efficiency_level_translations";


    public function efficiency()
    {
        return $this->belongsTo(EfficiencyLevel::class , 'efficiency_level_id' , 'id');
    }
}
