<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Questions_m extends MY_Model{	

	function __construct(){
		parent::__construct();
	}
        
	public function get_question_with_unit_id($id){
            $sql = "SELECT *,questions.id, users.firstname AS user_name FROM questions INNER JOIN users ON questions.user_id = users.id WHERE unit_id = ? ";
            $q = $this->db->query($sql,$id);
            $q = $q->result();
            return $q;
        } 
        
        public function get_answer_with_unit_id($id){
            $sql = "SELECT * FROM questions WHERE unit_id = ?";
            $q = $this->db->query($sql,$id);
            if($q->num_rows >= 1){
                $q = $q->result();
                $q3= array();
                $this->load->model('answers_m');
                foreach($q as $q2)
                {
                   array_push($q3, $this->answers_m->get_answer_with_id($q2->id));
                }
                $q2->ans = $q3;
                return $q2->ans;
            
            }
        }
        
         public function add_questions($arr){
             
            $args = array();
            $field_names = "";
            $values = "";
            foreach($arr as $key => $value){ 
               
                $field_names .= $key.",";
                $args[] = $value;
                $values .= "?,";
            }
           
            $field_names .='user_id';
            $args[] =$this->user->Data('id');
            $values .= "?";
             
            $sql = "INSERT INTO questions ($field_names) VALUES ($values)";
            if($this->db->query($sql,$args)){
                $sql = "SELECT LAST_INSERT_ID() AS id FROM questions";
                $q = $this->db->query($sql);
                $q = $q->result();
                return $q[0]->id;
            }
            else return FALSE;
        }
        
}

