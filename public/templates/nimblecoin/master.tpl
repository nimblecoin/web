<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <meta charset="UTF-8"/>
  <title>{$GLOBAL.website.title} | {$smarty.request.page|escape|default:"home"|capitalize}</title>
  <!--[if IE]><script type="text/javascript" src="{$PATH}/js/excanvas.js"></script><![endif]-->
  {literal}<script>
    var zxcvbnPath = "{/literal}{$PATH}{literal}/js/zxcvbn/zxcvbn.js";
  </script>{/literal}
  {if $GLOBAL.statistics.analytics.enabled}
  {$GLOBAL.statistics.analytics.code nofilter}
  {/if}

  <script src="{$PATH}/assets/plugins/jquery-1.8.3.min.js" type="text/javascript"></script> 
  <link href="{$PATH}/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
  <link href="{$PATH}/assets/plugins/jquery-slider/css/jquery.sidr.light.css" rel="stylesheet" type="text/css" media="screen"/>
  <link rel="stylesheet" href="{$PATH}/assets/plugins/jquery-morris-chart/css/morris.css" type="text/css" media="screen">
  <!-- BEGIN CORE CSS FRAMEWORK -->
  <link href="{$PATH}/assets/plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
  <!-- END CORE CSS FRAMEWORK -->

  <!-- BEGIN CSS TEMPLATE -->
  <link href="{$PATH}/assets/css/style.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/css/magic_space.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
  <link href="{$PATH}/assets/css/custom-icon-set.css" rel="stylesheet" type="text/css"/>
  <!-- END CSS TEMPLATE -->
  
  <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
  <script type="text/javascript" src="{$PATH}/assets/plugins/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
  <script type="text/javascript" src="{$PATH}/assets/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
  <link rel="stylesheet" type="text/css" href="{$PATH}/assets/plugins/rs-plugin/css/settings.css" media="screen" />

  <meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1"/>
  <meta name="apple-mobile-web-app-capable" content="yes"/>
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
  <meta name="format-detection" content="telephone=no"/>
  <link rel="shortcut icon" href="/favicon.ico">
</head>
<body>
  {include file="global/header.tpl"}
  <!-- BEGIN CONTAINER -->
  <div class="page-container row-fluid">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar" id="main-menu">
      {include file="global/navigation.tpl"}
    </div>	
    <div class="clearfix"></div>
    <!-- END SIDEBAR MENU -->
  </div>
</div>
<div class="page-content">
  {if $PAGE == "home"}
    {if $CONTENT != "empty" && $CONTENT != ""}
      {if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}
        {include file="$PAGE/$ACTION/$CONTENT"}
      {else}
        Missing template for this page
      {/if}
    {/if}
  {else}
  <div class="content"> 
    <div class="row">
      <div class="col-md-12">
        {nocache}
        {if is_array($smarty.session.POPUP|default)}
        {section popup $smarty.session.POPUP}
        <div class="notification-messages {$smarty.session.POPUP[popup].TYPE|default:"info"}">
          <div class="description">{$smarty.session.POPUP[popup].CONTENT nofilter}</div>
        </div>	
        {/section}
        {/if}
        {/nocache}
      </div>			
    </div>
    {if $CONTENT != "empty" && $CONTENT != ""}
    {if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}
    {include file="$PAGE/$ACTION/$CONTENT"}
    {else}
    Missing template for this page
    {/if}
    {/if}
  </div>
  {/if}
  <div class="clearfix"></div>
</div>
<!-- END CONTAINER -->


<!-- BEGIN CORE JS FRAMEWORK--> 

<script src="{$PATH}/assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script> 
<script src="{$PATH}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="{$PATH}/assets/plugins/breakpoints.js" type="text/javascript"></script> 
<script src="{$PATH}/assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/waypoints.min.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/parrallax/js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/jquery-appear/jquery.appear.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/jquery-block-ui/jqueryblockui.js" type="text/javascript"></script> 
<!-- END CORE JS FRAMEWORK --> 
<!-- BEGIN PAGE LEVEL JS --> 	
<script src="{$PATH}/assets/js/messages_notifications.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/jquery-slider/jquery.sidr.min.js" type="text/javascript"></script> 	
<script src="{$PATH}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="{$PATH}/assets/plugins/pace/pace.min.js" type="text/javascript"></script>  
<script src="{$PATH}/assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
<script src="{$PATH}/assets/plugins/raphael-min.js"></script>
<script src="{$PATH}/assets/plugins/jquery-morris-chart/js/morris.min.js"></script>
<script src="{$PATH}/assets/plugins/jquery-easy-pie-chart/js/jquery.easypiechart.min.js"></script>
<!-- END PAGE LEVEL PLUGINS --> 	

<!-- BEGIN CORE TEMPLATE JS --> 
<script src="{$PATH}/assets/js/core.js" type="text/javascript"></script>
<!-- END CORE TEMPLATE JS -->
</body>

</html>
