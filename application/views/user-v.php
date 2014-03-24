<h1>Series created by <?php if(isset($user['user_name'])) echo $user['user_name'];?></h1>
<br />
<?php foreach ($series as $s): ?>
    <a href="<?php echo base_url('series/show/'.$s->id)?>"><?php echo $s->title?></a>
    <br />
<?php endforeach; ?>
<hr />

<h1>Units created by <?php if(isset($user['user_name'])) echo $user['user_name'];?></h1>
<br />
<?php foreach ($unit as $u): ?>
    <a href="<?php echo base_url('units/show/'.$u->id)?>"><?php echo $u->title?></a>
    <br />
<?php endforeach; ?>




