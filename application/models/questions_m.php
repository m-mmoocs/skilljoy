<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Questions_m extends MY_Model{	

	function __construct(){
		parent::__construct();
	}
        
	public function get_question_with_unit_id($id){
            $sql = "SELECT *,questions.id, users.firstname AS user_name FROM questions INNER JOIN users ON questions.user_id = users.id WHERE unit_id = ? ORDER BY questions.id";
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
        
     public function get_rating_with_unit_id($id)
     {
            $sql = "SELECT * FROM questions WHERE unit_id = ? ORDER BY questions.id";
            $q = $this->db->query($sql,$id);
            if($q->num_rows >= 1){
                $q = $q->result();
                $q3= array();
                foreach($q as $q2)
                {
                    $s = $this->rating_calculation($q2->id);
                    array_push($q3, $s);
                }
                return $q3;
            
            }
     }
     
     public function get_question_rating_total($question_id)
     {
         $sql = "SELECT COUNT(rating) as total FROM question_rating WHERE question_id=?";
         $q = $this->db->query($sql,$question_id);
         $q = $q->result();
         return $q[0]->total;
     }
     
     public function get_question_rating_up($question_id)
     {
         $sql = "SELECT COUNT(rating) as positive_total FROM question_rating WHERE question_id=? AND rating='1'";
         $q = $this->db->query($sql,$question_id);
         $q = $q->result();
         return $q[0]->positive_total;   
     }
     
     public function get_question_rating_down($question_id)
     {
         $sql = "SELECT COUNT(rating) as negative_total FROM question_rating WHERE question_id=? AND rating='-1'";
         $q = $this->db->query($sql,$question_id);
         $q = $q->result();
         return $q[0]->negative_total;   
     }
     
     public function rating_calculation($question_id)
     {
         $total = $this->get_question_rating_total($question_id);
         $positive = $this->get_question_rating_up($question_id);
         $negative = $this->get_question_rating_down($question_id);
         $cal_arr = array();
         if( $total > 0)
         {
            $p_cal = round(($positive/$total)*100);
            $n_cal = round(($negative/$total)*100);
         }
         else
         {
             $p_cal = 0;
             $n_cal = 0;
         }
         array_push($cal_arr, $p_cal);
         array_push($cal_arr,$n_cal);
         return ($cal_arr); //array[0] is the % for positive votes , array[1] is the % for negative votes
     }
     
     public function rating_check_conflicts($question_id , $user_id)
     {
         $args = array($question_id, $user_id);
         $sql = "SELECT id FROM question_rating WHERE question_id = ? AND user_id = ?";
         $q = $this->db->query($sql,$args);
         $q = $q->result();
         return $q;
     }
        
}

