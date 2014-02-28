<form action="{$smarty.server.SCRIPT_NAME}" method="post">
  <input type="hidden" name="page" value="{$smarty.request.page|escape}"/>
  {if $smarty.request.token|default:""}
  <input type="hidden" name="token" value="{$smarty.request.token|escape}"/>
  {/if}
  <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}"/>
  <input type="hidden" name="action" value="register"/>
  
  <div class="row">
  <div class="col-md-6">
    <div class="grid simple">
      <div class="grid-title no-border">
        <h4>Create a <span class="semi-bold">New Account</span></h4>
      </div>
      <div class="grid-body no-border">
        <div class="form-group">
          <div class="input-group">
				    <span class="input-group-addon primary">
				      <span class="arrow"></span>
				  	  <i class="fa fa-users"></i>
				    </span>
				    <input type="text" class="form-control" name="username" value="{$smarty.post.username|escape|default:""}" size="15" maxlength="20" placeholder="Username" required>
				  </div>
				</div>
				
				<div class="form-group">
          <div class="input-group">
				    <span class="input-group-addon primary">
				      <span class="arrow"></span>
				  	  <i class="fa fa-envelope"></i>
				    </span>
				    <input type="text" name="email1" class="form-control" value="{$smarty.post.email1|escape|default:""}" size="15" placeholder="E-mail" required>
				  </div>
				</div>
				
				
				<div class="form-group">
          <div class="input-group">
				    <span class="input-group-addon primary">
				      <span class="arrow"></span>
				  	  <i class="fa fa-envelope"></i>
				    </span>
				    <input type="text" name="email2" class="form-control" value="{$smarty.post.email2|escape|default:""}" size="15" placeholder="Repeat E-mail" required>
				  </div>
				</div>
				
				<div class="row">
				<div class="col-md-6">
				
				<div class="form-group">
          <div class="input-group">
				    <span class="input-append">
				      <input type="password" class="form-control" name="password1" value="" size="15" maxlength="100" id="pw_field" placeholder="Password" required>
				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
				    </span>
				  </div>
				</div>
				
				
				
				<div class="form-group">
          <div class="input-group">
				    <span class="input-append">
				      <input type="password" class="form-control" name="password2" value="" size="15" maxlength="100" id="pw_field2" placeholder="Repeat Password" required>
				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
				    </span>
				  </div>
				</div>
				
				</div>
				
				<div class="col-md-6">
				  <div class="form-group">
            <div class="input-group">
  				    <span class="input-append">
  				      <input type="password" class="text pin" name="pin" value="" size="4" maxlength="4" placeholder="Pin">
  				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
  				    </span>
  				  </div>
  				  <div class="help">Choose a 4 digit pin</div>
  				</div>
				</div>
				
				</div>
				
        	<div class="checkbox check-success">
  				  <input class="checkbox-circle" type="checkbox" value="1" name="tac" id="tac">
            <label for="tac">Accept Terms and Conditions</label>
          </div>

        <div class="form-actions">  
          <div class="pull-right">
            <input type="submit" value="Register" class="btn btn-success btn-cons-md">
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>

</form>
