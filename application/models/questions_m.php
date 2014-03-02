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
        
        
}

