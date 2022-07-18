<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StoreManagerDetailNova extends Model
{
    use HasFactory;

    protected $casts = [
        'doj'          => 'date',
    ];

    public function admin()
    {
        return $this->belongsTo(Admin::class , 'admin_id' , 'id');
    }
    public function category()
    {
        return $this->belongsTo(CategoryNova::class , 'category_id' , 'id');
    }

    public function country()
    {
        return $this->belongsTo(LocationNova::class,'country_id' , 'id');
    }
    public function city()
    {
        return $this->belongsTo(LocationNova::class,'city_id' , 'id');
    }

    public function region()
    {
        return $this->belongsTo(LocationNova::class,'region_id' , 'id');
    }

    public function membership()
    {
        return $this->belongsTo(MembershipNova::class , 'membership_id' , 'id');
    }
}
