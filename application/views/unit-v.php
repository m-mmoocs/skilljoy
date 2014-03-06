<?php 

?>

<h2 class="unit-title"><?php echo ucwords($unit->title); ?></h2>
 
<p  class="unit-description"><?php echo ucfirst($unit->description); ?></p>
<hr>

<div class="unit-materials">
 
<!-- only shows primary materials --> 
    <?php foreach($unit->primary_material as $p)
    {
                if ($p->content_type == 1) // -------- if it's a youtube video id
                {
                    $this->load->view('materials/youtube-v', $p);
                }
                elseif ($p->content_type == 2) // -------- if it's a pdf URL
                {
                    $this->load->view('materials/pdf-v', $p);
                }
                elseif ($p->content_type == 3) // -------- if it's a vimeo URL
                {
                    $this->load->view('materials/vimeo-v', $p);
                }
                
                echo '<br /><br />';
    }    
    ?>
    
<!-- Show all the secondary materials -->
    <?php   
            foreach($unit->secondary_material as $s){
                
                if ($s->content_type == 1) // -------- if it's a youtube video id
                {
                    $this->load->view('materials/youtube-v', $s);
                }
                elseif ($s->content_type == 2) // -------- if it's a pdf URL
                {
                    $this->load->view('materials/pdf-v', $s);
                }
                elseif ($s->content_type == 3) // -------- if it's a vimeo URL
                {
                    $this->load->view('materials/vimeo-v', $s);
                }
                else 
                    echo '<a target="_blank" href="'.$s->content.'">'.$s->content;
                echo ' </a><br /><br />';
                }
     ?> 
<?php
    if($this->user && $this->user->status()==='active')
    { ?>
<form action="" method="post">  
<p>Have a question? Ask here -> 
<input type="hidden" name="unit_id" value="<?php echo $unit->id; ?>">
<input type ="text" name="question"> <input type="submit" name="add_questions" value="Submit"> 
</form>
</p><br />
<?php
        echo '<p>Posted Questions</p><br />';
        foreach($unit->questions as $quest)
        {
            //$this->smrke->Debug($unit);
            echo $quest->question . ' (by '.$quest->user_name.')<br />';
            
            
            foreach($unit->answers as $ans)
            {   
                if($ans->question_id == $quest->id)
                    echo 'A: ' . $ans->answers . ' (by '.$ans->user_name .')<br/>';
                
            }
            echo '<form action="" method="post">';
            echo '<p><input type="hidden" name="question_id" value="'.$quest->id. '"> <input type ="text" name="answers"  > '; 
            echo '<input type="submit" name="add_answers" value="Reply"><br /></p></form>';
            echo '<br />';
            
            
        }
    }
    else
    {
        echo '<p>Please login to Ask / See Posted Questions</p>';
    }
?>
</div>
