<?php

namespace App\Models;

class WelcomeScreenTranslation extends MyModel {

    protected $table = "welcome_screen_translations";

    public function welcome()
    {
        return $this->belongsTo(WelcomeScreen::class , 'welcome_screen_id' , 'id');
    }
}
