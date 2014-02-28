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

<?php if($this->user && $this->user->status()==='active'): ?>
    <a href="<?php echo base_url('units/save_unit'); ?>" >Add Unit</a>
<?php endif; ?>

    