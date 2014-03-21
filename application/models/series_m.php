<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Series_m extends MY_Model {

    function __construct() {
        parent::__construct();
    }

    public function get_all_series() {
        $sql = "SELECT * FROM series WHERE deleted_at IS NULL";
        $q = $this->db->query($sql);
        return $q->result();
    }

    public function get_series_with_id($id) {
        $this->load->model('units_m');
        $sql = "SELECT * FROM series WHERE id = ? AND deleted_at IS NULL";
        $q = $this->db->query($sql, $id);
        $series->unit[] = array();
        if ($q->num_rows == 1) {
            $q = $q->result();
            $series = $q[0];     // this is to get the title, id and description
            if ($unit_ids = $this->get_units_with_series_id($series->id)) { // ids are returned as $unit_id[]->unit_id
                foreach ($unit_ids as $unit) {
                    $series->unit[] = $this->units_m->get_unit_with_id($unit->unit_id);
                }
            }
        }
        return $series;
    }

    public function get_units_with_series_id($id) {
        $unit = array();
        $sql = "SELECT unit_id FROM series_units WHERE series_id = ? AND deleted_at IS NULL ORDER BY priority";
        $q = $this->db->query($sql, $id);
        if ($q->num_rows > 0) {
            $q = $q->result();
            return $q;
        } else
            return FALSE;
    }

    function save_series($arr) {
        $ctr = 0;
        $series = array(
            'user_id' => $this->user->Data('id'),
            'title' => $arr['series_title'],
            'description' => $arr['description']);
        if ($series_id = $this->add_series($series)) {
            foreach ($arr['current_selected_units'] as $unit_id) {
                $this->add_series_units_relation($series_id, $unit_id, $ctr);
                $ctr++;
            }
        }
        return $series_id;
    }

    function add_series($arr) {
        $args = array();
        $field_names = "";
        $values = "";
        foreach ($arr as $key => $value) {
            $field_names .= $key . ",";
            $args[] = $value;
            $values .= "?,";
        }
        $field_names.='created_at,';
        $args[] = date('Y-m-d H:i:s', time());
        $field_names.='created_by';
        $args[] = ip2long($_SERVER['REMOTE_ADDR']);
        $values .= "?,?";

        $sql = "INSERT INTO series ($field_names) VALUES ($values)";
        if ($this->db->query($sql, $args)) {
            // return newly created user id
            $sql = "SELECT LAST_INSERT_ID() AS id FROM units";
            $q = $this->db->query($sql);
            $q = $q->result();
            return $q[0]->id;
        } else {
            return FALSE;
        }
    }
// end function add_unit

    function add_series_units_relation($series_id, $units_id, $priority) {
        $args = array($series_id, $units_id, $priority);
        $sql = "INSERT INTO series_units (series_id, unit_id, priority) VALUES (?,?,?)";
        if ($this->db->query($sql, $args)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    function get_units_completed_by_user_in_series($id) {
        $args = array($this->user->Data('id'), $id);
        $unit_id = array();
        $sql = "SELECT series_units.unit_id FROM completed_units INNER JOIN series_units ON completed_units.unit_id = series_units.unit_id WHERE user_id = ? AND series_id = ? AND incomplete_at IS NULL";
        $q = $this->db->query($sql, $args);
        if ($q->num_rows > 0) {
            $q = $q->result();
            foreach ($q as $u)
                $unit_id[] = $u->unit_id;
            return $unit_id;
        } else
            return FALSE;
    }


}
