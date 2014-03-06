<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Units extends MY_Controller {

    public function index() {
        
    }

    public function show($id) {
        $this->load->model('units_m');
<<<<<<< HEAD
        
        if (isset($_POST['add_questions'])) {  // if user has clicked the submit button
             $this->units_m->save_question($_POST);
             header('Location:' . base_url());
             exit();
        }
        
        if( isset($_POST['add_answers'])){
            $this->units_m->save_answers($_POST);
            header('Location:' . base_url());
            exit();
        }
        
=======
        $this->load->model('subjects_m');
        if(!$unit=$this->units_m->get_unit_with_id($id)){
            header('Location:'.base_url());
            exit();
        }
>>>>>>> origin/main
        $page = new Page('unit');
        if ($subjects = $this->subjects_m->get_subjects_for_unit($unit->id))
        {   // ensures there are returned rows before sending to page
            $page->Data('subjects', $subjects);
        }
        $rate_status = $this->units_m->rating_info_for_unit($id);
        $page->Data('rate_status', $rate_status);
        $page->Data('unit', $unit);
        $page->show();
        
    }

    public function save_unit() {
        $this->load->model('units_m');
        $this->load->model('materials_m');
<<<<<<< HEAD
        
        
=======
        $this->load->model('subjects_m');

>>>>>>> origin/main
        if (!$this->user || $this->user->status() !== 'active') {
            header("Location:" . base_url());
            exit();
        }

        if (isset($_POST['add_unit'])) {  // if user has clicked the Save button
            if ($this->chk_form()) {      // if the form has been validated
                $this->extract_id();    // call function to extract video IDs
                $this->units_m->save_unit($_POST);
                header('Location:' . base_url());
                exit();
            }
        }
        
        $page = new Page('unit');
        $page->Data('content_types', $this->materials_m->get_content_types());
        $page->Data('subjects', $this->subjects_m->get_all_subjects());
        $page->content('save_unit-v');
        $page->show();
    }

 
    public function extract_id() {
        /* This function takes the POST data and extracts video IDs for vimeo
          and youtube videos along with the content_type, then reassigns them into
          the $_POST data to prepare for insertion into database. */
        $this->load->library('mui');
        $result = $this->mui->material_check($_POST['materials'][0]['content']);
        $_POST['materials'][0]['content'] = $result['content'];
        $_POST['materials'][0]['content_type'] = $result['content_type'];
        if (strlen($_POST['materials'][1]['content']) > 5)
        {
        $result = $this->mui->material_check($_POST['materials'][1]['content']);
        $_POST['materials'][1]['content'] = $result['content'];
        $_POST['materials'][1]['content_type'] = $result['content_type'];
        }
        if (strlen($_POST['materials'][1]['content']) > 5)
        {
        $result = $this->mui->material_check($_POST['materials'][2]['content']);
        $_POST['materials'][2]['content'] = $result['content'];
        $_POST['materials'][2]['content_type'] = $result['content_type'];
        }
    }

    public function chk_form() {      // returns true/false
        $this->load->library('form_validation');

        $this->fix_url();   // add http:// to content if it hasn't already been added
        // content fields with more than 5 char input will be checked. otherwise they are ignored
        if (strlen($_POST['materials'][1]['content']) > 5) {   // validation rule for 1st supporting material
            $this->form_validation->set_rules('materials[1][content]', 'Supporting Material 1', 'xss_clean|is_valid_url|is_real_url');
        }
        if (strlen($_POST['materials'][2]['content']) > 5) {   // validation rule for 2nd supporting material
            $this->form_validation->set_rules('materials[2][content]', 'Supporting Material 2', 'xss_clean|is_valid_url|is_real_url');
        }
        // setting up validation rules
        $this->form_validation->set_rules('title', 'Unit Title', 'required|trim|xss_clean');
        $this->form_validation->set_rules('description', 'Unit Title', 'trim|xss_clean');
        $this->form_validation->set_rules('materials[0][content]', 'Primary Material', 'required|xss_clean|is_valid_url|is_valid_content|is_real_url');
        $this->form_validation->set_rules('new_subject', 'New Subject', 'trim|xss_clean');
        $this->form_validation->set_message('is_valid_url', 'Invalid URL format.');
        $this->form_validation->set_message('is_valid_content', 'Invalid Content. Must be video link or URL to PDF');
        $this->form_validation->set_message('is_real_url', 'URL is not accessible.');

        if ($this->form_validation->run() == TRUE) {
            return TRUE;
        }
    }

    public function fix_url() {
        if (strlen($_POST['materials'][0]['content']) > 5) {
            $_POST['materials'][0]['content'] = prep_url($_POST['materials'][0]['content']);
        }
        if (strlen($_POST['materials'][1]['content']) > 5) {
            $_POST['materials'][1]['content'] = prep_url($_POST['materials'][1]['content']);
        }
        if (strlen($_POST['materials'][2]['content']) > 5) {
            $_POST['materials'][2]['content'] = prep_url($_POST['materials'][2]['content']);
        }
    }

    public function rate_up($uid)   // called when user clicks Rate Up 
    {
        $this->load->model('units_m');          // load the model
        $this->units_m->set_rate_up($uid);      
        $this->show($uid);                      // reload the page
    }
    
    public function rate_down($uid) // called when user clicks Rate Up 
    {
        $this->load->model('units_m');          
        $this->units_m->set_rate_down($uid);      
        $this->show($uid); 
    }
}
