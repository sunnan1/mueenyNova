<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdvertisementCancellation extends Model
{
    public $table = 'advertisement_cancellation';

    public function reason()
    {
        return $this->belongsTo(CancellationReason::class, 'cancellation_reason_id');
    }

    public function user()
    {
        return $this->belongsTo(Admin::class, 'by', 'id');
    }
    public function advertisment()
    {
        return $this->belongsTo(Advertisement::class, 'advertisement_id', 'id');
    }
}
