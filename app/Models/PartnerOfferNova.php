<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartnerOfferNova extends Model
{
    use HasFactory;

    public function images()
    {
        return $this->hasMany(PartnerOfferImageNova::class , 'partner_offer_id' , 'id');
    }

    public function admins()
    {
        return $this->belongsTo(Admin::class , 'store_id' , 'id')->where('is_store' , '=' , 1);
    }
}
