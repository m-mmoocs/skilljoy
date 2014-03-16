<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Units extends MY_Controller {

    public function index() {
        
    }

    public function show($id) {
        $this->load->model('units_m');
        if (isset($_POST['add_questions'])) {  // if user has clicked the submit button
             $this->units_m->save_question($_POST);
             header('Location:' . base_url('units/show/'.$id));
             exit();
        }
        
        if( isset($_POST['add_answers'])){
            $this->units_m->save_answers($_POST);
            header('Location:' . base_url('units/show/'.$id));
            exit();
        }
        
        if (isset($_POST['rate_up']))
        {
            $this->units_m->set_rate_up($_POST['unit_id']);
        }
        
        if (isset($_POST['rate_down']))
        {
            $this->units_m->set_rate_down($_POST['unit_id']);
        }
        
        $this->load->model('subjects_m');
        if(!$unit=$this->units_m->get_unit_with_id($id)){
            header('Location:'.base_url());
            exit();
        }
        
        $page = new Page('unit');
        if ($subjects = $this->subjects_m->get_subjects_for_unit($unit->id))
        {   // ensures there are returned rows before sending to page
            $page->Data('subjects', $subjects);
        }
        $page->Data('unit', $unit);
        $page->show();
        
    }

    public function save_unit() {
        $this->load->model('units_m');
        $this->load->model('materials_m');
        $this->load->model('subjects_m');

        if (!$this->user || $this->user->status() !== 'active') {
            header("Location:" . base_url());
            exit();
        }

        if (isset($_POST['add_unit'])) {  // if user has clicked the Save button
            if ($this->chk_add_unit_form()) {      // if the form has been validated
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

    public function chk_add_unit_form() {      // returns true/false
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
    
    
    public function create_series()
    {
        $this->load->model('units_m');
        $this->load->model('subjects_m');
        $avail_units = array();
        $selected_units_list = array(); // this holds a list of selected unit numbers
        $selected_units = array();
        $ctr = 0;
        $bump_error = "";
        $add_remove_error = "";
        if (!isset($_POST['subject_filter']))   // if no filter was set
            $_POST['subject_filter'] = 'all';   // then default to all

        
        if (isset($_POST['current_selected_units'])) {
            $selected_units_list = $_POST['current_selected_units'];
        }   // ------ $selected_units_list is a list of unit numbers that has been selected

        if (isset($_POST['add_to_selected'])) {
            if (isset($_POST['available_units'])) {
                array_push($selected_units_list, $_POST['available_units']);
            } else {
                $add_remove_error .= "Error: Select one of the units from the left before clicking Add.";
            }
        }   // ------ adds the available unit # to the list of units that are selected

        if (isset($_POST['remove_from_selected'])) {
            if (isset($_POST['selected_units'])) {
                $ctr = 0;
                foreach ($selected_units_list as $unit_id) {
                    if ($unit_id == $_POST['selected_units']) {
                        array_splice($selected_units_list, $ctr, 1);
                    }
                    $ctr++;
                }
            } else {
                $add_remove_error .= "Error: Select one of the units from the right before clicking Remove.";
            }
        }   // ------ loops through the list of selected units and removes the desired unit

        if (isset($_POST['bump_unit_up'])) {
            if (!isset($_POST['selected_units'])) {
                $bump_error .= "Error: Select one of the units from the right before clicking Bump Up.";
            } else if ($_POST['selected_units'] == $selected_units_list[0]) {
                $bump_error .= "Error: The first unit cannot be bumped up.";
            } else {
                $ctr = 0;
                $tmp = 0;
                foreach ($selected_units_list as $unit_id) {
                    if ($unit_id == $_POST['selected_units']) {
                        $tmp =$selected_units_list[$ctr - 1];
                        $selected_units_list[$ctr - 1] = $selected_units_list[$ctr];
                        $selected_units_list[$ctr] = $tmp;
                    }
                    $ctr++;
                }
            }
        }   // ----- swaps the requested unit with the one above it
        
        if (isset($_POST['bump_unit_down'])) {
            if (!isset($_POST['selected_units'])) {
                $bump_error .= "Error: Select one of the units from the right before clicking Bump Down.";
            } else if ($_POST['selected_units'] == $selected_units_list[count($selected_units_list)-1]) {
                $bump_error .= "Error: The last unit cannot be bumped down.";
            } else {
                $ctr = 0;
                $tmp = 0;
                foreach ($selected_units_list as $unit_id) {
                    if ($unit_id == $_POST['selected_units']) {
                        $tmp =$selected_units_list[$ctr + 1];
                        $selected_units_list[$ctr + 1] = $selected_units_list[$ctr];
                        $selected_units_list[$ctr] = $tmp;
                    }
                    $ctr++;
                }
            }
        }   // ----- swaps the requested unit with the one below it
        
        if (isset($_POST['create_series']))
        {
            if ($this->check_save_series_form()) {      // if the form has been validated
                $this->smrke->debug("Validation Passed");
                header('Location:' . base_url());
                exit();
            }
        }
        
        $avail_units = $this->get_available_units($avail_units, $_POST['subject_filter']);
        $selected_units = $this->get_selected_units($selected_units_list);
        $avail_units = $this->trim_available_array($avail_units, $selected_units_list);
        $page = new Page('series');
        $page->Data('add_remove_error', $add_remove_error);
        $page->Data('bump_error', $bump_error);
        $page->Data('avail_units', $avail_units);
        $page->Data('selected_units', $selected_units);
        $page->Data('subjects', $this->subjects_m->get_all_subjects());
        $page->content('save_series-v');
        $page->show();
    }
    
    private function check_save_series_form()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('series_title', 'Series Title', 'required|trim|xss_clean');
        $this->form_validation->set_rules('description', 'Series Description', 'trim|xss_clean');
        $this->form_validation->set_rules('current_selected_units[]', 'Selected Units', 'required');
        if ($this->form_validation->run() == TRUE) {
            return TRUE;
        }
    }            
    private function get_available_units($avail_units, $filter) {
        $this->load->model('units_m');
        $this->load->model('subjects_m');
        if ($filter != 'all')
        {
            if ($unit_id_list = $this->subjects_m->get_units_for_subject($filter)) {        // get all the relevant unit ids
                foreach ($unit_id_list as $unit_id) {                                       // for each of the units
                    array_push($avail_units, $this->units_m->get_unit_with_id($unit_id->id));   // add details to the list of available units
                    }
                }
            } else {    // otherwise filter wants everything
        $avail_units = $this->units_m->get_all_units();
            }
            return $avail_units;
}

private function get_selected_units($selected_list)
    {
        $this->load->model('units_m');
        $selected_units = array();
        foreach ($selected_list as $selected_unit_id)
        {
            array_push($selected_units, $this->units_m->get_unit_with_id($selected_unit_id));
        }
        return $selected_units;
    }
    
    private function trim_available_array($available, $selected_list) {
        // this array takes the full list of available units, and removes entries where it's been selected
        foreach ($selected_list as $selected_unit_id) {   // for every number on the selected list
            $ctr = 0;
            foreach ($available as $a) {        // match with every entry that is available
                if ($selected_unit_id == $a->id) {   // if the the selected number is on the available list
                    array_splice($available, $ctr, 1);  // remove the available entry
                }
                $ctr++;
            }
        }
        return $available;
    }

}
