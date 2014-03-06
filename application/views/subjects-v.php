<h1>Subject : <?php echo $subject_name; ?> <h1>
<br /><hr><br />
<?php
    foreach($unit as $u)
    {
        echo '<a href="'. base_url('units/show/'.$u->id).'"><h3 class="unit-title">'.$u->title.'</h3></a>';
        foreach($u->primary_material as $p)
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
    }
?>