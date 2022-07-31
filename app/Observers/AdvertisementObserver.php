<?php

namespace App\Observers;

use App\Models\Advertisement;

class AdvertisementObserver
{
    public function updated(Advertisement $advertisement)
    {
        dd(123);
        print_r(request()->all());
        dd();
    }

    public function updating(Advertisement $advertisement)
    {
        dd(123);
        print_r(request()->all());
        dd();
    }
}
