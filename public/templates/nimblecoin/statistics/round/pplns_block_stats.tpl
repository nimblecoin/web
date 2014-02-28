<div class="row">
  
  <div class="col-md-12 m-b-20">					
		<div class="tiles white add-margin">
				<div class="p-t-20 p-l-20 p-r-20 p-b-20">
				<div class="row b-grey b-b xs-p-b-20">
				<div class="col-md-3 col-sm-3">
          <h4 class="text-black semi-bold"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="This is the user that found the block. They get a 1,000 doge block finder bonus!" data-placement="right"></i> Block Finder</h4>
					<h3 class="text-grey semi-bold">{$BLOCKDETAILS.finder|default:"unknown"}</h3>
				</div>
				<div class="col-md-3 col-sm-3">
					<h4 class="text-black semi-bold"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="How much this block was worth in Doge" data-placement="right"></i> Block Reward</h4>
					<h3 class="text-success semi-bold">Đ {$BLOCKDETAILS.amount|number_format}</h3>
				</div>
				<div class="col-md-3 col-sm-5">
				  <h4 class="text-black semi-bold"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="Blocks must be confirmed by the Dogecoin network before they can be paid out. This usually takes less than 30 minutes." data-placement="right"></i> Status</h4>
					<h4 class="text-success semi-bold">
					  {if $BLOCKDETAILS.confirmations >= $GLOBAL.confirmations}
              <span class="label label-info">Confirmed</span>
            {else if $BLOCKDETAILS.confirmations == -1}
              <span class="label">Orphaned</span>
            {else if $BLOCKDETAILS.confirmations == 0}0
            {else}
              <span class="label">{($GLOBAL.confirmations - $BLOCKDETAILS.confirmations)|default:"0"} left</span>
            {/if}
					</h4>
				</div>
				<div class="col-md-3 col-sm-3">
					<h4 class="text-black semi-bold"><i class="fa fa-info-circle tip" data-toggle="tooltip" title="If this number is below 100% then it means we found a block faster than we expected!" data-placement="right"></i> Completed at</h4>
					<h3 class="text-success semi-bold">{math equation='x / y * 100' x=($BLOCKDETAILS.shares|default:"0") y=($BLOCKDETAILS.estshares|default:"0") format='%.2f'}%</h3>
				</div>
				</div>
				
				<div class="row b-grey">
				<div class="col-md-3 col-sm-3">
				<div class="m-t-10">
					<p class="text semi-bold">Found</p>
					<p class="text-grey">{$BLOCKDETAILS.time|date_format:'%b %e, %Y %l:%M %p'}</p>
				</div>
				</div>
				<div class="col-md-3 col-sm-3">
				<div class="m-t-10">
					<p class="text semi-bold">Difficulty</p>
					<p class="text-black">{$BLOCKDETAILS.difficulty|number_format:"0"}</p>
				</div>
				</div>
				<div class="col-md-3 col-sm-3">
				<div class="m-t-10">
					<p class="text semi-bold">Time Since Last Block</p>
					<p class="text-black">{$BLOCKDETAILS.round_time|seconds_to_words|default:"0"}</p>
				</div>
				</div>
				<div class="col-md-3 col-sm-3">
				<div class="m-t-10">
					<p class="text semi-bold">Shares</p>
					<div class="pull-left">
					PPLNS
					</div>
					<div class="pull-right">
					<span class="text-info">{$PPLNSSHARES|number_format:"0"|default:"0"}</span>
					</div>
					<div class="clearfix"></div>
					<div class="pull-left">
					Estimated
					</div>
					<div class="pull-right">
					<span class="text-success">{$BLOCKDETAILS.estshares|number_format|default:"0"}</span>
					</div>
					<div class="clearfix"></div>
				</div>
				</div>
				</div>

				</div>
				
				<div class="tiles grey" id="chart_1" style="width:100%">				
				  		<div class="tiles white no-padding">
                <div class="tiles-chart">
                  <ul class="nav nav-tabs p-t-10 p-l-10" id="dash-tab">
                    <li class="active"><a href="#Transactions">Payouts</a></li>
                    <li class=""><a href="#Shares">Shares</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="active tab-pane" id="Transactions">
                      <table class="table table-condensed">
                      <thead>
                        <tr>
                          <th>User Name</th>
                          <th align="right" style="text-align: right;">PPLNS Shares</th>
                          <th align="right" style="text-align: right;">Reward %</th>
                          <th align="right" style="text-align: right;">Amount</th>
                        </tr>
                      </thead>
                      <tbody>
                        {assign var=percentage1 value=0}
                        {section txs $ROUNDTRANSACTIONS}
                              <tr{if $GLOBAL.userdata.username|default:"" == $ROUNDTRANSACTIONS[txs].username}{assign var=listed value=1} style="background:#90ee92; border: none;"{else} class="{cycle values="odd,even"}"{/if}>
                                <td>{if $ROUNDTRANSACTIONS[txs].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$ROUNDTRANSACTIONS[txs].username|default:"unknown"|escape}{/if}</td>
                                <td align="right">{$PPLNSROUNDSHARES[txs].pplns_valid|number_format|default:"0"}</td>
                        	<td align="right">{if $PPLNSROUNDSHARES[txs].pplns_valid > 0 }{(( 100 / $PPLNSSHARES) * $PPLNSROUNDSHARES[txs].pplns_valid)|number_format:"4"|default:"0"}{else}0{/if}</td>
                                <td align="right" style="padding-right: 25px;">{$ROUNDTRANSACTIONS[txs].amount|default:"0"|number_format:"8"}</td>
                                {assign var=percentage1 value=0}
                              </tr>
                        {/section}
                      </tbody>
                      </table>  
                    </div>
                    <div class="tab-pane" id="Shares">
                      <table class="table table-condensed">
                      <thead>
                        <tr>
                          <th align="center" style="text-align: center;">Rank</th>
                          <th align="left">User Name</th>
                          <th align="right" style="text-align: right;">Valid</th>
                          <th align="right" style="text-align: right;">Invalid</th>
                          <th align="right" style="text-align: right;">Invalid %</th>
                        </tr>
                      </thead>
                      <tbody>
                        {assign var=rank value=1}
                        {assign var=listed value=0}
                        {foreach key=id item=data from=$ROUNDSHARES}
                              <tr{if $GLOBAL.userdata.username|default:"" == $data.username}{assign var=listed value=1} style="background-color:#efefef;"{else} class="{cycle values="odd,even"}"{/if}>
                                <td align="center">{$rank++}</td>
                                <td>{if $data.is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$data.username|default:"unknown"|escape}{/if}</td>
                                <td align="right">{$data.valid|number_format}</td>
                                <td align="right">{$data.invalid|number_format}</td>
                              	<td align="right" style="padding-right: 25px;">{if $data.invalid > 0 }{($data.invalid / $data.valid * 100)|number_format:"2"|default:"0"}{else}0.00{/if}</td>
                              </tr>
                        {/foreach}
                      </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
				</div>
			</div>
	</div>
  


</div>