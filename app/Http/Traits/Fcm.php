<?php

namespace App\Http\Traits;

use Kreait\Firebase\Contract\Auth;

class Fcm
{

  /** @var string     push message title */
  private $title;

  /** @var string     message */
  private $message;

  /** @var string     URL String */
  private $image;

  /** @var array     Custom payload */
  private $data;

  private $badge;

  /**
   * flag indicating whether to show the push notification or not
   * this flag will be useful when perform some opertation
   * in background when push is recevied
   */

  /** @var bool     set background or not */
  private $is_background;

  /**
   * Function to set the title
   *
   * @param string    $title  The title of the push message
   */
  public function setTitle($title)
  {
    $this->title = $title;
  }

  /**
   * Function to set the message
   *
   * @param string    $message    Message
   */
  public function setMessage($message)
  {
    $this->message = $message;
  }

  /**
   * Function to set the image (optional)
   *
   * @param string    $imageUrl    URI string of image
   */
  public function setImage($imageUrl)
  {
    $this->image = $imageUrl;
  }

  /**
   * Function to set the custom payload (optional)
   *
   * eg:
   *      $payload = array('user' => 'user1');
   *
   * @param array    $data    Custom data array
   */
  public function setPayload($data)
  {
    $this->data = $data;
  }

  /**
   * Function to specify if is set background (optional)
   *
   * @param bool    $is_background
   */
  public function setIsBackground($is_background)
  {
    $this->is_background = $is_background;
  }

  /**
   * Generating the push message array
   *
   * @return array  array of the push notification data to be send
   */
  public function getPush()
  {
    $res = array();
    $res['title'] = $this->title;
    //$res['is_background'] = $this->is_background;
    $res['body'] = $this->message;
    $res['sound'] = 'tone.wav';
    $res['badge'] = $this->badge;
    //$res['timestamp'] = date('Y-m-d G:i:s');
    return $res;
  }

  /**
   * Function to send notification to a single device
   *
   * @param   string   $to     registration id of device (device token)
   * @param   array   $message    push notification array returned from sendMultiple()
   *
   * @return  array   array of notification data and to address
   */
  public function send($to, $message)
  {
    $fields = array(
      'to' => $to,
      'notification' => $message,
    );
    return $this->sendPushNotification($fields);
  }

  /**
   * Function to send notification to a topic by topic name
   *
   * @param   string   $to     topic
   * @param   array   $message    push notification array returned from getPush()
   * 
   * @return  array   array of notification data and to address (topic)
   */
  public function sendToTopic($to, $message)
  {
    $fields = array(
      'to' => '/topics/' . $to,
      'data' => $message,
    );
    return $this->sendPushNotification($fields);
  }

  /**
   * Function to send notification to multiple users by firebase registration ids
   *
   * @param   array   $to         array of registration ids of devices (device tokens)
   * @param   array   $message    push notification array returned from getPush()
   * 
   * @return  array   array of notification data and to addresses
   */
  public function sendMultiple($registration_ids, $message)
  {
    //   echo"<pre>";
    //   print_r($registration_ids);
    //   echo"</pre>";

    $tokenNew = array();
    $tokenUnique = array_unique($registration_ids);
    foreach ($tokenUnique as $token) {
      array_push($tokenNew, $token);
    }
    $fields = array(
      'registration_ids' => $tokenNew,
      'notification' => $message,
      'priority' => 'high'
    );

    return $this->sendPushNotification($fields);
  }

  /**
   * Function makes curl request to firebase servers
   *
   * @param   array   $fields    array of registration ids of devices (device tokens)
   * 
   * @return  string   returns result from FCM server as json
   */
  private function sendPushNotification($fields)
  {

    // Set POST variables
    $url = config('app.firebase_server_url');
    $key = config('app.server_api_key');

    //Generating JSON encoded string form the above array.
    $json = json_encode($fields);

    //Setup headers:
    $headers = array();
    $headers[] = 'Content-Type: application/json';
    $headers[] = 'Authorization: key=' . $key; // key here
    $ch = curl_init($url);

    //Setup curl, add headers and post parameters.
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    ////  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);                                                                  
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    //Send the request
    $response = curl_exec($ch);

    //Close request
    if ($response === FALSE) {
      die('FCM Send Error: ' . curl_error($ch));
    }

    //Close request
    curl_close($ch);
    return $response;
  }

  public function setBadge($number)
  {
    $this->badge = $number;
  }

  public function getCustomToken($id)
  {
    $auth = app('firebase.auth');
    $additionalClaims = [
      'premiumAccount' => true
    ];
    // dd($id);
    $r = $auth->createCustomToken($id, $additionalClaims);
    return $r->__toString();
  }
}
