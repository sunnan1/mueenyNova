<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class PaymentMethodTranslation extends MyModel
{
    protected $table = "payment_method_translations";

    public function payment()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_method_id' , 'id');
    }
}
