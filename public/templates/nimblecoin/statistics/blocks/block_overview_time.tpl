<div class="row">
<div class="col-md-12">
  <div class="row tiles white m-b-20 tiles-container">
    <div class="col-md-12 p-t-20 p-b-20">
      <div class="col-md-6 col-sm-6">
        <div class="row p-b-10">
          <div class="col-md-6 col-sm-6">
            <p class="bold small-text">&nbsp;</p>
            <h3 class="">Last 24 Hours</h3>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="bold small-text">BLOCKS</p>
            <h3  class="bold text-success">{$LASTBLOCKSBYTIME.24HourTotal}</h3>
          </div>
        </div>
        <div class="row m-t-10 hidden-xs">
          <div class="col-md-6 col-sm-6">
            <p class="bold text-grey">Last 7 Days</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{$LASTBLOCKSBYTIME.7DaysTotal}</p>
          </div>
        </div>
        <div class="row m-t-10 hidden-xs">
          <div class="col-md-6 col-sm-6">
            <p class="bold text-grey">Last Month</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{$LASTBLOCKSBYTIME.4WeeksTotal}</p>
          </div>
        </div>
        <div class="row m-t-10 hidden-xs">
          <div class="col-md-6 col-sm-6">
            <p class="bold text-grey">All-Time</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{$LASTBLOCKSBYTIME.12MonthTotal}</p>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-sm-6">
        <div class="row p-b-10">
          <div class="col-md-6 col-sm-6">
            <p class="bold small-text">AVG REWARD</p>
            <h3  class="bold text-success">{($LASTBLOCKSBYTIME.24HourAmount / $LASTBLOCKSBYTIME.24HourTotal)|number_format:"0"}</h3>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="bold small-text">LUCK</p>
            <h3  class="bold text-black">
              {if $LASTBLOCKSBYTIME.24HourEstimatedShares > 0}
                <font color="{if (($LASTBLOCKSBYTIME.24HourShares / $LASTBLOCKSBYTIME.24HourEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.24HourShares / $LASTBLOCKSBYTIME.24HourEstimatedShares * 100)|number_format:"2"}</font></b>
              {else}
                0.00
              {/if}
            </h3>
          </div>
        </div>
        <div class="row m-t-15 hidden-xs">
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{($LASTBLOCKSBYTIME.7DaysAmount / $LASTBLOCKSBYTIME.7DaysTotal)|number_format:"0"}</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">
              {if $LASTBLOCKSBYTIME.7DaysEstimatedShares > 0}
                <font color="{if (($LASTBLOCKSBYTIME.7DaysShares / $LASTBLOCKSBYTIME.7DaysEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.7DaysShares / $LASTBLOCKSBYTIME.7DaysEstimatedShares * 100)|number_format:"2"}</font></b>
              {else}
                0.00
              {/if}
            </p>
          </div>
        </div>
        <div class="row m-t-10 hidden-xs">
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{($LASTBLOCKSBYTIME.4WeeksAmount / $LASTBLOCKSBYTIME.4WeeksTotal)|number_format:"0"}</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">
              {if $LASTBLOCKSBYTIME.4WeeksEstimatedShares > 0}
                <font color="{if (($LASTBLOCKSBYTIME.4WeeksShares / $LASTBLOCKSBYTIME.4WeeksEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.4WeeksShares / $LASTBLOCKSBYTIME.4WeeksEstimatedShares * 100)|number_format:"2"}</font></b>
              {else}
                0.00
              {/if}
            </p>
          </div>
        </div>
        <div class="row m-t-10 hidden-xs">  
          <div class="col-md-6 col-sm-6">
            <p class="text-black">{($LASTBLOCKSBYTIME.12MonthAmount / $LASTBLOCKSBYTIME.12MonthTotal)|number_format:"0"}</p>
          </div>
          <div class="col-md-6 col-sm-6">
            <p class="text-black">
              {if $LASTBLOCKSBYTIME.7DaysEstimatedShares > 0}
                <font color="{if (($LASTBLOCKSBYTIME.12MonthShares / $LASTBLOCKSBYTIME.12MonthEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.12MonthShares / $LASTBLOCKSBYTIME.12MonthEstimatedShares * 100)|number_format:"2"}</font></b>
              {else}
                0.00
              {/if}
            </p>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
</div>


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           