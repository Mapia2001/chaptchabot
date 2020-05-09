<?php
$signature = $_SERVER['HTTP_X_FRESHCHAT_SIGNATURE'];
$public_key = getenv('WH_AUTH');
$api_token = getenv('FRESHCHAT_API_TOKEN');
$url='https//api.freshchat.com/v2/';

/* if (file_exists('request.log')) {
  $log = readfile('request.log');
  var_dump($log);
}*/

$request = file_get_contents('php://input');
$input = json_decode($request, true);
// Informacion clave para responder el mensaje
$app_id = $input['app_id'];
$user_id = $input['actor']['actor_id'];
$message = $input['data']['message']['properties']['text']['content'];
$channel_id = $input['channel_id'];
$conversation_id = $input['conversation_id'];
$message_type = 'normal';
$status = 'new';
// Informacion del agente
$actor_type = 'agent';
$actor_id = getenv('ACTOR_ID');

?>