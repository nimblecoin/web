
    <!-- BEGIN MINI-PROFILE -->
    <div class="page-sidebar-wrapper" id="main-menu-wrapper">
      {if $GLOBAL.userdata.username|default}
      <div class="user-info-wrapper">
        <div class="user-info">
          <div class="username">{$smarty.session.USERDATA.username|escape}</div>
          <div id="balance">
            &#272; <span id="b-confirmed" class="confirmed">{$GLOBAL.userdata.balance.confirmed|number_format:"4"}</span>
      			{if $GLOBAL.userdata.balance.unconfirmed > 1}
      			<span id="b-unconfirmed" class="unconfirmed">(+{$GLOBAL.userdata.balance.unconfirmed|number_format:"4"})</span>
            {/if}
          </div>
        </div>
      </div>
      {/if}
      <!-- END MINI-PROFILE -->

    <!-- BEGIN SIDEBAR MENU -->
 	<p class="menu-title">CONTROL PANEL</p>
     <ul>
       <li class="{if $smarty.request.page == 'news'}active{/if}"> <a href="/news"> <i class="icon-custom-home"></i> <span class="title">News</span></a> </li>
      {if !$smarty.session.AUTHENTICATED}
        <li class="{if $smarty.request.page == 'gettingstarted'}active{/if}"> <a href="/gettingstarted"> <i class="fa fa-info-circle"></i> <span class="title">Getting Started</span></a></li>
        <li class="{if $smarty.request.page == 'register'}active{/if}"> <a href="/register"> <i class="fa fa-plus"></i> <span class="title">Create Account</span></a></li>
        <li class="{if $smarty.request.page == 'login'}active{/if}"> <a href="/login"> <i class="fa fa-user"></i> <span class="title">Login</span></a></li>
      {/if}


       {if $smarty.session.AUTHENTICATED|default:"0" == 1}
       <li class="{if $smarty.request.page == 'dashboard'}active{/if}"> <a href="/dashboard"> <i class="fa fa-tachometer"></i> <span class="title">Dashboard</span></a></li>
       {/if}


       {if $smarty.session.AUTHENTICATED|default:"0" == 1}
        <li class="{if $smarty.request.page == 'account'}active{/if}"><a href="javascript:;"><i class="fa fa-rocket"></i> <span class="title">My Account</span>
          {if ($GLOBAL.userdata.shares.valid < 1) || (!$GLOBAL.userdata.coin_address)}
          <span class="label label-important pull-right">SETUP</span>
          {/if}
          {if ($GLOBAL.userdata.shares.valid > 1)}
          <span class="arrow"></span>
          {/if}
          </a>
        <ul class="sub-menu">
          <li class="{if $smarty.request.action == 'workers'}active{/if}">
            <a href="/account/workers">Workers {if $GLOBAL.userdata.shares.valid < 1}
            <span class="label label-important pull-right m-r-30">!</span>
            {/if}</a>
          </li>
          <li class="{if $smarty.request.action == 'transactions'}active{/if}"><a href="/account/transactions">Transactions</a></li>
          {if !$GLOBAL.config.disable_notifications}<li class="{if $smarty.request.action == 'notifications'}active{/if}"><a href="/account/notifications">Notifications</a></li>{/if}
        {if !$GLOBAL.config.disable_invitations}<li class="icon-plus"><a href="/account/invitations">Invitations</a></li>{/if}
          <li class="{if $smarty.request.action == 'edit'}active{/if}"><a href="/account/edit">Settings {if !$GLOBAL.userdata.coin_address}
          <span class="label label-important pull-right m-r-30">!</span>
          {/if}</a></li>
          <li><a href="/logout">Logout</a></li>
        </ul>
        </li>
        {/if}

         {if $smarty.session.AUTHENTICATED|default:"0" == 1 && $GLOBAL.userdata.is_admin == 1}
           <li class="{if $smarty.request.page == 'admin'}active{/if}"><a href="javascript:;"><i class="fa fa-cogs"></i> <span class="title">Admin</span> <span class="arrow"></span></a>
           <ul class="sub-menu">
             <li class="icon-gauge"><a href="/admin/dashboard">Dashboard</a></li>
             <li class="icon-bell"><a href="/admin/monitoring">Monitoring</a></li>
             <li class="icon-torso"><a href="/admin/user">User Info</a></li>
             <li class="icon-money"><a href="/admin/wallet">Wallet Info</a></li>
             <li class="icon-exchange"><a href="/admin/transactions">Transactions</a></li>
             <li class="icon-cog"><a href="/admin/settings">Settings</a></li>
             <li class="icon-doc"><a href="/admin/news">News</a></li>
             <li class="icon-chart"><a href="/admin/reports">Reports</a></li>
             <li class="icon-photo"><a href="/admin/poolworkers">Pool Workers</a></li>
             <li class="icon-pencil"><a href="/admin/templates">Templates</a></li>
           </ul>
           </li>
           {/if}
       </ul>

        <p class="menu-title">Stats</p>
        <ul>
          <li class="{if $smarty.request.action == 'pool'}active{/if}"> <a href="/statistics/pool"> <i class="fa fa-bar-chart-o"></i> <span class="title">Pool</span></a></li>
          <li class="{if $smarty.request.action == 'blocks'}active{/if}"> <a href="/statistics/blocks"> <i class="fa fa-square-o"></i> <span class="title">Blocks</span></a></li>
          <li class="{if $smarty.request.action == 'donors'}active{/if}"> <a href="/about/donors"> <i class="fa fa-hdd-o"></i> <span class="title">Donors</span>  <span class="label label-info pull-right">NEW</span></a></li>
          <li class="{if $smarty.request.action == 'uptime'}active{/if}"> <a href="/statistics/uptime"> <i class="fa fa-hdd-o"></i> <span class="title">Server</span></a></li>
        </ul>
        <p class="menu-title">Community</p>
        <ul>
         <li class="{if $smarty.request.action == 'chat'}active{/if}"> <a href="/about/chat"> <i class="fa fa-comments"></i> <span class="title">Web Chat</span></a></li>
        <li> <a href="https://pay.reddit.com/r/nimblecoin"> <i class="fa fa-arrow-up"></i> <span class="title">/r/nimblecoin</span></a></li>
         <li><a href="javascript:;"><i class="fa fa-heart"></i> <span class="title">Help</span> <span class="arrow"></span></a>
          <ul class="sub-menu">
            <li class="icon-desktop"><a href="/gettingstarted">Getting Started</a></li>
            <li class="icon-mail"><a href="https://github.com/nimblecoin/server/issues">Report Issue</a></li>
            <li class="icon-doc"><a href="http://docs.nimblecoin.us:3000/api">API Documentation</a></li>
            <li class="icon-doc"><a href="/tac">Terms and Conditions</a></li>
          </ul>
         </li>
       </ul>
  <div class="clearfix"></div>

