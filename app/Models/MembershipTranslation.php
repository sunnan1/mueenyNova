<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MembershipTranslation extends MyModel
{
    protected $table = "membership_translations";

    public function membership()
    {
        return $this->belongsTo(Membership::class , 'membership_id' , 'id');
    }
}
