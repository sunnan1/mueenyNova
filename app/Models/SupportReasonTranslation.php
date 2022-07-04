<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class SupportReasonTranslation extends MyModel
{
    protected $table = "support_reason_translations";

    public function reason()
    {
        return $this->belongsTo(SupportReason::class , 'support_reason_id' , 'id');
    }
}
