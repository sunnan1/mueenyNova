<?php

namespace App\Models;

use App\Models\MyModel;

class SupportTicket extends MyModel
{
    protected $table = "support_tickets";
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'message' => 'string',
        'status' => 'integer',
    ];

    public $statuses = [
        'open' => 0,
        'pending' => 1,
        'closed' => 2
    ];

    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function supportReason() {
        return $this->belongsTo(SupportReason::class, 'support_reason_id');
    }
}