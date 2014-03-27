<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends MY_Controller {

    public function index() {
        $this->load->model('series_m');
        $this->load->model('units_m');
        $page = new Page('home');
        if (isset($_POST['add_username']))
        {
            if($this->check_username())
            {
                $this->load->model('user_m');
                $this->user_m->add_username($_POST['new_username']);
            }
        }
        
        if (empty($this->user->Data(['user_name']))) {
            $page->Data('has_username', false);
        } else {
            $page->Data('has_username', true);
        }

        $page->Data('series', $this->series_m->get_all_series());
        $page->Data('units', $this->units_m->get_all_units());
        $page->show();
    }

    public function check_username()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('new_username', 'Username', 'trim|xss_clean|is_alphanumeric|min_length[4]|max_length[30]|is_unique[users.user_name]');
        $this->form_validation->set_message('is_alphanumeric', 'Username can only contain alphanumeric characters or dashes.');
        $this->form_validation->set_message('is_unique', 'That username is taken.');
        if ($this->form_validation->run() == TRUE) {
            return TRUE;
        }
    }
}
