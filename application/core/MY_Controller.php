<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');class MY_Controller extends CI_Controller{	function __construct(){		parent::__construct();                $this->user = class_exists('User')? new User($this->session->userdata("user_id")):NULL;		$this->load->library('smrke');                	}}function character_limiter($string,$pos){	if(strlen($string)<=$pos) return $string;		$out = substr($string,$pos,1);	while(!($out==" " || $out=="/" || $out=="-"||$out==",")){		// echo $out."<br>";		$out = substr($string,--$pos,1);	}	return substr($string,0,$pos)." ...";}