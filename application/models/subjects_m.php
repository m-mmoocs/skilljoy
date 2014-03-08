<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Subjects_m extends MY_Model{	

	function __construct(){
		parent::__construct();
	}
        
        public function get_all_subjects()
        {
            $sql = "SELECT id, name FROM subjects "
                    . "WHERE status <> 'pending' AND deleted_at IS NULL ORDER BY name";
            $q = $this->db->query($sql);
            if ($q->num_rows > 0) {
                $q = $q->result();
                return $q;
            } else {
                return FALSE;
            }
        }

        public function get_subjects_for_unit($id) {
            $sql = "SELECT subjects.id, subjects.name FROM units_subject "
                    . "INNER JOIN subjects ON units_subject.subject_id = subjects.id "
                    . "WHERE unit_id = ? AND status <> 'pending'";
            $q = $this->db->query($sql, $id);
            if ($q->num_rows > 0) {
                $q = $q->result();
                return $q;
            } else {
                return FALSE;
            }
        }
        
        public function get_units_for_subject($id) {
            $sql = "SELECT units.id, subjects.name FROM units "
                    . "INNER JOIN units_subject ON units.id = units_subject.unit_id "
                    . "INNER JOIN subjects ON units_subject.subject_id = subjects.id "
                    . "INNER JOIN rating ON units.id = rating.unit_id "
                    . "WHERE subject_id = ? "
                    . "ORDER BY rating DESC";
            $q = $this->db->query($sql, $id);
            if ($q->num_rows > 0) {
                $q = $q->result();
                return $q;
            } else {
                return FALSE; }
        }
        
        public function add_subject($arr) {
            $args = array();
            $field_names = "";
            $values = "";
            foreach($arr as $key => $value){
                $field_names .= $key.",";
                $args[] = $value;
                $values .= "?,";
            }
            $field_names.='created_at,';
            $args[] = date( 'Y-m-d H:i:s',time());
            $field_names.='created_by';
            $args[] = ip2long($_SERVER['REMOTE_ADDR']);
            $values .= "?,?";
         
            $sql = "INSERT INTO subjects ($field_names) VALUES ($values)";
            if($this->db->query($sql,$args)){
                // return newly created user id
                $sql = "SELECT LAST_INSERT_ID() AS id FROM subjects";
                $q = $this->db->query($sql);
                $q = $q->result();
                return $q[0]->id;
            }
            else return FALSE;
        }   // end add_subject()
        
        public function add_subject_tags($uid, $sid)
        {
            $args[] = $uid;
            $args[] = $sid;
            $sql = "INSERT INTO units_subject"
                    . "(unit_id, subject_id) "
                    . "VALUES (?,?)";
            if ($this->db->query($sql, $args)) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
}

