<!doctype html>

<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><?php echo $title; ?> | site tagline</title>
	<meta name="description" content="<?php echo (isset($description))?$description:""; ?>">
	<meta name="viewport" content="width=1024" >
<!--	<link rel="shortcut icon" href="<?php echo base_url('_/images/favicon.ico'); ?>" />-->
	<link rel="stylesheet" href="<?php echo base_url(); ?>_/css/style.css">
	<?php

	if(isset($styles)){

		foreach ($styles as $style) {
			echo "<link rel='stylesheet' href='".base_url()."_/css/".$style.".css'>";
		}

	}

	if(isset($e_styles)){

		foreach ($e_styles as $style) {
			echo "<link rel='stylesheet' href='".$style."'>";
		}

	}

	 ?>

	<script src="<?php echo base_url(); ?>_/js/modernizr-1.7.min.js"></script>

	<script>
		<?php

		if(isset($custom_js_vars)){

			foreach ($custom_js_vars as $key => $value) {
				echo "var ".$key."=".$value.";\n\r";
			}

		}

		?>

	</script>

	<?php if(isset($share_this)): ?>
		<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
		<script type="text/javascript">stLight.options({publisher: "f00cc3e0-b450-4d3f-9648-d2f1db5b0550", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
	<?php endif; ?>
</head>

<body>

    <header class=''>
	<?php $this->load->view('includes/header'); ?>
    </header>

		<div id="content">
			<?php

				$this->load->view($content);

			?>
		</div>

		<footer >
			<?php $this->load->view('includes/footer'); ?>
		</footer>

<!-- /body  --><!-- scripts -->

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
<script>window.jQuery || document.write("<script src='<?php echo base_url(); ?>_/js/jquery-1.5.1.min.js'>\x3C/script>")</script>
<?php if(isset($e_scripts)){

 		foreach ($e_scripts as $script) {
			echo "<script src=\"".$script."\"></script>";
		 }
	}

?>
<?php if(isset($scripts)){

 		foreach ($scripts as $script) {
			echo "<script src=\"".base_url()."_/js/".$script.".js\"></script>";
		 }
	}
?>
<script src="<?php echo base_url('_/js/global.js'); ?>"></script>
</body>
</html>
