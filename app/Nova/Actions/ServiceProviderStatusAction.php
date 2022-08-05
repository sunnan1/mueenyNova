<?php

namespace App\Nova\Actions;

use App\Http\Traits\FirebaseNotification;
use App\Models\ServiceProviderDetails;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Laravel\Nova\Actions\Action;
use Laravel\Nova\Fields\ActionFields;
use Laravel\Nova\Fields\Select;

class ServiceProviderStatusAction extends Action
{
    use InteractsWithQueue, Queueable, FirebaseNotification;

    /**
     * Perform the action on the given models.
     *
     * @param  \Laravel\Nova\Fields\ActionFields  $fields
     * @param  \Illuminate\Support\Collection  $models
     * @return mixed
     */
    public function handle(ActionFields $fields, Collection $models)
    {
        foreach($models as $model)
        {
            $serviceProvider = ServiceProviderDetails::find($model->id);
            if ($serviceProvider->is_submitted === 1 && $serviceProvider->status != 1) {
                if ($serviceProvider->agency_id && $fields->status == 0) {
                    $serviceProvider->agency_id = null;
                    $serviceProvider->is_submitted = 0;
                }
                $serviceProvider->status = $fields->status;
                $serviceProvider->operated_by = Auth::user()->id;
                $serviceProvider->operation = $fields->status;
                $serviceProvider->saveQuietly();
                $user = User::find($serviceProvider->user_id);
                $user->is_service_provider =  ($fields->status == 1) ? 1 : 0;
                $user->saveQuietly();

                if ($fields->status == 1) {
                    $title = "Service provider join request accepted";
                    $message = "Welcome to our service provider community, you are now a service provider in Mueeny.";
                    $this->sendNotification($serviceProvider->user_id, $title, $message);
                }
                if ($fields->status == 2) {
                    $title = "Service provider join request rejected";
                    $message = "We are sorry your request has been rejected.";
                    $this->sendNotification($serviceProvider->user_id, $title, $message);
                }
                return Action::message('Status Changed Successfully !');
            }
            return Action::danger('Status change not allowed');
        }
    }

    /**
     * Get the fields available on the action.
     *
     * @return array
     */
    public function fields()
    {
        return [
            Select::make('Status' , 'status')->options([
                0 => 'Pending',
                1 => 'Accepted',
                2 => 'Rejected'
            ])->rules('required')
        ];
    }

    public function name()
    {
        return "Update Status";
    }
}
