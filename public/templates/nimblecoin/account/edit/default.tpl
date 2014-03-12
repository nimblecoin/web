{if !$GLOBAL.userdata.coin_address}
    <div class="well">Hey you! You should probably set your <strong>Payment Address</strong>.</div>
{/if}

<div class="tiles col-md-12 white col-sm-12 no-padding">
  <div class="tiles-chart">
    <ul class="nav nav-tabs p-t-10 p-l-10" id="dash-tab">
      <li class="active"><a href="#Account-Details">Account Details</a></li>
      <li class=""><a href="#Withdraw">Manual Withdrawal</a></li>
      <li class=""><a href="#Security">Security</a></li>
    </ul>
    <div class="tab-content">
      <div class="active tab-pane" id="Account-Details">
        
        <form action="{$smarty.server.SCRIPT_NAME}" method="post">
          <input type="hidden" name="page" value="{$smarty.request.page|escape}">
          <input type="hidden" name="action" value="{$smarty.request.action|escape}">
          <input type="hidden" name="do" value="updateAccount">
          
          <div class="col-md-6">
          
          <div class="row">
          <div class="col-md-6">
          <div class="form-group">
            <label class="form-label">Username</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-users"></i>
  				    </span>
  				    <input type="text" class="form-control" placeholder="Username" value="{$GLOBAL.userdata.username|escape}" disabled/>
  				  </div>
  				</div>
  				</div>
  				
  				<div class="col-md-6">
  				<div class="form-group">
            <label class="form-label">ID</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-users"></i>
  				    </span>
  				    <input type="text" class="form-control" value="{$GLOBAL.userdata.id}" disabled/>
  				  </div>
  				</div>
  				</div>
  				
  				</div>
  				
  				<div class="form-group">
            <label class="form-label">Email</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-envelope"></i>
  				    </span>
  				    {nocache}<input type="text" class="form-control" name="email" value="{$GLOBAL.userdata.email|escape}" size="20" {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details && !$DETAILSUNLOCKED}disabled{/if}/>{/nocache}
  				  </div>
  				</div>
  				
  				<div class="form-group">
            <label class="form-label">API-Key</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-key"></i>
  				    </span>
  				    {nocache}<input type="text" class="form-control" name="api-key" value="{$GLOBAL.userdata.api_key}" disabled/>{/nocache}
  				  </div>
  				</div>
  				
  				<div class="form-group">
            <div class="checkbox check-default">
              <input type="hidden" name="is_anonymous" value="0" />
  				    {nocache}<input type="checkbox" name="is_anonymous" value="1" id="is_anonymous" {if $GLOBAL.userdata.is_anonymous}checked{/if} {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details && !$DETAILSUNLOCKED}disabled{/if}/>{/nocache}
  				    <label for="is_anonymous" class="form-label">Hide my stats from other users</label>
  				  </div>
  				</div>
  				
  				</div>
  				
  				<div class="col-md-6">
  				  
  				  <div class="form-group">
              <label class="form-label">Payment Address</label>
              <span class="help">Your Doge Wallet Address (No Exchanges)</span>
              <div class="input-group">
    				    <span class="input-group-addon primary">
    				      <span class="arrow"></span>
    				  	  <i class="fa fa-credit-card"></i>
    				    </span>
    				    {nocache}<input type="text" class="form-control" name="paymentAddress" value="{$smarty.request.paymentAddress|default:$GLOBAL.userdata.coin_address|escape}" size="40"  {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details && !$DETAILSUNLOCKED}disabled{/if}/>{/nocache}
    				  </div>
    				</div>
    				
    				<div class="form-group">
              <label class="form-label">Automatic Payout Threshold</label>
              <span class="help">Recommended: 500-5000</span>
              <div class="input-group">
    				    <span class="input-group-addon primary">
    				      <span class="arrow"></span>
    				  	  <i class="fa fa-money"></i>
    				    </span>
    				    <input type="text" class="form-control" name="payoutThreshold" value="{nocache}{$smarty.request.payoutThreshold|default:$GLOBAL.userdata.ap_threshold|escape}{/nocache}" size="{$GLOBAL.config.ap_threshold.max|strlen}" maxlength="{$GLOBAL.config.ap_threshold.max|strlen}" {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details && !$DETAILSUNLOCKED}disabled{/if}/>
    				  </div>
    				</div>
    				
    				<div class="form-group">
              <label class="form-label">Donation Percentage</label>
              <span class="help">1% helps a lot!</span>
              <div class="input-group">
    				    <span class="input-group-addon primary">
    				      <span class="arrow"></span>
    				  	  <i class="fa fa-star"></i>
    				    </span>
    				    {nocache}<input type="text" class="form-control" name="donatePercent" value="{$smarty.request.donatePercent|default:$GLOBAL.userdata.donate_percent|escape|number_format:"1"}" size="4" {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details && !$DETAILSUNLOCKED}disabled{/if}/>{/nocache}
    				  </div>
    				</div>
    				
    				<div class="form-group">
              <label class="form-label">Timezone</label>
              <span class="help">Select the closest city</span>
              <div class="input-group">
    				    <select name="timezone">
    				      {SECTION tzname $TIMEZONES}
    				        <option value="{$TIMEZONES[tzname]}" {if $GLOBAL.userdata.timezone == $TIMEZONES[tzname]}selected{/if}>{$TIMEZONES[tzname]}</option>
    				      {/SECTION}
    				    </select>
    				  </div>
    				</div>
  				
  				</div>
  				<div class="clearfix"></div>
  				<div class="row-fluid">
  				<div class="form-actions">
  				    <div class="pull-left m-r-50">
                <div class="input-append">
      				    <input type="password" class="form-control" name="authPin" size="4" maxlength="4" placeholder="Pin" required/>
      				    <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
      				  </div>
      				</div>
              {nocache}
                <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
                <input type="hidden" name="ea_token" value="{$smarty.request.ea_token|escape|default:""}">
                <input type="hidden" name="utype" value="account_edit">
                {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.details}
                  {if $DETAILSSENT == 1 && $DETAILSUNLOCKED == 1}
                  	<input type="submit" value="Update Account" class="btn btn-primary btn-cons-md">
                  {elseif $DETAILSSENT == 0 && $DETAILSUNLOCKED == 1 || $DETAILSSENT == 1 && $DETAILSUNLOCKED == 0}
                    <input type="submit" value="Update Account" class="btn btn-primary btn-cons-md" disabled>
                  {elseif $DETAILSSENT == 0 && $DETAILSUNLOCKED == 0}
                    <input type="submit" value="Unlock to Edit" class="btn btn-primary btn-cons-md" name="unlock">
                  {/if}
                {else}
                  <input type="submit" value="Update Account" class="btn btn-primary btn-cons-md">
                {/if}
              {/nocache}
  				</div>
  				</div>
        </form>
        
        
      </div>
      <div class="tab-pane" id="Withdraw">
        {if !$GLOBAL.config.disable_payouts && !$GLOBAL.config.disable_manual_payouts}
        <form action="{$smarty.server.SCRIPT_NAME}" method="post">
          <input type="hidden" name="page" value="{$smarty.request.page|escape}">
          <input type="hidden" name="action" value="{$smarty.request.action|escape}">
          <input type="hidden" name="do" value="cashOut">
          
          <div class="col-md-6">
          
          <div class="form-group">
            <label class="form-label">Account Balance</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-money"></i>
  				    </span>
  				    {nocache}<input type="text" class="form-control" value="{$GLOBAL.userdata.balance.confirmed|escape}" {$GLOBAL.config.currency} disabled />{/nocache}
  				  </div>
  				</div>
  				
  				<div class="form-group">
            <label class="form-label">Payout to</label>
            <div class="input-group">
  				    <span class="input-group-addon primary">
  				      <span class="arrow"></span>
  				  	  <i class="fa fa-credit-card"></i>
  				    </span>
  				    {nocache}<input type="text" class="form-control" value="{$GLOBAL.userdata.coin_address|escape}" disabled />{/nocache}
  				  </div>
  				</div>
  				
  				</div>
  				
          <div class="clearfix"></div>
  				<div class="row-fluid">
  				<div class="form-actions">
  				    <div class="pull-left m-r-50">
                <div class="input-append">
      				    <input type="password" class="form-control" name="authPin" size="4" maxlength="4" placeholder="Pin" required/>
      				    <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
      				  </div>
      				</div>
              {nocache}
                <input type="hidden" name="wf_token" value="{$smarty.request.wf_token|escape|default:""}">
                <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
                <input type="hidden" name="utype" value="withdraw_funds">
                {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.withdraw}
                  {if $WITHDRAWSENT == 1 && $WITHDRAWUNLOCKED == 1}
                  	<input type="submit" value="Cash Out" class="btn btn-primary btn-cons-md">
                  {elseif $WITHDRAWSENT == 0 && $WITHDRAWUNLOCKED == 1 || $WITHDRAWSENT == 1 && $WITHDRAWUNLOCKED == 0}
                    <input type="submit" value="Cash Out" class="btn btn-primary btn-cons-md" disabled>
                  {elseif $WITHDRAWSENT == 0 && $WITHDRAWUNLOCKED == 0}
                    <input type="submit" value="Unlock to Edit" class="btn btn-primary btn-cons-md" name="unlock">
                  {/if}
                {else}
                  <input type="submit" value="Cash Out" class="btn btn-primary btn-cons-md">
                {/if}
              {/nocache}
  				</div>
  				</div>
        </form>
        {/if}
        
      
      </div>
      <div class="tab-pane" id="Security">
        
        <form action="{$smarty.server.SCRIPT_NAME}" method="post"><input type="hidden" name="act" value="updatePassword">
          <input type="hidden" name="page" value="{$smarty.request.page|escape}">
          <input type="hidden" name="action" value="{$smarty.request.action|escape}">
          <input type="hidden" name="do" value="updatePassword">
          
          <div class="col-md-6">
          <h4>Change Password</h4>
          <div class="form-group">
            <label class="form-label">Current Password</label>
            <div class="input-group">
  				    <span class="input-append">
  				      {nocache}<input type="password" name="currentPassword" {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.changepw && !$CHANGEPASSUNLOCKED}disabled{/if}/>{/nocache}
  				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
  				    </span>
  				  </div>
  				</div>
  				
  				<div class="form-group">
            <label class="form-label">New Password</label>
            <div class="input-group">
  				    <span class="input-append">
  				      {nocache}<input type="password" name="newPassword" id="pw_field"{if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.changepw && !$CHANGEPASSUNLOCKED}disabled{/if}/>{/nocache}
  				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
  				    </span>
  				  </div>
  				</div>
  				
  				<div class="form-group">
            <label class="form-label">Repeat Password</label>
            <div class="input-group">
  				    <span class="input-append">
  				      {nocache}<input type="password" name="newPassword2" id="pw_field2"{if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.changepw && !$CHANGEPASSUNLOCKED}disabled{/if}/>{/nocache}
  				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
  				    </span>
  				  </div>
  				</div>
  				
  				</div>
  				
  				<div class="clearfix"></div>
  				<div class="row-fluid">
  				<div class="form-actions">
  				    <div class="pull-left m-r-50">
                <div class="input-append">
      				    <input type="password" class="form-control" name="authPin" size="4" maxlength="4" placeholder="Pin" required/>
      				    <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
      				  </div>
      				</div>
              {nocache}
                <input type="hidden" name="cp_token" value="{$smarty.request.cp_token|escape|default:""}">
                <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
                <input type="hidden" name="utype" value="change_pw">
                {if $GLOBAL.twofactor.enabled && $GLOBAL.twofactor.options.changepw}
                  {if $CHANGEPASSSENT == 1 && $CHANGEPASSUNLOCKED == 1}
                  	<input type="submit" value="Change Password" class="btn btn-primary btn-cons-md">
                  {elseif $CHANGEPASSSENT == 0 && $CHANGEPASSUNLOCKED == 1 || $CHANGEPASSSENT == 1 && $CHANGEPASSUNLOCKED == 0}
                    <input type="submit" value="Change Password" class="btn btn-primary btn-cons-md" disabled>
                  {elseif $CHANGEPASSSENT == 0 && $CHANGEPASSUNLOCKED == 0}
                    <input type="submit" value="Unlock to Edit" class="btn btn-primary btn-cons-md" name="unlock">
                  {/if}
                {else}
                  <input type="submit" value="Change Password" class="btn btn-primary btn-cons-md">
                {/if}
              {/nocache}
  				</div>
  				</div>
        </form>

        <form action="{$smarty.server.SCRIPT_NAME}" method="post">
          <input type="hidden" name="page" value="{$smarty.request.page|escape}">
          <input type="hidden" name="action" value="{$smarty.request.action|escape}">
          <input type="hidden" name="do" value="genPin">
          <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
          
          <div class="col-md-12">
  				  <h4>Reset Pin</h4>
  				  <div class="form-group">
              <label class="form-label">Current Password</label>
              <div class="input-group">
    				    <span class="input-append">
    				      <input type="password" class="form-control" name="currentPassword" />
    				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
    				    </span>
    				  </div>
    				      
    				</div> 
  				</div>
  				<div class="clearfix"></div>
  				<div class="row-fluid">
  				<div class="form-actions">
  				  <input type="submit" class="btn btn-primary btn-cons-md" value="Reset PIN">
  				</div>
  				</div>
        </form>
        
      </div>
    </div>
  </div>
  <div class="clearfix"></div>
</div>



