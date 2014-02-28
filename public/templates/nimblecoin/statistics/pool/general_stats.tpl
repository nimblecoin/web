{if is_array($POOLHASHRATES)}
<div class="row-fluid">
    <div class="grid simple">
      <div class="grid-title no-border">
        <h4>Pool <strong>Hashrate</strong></h4>
      </div>
      <div class="grid-body no-border">
        <div id="pool-hashrates-graph"></div>
      </div>
    </div>
</div>
{/if}

{if is_array($POOLHASHRATES)}
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {	
  Morris.Area({
	  element: 'pool-hashrates-graph',
	  data: [
    {foreach $POOLHASHRATES as $hour=>$hashrate}
    { hour: '{$hour}:00', hashrate: {$hashrate} },
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
});
</script>
{/if}

<div class="row">

<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body">
      <div class="tiles-title">POOL HASHRATE</div>
      <div class="heading text-black"> <span class="animate-number" data-value="{$GLOBAL.hashrate}" data-animation-duration="1200">0</span> {$GLOBAL.hashunits.pool}</div>
      <div class="description"><span class="mini-description"><span class="text-black bold">{if $GLOBAL.roundshares.valid > 0}{($GLOBAL.roundshares.valid / ($GLOBAL.roundshares.valid + $GLOBAL.roundshares.invalid) * 100)|number_format:"2"}%{else}0%{/if}</span> Efficiency — <span class="text-black bold animate-number" data-value="{$GLOBAL.workers}" data-animation-duration="1200">0</span> Pool Workers </span> </div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white added-margin">
    <div class="tiles-body">
      <div class="tiles-title">CURRENT BLOCK </div>
      <div class="heading text-black"><span class="animate-number" data-value="{$CURRENTBLOCK}" data-animation-duration="1200">0</span></div>
      <div class="description"><span class="mini-description"><span class="text-black bold">{$NETWORK.difficulty}</span> Difficulty </span>  </div>
    </div>
  </div>
</div>

<div class="col-md-4 spacing-bottom">
  <div class="tiles white">
    <div class="tiles-body">
      <div class="tiles-title">AVG TIME PER BLOCK </div>
      <div class="heading text-black">{$ESTTIME|seconds_to_words}</div>
      <div class="description"><span class="mini-description"><span class="text-black bold">{$TIMESINCELAST|seconds_to_words}</span> since last block found </span>  </div>
    </div>
  </div>
</div>

</div>



 