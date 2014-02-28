<form action="/index.php?page=login" method="post" id="loginForm">
  <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
  <div class="row">
   <div class="col-md-6 col-sm-6">
     <div class="grid simple">
       <div class="grid-title no-border">
         <h4><span class="semi-bold">Log In</span></h4>
       </div>
       <div class="grid-body no-border">
         
         <div class="form-group">
           <div class="input-group">
 				    <span class="input-group-addon primary">
 				      <span class="arrow"></span>
 				  	  <i class="fa fa-envelope"></i>
 				    </span>
 				    <input type="email" name="username" class="form-control" size="22" maxlength="100" value="{$smarty.request.username|default:""|escape}" placeholder="E-mail" tabindex="1" required />
 				  </div>
 				</div>
 				
 				<div class="form-group">
           <div class="input-group">
 				    <span class="input-append ">
 				      <input type="password" name="password" class="form-control" maxlength="100" placeholder="Password" tabindex="2" required />
 				      <span class="add-on"><span class="arrow"></span><i class="fa fa-lock"></i> </span>
 				    </span>
 				    
 				  </div>
 				</div>
 				
 				<div class="form-actions">  
          <div class="pull-right">
            <a href="{$smarty.server.SCRIPT_NAME}?page=password"><font size="1">Forgot your password?</font></a>
            <input type="submit" value="Login" class="btn btn-success btn-cons-md" />
          </div>
        </div>
    
        </div>
      </div>
    </div>
    </div>
</form>
