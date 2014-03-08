<html>
<body>
<p>Oh no! Your account has been locked due to too many failed password or PIN attempts. Please use the URL below to unlock your account and contact an admin if you think someone is trying to break in.</p>
<p><a href="https://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=account&action=unlock&token={nocache}{$DATA.token}{/nocache}">https://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_NAME}?page=account&action=unlock&token={nocache}{$DATA.token}{/nocache}</a></p>
<p>&lt;3 Nimblecoin</a>
</body>
</html>
