<a href="<?php echo base_url(); ?>" id="site-logo" class="floatLeft" >Skilljoy</a>
<div id="user-box" class="floatRight">
<?php if($this->user && $this->user->status()==='active'): ?>
    <?php $username = $this->user->Data('user_name'); ?>
    <div id="">Hello 
    <?php if(!empty($username)): ?>
        <?php echo ' <a href="'.base_url('users/show/'.$this->user->Data('id')).'">' . $username . '</a>';?>
    <?php else: ?>
        <?php echo $this->user->Data('firstname'); ?>
    <?php endif;?>
    <br /></div>
    <a href="<?php echo base_url('users/logout'); ?>">Logout</a>
<?php else: ?>
    <?php if($p!=='login'): ?>
<!--    <a id="login-button" href="<?php echo base_url('users/login'); ?>">Login</a>-->
    <div id="login-box">
        <?php $this->load->view('includes/header_login'); ?>
    </div>
    <?php endif; ?>
<?php endif; ?>
</div>

