{if $smarty.session.AUTHENTICATED|default}
<div class="page-title">
  <h3>Dashboard</h3>
</div>

<div class="row spacing-bottom 2col">
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles blue added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> NIMBLECOIN BALANCE </div>
        <div class="heading"> <span>{$GLOBAL.userdata.balance.confirmed|number_format:"8"}</span> </div>
      </div>
    </div>
  </div>
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> UNCONFIRMED BALANCE </div>
        <div class="heading"> <span>{$GLOBAL.userdata.balance.unconfirmed|number_format:"8"}</span> </div>
      </div>
    </div>
  </div>
  
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles green narrow-margin">
      <div class="tiles-body">
        <div class="tiles-title"> TOTAL EARNED </div>
        <div class="heading"> <span>{$SUMMARY['Credit']|number_format:"4"}</span></div>
      </div>
    </div>
  </div>
</div>


<div class="row">
<div class="col-md-12">
<div class="row tiles-container tiles white spacing-bottom">
  <div class="tile-more-content col-md-4 col-sm-4 no-padding">
    <div class="tiles purple">
      <div class="tiles-body">
        <h5 style="color:white;text-align:center;margin:0 0 15px 0"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="This is estimated based on the number of shares you submit within 5 minutes. The hashrate in your mining app is more accurate." data-placement="right"></i> Your Hashrate</h5>
        <div id="current-hashrate" class="hash-pie" data-percent="{math equation='x / y * 100' x=$GLOBAL.userdata.hashrate y=$GLOBAL.hashrate format='%.0f'}"><span class="easy-pie-percent">{$GLOBAL.userdata.hashrate} {$GLOBAL.hashunits.personal}</span></div>
        <br/><br/>
        <h5 style="color:white;text-align:center;margin:0 0 15px 0">Pool Hashrate</h5>
        <div id="pool-hashrate" class="hash-pie" data-percent="{math equation='x / y * 100' x=$GLOBAL.hashrate y=($GLOBAL.nethashrate*10000) format='%.0f'}"><span class="easy-pie-percent">{$GLOBAL.hashrate|number_format:"0"} {$GLOBAL.hashunits.personal}</span></div>
        <div class="clearfix"></div>
      </div>
      <div class="tile-footer rejected-shares">
        Mining at {$GLOBAL.fees|escape|number_format:"0"}% Pool Fee</div>
    </div>
    
  </div>
  <div class="tiles col-md-8 white col-sm-8 no-padding">
    <div class="tiles-chart">
      <ul class="nav nav-tabs p-t-10 p-l-10" id="dash-tab">
        <li class="active"><a href="#Hashrate">Hourly Hashrate</a></li>
      </ul>
      <div class="tab-content">
        <div class="active tab-pane" id="Hashrate">
          <div id="your-hashrates-graph"></div>
        </div>
        <div class="tab-pane" id="Payout">
          <div id="your-payouts-graph"></div>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
</div>


</div>


<div class="row">
  
<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body">
      <div class="tiles-title"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="When a block is found, it's added to the blockchain in sequencial order. Difficulty is an abstract number that scales as more or less people are mining Dogecoins." data-placement="right"></i> CURRENT BLOCK </div>
      <div class="heading text-black"> {$NETWORK.block}</div>
      <div class="progress  progress-small no-radius">
        <div class="progress-bar progress-bar-success animate-progress-bar" data-percentage="{$ESTIMATES.percent}%" ></div>
      </div>
      <div class="description"><span class="mini-description"><span class="text-black bold">{$NETWORK.EstNextDifficulty|number_format:"0"}</span> Difficulty </span>  </div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body blue">
      <div class="tiles-title"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="Finding a block is completely random. The number of attempts at finding a block is broken up into shares of work. If we're lucky, sometimes a block can be found less than the estimated number of shares needed." data-placement="top"></i> POOL LUCK </div>
      <div class="heading text-black ">
        {$ESTIMATES.percent}
      </div>
      <div class="progress  progress-small no-radius">
        <div class="progress-bar progress-bar-success animate-progress-bar" data-percentage="{$ESTIMATES.percent}%" ></div>
      </div>
      <div class="description"> <span class="mini-description"><span class="text-black bold">{$GLOBAL.roundshares.valid|number_format}</span> of <span class="text-black bold">{$ESTIMATES.shares|number_format}</span> estimated shares needed</span> </div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white">
    <div class="tiles-body">
      <div class="tiles-title">AVG TIME PER BLOCK </div>
      <div class="heading text-black">{$ESTTIME|seconds_to_words}</div>
      <div class="progress  progress-small no-radius">
        <div class="progress-bar progress-bar-success animate-progress-bar" data-percentage="{$TIMESINCELAST / $ESTTIME * 100}%" ></div>
      </div>
      <div class="description"><span class="mini-description"><span class="text-black bold">{$TIMESINCELAST|seconds_to_words}</span> since last block found </span>  </div>
    </div>
  </div>
