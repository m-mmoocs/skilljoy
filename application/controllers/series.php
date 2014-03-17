<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Series extends MY_Controller {

    public function index() {
        
    }

    public function show($id) {
        $this->load->model('series_m');
        $current_unit = 0;  // this is the unit (# on the series) user is currently viewing
        $series = $this->series_m->get_series_with_id($id);

        if (isset($_POST['curr_unit'])) {
            $current_unit = $_POST['curr_unit'];
        }
        if (isset($_POST['mark_as_complete'])) {
            $this->series_m->mark_unit_in_series_as_complete($series->unit[$current_unit]->id, $series->id);
            $_POST['next_unit'] = 'Proceed';
        }
        if (isset($_POST['mark_as_incomplete'])) {
            $this->series_m->mark_unit_in_series_as_incomplete($series->unit[$current_unit]->id, $series->id);
        }
        if (isset($_POST['previous_unit']) && $current_unit != 0) {
            $current_unit--;
        }
        if (isset($_POST['next_unit']) && $current_unit != count($series->unit) - 1) {
            $current_unit++;
        }
        
        $page = new Page('series');
        $page->Data('completed_units', $this->series_m->get_units_completed_by_user_in_series($series->id));
        $page->Data('current_unit', $current_unit);
        $page->Data('series', $series);
        $page->show();
    }

}
