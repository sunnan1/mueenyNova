<?php

namespace App\Models;

use App\Models\MyModel;

class SupportReason extends MyModel
{
    protected $table = "support_reasons";
    
    public $statuses = [
        'active' => 0,
        'not_active' => 1
    ];

    public function translations()
    {
        return $this->hasMany(SupportReasonTranslation::class, 'support_reason_id');
    }

    public function scopeActive($q)
    {
        return $q->where('status', 0);
    }
}