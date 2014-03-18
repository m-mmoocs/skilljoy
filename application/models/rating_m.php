<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Rating_m extends MY_Model{	

     public function get_rating_with_unit_id($id)
     {
            $sql = "SELECT * FROM questions WHERE unit_id = ?";
            $q = $this->db->query($sql,$id);
            if($q->num_rows >= 1){
                $q = $q->result();
                $q3= array();
             
                foreach($q as $q2)
                {
                  // array_push($q3, $this->get_question_rating_total($q2->id),$this->get_question_rating_up($q2->id));
                  // array_push($q3, $this->get_question_rating_up($q2->id));
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
        //$this->smrke->Debug($q);
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
         return ($cal_arr); //array[0] is the total for positive votes , array[1] is the total for negative votes
     }
     
     public function rating_check_conflicts($question_id , $user_id)
     {
          //$this->smrke->Debug($args);
         $args = array($question_id, $user_id);
         $sql = "SELECT id FROM question_rating WHERE question_id = ? AND user_id = ?";
         $q = $this->db->query($sql,$args);
         $q = $q->result();
         //$this->smrke->Debug($q);
         return $q;
     }
}