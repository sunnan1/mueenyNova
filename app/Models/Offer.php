<?php

namespace App\Models;

class Offer extends MyModel
{

    protected $table = "offers";

    protected $casts = [
        'id' => 'integer',
    ];

    public $statuses = [
        'pending' => 0,
        'accepted' => 1,
        'cancelled' => 2
    ];

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Offer $offer) {
        });

        static::deleted(function (Offer $offer) {
        });
    }

    public function userAsServiceProvider()
    {
        return $this->belongsTo(User::class, 'service_provider_id');
    }

    public function advertisement()
    {
        return $this->belongsTo(Advertisement::class, 'advertisement_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'service_provider_id');
    }
}
