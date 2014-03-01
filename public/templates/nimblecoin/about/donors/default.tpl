<div class="page-title">
  <h3>Donations This Month</h3>
</div>

<div class="row m-b-20">

  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles green added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> AMOUNT DONATED </div>
        <div class="heading"> <span>{$TOTAL}</span> </div>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles green added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> DONATION TARGET </div>
        <div class="heading"> <span>200,000</span> </div>
      </div>
    </div>
  </div>
  
  <div class="col-md-4 col-sm-4 spacing-bottom-sm ">
    <div class="tiles green added-margin">
      <div class="tiles-body">
        <div class="tiles-title"> AVERAGE DONATION </div>
        <div class="heading"> <span>{$AVGPCT|number_format:"2"}%</span> </div>
      </div>
    </div>
  </div>

</div>

<div class="row-fluid">
  <div class="progress progress-large progress-striped active">
    <div class="progress-bar progress-bar-success animate-progress-bar" data-percentage="{$TOTAL / 200000 * 100}%" ></div>
  </div>
</div>

<div class="row-fluid">
  <div class="span12">
    <div class="grid simple">
      <div class="grid-body">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th>Name</th>
              <th align="right">%</th>
              <th align="right">Total</th>
            </tr>
          </thead>
          <tbody>
            {section name=donor loop=$DONORS}
            <tr>
              <td>{if $DONORS[donor].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$DONORS[donor].username}{/if}</td>
              <td align="">{$DONORS[donor].donate_percent}</td>
              <td align="">{$DONORS[donor].donation|number_format:"2"}</td>
            </tr>
            {sectionelse}
            <tr>
              <td align="center" colspan="3">No confirmed donations yet, please be patient!</td>
            </tr>
            {/section}
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
