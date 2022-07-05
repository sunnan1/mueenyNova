<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class ReportReason extends MyModel
{
    public $table = 'report_reasons';


    public $statuses = [
        'active' => 0,
        'not_active' => 1
    ];

    public function translations()
    {
        return $this->hasMany(ReportReasonTranslation::class, 'report_reason_id');
    }

    public function scopeActive($q)
    {
        return $q->where('status', 0);
    }
}
