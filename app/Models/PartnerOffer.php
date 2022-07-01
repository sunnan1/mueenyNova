<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PartnerOffer extends MyModel
{
    public function translations()
    {
        return $this->hasMany(PartnerOfferTranslation::class, 'partner_offer_id');
    }   

    public function store()
    {
        return $this->belongsTo(StoreManager::class,'store_id');
    }
}
