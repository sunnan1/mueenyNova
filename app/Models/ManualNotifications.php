<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ManualNotifications extends Model
{
    protected $table = "manual_notifications";
    protected $guarded = [];


    public function admin()
    {
        return $this->belongsTo(Admin::class , 'admin_id' , 'id');
    }
}
