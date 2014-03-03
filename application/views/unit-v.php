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
</div>

