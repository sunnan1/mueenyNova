<?php

namespace App\Models;

class CurrencyTranslation extends MyModel {

    protected $table = "currency_translations";

    public function currency()
    {
        return $this->belongsTo(Currency::class , 'currency_id' , 'id');
    }
}
