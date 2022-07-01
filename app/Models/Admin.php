<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Notifications\AdminResetPasswordNotification;
use App\Traits\ModelTrait;
use Spatie\Permission\Traits\HasRoles;


class Admin extends Authenticatable {

    use HasRoles;
    use Notifiable;
    use ModelTrait;

    protected $table = "admins";

    protected $guarded = [];

    public function group() {
        return $this->belongsTo(Group::class, 'group_id');
    }

    public function partnerOffers()
    {
        return $this->hasMany(PartnerOffer::class, 'admin_id');
    }

    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new AdminResetPasswordNotification($token));
    }

    public function scopeStore($q)
    {
        return $q->where('is_store', 1);
    }

    public function store_manager()
    {
        return $this->hasOne(StoreManager::class, 'admin_id');
    }
}
