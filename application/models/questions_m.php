<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Questions_m extends MY_Model{	

	function __construct(){
		parent::__construct();
	}
        
	public function get_question_with_unit_id($id){
            $sql = "SELECT * FROM questions WHERE unit_id = ? ";
            $q = $this->db->query($sql,$id);
            $q = $q->result();
            return $q;
        } 
        
        public function get_answer_with_unit_id($id){
            $sql = "SELECT * FROM questions WHERE unit_id = ?";
            //$sql = $sql = "SELECT * FROM answers WHERE question_id = 1";
            $q = $this->db->query($sql,$id);
            
                $q = $q->result();
                $q2 = $q[0];
                $this->load->model('answers_m');
                $q2->ans = $this->answers_m->get_answer_with_id($q2->id);
                return $q2->ans;
            
            
        }
        
}

