<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupportTicketNova extends Model
{
    use HasFactory;

    public function reason()
    {
        return $this->belongsTo(SupportReasonNova::class , 'support_reason_id' , 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class , 'user_id' , 'id');
    }
}
