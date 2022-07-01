<?php

namespace App\Models;

class PracticalExperience extends MyModel {
 
    protected $table = "practical_experiences";
    
    protected $casts = [
        'id' => 'integer',
        'efficiency_level_id' => 'integer'
    ];

    public function efficient() {
        return $this->belongsTo(EfficiencyLevel::class, 'efficiency_level_id');
    }

    public function translations() {
        return $this->hasMany(EfficiencyLevelTranslation::class, 'language_id');
    }


    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->efficiency_level_id = $this->efficiency_level_id;
        $transformer->efficiency_level = $this->efficiency_level;
        return $transformer;
    }
    

    protected static function boot() {
        parent::boot();

        static::deleting(function(PracticalExperience $practicalExperience) {
          
        });
        
        static::deleted(function (PracticalExperience $practicalExperience) {
           
        });
    }

}
