<?php

namespace App\Models;

class LanguageTranslation extends MyModel {

    protected $table = "language_translations";


    public function language()
    {
        return $this->belongsTo(Language::class , 'language_id' , 'id');
    }

}
