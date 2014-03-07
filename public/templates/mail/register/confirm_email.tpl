<html>
<body>
<p>Hi {nocache}{$DATA.username}{/nocache},</p>
<p>Thanks for creating an account on Nimblecoin! In order to complete the registration process please follow this link:</p>
<p><a href="https://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=account&action=confirm&token={nocache}{$DATA.token}{/nocache}">https://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=account&action=confirm&token={nocache}{$DATA.token}{/nocache}</a></p>
<p>&lt;3 {$WEBSITENAME}</p>
</body>
</html>
