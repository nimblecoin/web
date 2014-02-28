<div class="page-title">
  <h3>Pool Servers</h3>
</div>

<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
    <thead>
      <tr>
        <th align="center">Location</th>
        <th align="center">Service</th>
        <th align="center">Status</th>
        <th align="center" colspan="4" style="padding-right: 10px">Uptime</th>
      </tr>
    </thead>
    <tbody>

{foreach key=key item=item from=$STATUS}
{assign var=node value="."|explode:$item.friendlyname}
      <tr>
        <td><h3>{$node.0|upper}</h3></td>
        {if $node|count > 1}<td style="vertical-align: middle"><h3>{$node.2}.{$node.3}.{$node.4}</h3></td>{/if}
        <td style="vertical-align: middle"><span class="label label-success ur-status-{$CODES[$item.status]|lower}">{$CODES[$item.status]}</span></td>
        <td style="vertical-align: middle">{$item.customuptimeratio.0|number_format:"0"}%</td>
      </tr>
      
{/foreach}
      <tr>
        <td style="vertical-align: middle"><h4>JP</h4></td>
        <td colspan="3" style="vertical-align: middle"><h4>Coming Soon!</h4></td>
      </tr>
    </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

<script>
{literal}
$(document).ready(function(){
  $('.chart').easyPieChart({
    easing: 'easeOutBounce',
    size: 26,
    scaleColor: false,
    lineWidth: 13,
    lineCap: 'butt',
    barColor: '#92CCA6',
    trackColor: '#FF7878',
    animate: false,
    onStep: function(from, to, percent) {
      $(this.el).find('.percent-{/literal}{$item.id}{literal}').text(Math.round(percent));
    }
  });
});
{/literal}
</script>
