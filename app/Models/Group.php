<?php

namespace App\Models;

class Group extends MyModel
{
    protected $table = "groups";
    public function admin() {
        return $this->hasMany(Admin::class);
    }

    protected static function boot() {
        parent::boot();

        static::deleting(function(Group $group) {            
            if ($group->is_restricted == 1){
                return false;
            }           
            
        });               
    }
}
