<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceProviderDetailDocuments extends Model
{
    use HasFactory;

    public function provider()
    {
        return $this->belongsTo(ServiceProviderDetails::class , 'detail_id' , 'id');
    }
}
