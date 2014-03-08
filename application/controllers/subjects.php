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
        $page->Data('unit', $this->sort_units_by_rating_percentage($unit)); // send resulting array to page
        $page->Data('subject_name', $result[0]->name);                      // along with the subject name for display
        $page->show();
    }
    
    public function sort_units_by_rating_percentage($unit)
    {
        for ($y = 0; $y < count($unit); $y++)
        {
            for ($x = 0; $x < count($unit)-1; $x++)
            {
                if ($unit[$x]->rate_status['percentage'] < $unit[$x+1]->rate_status['percentage'])
                {
                    $temp = $unit[$x];
                    $unit[$x] = $unit[$x+1];
                    $unit[$x+1] = $temp;
                }
            }
        }
        return $unit;
    }
}
