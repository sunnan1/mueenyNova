<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\MyModel;
use App\Helpers\Authorization;

class Advertisement extends MyModel
{

    protected $table = "advertisements";
    protected $guarded = [];
    protected $casts = [
        'id' => 'integer',
        'budget' => 'double',
        'client_rate' => 'double',
        'no_of_offers' => 'integer',
        'service_provider_id' => 'integer',
        'service_provider_rate' => 'double',
        'service_provider_rates_count' => 'integer',
        'score' => 'double',
        'cancellation_status' => 'boolean',
        'date' => 'date'
    ];

    public $stauses = [
        'waiting_for_acceptance' => 0,
        'active' => 1,
        'completed' => 2,
        'cancelled' => 3,
        'refunded' => 4
    ];

    public $payment_statuses = [
        'pending' => 0,
        'paid' => 1,
    ];

    public $types = [
        'in_location' => 1,
        'remotely' => 2
    ];

    public function scopeCompleted($q)
    {
        return $q->where('status', 2);
    }


    public function requirements()
    {
        return $this->hasMany(Requirement::class, 'advertisement_id');
    }

    public function requirementsApproved()
    {
        return $this->hasMany(Requirement::class, 'advertisement_id')->accepted();
    }

    public function requirementsExcludeCancelled()
    {
        return $this->hasMany(Requirement::class, 'advertisement_id')->notRejected();
    }

    public function offers()
    {
        return $this->hasMany(Offer::class, 'advertisement_id');
    }

    public function acceptedOffer()
    {
        return $this->hasMany(Offer::class, 'advertisement_id')->where('status', 1);
    }

    public function transformListApi()
    {

        $favorite = \DB::table('user_advertisement')
            ->where(['advertisement_id' => $this->id, 'user_id' => $this->authUser()->id])->exists();
        // dd($favorite);
        Carbon::setLocale($this->getLangCode());
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->created_at = $this->created_at;
        $transformer->title = $this->title;
        $transformer->description = $this->description;
        $transformer->lat = $this->lat;
        $transformer->lng = $this->lng;
        $transformer->budget = $this->budget;
        $transformer->status = $this->status;
        $transformer->status_text = _lang('app.' . array_search($this->status, $this->stauses));
        $transformer->date = date('d/m/Y', strtotime($this->date));
        $transformer->user_id = $this->user_id;
        $transformer->user_phone = $this->user->mobile;
        if (filter_var($this->user_image, FILTER_VALIDATE_URL)) {
            $transformer->user_image = $this->user_image;
        } else {
            $transformer->user_image = url("public/uploads/users/$this->user_image");
        }
        $transformer->user_rate = $this->client_rate;
        $transformer->no_of_offers = $this->offers->count();
        $transformer->favorite = $favorite;
        if (in_array($this->status, [$this->stauses['active'], $this->stauses['completed']])) {
            $serviceProvider = new \stdClass();
            $serviceProvider->id = $this->service_provider_id;
            $serviceProvider->name = $this->service_provider;
            $serviceProvider->image = url("public/uploads/service_providers/$this->service_provider_image");
            $serviceProvider->rate = $this->service_provider_rate;
            $serviceProvider->no_of_rates = $this->service_provider_rates_count;
            $transformer->service_provider = $serviceProvider;
            if ($this->stauses == $this->stauses['completed']) {
                $serviceProviderRate = new \stdClass();
                $serviceProviderRate->score = $this->score;
                $serviceProviderRate->comment = $this->comment;
                $transformer->rate = $serviceProviderRate;
            }
        }



        if ($this->status == $this->stauses['cancelled']) {
            $transformer->cancellation_reason = $this->cancelRequests->first()->reason->translations[0]->name;
            $transformer->cancellation_note = $this->cancelRequests->first()->cancellation_note;
            $transformer->cancellation_status = $this->cancelRequests->first()->status;
        }
        return $transformer;
    }

    public function getUserAvatarAttribute()
    {
        return url("public/uploads/users/$this->image");
    }

    protected static function boot()
    {
        parent::boot();

        static::created(function (advertisement $advertisement) {
            // Service providers will get new notifications if there is any order placed for the same category they working on
            $serviceProviders = User::providers()->get();
            foreach ($serviceProviders as $serviceProvider) {
                foreach ($serviceProvider->categories as $category) {
                    if ($category->id == $advertisement->main_category_id) {
                        //    $this->notificationCreatedOrder($advertisement);
                    }
                }
            }
            return $advertisement;
        });

        static::deleting(function (advertisement $advertisement) {
            foreach ($advertisement->requirements as $requirement) {
                $requirement->delete();
            }
            foreach ($advertisement->offers as $offer) {
                $offer->delete();
            }
        });

        static::deleted(function (advertisement $advertisement) {
            if ($advertisement->images) {
                foreach (json_decode($advertisement->images) as $image) {
                    $advertisement->deleteUploaded('advertisements', $image);
                }
            }
            if ($advertisement->videos) {
                foreach (json_decode($advertisement->videos) as $video) {
                    $advertisement->deleteUploaded('advertisements', $video);
                }
            }
        });
    }


    private function notificationCreatedOrder($advertisement)
    {
        $userId = $advertisement->acceptedOffer[0]->user->id;
        $title = _lang('app.deleted_order');
        $message = _lang('app.the_order_has_deleted');
        $this->sendNotification($userId, $title, $message);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function scopePast($q)
    {
        return $q->where('status', 2)->orWhere('status', 3)->orWhere('status', 4);
    }

    public function scopeActive($q)
    {
        return $q->where('status', 0)->orWhere('status', 1);
    }

    public function getCreatedAtAttribute()
    {
        return \Carbon\Carbon::parse($this->attributes['created_at'])->format('d/m/Y');
    }

    public function getFinishedAtAttribute()
    {
        return \Carbon\Carbon::parse($this->attributes['finished_at'])->format('d/m/Y');
    }

    public function serviceProvider()
    {
        return $this->belongsTo(ServiceProviderDetails::class, 'service_provider_id');
    }

    public function rates()
    {
        return $this->hasMany(Rate::class, 'advertisement_id');
    }

    public function cancelRequests()
    {
        return $this->hasMany(AdvertisementCancellation::class, 'advertisement_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_advertisement', 'advertisement_id', 'user_id');
    }

    public function finishedBy()
    {
        return $this->belongsTo(User::class,  'finished_by');
    }

    public function reports()
    {
        return $this->hasMany(OrderReport::class, 'advertisement_id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class, 'currency_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'main_category_id');
    }
    public function categoryNova()
    {
        return $this->belongsTo(CategoryNova::class, 'main_category_id');
    }

    public function subCategoryNova()
    {
        return $this->belongsTo(CategoryNova::class, 'sub_category_id');
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class, 'payment_method');
    }

    public function paymentMethodNova()
    {
        return $this->belongsTo(PaymentMethodNova::class, 'payment_method' , 'id');
    }

    public function authUser()
    {
        $token = request()->header('authorization');
        $token = Authorization::validateToken($token);
        $user = null;
        if ($token) {
            $user = User::find($token->id);
        }
        return $user;
    }

    public function totalRevenue()
    {
        $totalBudget = $this->budget + $this->requirementsApproved->sum('price');
        $totalRevenue = $totalBudget - round(($this->commission / 100) * $totalBudget, 2);
        return $totalRevenue;
    }
}
