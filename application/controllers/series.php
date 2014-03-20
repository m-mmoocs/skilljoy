<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Series extends MY_Controller {

    public function index() {
        
    }

    public function show($id) {
        $this->load->model('series_m');
        $this->load->model('units_m');
          // this is the unit (# on the series) user is currently viewing
        $current_unit = isset($_GET['show'])?$_GET['show'] : 0;
        
        $this->smrke->debug($series);
        
        if (isset($_POST['mark_as_complete'])) {
            $this->units_m->mark_unit_as_complete($_POST['current_unit_id']);
//            $_POST['next_unit'] = 'Proceed';
            $current_unit++
        }
        if (isset($_POST['mark_as_incomplete'])) {
            $this->units_m->mark_unit_as_incomplete($_POST['current_unit_id']);
        }

        // get series after updating units so it contains changes
        $series = $this->series_m->get_series_with_id($id);
        
        
        
        $page = new Page('series');
        if ($this->user->status() != 'anonymous')
        {
            $page->Data('completed_units', $this->series_m->get_units_completed_by_user_in_series($series->id));
        }
        $page->Data('current_unit', $current_unit);
        $page->Data('series', $series);
        $page->show();
    }

    public function create_series()
    {
        $this->load->model('subjects_m');
        $this->load->model('series_m');
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
                $series_id = $this->series_m->save_series($_POST);
                header('Location:' . base_url('/series/show/'.$series_id));
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
