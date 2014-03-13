<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

if ($user->isAuthenticated()) {
  $iLimit = 30;
  empty($_REQUEST['start']) ? $start = 0 : $start = $_REQUEST['start'];
  $aTransactions = $transaction->getTransactions($start, @$_REQUEST['filter'], $iLimit, $_SESSION['USERDATA']['id']);
  $aTransactionTypes = $transaction->getTypes();
  if (!$aTransactions) $_SESSION['POPUP'][] = array('CONTENT' => 'Could not find any transaction', 'TYPE' => 'errormsg');
  if (!$setting->getValue('disable_transactionsummary')) {
    $aTransactionSummary = $transaction->getTransactionSummary($_SESSION['USERDATA']['id']);
    $smarty->assign('SUMMARY', $aTransactionSummary);
    
    $aMonthlyEarnings = $transaction->getMonthlyEarnings($_SESSION['USERDATA']['id']);
    
    $i = 1;
    foreach ($aMonthlyEarnings as $key => $value) {
      $total += $aMonthlyEarnings[$key]['amount'];
      $aMonthlyEarnings[$key]['total'] = $total;
      $i++;
    }
    
    $average = $total/$i;
    
    $smarty->assign('AVERAGE', $average);
    $smarty->assign('TOTAL', $total);
    $smarty->assign('MONTHLY', $aMonthlyEarnings);
  }
  $smarty->assign('LIMIT', $iLimit);
  $smarty->assign('TRANSACTIONS', $aTransactions);
  $smarty->assign('TRANSACTIONTYPES', $aTransactionTypes);
  $smarty->assign('TXSTATUS', array('' => '', 'Confirmed' => 'Confirmed', 'Unconfirmed' => 'Unconfirmed', 'Orphan' => 'Orphan'));
  $smarty->assign('DISABLE_TRANSACTIONSUMMARY', $setting->getValue('disable_transactionsummary'));
}
$smarty->assign('CONTENT', 'default.tpl');
?>
