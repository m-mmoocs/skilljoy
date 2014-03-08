<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Subjects extends MY_Controller {

    public function index() {
        
    }

    public function show($id)  
    { // this returns all the units that were marked under that subject id
        $this->load->model('subjects_m');
        $this->load->model('units_m');
        $unit = array();
        if(!$result=$this->subjects_m->get_units_for_subject($id)){         // get all the units related to the subject
            header('Location:'.base_url());                       
            exit();
        }
        foreach($result as $r) {    // for each of the units, get the unit details
            array_push($unit, $this->units_m->get_unit_with_id($r->id));    // append to array
        }
        $page = new Page('subjects');
        $page->Data('unit', $unit);                                         // send resulting array to page
        $page->Data('subject_name', $result[0]->name);                      // along with the subject name for display
        $page->show();
    }
}
