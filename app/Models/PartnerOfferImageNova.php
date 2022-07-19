<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartnerOfferImageNova extends Model
{
    use HasFactory;

    public function partneroffer()
    {
        return $this->belongsTo(PartnerOfferNova::class , 'partner_offer_id' , 'id');
    }
}
