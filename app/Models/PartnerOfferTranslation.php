<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PartnerOfferTranslation extends MyModel
{
    protected $table = "partner_offer_translations";

    public function partner()
    {
        return $this->belongsTo(PartnerOffer::class , 'partner_offer_id' ,'id');
    }
}
