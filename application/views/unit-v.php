<?php 

?>

<h2 class="unit-title"><?php echo ucwords($unit->title); ?></h2>

<p  class="unit-description"><?php echo nl2br(ucfirst($unit->description)); ?></p>

<div class="subject_tags">
<hr>
<h3>Tags:</h3>
<?php
if (!empty($subjects))
{
    foreach($subjects as $sub)
    {
        echo '<a href="'.base_url('subjects/show/'.$sub->id).'">'.$sub->name.'</a>  ';
    }
}
else
{
    echo 'This unit has not been tagged to a subject.';
}
?>
</div>
<hr>
<div class="rate">
    <form action="" method="post">
        <input type="hidden" name="unit_id" value="<?php echo $unit->id?>">
    <?php if ($unit->rate_status['total_rates'] == 0): ?>
        <p>This unit has not been voted on!</p>
    <?php else: ?>
        <p> <?php echo $unit->rate_status['positive']; ?>% positive rating,  <?php echo $unit->rate_status['negative']; ?>% negative rating.</p>
    <?php endif; ?>
    <?php if($this->user && $this->user->status()==='active'): ?>
        Rate this unit: 
        <?php if ($unit->rate_status['has_rated'] == 1): ?>
            <input type="submit" name="rate_down" value="Down">
        <?php elseif ($unit->rate_status['has_rated'] == -1): ?>
            <input type="submit" name="rate_up" value="Up">
        <?php else: ?>
            <input type="submit" name="rate_up" value="Up">
            <input type="submit" name="rate_down" value="Down">
        <?php endif; ?>
    <?php else: ?>
            <p>Log in to vote!</p>
    <?php endif; ?>        
    </form>
</div>
<br />
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
                elseif ($p->content_type == 5) // -------- if it's a slideshare URL
                {
                    $this->load->view('materials/slideshare-v', $p);
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
                elseif ($p->content_type == 5) // -------- if it's a slideshare URL
                {
                    $this->load->view('materials/slideshare-v', $s);
                }           
                else 
                    echo '<a target="_blank" href="'.$s->content.'">'.$s->content;
                echo ' </a><br /><br />';
                }
     ?> 

<form action="" method="post">  
<p>Have a question? Ask here -> 
<?php
if($this->user && $this->user->status()==='active')
{ ?>
<input type="hidden" name="unit_id" value="<?php echo $unit->id; ?>">
<input type ="text" name="question"> <input type="submit" name="add_questions" value="Submit"> 
<?php 
}else{
    echo 'Please login to Ask question';
     } ?> 
</form>
</p><br />
<?php
        echo '<p>Posted Questions</p><br />';
        $i = 0;
        $j = 0;
        foreach($unit->questions as $quest)
        {
           
            echo $quest->question . ' (by '.$quest->user_name.')  ';
            if($unit->rating[$j][0] == 0 && $unit->rating[$j][1] == 0)
            {
               echo 'Currently no one rated yet<br />'; 
            }
            else
            {
                echo $unit->rating[$j][0].'% positive rating, ' . $unit->rating[$j][1] .'% negative rating<br />';
            }
            
            echo '<form action="" method="post">';
            if($this->user && $this->user->status()==='active')
            {
                 echo '<p> Rating: '. '<input type="hidden" name="question_id" value="'.$quest->id. '"> ';
                 echo '<input type="submit" name="question_rate_up" value="Up" /> <input type="submit" name="question_rate_down" value="Down" /><br /></p></form>';
            }
            else 
            {
                 echo 'Please log in to rate the current question <br />';
            }
           
         //  $this->smrke->Debug($unit->rating);
            
            
            foreach($unit->answers[$i] as $ans)
            {   
                    echo 'A: ' . $ans->answers . ' (by '.$ans->user_name .')<br/>';
            }
            
            
            if($this->user && $this->user->status()==='active')
            { 
                echo '<form action="" method="post">';
                echo '<p><input type="hidden" name="question_id" value="'.$quest->id. '"> <input type ="text" name="answers"  > '; 
                echo '<input type="submit" name="add_answers" value="Reply"><br /></p></form>';

            }else
             {
                  echo '<p>Please login to Reply</p>';
            }
            echo '<br />';
            $i++;
            $j++;
        }
?>
</div>

