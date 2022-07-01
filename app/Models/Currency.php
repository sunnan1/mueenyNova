<?php

namespace App\Models;

class Currency extends MyModel {
 
    protected $table = "currencies";
    protected $casts = [
        'id' => 'integer',
        'is_default' => 'boolean'
    ];
  
    public function translations() {
        return $this->hasMany(CurrencyTranslation::class, 'currency_id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->is_default = $this->is_default;
        return $transformer;
    }   

    protected static function boot() {
        parent::boot();

        static::deleting(function(Currency $currency) {
            foreach ($currency->translations as $translation) {
                $translation->delete();
            }
        });
        
        static::deleted(function (Currency $currency) {
           
        });
    }

}
