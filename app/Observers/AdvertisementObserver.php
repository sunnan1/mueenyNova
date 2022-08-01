<?php

namespace App\Observers;

use App\Models\Advertisement;

class AdvertisementObserver
{
    public function updated(Advertisement $advertisement)
    {
//        dd(123);
//        print_r(request()->all());
//        dd();
    }

    public function updating(Advertisement $advertisement)
    {
//        if (3 === (int)request()->input('status')) {
//            $advertisementCancellation = new AdvertisementCancellation;
//            $advertisementCancellation->cancellation_reason_id = $request->cancellation_reason_id;
//            $advertisementCancellation->cancellation_note = $request->cancellation_note;
//            $advertisementCancellation->status = 1;
//            $advertisementCancellation->created_at = date('y-m-d h:i:s');
//            $advertisementCancellation->advertisement_id = (int)$request->id;
//            $advertisementCancellation->by = (int)Auth::id();
//            $advertisementCancellation->save();
//        }
    }
}
