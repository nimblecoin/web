<div class="row-fluid">
  <div class="">
    <div class="grid simple">
      <div class="grid-title no-border">
        <h4>Recent <strong>Blocks</strong></h4>
      </div>
      <div class="grid-body no-border">
        <div id="blocks-graph"></div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {	
  Morris.Bar({
	  element: 'blocks-graph',
	  data: [
    {foreach $BLOCKSFOUND|@array_reverse as $block}
    { x: {$block.height}, a: {$block.amount} },
    {/foreach}
	  ],
	  xkey: 'x',
	  ykeys: ['a'],
	  labels: ['Reward'],
	  barColors:['#0090d9'],
	  grid:true,
	  parseTime:false,
	  preUnits: "Đ ",
	  hideHover:'auto',
	  goals: [250000],
	  goalLineColors: ['#0AA699'],
	});
});
</script>

<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
    <thead>
      <tr>
        <th align="center">Time</th>
        <th align="center">Block</th>
        <th align="center">Status</th>
        <th>Finder</th>
        <th align="right">Difficulty</th>
        <th align="right">Amount</th>
        <th align="right">Est. Shares</th>
        <th align="right">Shares</th>
        <th align="right">Luck</th>
      </tr>
    </thead>
    <tbody>
{assign var=count value=0}
{assign var=totalexpectedshares value=0}
{assign var=totalshares value=0}
{assign var=pplnsshares value=0}
{section block $BLOCKSFOUND}
      {assign var="totalshares" value=$totalshares+$BLOCKSFOUND[block].shares}
      {assign var="count" value=$count+1}
      {if $GLOBAL.config.payout_system == 'pplns'}{assign var="pplnsshares" value=$pplnsshares+$BLOCKSFOUND[block].pplns_shares}{/if}
      <tr class="{cycle values="odd,even"}">
        <td align="center">{$BLOCKSFOUND[block].time|date_format:"%b %e %l:%M %p"}</td>
{if ! $GLOBAL.website.blockexplorer.disabled}
        <td><span class="label label-success"><a href="{$smarty.server.SCRIPT_NAME}?page=statistics&action=round&height={$BLOCKSFOUND[block].height}">{$BLOCKSFOUND[block].height}</a></span></td>
{else}
        <td align="center">{$BLOCKSFOUND[block].height}</td>
{/if}
        <td align="center">
{if $BLOCKSFOUND[block].confirmations >= $GLOBAL.confirmations}
          <span class="label label-info confirmed">Confirmed</span>
{else if $BLOCKSFOUND[block].confirmations == -1}
          <span class="label orphan">Orphaned</span>
{else}
          <span class="unconfirmed">{$GLOBAL.confirmations - $BLOCKSFOUND[block].confirmations} left</span>
{/if}
        </td>
        <td>{if $BLOCKSFOUND[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSFOUND[block].finder|default:"unknown"|escape}{/if}</td>
        <td align="right">{$BLOCKSFOUND[block].difficulty|number_format:"0"}</td>
        <td align="right">{$BLOCKSFOUND[block].amount|number_format:"0"}</td>
        <td align="right">
{assign var="totalexpectedshares" value=$totalexpectedshares+$BLOCKSFOUND[block].estshares}
          {$BLOCKSFOUND[block].estshares|number_format}
        </td>
        <td align="right">{$BLOCKSFOUND[block].shares|number_format}</td>
        <td align="right" style="padding-right: 25px;">
{math assign="percentage" equation="shares / estshares * 100" shares=$BLOCKSFOUND[block].shares|default:"0" estshares=$BLOCKSFOUND[block].estshares}
          <font color="{if ($percentage <= 100)}green{else}red{/if}">{$percentage|number_format:"2"}</font>
        </td>
      </tr>
{/section}
    <tr>
      <td colspan="6" align="right"><b>Totals</b></td>
      <td align="right">{$totalexpectedshares|number_format}</td>
      <td align="right">{$totalshares|number_format}</td>
      <td align="right" style="padding-right: 25px;">{if $count > 0}<font color="{if (($totalshares / $totalexpectedshares * 100) <= 100)}green{else}red{/if}">{($totalshares / $totalexpectedshares * 100)|number_format:"2"}</font>{else}0{/if}</td>
    </tr>
    </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>