<?php

namespace App\Nova\Actions;

use App\Models\Advertisement;
use App\Models\AdvertisementCancellation;
use App\Models\CancellationReasonNova;
use Epartment\NovaDependencyContainer\NovaDependencyContainer;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Laravel\Nova\Actions\Action;
use Laravel\Nova\Fields\ActionFields;
use Laravel\Nova\Fields\Select;
use Laravel\Nova\Fields\Text;

class AdvertisementStatusAction extends Action
{
    use InteractsWithQueue, Queueable;

    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields  $fields
     * @param  \Illuminate\Support\Collection  $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {
        DB::beginTransaction();
        if (3 === (int)$fields->status) {
            $advertisementCancellation = new AdvertisementCancellation();
            $advertisementCancellation->cancellation_reason_id = $fields->reason;
            $advertisementCancellation->cancellation_note = $fields->note;
            $advertisementCancellation->status = 1;
            $advertisementCancellation->created_at = date('y-m-d h:i:s');
            $advertisementCancellation->advertisement_id = (int) $models[0]->id;
            $advertisementCancellation->by = (int) Auth::id();
            $advertisementCancellation->save();


//            $title = 'Admin Notification';
//            $message = 'Order # ' . $models->id . ' has been cancelled by the admin';
//            $ad->offers()->each(function ($item, $key) use ($title, $message) {
//
//                if ($item->status == 1) {
//                    $item->status = 0;
//                    $item->save();
//                    $this->sendNotification($item->userAsServiceProvider->id, $title, $message);
//                }
//            });
//
//
//            $this->sendNotification($ad->user->id, $title, $message);
            DB::commit();
        }
        $ad = Advertisement::find((int)$models[0]->id)->update(['status' => $fields->status]);
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        $reasons = CancellationReasonNova::pluck('name_ar' , 'id')->toArray();
        return [
            Select::make('Status' , 'status')->options([
                0 => 'Waiting for acceptance',
                1 => 'Active',
                2 => 'Completed',
                3 => 'Cancelled',
                4 => 'Refunded',
            ])->rules('required'),

            NovaDependencyContainer::make([
                Select::make('Reason' , 'reason')->options($reasons)->rules('required'),
                Text::make('Note' , 'note')->rules('required'),
            ])->dependsOn('status', 3),
        ];
    }

    public function name()
    {
        return "Change Status";
    }
}
