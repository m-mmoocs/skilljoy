<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Home extends MY_Controller{

	public function index(){
            $this->load->model('series_m');
            $this->load->model('units_m');
            $page = new Page('home');
            $page->Data('series', $this->series_m->get_all_series());
            $page->Data('units',$this->units_m->get_all_units());
            $page->show();
	}
	
}
