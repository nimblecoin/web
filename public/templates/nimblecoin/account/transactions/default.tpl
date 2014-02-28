<div class="page-title">
  <h3>Transactions</h3>	
</div>

{if $DISABLE_TRANSACTIONSUMMARY|default:"0" != 1}
<div class="row spacing-bottom 2col">
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles green added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> TOTAL EARNED </div>
        <div class="heading"> <span>{$SUMMARY['Credit']}</span> </div>
      </div>
    </div>
  </div>
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles blue added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> SENT TO WALLET </div>
        <div class="heading"> <span>{$SUMMARY['Debit_AP'] + $SUMMARY['Debit_MP']}</span> </div>
      </div>
    </div>
  </div>
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles purple">
      <div class="tiles-body">
        <div class="tiles-title"> DONATED </div>
        <div class="heading"> <span>{$SUMMARY['Donation']}</span> </div>
      </div>
    </div>
  </div>
  
</div>
{/if}

{if $TRANSACTIONS}
<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th style="width:170px">Date</th>
              <th>Type</th>
              <th>Amount</th>
              <th>Status</th>
              <th>Reference</th>
            </tr>
          </thead>
          <tbody>
          {section transaction $TRANSACTIONS}
            {if $TRANSACTIONS[transaction].type != 'TXFee'}
            <tr>
              <td><span class="muted">{$TRANSACTIONS[transaction].timestamp|date_format:'%b %e, %Y %l:%M %p'}</span></td>
              <td>
                {if $TRANSACTIONS[transaction].type == 'Debit_MP'}
                <span class="label">Manual Withdrawl</span>
                {elseif $TRANSACTIONS[transaction].type == 'Debit_AP'}
                <span class="label">Auto Withdrawl</span>
                {elseif $TRANSACTIONS[transaction].type == 'Credit'}
                <span class="label label-success">Block Reward</span>
                {elseif $TRANSACTIONS[transaction].type == 'Bonus'}
                <span class="label label-success">Block Finder Bonus</span>
                {else}
                <span class="label">{$TRANSACTIONS[transaction].type}</span>
                {/if}
              </td>
              <td>
                {if $TRANSACTIONS[transaction].type == 'Credit' or $TRANSACTIONS[transaction].type == 'Credit_PPS' or $TRANSACTIONS[transaction].type == 'Bonus'}
                  <span class="text-success semi-bold">{$TRANSACTIONS[transaction].amount|number_format:"8"}</span>
                {else}
                  <span class="text-grey">{$TRANSACTIONS[transaction].amount|number_format:"8"}</span>
                {/if}
              </td>
              <td>
                {if $TRANSACTIONS[transaction].type == 'Credit_PPS' OR
                    $TRANSACTIONS[transaction].type == 'Fee_PPS' OR
                    $TRANSACTIONS[transaction].type == 'Donation_PPS' OR
                    $TRANSACTIONS[transaction].type == 'Debit_MP' OR
                    $TRANSACTIONS[transaction].type == 'Debit_AP' OR
                    $TRANSACTIONS[transaction].type == 'TXFee' OR
                    $TRANSACTIONS[transaction].confirmations >= $GLOBAL.confirmations
                }<span class="label label-info confirmed">Confirmed</span>
                {else if $TRANSACTIONS[transaction].confirmations == -1}<span class="label orphan">Orphaned</span>
                {else}<span class="label unconfirmed">Unconfirmed</span>{/if}
              </td>
              <td>
                <span class="muted">
                  {if $TRANSACTIONS[transaction].height == 0}
                  {if ! $GLOBAL.website.transactionexplorer.disabled}
                    <a href="{$GLOBAL.website.transactionexplorer.url}{$TRANSACTIONS[transaction].txid|escape}" title="{$TRANSACTIONS[transaction].txid|escape}">TX ID</a>
                  {else}
                    <a href="#" onClick="alert('{$TRANSACTIONS[transaction].txid|escape}')" title="{$TRANSACTIONS[transaction].txid|escape}">TX ID</a>
                  {/if}
                  {else}
                  <a href="{$smarty.server.SCRIPT_NAME}?page=statistics&action=round&height={$TRANSACTIONS[transaction].height}">Block</a>{/if}
                </span>
              </td>
            </tr>
            {/if}
          {/section}
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
{else}
<div class="well">No transactions yet! Coins are distributed after you've been mining with us and a block has been found.</div>
{/if}

