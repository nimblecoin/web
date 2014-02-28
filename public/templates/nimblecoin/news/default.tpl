<div class="row">
{section name=news loop=$NEWS} 
   
  <!-- BEGIN BLOG POST SIMPLE-->
	<div class="col-md-8 m-b-40">	
	  <div class="widget-item added-margin">
	  <div class="tiles purple" style="max-height:345px">
		<div class="tiles-body">
		  <h3 class="text-white m-t-50 m-b-30 m-r-20">{$NEWS[news].header|regex_replace:"/(<p>|<p [^>]*>|<\\/p>)/":""}</h3>
		  <div class="overlayer bottom-right fullwidth">
			<div class="overlayer-wrapper">
			  <div class=" p-l-20 p-r-20 p-b-20 p-t-20">
				<div class="clearfix"></div>
			  </div>
			</div>
		  </div>
		  <br>
		</div>
	  </div>
	  <div class="tiles white ">
		<div class="tiles-body">
		  <div class="row">
		    <div class="user-profile-pic text-left"> 
				<img width="69" height="69" data-src-retina="{$PATH}/assets/img/dogecoin-logo.png" data-src="{$PATH}/assets/img/dogecoin-logo.png" src="{$PATH}/assets/img/dogecoin-logo.png" alt=""> 
				 <div class="pull-right m-r-20 m-t-35"> <span class="bold small-text">{$NEWS[news].time|date_format:" %B %d %l:%M %p"}</span> </div>
			  </div>
			<div class="p-l-15 p-r-20">
			  {$NEWS[news].content nofilter}
			</div>
		  </div>
		</div>
	  </div>
	</div>
  <!-- END BLOG POST SIMPLE-->
   
</div>
{/section}
</div>

<div class="clearfix"></div>
