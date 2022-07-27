<?php

namespace App\Models;

use App\Traits\ModelTrait;
use App\Interfaces\UserInterface;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Lang;

class User extends Authenticatable implements UserInterface
{
    use Notifiable;
    use ModelTrait;
    protected $guarded = [];
    protected $casts = [
        'mobile' => 'string',
        'is_service_provider' => 'boolean',
        'gender' => 'integer',
        'orders_offers_notifications' => 'boolean',
        'messages_notifications' => 'boolean',
        'appointments_notifications' => 'boolean',
        'dob' => 'date:Y-m-d'
    ];
    public $genders = [
        'Male' => 1,
        'Female' => 2
    ];

    public function devices()
    {
        return $this->hasOne(Device::class, 'user_id');
    }

    public function getGenderAttribute($value)
    {
        return $value == '1' ? _lang('app.male') : _lang('app.female');
    }

    public function serviceProviderDetails()
    {
        return $this->hasOne(ServiceProviderDetails::class, 'user_id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->name = $this->name;
        $transformer->email = $this->email;
        $transformer->mobile = $this->mobile;
        $transformer->firebase_id = $this->firebase_id;
        if (filter_var($this->image, FILTER_VALIDATE_URL)) {
            $transformer->image = $this->image;
        } else {
            $transformer->image = url("public/uploads/users/$this->image");
        }
        $transformer->is_service_provider = $this->is_service_provider ?: false;
        $serviceProviderDetails = $this->serviceProviderDetails()->latest()->first();
        if ($serviceProviderDetails) {
            $transformer->service_provider_status = $serviceProviderDetails->status;
            $transformer->service_provider_type = $serviceProviderDetails->type;
        }

        return $transformer;
    }

    public function transportation()
    {
        return $this->belongsToMany(Transportation::class, 'user_transportation', 'user_id', 'transportation_id');
    }
    public function transportationNova()
    {
        return $this->belongsToMany(TransportationNova::class, 'user_transportation', 'user_id', 'transportation_id');
    }
    protected $hidden =
    [
        'password', 'orders_offers_notifications', 'messages_notifications', 'appointments_notifications',
        'active', 'cancelled_orders_count', 'created_at', 'updated_at',
    ];

    public function transformProfile()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        $transformer->email = $this->email;
        $transformer->mobile = $this->mobile;
        $transformer->firebase_id = $this->firebase_id;
        if (filter_var($this->image, FILTER_VALIDATE_URL)) {
            $transformer->image = $this->image;
        } else {
            $transformer->image = url("public/uploads/users/$this->image");
        }
        $transformer->registeration_date = $this->created_at->format('d/m/Y');
        $transformer->dob = $this->dob;
        $transformer->bio = $this->bio;
        $transformer->language_id = $this->language_id;
        // check lang in the header
        foreach ($this->language->translations as $value) {
            if (isset(apache_request_headers()['Lang']) && apache_request_headers()['Lang'] == $value->locale) {
                $transformer->lang =  $value->name;
            } else $transformer->lang = 'en';
        }
        $transformer->gender = $this->gender;
        $transformer->orders_offers_notifications = $this->orders_offers_notifications;
        $transformer->messages_notifications = $this->messages_notifications;
        $transformer->appointments_notifications = $this->appointments_notifications;
        $transformer->is_service_provider = $this->is_service_provider;
        return $transformer;
    }

    protected static function boot()
    {
        parent::boot();
        static::deleting(function (User $user) {
            foreach ($user->devices as $device) {
                $device->delete();
            }
        });

        static::deleted(function (User $user) {
            if ($user->image != 'default.png') {
                $user->deleteUploaded('users', $user->image);
            }
        });
    }

    public function getUserImageAttribute()
    {
        return "/public/uploads/users/" . $this->image;
    }

    public function address()
    {
        return $this->hasMany('App\Models\Address', 'user_id');
    }

    public function language()
    {
        return $this->belongsTo(Language::class, 'language_id');
    }

    public function languageNova()
    {
        return $this->belongsTo(\App\Models\LanguageNova::class, 'language_id' , 'id');
    }

    public function languageLevel()
    {
        return $this->belongsToMany(Language::class, 'user_language', 'user_id', 'language_id');
    }

    public function efficiencyLevel()
    {
        return $this->belongsToMany(EfficiencyLevel::class, 'user_language', 'user_id', 'efficiency_level_id');
    }

    public function certifications()
    {
        return $this->hasMany(Certification::class, 'user_id');
    }

    public function bankAccounts()
    {
        return $this->hasMany(BankAccount::class, 'user_id');
    }

    public function practicalExperience()
    {
        return $this->hasMany(PracticalExperience::class, 'user_id');
    }

    public function languages()
    {
        return $this->hasMany(ServiceProviderLanguage::class, 'user_id');
    }

    public function listServices()
    {
        return $this->hasMany(ListService::class, 'user_id');
    }

    public function serviceProviderRate()
    {
        return $this->hasMany(Rate::class, 'rater_id');
    }

    public function userRate()
    {
        return $this->hasMany(Rate::class, 'rated_id');
    }

    public function offers()
    {
        return $this->hasMany(Offer::class, 'service_provider_id');
    }

    public function rateServiceProvider()
    {
        return $this->hasMany(Rate::class, 'rated_id');
    }



    public function serviceProvider()
    {
        return $this->hasOne(ServiceProviderDetails::class, 'user_id');
    }

    public function scopeProviders($q)
    {
        return $q->where('is_service_provider', 1);
    }
    public function scopeActive($q)
    {
        return $q->where('active', 1);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'user_category', 'user_id', 'category_id');
    }

    public function membership()
    {
        return $this->belongsTo(Membership::class, 'membership_id');
    }

    public function membershipNova()
    {
        return $this->belongsTo(MembershipNova::class, 'membership_id');
    }

    public function AdsFavorites()
    {
        return $this->belongsToMany(Advertisement::class, 'user_advertisement', 'user_id', 'advertisement_id');
    }

    public function store()
    {
        return $this->hasOne(StoreManager::class);
    }
}
