<div class="page-title">
  <h3>Workers</h3>	
</div>

<div class="btn-group"> <a class="btn btn-primary btn-demo-space dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-cog"></i> Actions <span class="caret"></span> </a>
  <ul class="dropdown-menu">
    <li><a href="#" data-toggle="modal" data-target="#newWorker"><i class="fa fa-plus"></i> Add Worker</a></li>
    <li><a href="#" data-toggle="modal" data-target="#editWorker"><i class="fa fa-wrench"></i> Manage Workers</a></li>
  </ul>
</div>

<div class="clearfix"></div>

{nocache}
<div class="row 2col">
{section worker $WORKERS}
{assign var="username" value="."|escape|explode:$WORKERS[worker].username:2}
<div class="col-md-3 col-sm-6 spacing-bottom-sm spacing-bottom">
  <div class="tiles {if $WORKERS[worker].hashrate > 0}blue{else}red{/if} added-margin tile-worker">
    <div class="tiles-body">
      <div class="controller"><a href="javascript:;" class="reload"></a></div>
      <div class="tiles-title">{$username.1|escape|upper}</div>
      <div class="heading"> <span class="animate-number" data-value="{$WORKERS[worker].hashrate}" data-animation-duration="1200">0</span>kh/s</div>
      <div class="progress transparent progress-small no-radius">
        <div class="progress-bar progress-bar-white animate-progress-bar" data-percentage="{$WORKERS[worker].hashrate / 10}%"></div>
      </div>
      <div class="description">
        {if $WORKERS[worker].hashrate > 0}
          <i class="icon-custom-up"></i><span class="text-white mini-description ">&nbsp; ONLINE</span>
        {else}
          <i class="icon-custom-down"></i><span class="text-white mini-description ">&nbsp; OFFLINE</span>
        {/if}
      </div>
    </div>
  </div>
</div>
{/section}
</div>
{/nocache}

{if count($WORKERS) > 0}


<div class="row">
  <div class="col-md-12 m-b-20">
    <div class="stratum-info">
      <h4>USA: stratum+tcp://doge-stratum.nimblecoin.us:3333 -u username.workername -p workerpass</h4>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-md-12 m-b-20">
    <div class="stratum-info">
      <h4>EU: stratum+tcp://doge-stratum-2.nimblecoin.us:3333 -u username.workername -p nimblecoin</h4>
    </div>
  </div>
</div>

<div class="well">Hashrate is <strong>estimated</strong> based on the number of shares submitted in the last 10 minutes. If a worker is hashing less than 30kh/s then it might not be reported as active. Don't worry, it's still working!</div>
{else}
<div class="well">You have no workers! Let's <strong>add a worker</strong> to start mining!</div>
{/if}

<!-- Modal -->
<div class="modal fade" id="newWorker" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="{$smarty.server.SCRIPT_NAME}" method="post">
        <input type="hidden" name="page" value="{$smarty.request.page|escape}">
        <input type="hidden" name="action" value="{$smarty.request.action|escape}">
        <input type="hidden" name="do" value="add">
        <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <br>
        <h4 id="myModalLabel" class="semi-bold">Let's Get Working!</h4>
        {if count($WORKERS) == 0}
        <p class="no-margin">Let's create your first worker! You can make the worker name and password anything you want. Be creative!</p>
        {else}
        <p class="no-margin">Wow! You have another worker? You're a mining MACHINE!</p>
        {/if}
        <br>
      </div>
      <div class="modal-body">
        <div class="row form-row">
          <div class="col-md-6">
            <input type="text" name="username" class="form-control" maxlength="20" placeholder="Worker Name" required/>
          </div>
          <div class="col-md-6">
            <input type="text" name="password" class="form-control" maxlength="20" placeholder="Set Password" required>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" value="Add New Worker" class="btn btn-success">
      </div>
    </div>
    </form>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="editWorker" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="{$smarty.server.SCRIPT_NAME}" method="post">
      <input type="hidden" name="page" value="{$smarty.request.page|escape}">
      <input type="hidden" name="action" value="{$smarty.request.action|escape}">
      <input type="hidden" name="do" value="update">
      <input type="hidden" name="ctoken" value="{$CTOKEN|escape|default:""}" />
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <br>
        <h4 id="myModalLabel" class="semi-bold">Let's Get Working!</h4>
        {if count($WORKERS) == 0}
        <p class="no-margin">Let's create your first worker! You can make the worker name and password anything you want. Be creative!</p>
        {else}
        <p class="no-margin">Wow! You have another worker? You're a mining MACHINE!</p>
        {/if}
        <br>
      </div>
      
      <div class="row">
          <div class="col-md-12">
              <div class="grid simple">
                  <div class="grid-body no-border">
                          <table class="table no-more-tables">
                              <thead>
                                  <tr>
                                      <th style="width:9%">Worker Name</th>
                                      <th style="width:22%">Set Password</th>
                                      <th style="width:10%">Actions</th>
                                  </tr>
                              </thead>
                              <tbody>
                                {nocache}
                                  {section worker $WORKERS}
                                  {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2} 
                                <tr>
                                  <td align="left"><input type="text" name="data[{$WORKERS[worker].id}][username]" value="{$username.1|escape}" required/></td>
                                  <td align="left"><input type="text" name="data[{$WORKERS[worker].id}][password]" value="{$WORKERS[worker].password|escape}" required></td>
                                  <td align="left" style="vertical-align:middle"><a href="{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$WORKERS[worker].id|escape}" class="icn_trash"><i class="fa fa-trash-o" style="font-size: 1.4em"></i></a></td>
                                </tr>
                                  {/section}
                                {/nocache}
                              </tbody>
                          </table>
                          <div class="clear"></div>
                  </div>
              </div>
          </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Update Workers">
      </div>
      </form>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

