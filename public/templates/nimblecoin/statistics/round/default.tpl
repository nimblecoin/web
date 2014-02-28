<div class="page-title">
  <a href="/statistics/blocks"><i class="icon-custom-left"></i></a>
  <h3>Block {$BLOCKDETAILS.height|number_format:"0"|default:"0"}</h3>
</div>

{if $GLOBAL.config.payout_system == 'pplns'}
   {include file="statistics/round/pplns_block_stats.tpl"}
{/if}
