<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// Check if the API is activated
$api->isActive();

// Check user token
$user_id = $api->checkAccess($user->checkApiKey($_REQUEST['api_key']), @$_REQUEST['id']);
$username = $user->getUsername($user_id);

//get some request vars
$workername = $_REQUEST['workername'];
$hashrate = $_REQUEST['hashrate'];

$worker = new Worker();
$worker->setWorkerHashRate($workername,$hashrate);

// Output JSON
echo $api->get_json('ok');

// Supress master template
$supress_master = 1;
?>
