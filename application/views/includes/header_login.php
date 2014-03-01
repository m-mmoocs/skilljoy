<?php
$fb_url = $this->fbconnect->getLoginUrl(array('redirect_uri' => 'http://localhost/skilljoy/users/fb_login','scope' => 'email'));
$g_url = $this->gconnect->createAuthUrl();
?>
<a href="<?php echo $fb_url; ?>" >Login with Facebook</a>
<br>
<a href="<?php echo $g_url; ?>" >Login with Google</a>
