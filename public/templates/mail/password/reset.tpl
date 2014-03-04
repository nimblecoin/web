<html>
<body>
<p>Hey {nocache}{$DATA.username}{/nocache},</p>
<p>You have requested a password reset through our online form. In order to complete the request please follow this link:</p>
<p><a href="http://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=password&action=change&token={nocache}{$DATA.token}{/nocache}">https://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=password&action=change&token={nocache}{$DATA.token}{/nocache}</a></p>
<p>You will be asked to change your password. You can then use this new password to login to your account.</p>
<p>&lt;3 {$WEBSITENAME}</p>
</body>
</html>
