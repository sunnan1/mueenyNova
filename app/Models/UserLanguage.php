<?php

namespace App\Models;

class UserLanguage extends MyModel {

    protected $table = "user_language";

    protected $casts = [
        'id' => 'integer',
        'language_id' => 'integer',
        'efficiency_level_id' => 'integer'
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->language_id = $this->language_id;
        $transformer->language = $this->language;
        $transformer->efficiency_level_id = $this->efficiency_level_id;
        $transformer->efficiency_level = $this->efficiency_level;
        return $transformer;
    }


    protected static function boot() {
        parent::boot();

        static::deleting(function(UserLanguage $userLanguage) {

        });

        static::deleted(function (UserLanguage $userLanguage) {

        });
    }

    public function language()
    {
        return $this->belongsTo(LanguageNova::class , 'language_id' , 'id');
    }

    public function efficiencylevel()
    {
        return $this->belongsTo(EfficiencyLevelNova::class , 'efficiency_level_id' , 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class , 'user_id' , 'id');
    }

}
