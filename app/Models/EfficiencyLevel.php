<?php

namespace App\Models;

class EfficiencyLevel extends MyModel {
 
    protected $table = "efficiency_levels";
    protected $casts = [
        'id' => 'integer'
    ];
  
    public function translations() {
        return $this->hasMany(EfficiencyLevelTranslation::class, 'efficiency_level_id');
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

        static::deleting(function(EfficiencyLevel $efficiencyLevel) {
            foreach ($efficiencyLevel->translations as $translation) {
                $translation->delete();
            }
        });
        
        static::deleted(function (EfficiencyLevel $efficiencyLevel) {
           
        });
    }

    public function languages()
    {
        return $this->belongsToMany(Language::class,'user_language', 'efficiency_level_id','language_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class,'user_language', 'efficiency_level_id','user_id');
    }

}
