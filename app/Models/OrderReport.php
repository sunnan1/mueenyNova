<?php

namespace App\Models;

use App\Models\MyModel;
use Illuminate\Database\Eloquent\Model;

class OrderReport extends MyModel
{
    public function reason()
    {
        return $this->belongsTo(ReportReason::class, 'report_reason_id');
    }

    public function translations()
    {
        return $this->hasMany(PartnerOfferTranslation::class, 'partner_offer_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
