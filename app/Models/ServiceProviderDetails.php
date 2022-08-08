<?php

namespace App\Models;

class ServiceProviderDetails extends MyModel
{
    protected $guarded = [];
    protected $table = "service_provider_details";
    protected $casts = [
        'id' => 'integer',
        'type' => 'integer',
        'status' => 'integer'
    ];

    public $types = [
        'individual' => 1,
        'company' => 2
    ];

    public $statuses = [
        'pending' => 0,
        'accepted' => 1,
        'rejected' => 2
    ];

    public function transform()
    {
        $transformer = new \stdClass();
        $transformer->id = $this->id;
        $transformer->type = $this->type;
        $transformer->name = $this->name;
        $transformer->image = url("public/uploads/service_providers/$this->image");
        if ($this->type == $this->types['individual']) {
            $transformer->id_image = url("public/uploads/service_providers/$this->id_image");
        } else {
            $transformer->email = $this->email;
            $transformer->mobile = $this->mobile;
            $transformer->commercial_record = $this->commercial_record;
            $transformer->commercial_record_image = url("public/uploads/service_providers/$this->commercial_record_image");
        }
        $transformer->other_documents = $this->other_documents ? preg_filter('/^/', url('public/uploads/service_providers') . '/', json_decode($this->other_documents)) : [];
        $transformer->registeration_date = $this->created_at->format('d/m/Y');
        return $transformer;
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'operated_by');
    }

    public function agency()
    {
        return $this->belongsTo(Admin::class, 'agency_id');
    }

    // public function getTypeAttribute($value)
    // {
    //     return $value == '1' ? _lang('app.individual') : _lang('app.company');
    // }

    public function scopePending($q)
    {
        return $q->where('status', 0);
    }

    public function scopeActive($q)
    {
        return $q->where('status', 1);
    }

    public function scopeRejected($q)
    {
        return $q->where('status', 2);
    }

    public function documents()
    {
        return $this->hasMany(ServiceProviderDetailDocuments::class , 'detail_id' , 'id');
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function (ServiceProviderDetails $serviceProviderDetails) {
        });

        static::deleted(function (ServiceProviderDetails $serviceProviderDetails) {
            $serviceProviderDetails->deleteUploaded('service_providers', $serviceProviderDetails->image);
            if ($serviceProviderDetails->type == $serviceProviderDetails->types['individual']) {
                $serviceProviderDetails->deleteUploaded('service_providers', $serviceProviderDetails->id_image);
            } else {
                $serviceProviderDetails->deleteUploaded('service_providers', $serviceProviderDetails->commercial_record_image);
            }
            if ($serviceProviderDetails->other_documents) {
                foreach (json_decode($serviceProviderDetails->other_documents) as $document) {
                    $serviceProviderDetails->deleteUploaded('service_providers', $document);
                }
            }
        });
    }

    public function getServiceProviderImageAttribute()
    {
        return  !empty($this->image) ? "/public/uploads/service_providers/" . $this->image : '';
    }

    public function getIdProofAttribute()
    {
        return  !empty($this->id_image) ? "/public/uploads/service_providers/" . $this->id_image : '';
    }

    public function getNationalitysAttribute()
    {
        $search_array = config('country.countries');

        if (array_key_exists($this->nationality, $search_array)) {
            return $search_array[$this->nationality]['name'];
        }
    }

    public function userLanguages()
    {
        return $this->user->userLanguage();
    }

    public function userTransportation()
    {
        return $this->user->userTransportation();
    }

    public function rateServiceProvider()
    {
        return $this->user->rateServiceProvider();
    }

    public function certifications()
    {
        return $this->user->certifications();
    }

    public function practicalExperience()
    {
        return $this->user->practicalExperience();
    }

    public function transportation()
    {
        return $this->user->transportationNova();
    }

    public function listServices()
    {
        return $this->user->listServices();
    }
}
