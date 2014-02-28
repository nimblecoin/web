
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse "> 
	  <!-- BEGIN TOP NAVIGATION BAR -->
	  <div class="navbar-inner">
		<div class="header-seperation"> 
			<ul class="nav pull-left notifcation-center" id="main-menu-toggle-wrapper" style="display:none">	
			 <li class="dropdown"> <a id="main-menu-toggle" href="#main-menu"  class="" > <div class="iconset top-menu-toggle-white"></div> </a> </li>		 
			</ul>
	      <!-- BEGIN LOGO -->	
	      <a href="/"><img src="{$PATH}/assets/img/logo.png" class="logo" alt=""  data-src="{$PATH}/assets/img/logo.png" data-src-retina="{$PATH}/assets/img/logo_2x.png" width="106" height="21"/></a>
	      <!-- END LOGO --> 
	      <ul class="nav pull-right notifcation-center">	
          <li class="dropdown" id="header_task_bar"> 
          
          </li>       
        </ul>
	      </div>
	      <!-- END RESPONSIVE MENU TOGGLER --> 
	      <div class="header-quick-nav" > 
	      <!-- BEGIN TOP NAVIGATION MENU -->
	      
		  <div class="pull-left"> 
		    <ul class="nav quick-section">
		      <li class="quicklinks"> 
		        <a href="#" class="" id="layout-condensed-toggle"><div class="iconset top-menu-toggle-dark"></div></a> 
          </li>
		      <li class="quicklinks"> <span class="h-seperate"></span></li>
		      <li class="quicklinks quick-stat"><span class="label label-info">Pool <i class="fa fa-dashboard"></i> {$GLOBAL.hashrate|number_format:"0"} {$GLOBAL.hashunits.pool}</span></li>
		      <li class="quicklinks quick-stat"><span class="label label-success">Network <i class="fa fa-cloud"></i> {$GLOBAL.nethashrate|number_format:"2"} {$GLOBAL.hashunits.network}</span></li>
	        <li class="quicklinks quick-stat"><span class="label label-inverse"><i class="fa fa-rocket"></i> {$GLOBAL.workers} Pool Workers</span></li>
	        <li class="quicklinks quick-stat"><span class="label">DOGE/BTC {$GLOBAL.price|number_format:"8"|default:"0"}</span></li>
	      </ul>
		  </div>
		 <!-- END TOP NAVIGATION MENU -->
		 
		 <!-- BEGIN CHAT TOGGLER -->
	      <div class="pull-right"> 
				{if $smarty.session.AUTHENTICATED|default:"0" == 1}
			 <ul class="nav quick-section">
				<li class="quicklinks"> 
					<a data-toggle="dropdown" class="dropdown-toggle pull-right" href="#" id="user-options">						
						<div class="iconset top-settings-dark"></div> 	
					</a>
					<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="user-options">
            <li><a href="/account/edit"><i class="fa fa-cog"></i> &nbsp;&nbsp;Settings</a></li>
            <li class="divider"></li>                
            <li><a href="/logout"><i class="fa fa-power-off"></i> &nbsp;&nbsp;Logout</a></li>
	        </ul>
				</li> 
			</ul>
			{/if}
	      </div>
		   <!-- END CHAT TOGGLER -->
		   
	      </div> 
	      <!-- END TOP NAVIGATION MENU --> 

	  </div>
	  <!-- END TOP NAVIGATION BAR --> 
	</div>
	<!-- END HEADER -->