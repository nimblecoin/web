<div class="col-md-6 added-margin">
<div class="row-fluid">
    <div class="grid simple">
      <div class="grid-title no-border">
        <h4>Top <strong>Contributors</strong></h4>
      </div>
      <div class="grid-body no-border">
        <table class="table table-condensed no-border">
          <thead>
            <tr>
              <th align="center" width="10"></th>
              <th align="right"></th>
              <th>User</th>
              <th>Shares</th>
            </tr>
          </thead>
          <tbody>
            {assign var=rank value=1}
            {assign var=listed value=0}
            {section shares $CONTRIBSHARES}
                  <tr{if $GLOBAL.userdata.username|default:""|lower == $CONTRIBSHARES[shares].account|lower}{assign var=listed value=1} class="owned" {else} class="{cycle values="odd,even"}"{/if}>
                    <td align="center">{$rank++}</td>
                    <td align="right">{if $CONTRIBSHARES[shares].donate_percent > 0}<i class="fa fa-star tip" data-toggle="tooltip" title="SUPER AWESOME DONATOR" data-placement="right"></i>{/if}</td>
                    <td>{if $CONTRIBSHARES[shares].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$CONTRIBSHARES[shares].account|escape}{/if}</td>
                    <td>{$CONTRIBSHARES[shares].shares|number_format}</td>
                  </tr>
            {/section}
            {if $listed != 1 && $GLOBAL.userdata.username|default:""}
                <tr class="owned">
                  <td align="center">n/a</td>
                  <td align="center">{if $GLOBAL.userdata.donate_percent > 0}<i class="fa fa-star tip" ata-toggle="tooltip" title="SUPER AWESOME DONATOR" data-placement="right"></i>{else}<i class="icon-cancel"></i>{/if}</td>
                  <td>{$GLOBAL.userdata.username|escape}</td>
                  <td>{$GLOBAL.userdata.shares.valid|number_format}</td>
                </tr>
            {/if}
          </tbody>
        </table>
      </div>
    </div>
</div>
</div>