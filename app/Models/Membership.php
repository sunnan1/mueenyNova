<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Membership extends MyModel
{
    public $status = [
        'active' => 1,
        'not_active' => 0
    ];

    public function translations()
    {
        return $this->hasMany(MembershipTranslation::class, 'membership_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (Membership $membership) {
            foreach ($membership->translations as $translation) {
                $translation->delete();
            }
        });

        static::deleted(function (Membership $membership) {
            $membership->deleteUploaded('memberships', $membership->image);
        });
    }

    public function scopeUsers($q)
    {
        return $q->where('membership_type', 'admins');
    }

    public function scopeStores($q)
    {
        return $q->where('membership_type', 'stores');
    }
}
