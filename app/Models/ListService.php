<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ListService extends Model
{
    public $table = 'services';

    protected $guarded = [];

    public function mainCategory()
    {
        return $this->belongsTo(Category::class, 'main_category_id');
    }

    public function subCategory()
    {
        return $this->belongsTo(Category::class, 'sub_category_id','id');
    }

    public function levelQualification()
    {
        return $this->belongsTo(EfficiencyLevel::class,'efficiency_level_id');
    }


}
