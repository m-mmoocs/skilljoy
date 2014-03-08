<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Units_m extends MY_Model{	

	function __construct(){
		parent::__construct();
	}

        public function get_all_units(){
            $sql = "SELECT * FROM units WHERE deleted_at IS NULL";
            $q = $this->db->query($sql);
            return $q->result();
        }
        
        public function get_unit_with_id($id){
            $sql = "SELECT * FROM units WHERE id = ? AND deleted_at IS NULL";
            $q = $this->db->query($sql,$id);
            if($q->num_rows == 1){
                $q = $q->result();
                $unit = $q[0];
                $this->load->model('materials_m');
                $unit->materials = $this->materials_m->get_materials_with_unit_id($unit->id);
                $unit->primary_material = $this->materials_m->get_primary_materials_with_unit_id($unit->id);
                $unit->secondary_material = $this->materials_m->get_secondary_materials_with_unit_id($unit->id);
                $unit->rate_status = $this->rating_info_for_unit($unit->id);
                $this->load->model('questions_m');
                $unit->questions = $this->questions_m->get_question_with_unit_id($unit->id);
                $unit->answers = $this->questions_m->get_answer_with_unit_id($unit->id);
                return $unit;
            }
            else return FALSE;
        } // end get_unit_with_id
       
        
        public function save_unit($arr){
            $unit = array(
                'user_id' => $this->user->Data('id'),
                'title' => $arr['title'],
                'description' => $arr['description'] );
            $unit_id = $this->add_unit($unit);

            if (isset($arr['new_subject']) && strlen($arr['new_subject']) > 3)      // check that a new subject was entered
            {                                                                       // (to combat empty subject names showing up)
                $subject = array('name' => $arr['new_subject']);                    // format the new subject
                $subject_id = $this->subjects_m->add_subject($subject);             // add the new subject to subjects table
            }
            if (count($arr['subjects']) > 0)                                        // check that there is an array 'subjects'
            {                                                                   
                if (isset($subject_id))                                             // if a new subject was created
                {
                    array_push($arr['subjects'], $subject_id);                      // then add the new subject to the array of subjects selected
                }
                foreach($arr['subjects'] as $subject_id){                           // for each subject related to the unit
                    $this->subjects_m->add_subject_tags($unit_id, $subject_id);     // create a relation in units_subject table
                }
            }
            else                                                                    // otherwise, no other subjects have been selected
            {
                $this->subjects_m->add_subject_tags($unit_id, $subject_id);         // just create a relation with the new subject
            }

            foreach($arr['materials'] as $material){
                if( strlen($material['content']) > 5 ){ // string length check is needed or it tries to load content of empty field
                        $material = array(
                            'unit_id' => $unit_id,
                            'content' => $material['content'],    // insert trimmed content or url here
                            'content_type' => $material['content_type'],   // insert the content_type id
                            'primary_mat' => $material['primary_mat'] );
                    $this->materials_m->add_material($material);
                }
            }
        } // end save_unit
        
        public function save_question($arr){
            $this->load->model('questions_m');
            $quest = array('unit_id' => $arr['unit_id'],'question'=> $arr['question']); //for adding question
            $this->questions_m->add_questions($quest); //for adding question
        }
        
        public function save_answers($arr){
            $this->load->model('answers_m');
            $quest = array('question_id' => $arr['question_id'],'answers'=> $arr['answers']); //for adding answer
            $this->answers_m->add_answers($quest); //for adding answer
        }
        
        public function add_unit($arr){
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
         
            $sql = "INSERT INTO units ($field_names) VALUES ($values)";
            if($this->db->query($sql,$args)){
                // return newly created user id
                $sql = "SELECT LAST_INSERT_ID() AS id FROM units";
                $q = $this->db->query($sql);
                $q = $q->result();
                return $q[0]->id;
            }
            else return FALSE;
        } // end function add_unit
        
        public function update_unit($args){
            $a = array();
            $sql = "UPDATE units SET";
            foreach ($args as $key => $value) {
                    $sql .= " ".$key."= ?,";
                    $a[]=$value;
            }
            $sql = trim($sql,',');
            $sql .= " WHERE id = ?";
            $a[] = $id;
            return $this->db->query($sql,$a);    
        } // end function update_unit
        
        public function delete_unit($id){
            $sql = "UPDATE units SET
            deleted_at = ?, deleted_by = ? WHERE id = ?";
            return $this->db->query($sql,array(date('',time()),  ip2long($_SERVER['REMOTE_ADDR']),$id));            
        } // end function delete_unit
        
        public function rating_info_for_unit($id)   // this calls the following 3 functions and returns the package to controller
        {
            $stats = array();
            if($this->user && $this->user->status()==='active')         // if user has logged in
            {
                $stats['has_rated'] = $this->user_has_rated_unit($id);  // then check if user has voted on this unit
            }
            $stats['total_rates'] = $this->total_ratings_for_unit($id);          // get the total times this unit has been voted on
            if ($stats['total_rates'] > 0)                  // avoids a divide by zero if unit has never been rated
            {                                               // then gets the percentage of positive votes versus total votes
                $stats['percentage'] = round(($this->positive_ratings_for_unit($id)/$stats['total_rates'])*100);
            } else {
                $stats['percentage'] = 0;                   // or set percentage to zero if there's been no votes
            }
            return $stats;                                  // send all the info back to controller
        }
        
        
        public function user_has_rated_unit($id)
        {  // this returns 1 if user has rated up, -1 if user has rated down, 0 if nothing was rated
            $status = array();
            $args = array('user_id' => $this->user->Data('id'),'unit_id' => $id,);
            $sql = "SELECT * FROM rating WHERE user_id = ? AND unit_id = ?";
            $q = $this->db->query($sql,$args); 
            if ($q->num_rows == 0)  // if no results came up, then user hasn't rated the unit
            { return 0; }
            else                    // otherwise user has rated before
            {
                $q = $q->result();
            return $q[0]->rating;
            }
        }
        
        public function positive_ratings_for_unit($id)
        {   // this returns the number of positive ratings
            $sql = "SELECT COUNT(*) AS positive FROM rating WHERE unit_id = ? AND rating = '1'";
            $q = $this->db->query($sql, $id);
            $q = $q->result();
            return ($q[0]->positive);
        }
        
        public function total_ratings_for_unit($id)
        {   // this returns the total number of times this unit has been voted on
            $sql = "SELECT COUNT(*) AS total FROM rating WHERE unit_id = ?";
            $q = $this->db->query($sql, $id);
            $q = $q->result();
            return ($q[0]->total);
        }
        
        public function set_rate_up($id)
        {
            $args = array('user_id' => $this->user->Data('id'),'unit_id' => $id,);
            $curr_rating = $this->user_has_rated_unit($id);
            if ($curr_rating == 0) // if no rating exists
            {
                $sql = "INSERT INTO rating (user_id, unit_id, rating) VALUES (?, ?, '1')";
            } else {// otherwise the user had rated down (rated up can't be accessed twice because option not available)
                $sql = "UPDATE rating SET rating = '1' WHERE user_id = ? AND unit_id = ?";
            }
            $this->db->query($sql, $args);
        }
        
        public function set_rate_down($id)
        {
            $args = array('user_id' => $this->user->Data('id'),'unit_id' => $id,);
            $curr_rating = $this->user_has_rated_unit($id);
            if ($curr_rating == 0) // if no rating exists
            {
                $sql = "INSERT INTO rating (user_id, unit_id, rating) VALUES (?, ?, '-1')";
            } else {// this sets up rating to -1
                $sql = "UPDATE rating SET rating = '-1' WHERE user_id = ? AND unit_id = ?";
            }
            $this->db->query($sql, $args);
        }
}

