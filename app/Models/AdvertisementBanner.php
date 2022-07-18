<?php

namespace App\Models;

use App\Models\MyModel;

class AdvertisementBanner extends MyModel
{
    protected $table = "advertisement_banners";
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'image' => 'string',
        'link' => 'string',
        'sort_order' => 'integer',
    ];

    protected static function boot()
    {
        parent::boot();

        static::deleted(function (AdvertisementBanner $advertisementBanner) {
            $advertisementBanner->deleteUploaded('advertisement_banners', $advertisementBanner->image);
        });
    }

    public function scopeActive($q)
    {
        return $q->where('active', 1);
    }

    public function getCreatedAtAttribute()
    {
        return \Carbon\Carbon::parse($this->attributes['created_at'])->diffForHumans();
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function categorynova()
    {
        return $this->belongsTo(CategoryNova::class, 'category_id');
    }
}
