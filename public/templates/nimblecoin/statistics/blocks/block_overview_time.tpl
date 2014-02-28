<div class="page-title">
  <h3>Summary</h3>
</div>
<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
    <thead>
        <tr>
          <th align="left"></th>
          <th align="center">Found</th>
          <th align="center">Valid</th>
          <th align="center">Orphan</th>
          <th align="center">Avg Diff</th>
          <th align="center">Amount</th>
          <th align="center">Est. Shares</th>
          <th align="center">Shares</th>
          <th align="center">Luck</th>
        </tr>
    </thead>
    <tbody>
        <tr>
          <th align="left" style="padding-left: 15px">All Time</td>
          <td align="center">{$LASTBLOCKSBYTIME.Total}</td>
          <td align="center">{$LASTBLOCKSBYTIME.TotalValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.TotalOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.TotalValid > 0}
              {($LASTBLOCKSBYTIME.TotalDifficulty / $LASTBLOCKSBYTIME.TotalValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.TotalAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.TotalEstimatedShares|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.TotalShares|number_format:"0"}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.TotalEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.TotalShares / $LASTBLOCKSBYTIME.TotalEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.TotalShares / $LASTBLOCKSBYTIME.TotalEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
        <tr>
          <th align="left" style="padding-left: 15px">Last Hour</td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourTotal}</td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.1HourValid > 0}
              {($LASTBLOCKSBYTIME.1HourDifficulty / $LASTBLOCKSBYTIME.1HourValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourEstimatedShares|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.1HourShares|number_format:"0"}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.1HourEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.1HourShares / $LASTBLOCKSBYTIME.1HourEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.1HourShares / $LASTBLOCKSBYTIME.1HourEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
        <tr>
          <th align="left" style="padding-left: 15px">Last 24 Hours</td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourTotal}</td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.24HourValid > 0}
              {($LASTBLOCKSBYTIME.24HourDifficulty / $LASTBLOCKSBYTIME.24HourValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourEstimatedShares|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.24HourShares|number_format:"0"}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.24HourEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.24HourShares / $LASTBLOCKSBYTIME.24HourEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.24HourShares / $LASTBLOCKSBYTIME.24HourEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
        <tr>
          <th align="left" style="padding-left: 15px">Last 7 Days</td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysTotal}</td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.7DaysValid > 0}
              {($LASTBLOCKSBYTIME.7DaysDifficulty / $LASTBLOCKSBYTIME.7DaysValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysEstimatedShares|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.7DaysShares|number_format:"0"}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.7DaysEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.7DaysShares / $LASTBLOCKSBYTIME.7DaysEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.7DaysShares / $LASTBLOCKSBYTIME.7DaysEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
        <tr>
          <th align="left" style="padding-left: 15px">Last 4 Weeks</td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksTotal}</td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.4WeeksValid > 0}
              {($LASTBLOCKSBYTIME.4WeeksDifficulty / $LASTBLOCKSBYTIME.4WeeksValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksEstimatedShares|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.4WeeksShares|number_format:"0"}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.4WeeksEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.4WeeksShares / $LASTBLOCKSBYTIME.4WeeksEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.4WeeksShares / $LASTBLOCKSBYTIME.4WeeksEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
        <tr>
          <th align="left" style="padding-left: 15px">Last 12 Month</td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthTotal}</td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthValid}</td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthOrphan}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.12MonthValid > 0}
              {($LASTBLOCKSBYTIME.12MonthDifficulty / $LASTBLOCKSBYTIME.12MonthValid)|number_format:"0"}
            {else}
              0
            {/if}
          </td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthAmount|number_format:"0"}</td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthEstimatedShares}</td>
          <td align="center">{$LASTBLOCKSBYTIME.12MonthShares}</td>
          <td align="center">
            {if $LASTBLOCKSBYTIME.12MonthEstimatedShares > 0}
              <font color="{if (($LASTBLOCKSBYTIME.12MonthShares / $LASTBLOCKSBYTIME.12MonthEstimatedShares * 100) <= 100)}green{else}red{/if}">{($LASTBLOCKSBYTIME.12MonthShares / $LASTBLOCKSBYTIME.12MonthEstimatedShares * 100)|number_format:"2"}</font></b>
            {else}
              0.00
            {/if}
          </td>
          
        </tr>
    </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
