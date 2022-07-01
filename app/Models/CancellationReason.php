<?php

namespace App\Models;

class CancellationReason extends MyModel
{

    protected $table = "cancellation_reasons";
    protected $casts = [
        'id' => 'integer'
    ];

    public $types = [
        'ad' => 1,
        'offer' => 2
    ];

    public function translations()
    {
        return $this->hasMany(CancellationReasonTranslation::class, 'cancellation_reason_id');
    }

    public function cancel()
    {
        return $this->hasMany(CancellationReason::class, 'cancellation_reason_id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->name = $this->name;
        return $transformer;
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (CancellationReason $cancellationReason) {
            foreach ($cancellationReason->translations as $translation) {
                $translation->delete();
            }
        });

        static::deleted(function (CancellationReason $cancellationReason) {
        });
    }

    public function scopeActive($q)
    {
        return $q->where('active', 1);
    }
}
