<?php
$defflip = (!cfip()) ? exit(header('HTTP/1.1 401 Unauthorized')) : 1;

// ACL check
switch($setting->getValue('acl_donors_page', 1)) {
case '0':
  if ($user->isAuthenticated()) {
    $aDonors = $transaction->getDonationsThisMonth();
    $smarty->assign("DONORS", $aDonors);
    $smarty->assign("CONTENT", "default.tpl");
  }
  break;
case '1':
  $aDonors = $transaction->getDonationsThisMonth();
  foreach ($aDonors as $donor) {
    $total += $donor['donation'];
    $totalPct += $donor['donate_percent'];
  }
  
  $avgPct = $totalPct / count($aDonors);
  
  $smarty->assign("TOTAL", $total);
  $smarty->assign("AVGPCT", $avgPct);
  $smarty->assign("DONORS", $aDonors);
  $smarty->assign("CONTENT", "default.tpl");
  break;
case '2':
  $_SESSION['POPUP'][] = array('CONTENT' => 'Page currently disabled. Please try again later.', 'TYPE' => 'errormsg');
  $smarty->assign("CONTENT", "disabled.tpl");
  break;
}
