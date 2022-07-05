<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class ReportReasonTranslation extends MyModel
{
    protected $table = "report_reason_translations";

    public function reason()
    {
        return $this->belongsTo(ReportReason::class , 'report_reason_id' , 'id');
    }
}
