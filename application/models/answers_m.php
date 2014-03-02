<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Answers_m extends MY_Model{	

     public function get_answer_with_id($id){
            $sql = "SELECT * FROM answers WHERE question_id = ?";
            $q = $this->db->query($sql,$id);
            $q = $q->result();
            return $q;
     }
}