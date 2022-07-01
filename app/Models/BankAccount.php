<?php

namespace App\Models;

class BankAccount extends MyModel {
 
    protected $table = "bank_accounts";
    
    protected $casts = [
        'id' => 'integer'
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->bank_name = $this->bank_name;
        $transformer->beneficiary_name = $this->beneficiary_name;
        $transformer->iban = $this->iban;
        $transformer->account_number = $this->account_number;
        return $transformer;
    }


    protected static function boot() {
        parent::boot();

        static::deleting(function(BankAccount $bankAccount) {
          
        });
        
        static::deleted(function (BankAccount $bankAccount) {
           
        });
    }

}
