<?php

namespace App\Http\Traits;

use App\Models\User;
use App\Http\Traits\Fcm;
use App\Models\Notification;
use Illuminate\Support\Facades\Log;
use App\Notifications\CreateManualNotification;

trait FirebaseNotification
{
    public function sendMultiNotification($request)
    {
        $tokens = [];
        $users = User::all();
        foreach ($users as $user) {
            if (!empty($user->devices->device_token) &&  $user->devices->device_token != 1) {
                $tokens[] = $user->devices->device_token;
            }
        }
        if ($tokens != null) {
            $fcm = new Fcm();
            $fcm->setTitle($request->title_en);
            $fcm->setMessage($request->data_en);
            $json = $fcm->getPush();
            $fcm->sendMultiple($tokens, $json);
        }
    }

    public function sendNotification($userID, $title, $message)
    {
        $user = User::find($userID);



        $notifications = Notification::where('notifiable_id', $user->id)->whereNull('read_at')->count();


        if ($user) {


            $device = $user->devices()->latest('updated_at')->first();


            if (empty($device)) {
                Log::error('Firebase error message: no device found for user ' . $userID);
                return;
            }
            $token = $device->device_token;



            if ($token != null) {
                $fcm = new Fcm();
                $fcm->setTitle($title);
                $fcm->setMessage($message);
                $fcm->setBadge($notifications);
                $json = $fcm->getPush($notifications);
                $fcm->send($token, $json);
            }
        } else {
            Log::error('No user ' . $userID);
            return;
        }
    }
}
