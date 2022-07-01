<?php

namespace App\Models;

class Language extends MyModel {
 
    protected $table = "languages";
    protected $casts = [
        'id' => 'integer'
    ];
  
    public function translations() {
        return $this->hasMany(LanguageTranslation::class, 'language_id');
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

        static::deleting(function(Language $language) {
            foreach ($language->translations as $translation) {
                $translation->delete();
            }
        });
        
        static::deleted(function (Language $language) {
           
        });
    }

    public function efficiencyLevel()
    {
        return $this->belongsToMany(EfficiencyLevel::class,'user_language', 'language_id','efficiency_level_id');
    }

}
