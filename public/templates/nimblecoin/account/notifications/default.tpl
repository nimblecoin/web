<div class="page-title">
  <h3>Notifications</h3>
</div>
<form action="{$smarty.server.SCRIPT_NAME}" method="POST">
  <input type="hidden" name="page" value="{$smarty.request.page|escape}">
  <input type="hidden" name="action" value="{$smarty.request.action|escape}">
  <input type="hidden" name="do" value="save">
  <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
  <input type="hidden" name="data[success_login]" value="0" />
  <div class="row">
    <div class="col-md-6 col-sm-6">
      <div class="grid simple">
        <div class="grid-body border">
          <table class="table table-condensed">
      <thead>
        <th align="left">Alert me when...</th>
        <th align="center">Email</th>
        <th align="center">SMS</th>
      </thead>
      <tr>
        <td align="left">A worker stops working</td>
        <td>
          <span class="toggle">
          <label for="data[idle_worker]">
          <input type="hidden" name="data[idle_worker]" value="0" />
          <input type="checkbox" name="data[idle_worker]" id="data[idle_worker]" value="1"{nocache}{if $SETTINGS['idle_worker']|default:"0" == 1}checked{/if}{/nocache} />
          </label>
          </span>
        </td>
        <td><em>Coming Soon</em></td>
      </tr>
      {if $DISABLE_BLOCKNOTIFICATIONS|default:"" != 1}
      <tr>
        <td align="left">The pool finds a new block</td>
        <td>
          <span class="toggle">
          <label for="data[new_block]">
          <input type="hidden" name="data[new_block]" value="0" />
            <input type="checkbox" name="data[new_block]" id="data[new_block]" value="1" {nocache}{if $SETTINGS['new_block']|default:"0" == 1}checked{/if}{/nocache} />
          </label>
          </span>
        </td>
        <td><em>Coming Soon</em></td>
      </tr>
      {/if}
      <tr>
        <td align="left">Coins are sent to my wallet</td>
        <td>
          <span class="toggle">
          <label for="data[payout]">
            <input type="hidden" name="data[payout]" value="0" />
            <input type="checkbox" name="data[payout]" id="data[payout]" value="1"{nocache}{if $SETTINGS['payout']|default:"0" == 1}checked{/if}{/nocache} />
          </label>
          </span>
        </td>
        <td><em>Coming Soon</em></td>
      </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <footer>
      <div class="submit_link">
        <input type="submit" value="Update" class="btn btn-primary btn-cons-md">
      </div>
    </footer>
</form>
