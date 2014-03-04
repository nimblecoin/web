<div class="col-md-6 added-margin">
<div class="row-fluid">
    <div class="grid simple">
      <div class="grid-title no-border">
        <h4>Top <strong>Hashrates</strong></h4>
      </div>
      <div class="grid-body no-border">
        <table class="table table-condensed no-border">
          <thead>
            <tr>
              <th align="center"></th>
              <th align="right"></th>
              <th align="left" scope="col">User</th>
              <th align="right" scope="col">KH/s</th>
            </tr>
          </thead>
          <tbody>
            {assign var=rank value=1}
            {assign var=listed value=0}
            {section contrib $CONTRIBHASHES}
                  {math assign="estday" equation="round(reward / ( diff * pow(2,32) / ( hashrate * 1000 ) / 3600 / 24), 3)" diff=$DIFFICULTY reward=$REWARD hashrate=$CONTRIBHASHES[contrib].hashrate}
                  <tr{if $GLOBAL.userdata.username|default:""|lower == $CONTRIBHASHES[contrib].account|lower}{assign var=listed value=1} class="owned" {else} class="{cycle values="odd,even"}"{/if}>
                    <td align="center">{$rank++}</td>
                    <td align="right">{if $CONTRIBHASHES[contrib].donate_percent > 0}<i class="fa fa-star tip" data-toggle="tooltip" title="SUPER AWESOME DONOR" data-placement="right"></i>{/if}</td>
                    <td>{if $CONTRIBHASHES[contrib].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$CONTRIBHASHES[contrib].account|escape}{/if}</td>
                    <td align="right">{$CONTRIBHASHES[contrib].hashrate|number_format}</td>
                  </tr>
            {/section}
            {if $listed != 1 && $GLOBAL.userdata.username|default:""}
                  {math assign="myestday" equation="round(reward / ( diff * pow(2,32) / ( hashrate * 1000 ) / 3600 / 24), 3)" diff=$DIFFICULTY reward=$REWARD hashrate=$GLOBAL.userdata.rawhashrate}
                  <tr class="owned">
                    <td align="center">n/a</td>
                    <td>{if $GLOBAL.userdata.donate_percent > 0}<i class="fa fa-star tip" data-toggle="tooltip" title="SUPER AWESOME DONOR" data-placement="right"></i>{/if}</td>
                    <td>{$GLOBAL.userdata.username|escape}</td>
                    <td align="right">{$GLOBAL.userdata.rawhashrate|number_format}</td>
                  </tr>
            {/if}
          </tbody>
        </table>
      </div>
    </div>
</div>
</div>
