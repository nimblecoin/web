<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;



if (!$smarty->isCached('master.tpl', $smarty_cache_key)) {
  $debug->append('No cached version available, fetching from backend', 3);
  if ($user->isAuthenticated()) {
    $aHourlyHashRates = $statistics->getHourlyHashrateByAccount($_SESSION['USERDATA']['username'], $_SESSION['USERDATA']['id']);
  }
  $smarty->assign("YOURHASHRATES", @$aHourlyHashRates);
} else {
  $debug->append('Using cached page', 3);
}

if ($user->isAuthenticated()) {
  $iLimit = 20;
  empty($_REQUEST['start']) ? $start = 0 : $start = $_REQUEST['start'];
  $filter = array("type" => "Credit");
  $aTransactions = $transaction->getTransactions($start, $filter, $iLimit, $_SESSION['USERDATA']['id']);
  $aTransactionTypes = $transaction->getTypes();
  
  for ($i=0; $i < count($aTransactions); $i++) {
    $aBlock = $block->getBlock($aTransactions[$i]['height']);
    $aTransactions[$i]['blockvalue'] = $aBlock['amount'];
  }
  
  if (!$setting->getValue('disable_transactionsummary')) {
    $aTransactionSummary = $transaction->getTransactionSummary($_SESSION['USERDATA']['id']);
    $smarty->assign('SUMMARY', $aTransactionSummary);
  }
  
  $smarty->assign('LIMIT', $iLimit);
  $smarty->assign('TRANSACTIONS', $aTransactions);
  $smarty->assign('TRANSACTIONTYPES', $aTransactionTypes);
  $smarty->assign('TXSTATUS', array('' => '', 'Confirmed' => 'Confirmed', 'Unconfirmed' => 'Unconfirmed', 'Orphan' => 'Orphan'));
  $smarty->assign('DISABLE_TRANSACTIONSUMMARY', $setting->getValue('disable_transactionsummary'));
}

// Estimated time to find the next block
$iCurrentPoolHashrate =  $statistics->getCurrentHashrate();

// Time in seconds, not hours, using modifier in smarty to translate
$iCurrentPoolHashrate > 0 ? $iEstTime = $dDifficulty * pow(2,32) / ($iCurrentPoolHashrate * 1000) : $iEstTime = 0;

$smarty->assign("ESTTIME", $iEstTime);

if ($user->isAuthenticated()) {
  if (! $interval = $setting->getValue('statistics_ajax_data_interval')) $interval = 300;
  // Defaults to get rid of PHP Notice warnings
  $dNetworkHashrate = 0;
  $dDifficulty = 1;
  $aRoundShares = 1;

  $aRoundShares = $statistics->getRoundShares();
  $dDifficulty = 1;
  $dNetworkHashrate = 1;
  $iBlock = 0;
  if ($bitcoin->can_connect() === true) {
    $dDifficulty = $bitcoin->getdifficulty();
    $dNetworkHashrate = $bitcoin->getnetworkhashps();
    $iBlock = $bitcoin->getblockcount();
  }

  // Fetch some data
  // Round progress
  $iEstShares = $statistics->getEstimatedShares($dDifficulty);
  if ($iEstShares > 0 && $aRoundShares['valid'] > 0) {
    $dEstPercent = round(100 / $iEstShares * $aRoundShares['valid'], 2);
  } else {
    $dEstPercent = 0;
  }
  //if (!$iCurrentActiveWorkers = $worker->getCountAllActiveWorkers()) $iCurrentActiveWorkers = 0;
  $iCurrentPoolHashrate =  $statistics->getCurrentHashrate();

  // Avoid confusion, ensure our nethash isn't higher than poolhash
  if ($iCurrentPoolHashrate > $dNetworkHashrate) $dNetworkHashrate = $iCurrentPoolHashrate;
  
  $iCurrentPoolHashrate > 0 ? $iEstTime = $dDifficulty * pow(2,32) / ($iCurrentPoolHashrate * 1000) : $iEstTime = 0;

  //$dExpectedTimePerBlock = $statistics->getNetworkExpectedTimePerBlock();
  $dExpectedTimePerBlock = 60;
  $dEstNextDifficulty = $statistics->getExpectedNextDifficulty();
  $iBlocksUntilDiffChange = $statistics->getBlocksUntilDiffChange();
  
  // Grab the last 1 blocks found as a quick overview
  $iLimit = 1;
  $aBlocksFoundData = $statistics->getBlocksFound($iLimit);
  count($aBlocksFoundData) > 0 ? $aBlockData = $aBlocksFoundData[0] : $aBlockData = array();
  
  // Time since last block
  if (!empty($aBlockData)) {
    $dTimeSinceLast = (time() - $aBlockData['time']);
    if ($dTimeSinceLast < 0) $dTimeSinceLast = 0;
  } else {
    $dTimeSinceLast = 0;
  }

  // Make it available in Smarty
  $smarty->assign("ESTTIME", $iEstTime);
  $smarty->assign("TIMESINCELAST", $dTimeSinceLast);
  $smarty->assign('ESTIMATES', array('shares' => $iEstShares, 'percent' => $dEstPercent));
  $smarty->assign('NETWORK', array('difficulty' => $dDifficulty, 'block' => $iBlock, 'EstNextDifficulty' => $dEstNextDifficulty, 'EstTimePerBlock' => $dExpectedTimePerBlock, 'BlocksUntilDiffChange' => $iBlocksUntilDiffChange));
  $smarty->assign('CONTENT', 'default.tpl');
}

?>
