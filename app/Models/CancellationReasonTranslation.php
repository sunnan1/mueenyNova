<?php

namespace App\Models;

class CancellationReasonTranslation extends MyModel {

    protected $table = "cancellation_reason_translations";

    public function cancellation()
    {
        return $this->belongsTo(CancellationReason::class , 'cancellation_reason_id' , 'id');
    }
}
