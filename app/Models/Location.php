<?php

namespace App\Models;

class Location extends MyModel {

    protected $table = "locations";
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'dial_code' => 'integer'
    ];

    public function translations() {
        return $this->hasMany(LocationTranslation::class, 'location_id');
    }

    public function childs()
    {
        return $this->hasMany(Location::class, 'parent_id');
    }

    public function location()
    {
        return $this->belongsTo(Location::class, 'parent_id' , 'id');
    }

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->dial_code = $this->dial_code;
        $transformer->image = url("public/uploads/locations/$this->image");
        return $transformer;
    }

    protected static function boot() {
        parent::boot();

        static::deleting(function(Location $location) {
            foreach ($location->childs as $child) {
                $child->delete();
            }
            foreach ($location->translations as $translation) {
                $translation->delete();
            }
        });

        static::deleted(function (Location $location) {
            $location->deleteUploaded('locations', $location->image);
        });
    }

}
