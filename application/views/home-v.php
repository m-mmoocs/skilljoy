<h2>Series</h2>
<?php if(count($series)>0): ?>
<?php foreach($series as $s): ?>
    <div class="series_stub">
        <a href="<?php echo base_url('series/show/'.$s->id); ?>"><?php echo $s->title; ?></a>
    </div>
<?php endforeach; ?>
<?php else: ?>
  <div>There are currently no series to display.</div>
<?php endif; ?>
<hr>
<h2>Units</h2>
<?php if(count($units)>0): ?>
<?php foreach($units as $u): ?>
    <div class="unit_stub">
        <a href="<?php echo base_url('units/show/'.$u->id); ?>"><?php echo $u->title; ?></a>
    </div>
<?php endforeach; ?>
<?php else: ?>
  <div>There are currently no units to display.</div>
<?php endif; ?>

<br>

<?php if($this->user && $this->user->has_permission('add unit')): ?>
    <a href="<?php echo base_url('units/save_unit'); ?>" >Add Unit</a>
<?php endif; ?>
<br />
<?php if($this->user && $this->user->has_permission('add series')): ?>
    <a href="<?php echo base_url('series/create_series'); ?>" >Add Series</a>
<?php endif; ?>
