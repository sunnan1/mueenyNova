<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends MyModel
{
    public $table = 'payment_methods';

    public $statuses = [
        'active' => 0,
        'not_active' => 1
    ];

    public function translations()
    {
        return $this->hasMany(PaymentMethodTranslation::class, 'payment_method_id');
    }

    public function scopeActive($q)
    {
        return $q->where('status', 0);
    }
}
