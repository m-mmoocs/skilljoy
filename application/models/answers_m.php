<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Answers_m extends MY_Model{	

     public function get_answer_with_id($id){
            $sql = "SELECT * FROM answers";// WHERE question_id = ?";
            $q = $this->db->query($sql,$id);
            $q = $q->result();
            return $q;
     }
     
      public function add_answers($arr){
           
            $args = array();
            $field_names = "";
            $values = "";
            foreach($arr as $key => $value){ 
               
                $field_names .= $key.",";
                $args[] = $value;
                $values .= "?,";
            }
           
            $field_names .='user_name';
            $args[] =$this->user->Data('firstname');
            $values .= "?";
             
            $sql = "INSERT INTO answers ($field_names) VALUES ($values)";
            if($this->db->query($sql,$args)){
                $sql = "SELECT LAST_INSERT_ID() AS id FROM answers";
                $q = $this->db->query($sql);
                $q = $q->result();
                return $q[0]->id;
            }
            else return FALSE;
        }
}