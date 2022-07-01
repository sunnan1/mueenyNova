<?php

namespace App\Models;

class Requirement extends MyModel
{

    protected $table = "requirements";

    protected $casts = [
        'id' => 'integer',

    ];

    public $statues = [
        'pending' => 0,
        'accepted' => 1,
        'rejected' => 2,
    ];

    public function addedBy()
    {
        return $this->belongsTo(User::class, 'added_by');
    }

    public function scopeAccepted($q)
    {
        return $q->where('status', 1);
    }

    public function scopeNotRejected($q)
    {
        return $q->whereIn('status', [0, 1]);
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Requirement $requirement) {
        });

        static::deleted(function (Requirement $requirement) {
        });
    }


    public function advertisement()
    {
        return $this->belongsTo(Advertisement::class, 'advertisement_id');
    }
}