</div>

</div>



<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th style="width:170px">Round Shares</th>
              <th>Valid</th>
              <th>Invalid</th>
              <th>Efficiency</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>My Shares</td>
              <td>{$GLOBAL.userdata.shares.valid|number_format} <i class="fa fa-info-circle tip" data-toggle="tooltip" title="This is the number of accepted shares of work you've submitted. You'll be paid a percentage of the block reward based on how many shares you have." data-placement="right"></i></td>
              <td>{$GLOBAL.userdata.shares.invalid|number_format} <i class="fa fa-info-circle tip" data-toggle="tooltip" title="This is the number of rejected shares you've submitted. Rejects happen if your share was stale or out of date. Don't worry if you get a few here and there." data-placement="right"></i></td>
              <td>{if $GLOBAL.userdata.shares.valid > 0}{(100 - $GLOBAL.userdata.shares.invalid / ($GLOBAL.userdata.shares.valid + $GLOBAL.userdata.shares.invalid) * 100)|number_format:"2"}%{else}0%{/if} <i class="fa fa-info-circle tip" data-toggle="tooltip" title="Your percentage of accepted vs invalid. Above 96% is good." data-placement="right"></i></td>
            </tr>
            <tr>
              <td>Pool Shares</td>
              <td>{$GLOBAL.roundshares.valid|number_format}</td>
              <td>{$GLOBAL.roundshares.invalid|number_format}</td>
              <td>{if $GLOBAL.roundshares.valid > 0}{(100 - $GLOBAL.roundshares.invalid / ($GLOBAL.roundshares.valid + $GLOBAL.roundshares.invalid) * 100)|number_format:"2"}%{else}100%{/if}</td>
            </tr>
            <tr>
              <td>PPLNS Target</td>
              <td colspan="3">{$GLOBAL.pplns.target|number_format}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>



<div class="page-title">
  <h3>Payouts</h3>
</div>

<!-- Removed until we can make this more accurate
<div class="row">
  
<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body">
      <div class="tiles-title"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="Estimated based on an average 250,000 block reward, network difficulty, and current hashrate. May flucuate." data-placement="right"></i> 1-DAY ESTIMATE </div>
      <div class="heading text-black">{((24 / (((($NETWORK.EstNextDifficulty) * pow(2,32) ) / (($GLOBAL.userdata.hashrate) * pow(10,3) )) / 3600)) * 250000)|number_format:"8"}</div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body blue">
      <div class="tiles-title">7-DAY ESTIMATE </div>
      <div class="heading text-black ">
        {((24 / (((($NETWORK.EstNextDifficulty) * pow(2,32) ) / (($GLOBAL.userdata.hashrate) * pow(10,3) )) / 3600)) * 250000 * 7)|number_format:"8"}
      </div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white">
    <div class="tiles-body">
      <div class="tiles-title">30-DAY ESTIMATE </div>
      <div class="heading text-black ">
        {((24 / (((($NETWORK.EstNextDifficulty) * pow(2,32) ) / (($GLOBAL.userdata.hashrate) * pow(10,3) )) / 3600)) * 250000 * 30)|number_format:"8"}
      </div>
    </div>
  </div>
