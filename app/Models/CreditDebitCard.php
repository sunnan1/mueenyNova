<?php

namespace App\Models;

class CreditDebitCard extends MyModel {
 
    protected $table = "credit_debit_cards";
    
    protected $casts = [
        'id' => 'integer'
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->card_name = $this->card_name;
        $transformer->card_no = $this->card_no;
        $transformer->expiry_month = $this->expiry_month;
        $transformer->expiry_year = $this->expiry_year;
        $transformer->cvv = $this->cvv;
        return $transformer;
    }


    protected static function boot() {
        parent::boot();

        static::deleting(function(CreditDebitCard $creditDebitCard) {
          
        });
        
        static::deleted(function (CreditDebitCard $creditDebitCard) {
           
        });
    }

}
