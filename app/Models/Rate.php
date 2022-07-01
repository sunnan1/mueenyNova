<?php

namespace App\Models;

class Rate extends MyModel
{

    protected $table = "rates";

    protected $casts = [
        'id' => 'integer',
        'rater_id' => 'integer',
        'rated_id' => 'integer',
    ];

    public $types = [
        'client' => 1,
        'service_provider' => 2
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;

        return $transformer;
    }

    public function serviceProvider()
    {
        return $this->belongsTo(User::class, 'rated_id');
    }

    public function rated()
    {
        return $this->belongsTo(User::class, 'rated_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'rater_id');
    }

    public function rater()
    {
        return $this->belongsTo(User::class, 'rater_id');
    }
    
    public function advertisement()
    {
        return $this->belongsTo(Advertisement::class,'advertisement_id');
    }



    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Rate $rate) {
        });

        static::deleted(function (Rate $rate) {
        });
    }

    function dateForHumans($value)
    {
        return $value->diffForHumans();
    }
}