</div>

</div>
-->

<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th style="width:170px">Date</th>
              <th>Block</th>
              <th>Block Reward</th>
              <th>Your Share</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><span class="muted"><em>In Progress</em></span></td>
              <td><span class="muted">{$ESTIMATES.percent}% done</span></td>
              <td><span class="muted">250,000 <i class="fa fa-info-circle tip" data-toggle="tooltip" title="Dogecoin block rewards are random from 1 to 500,000 coins." data-placement="top"></i></span></td>
              <td><span class="muted">{$GLOBAL.userdata.estimates.payout|number_format:"8"}</span></td>
              <td>
                <span class="label">Estimated</span> <i class="fa fa-info-circle tip" data-toggle="tooltip" title="Estimated based on an average 250,000 block reward." data-placement="top"></i>
              </td>
            </tr>
          {if $TRANSACTIONS}
          {section transaction $TRANSACTIONS}
            <tr>
              <td><span class="muted">{$TRANSACTIONS[transaction].timestamp|date_format:'%b %e %l:%M %p'}</span></td>
              <td><span class="muted label label-success"><strong><a href="/statistics/round&height={$TRANSACTIONS[transaction].height}">{$TRANSACTIONS[transaction].height}</a></strong></span></td>
              <td><span class="muted">{$TRANSACTIONS[transaction].blockvalue|number_format:"0"}</span></td>
              <td><span class="muted">{$TRANSACTIONS[transaction].amount|number_format:"8"}</span></td>
              <td>
                {if $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations}
                <span class="label label-info">Confirmed</span>
                {else if $TRANSACTIONS[transaction].confirmations == -1}
                <span class="label">Orphaned</span> <i class="fa fa-info-circle tip" data-toggle="tooltip" title="When two people find a block at the same time. The network picks one to be valid and the other is orphaned (invalid)." data-placement="top"></i>
                {else}
                <span class="label label-warning">Unconfirmed</span> <i class="fa fa-info-circle tip" data-toggle="tooltip" title="Blocks needs 120 confirmations from the Dogecoin network before they can be confirmed and paid out." data-placement="top"></i>
                {/if}
              </td>
            </tr>
          {/section}
          {/if}
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="well">You get paid a percentage of your valid shares every time the pool finds a block!</div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {	
  
  
  Morris.Area({
	  element: 'your-hashrates-graph',
	  data: [
    {foreach $YOURHASHRATES as $hour=>$hashrate}
    { hour: '{$hour|default:"0"}:00', hashrate: {$hashrate|default:"0"} },
    {/foreach}
	  ],
	  xkey: 'hour',
	  ykeys: ['hashrate'],
	  labels: ['AVG','Hour'],
	  lineColors:['#0090d9'],
	  lineWidth:'2',
	  grid:true,
	  continuousLine:true,
	  parseTime:false,
	  postUnits:'kh/s',
	  fillOpacity:'0.5',
	  pointSize:'0',
	});
	
	
  
	Morris.Line({
	  element: 'your-payouts-graph',
	  data: [
    {foreach $TRANSACTIONS as $transaction}
    { day: {$transaction.timestamp|date_format:'%e'}, amount: {$transaction.amount} },
    {/foreach}
	  ],
	  xkey: 'day',
	  ykeys: ['amount'],
	  labels: ['Day','Amount'],
	  lineColors:['#0090d9'],
	  lineWidth:'2',
	  grid:true,
	  continuousLine:true,
	  parseTime:false,
	  pointSize:'0',
	});
	
	
	$('#current-hashrate').easyPieChart({
		lineWidth:10,
		barColor:'#ffffff',
		trackColor:'#59466c',
		scaleColor:'#dfe0e0',
		size:150,
		lineCap:'butt',
  });
  
  $('#pool-hashrate').easyPieChart({
		lineWidth:10,
		barColor:'#ffffff',
		trackColor:'#59466c',
		scaleColor:'#dfe0e0',
		size:150,
		lineCap:'butt',
  });
});
</script>
{/if} 
