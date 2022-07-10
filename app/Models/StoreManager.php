<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\ModelTrait;

class StoreManager extends Model
{
    use ModelTrait;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'store_managers_details';

    protected $fillable = [
        "name",
        "category_id",
        "description",
        "country_id",
        "city_id",
        "regoin_id",
        "doj",
        "cover_image",
        "membership_id",
        "user_id",
    ];

    protected $casts = [
        'doj'          => 'date',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class , 'admin_id' , 'id');
    }

    public function partnerOffers()
    {
        return $this->hasMany(PartnerOffer::class,'store_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function country()
    {
        return $this->belongsTo(Location::class,'country_id');
    }
    public function city()
    {
        return $this->belongsTo(Location::class,'city_id');
    }

    public function region()
    {
        return $this->belongsTo(Location::class,'regoin_id');
    }

    public function membership()
    {
        return $this->belongsTo(Membership::class);
    }

    public function getMembership()
    {
        return Membership::join('membership_translations', function ($query) {
            $query->on('memberships.id', '=', 'membership_translations.membership_id')
               ->where('membership_translations.locale', $this->getLangCode());
         })->select('memberships.*', 'membership_translations.name')->where('memberships.id', $this->membership_id)->first();
    }

    public function getCategory()
    {
        return Category::join('category_translations', function ($query) {
            $query->on('categories.id', '=', 'category_translations.category_id')
               ->where('category_translations.locale', $this->getLangCode());
         })->select('categories.*', 'category_translations.name')->where('categories.id', $this->category_id)->first();
    }

    public function getLocation($id)
    {
        return $id ? Location::join('location_translations', function ($query) {
            $query->on('locations.id', '=', 'location_translations.location_id')
                ->where('location_translations.locale', $this->getLangCode());
        })->select('locations.*', 'location_translations.name')->where('locations.id', $id)->first()
        : 0;
    }

//    public function getCoverImageAttribute()
//    {
//        return 'uploads/admins/'.$this->attributes['cover_image'];
//    }
}
