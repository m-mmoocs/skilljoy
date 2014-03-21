
<h2 class="series-title"><?php echo ucwords($series->title); ?></h2>

<p  class="series-description"><?php echo nl2br(ucfirst($series->description)); ?></p>
<hr>
<form action="<?php echo base_url('series/show/'.$series->id); ?>" method="post">
    <div class="unit-list">
        <?php
        if (isset($series->unit)) {
            $ctr = 0;
            echo '<table>';
            echo '<tr><td width="110px"></td><td><h1>Units in this Series</h1></td></tr>';
            foreach ($series->unit as $unit) {
                echo '<tr>';
                echo '<td width="110px"><a href="'.base_url('units/show/'.$unit->id).'">Link to Unit</a></td>';
                if ($ctr == $current_unit)
                {
                    echo '<td>' . ($ctr + 1) . ' . ' . $unit->title ;
                }
                else
                {
                    echo '<td>' . ($ctr + 1) . ' . <a href="' . base_url('series/show/' . $series->id . '?jump_to=' . $ctr) . '">' . $unit->title . '</a></td>';
                }
                if (!empty($completed_units) && in_array($unit->id, $completed_units))
                {
                    echo '<td><em> (completed)</em></td>';
                }
                
                if ($ctr == $current_unit) {
                    echo '<td><em> <-- You are Here</em><td>';
                }
                echo '</tr>';
                $ctr++;
            }
            echo '</table><br />';
            if (!empty($completed_units) && (count($completed_units) >= $ctr))
            {
                echo '<em>Congratulations, you have completed all the units in this series!</em>';
            }
            echo '<br /><br />';
            if ($series->unit[$current_unit]->primary_material[0]->content_type == 1) { // -------- if it's a youtube video id
                $this->load->view('materials/youtube-v', $series->unit[$current_unit]->primary_material[0]);
            } elseif ($series->unit[$current_unit]->primary_material[0]->content_type == 2) { // -------- if it's a pdf URL
                $this->load->view('materials/pdf-v', $series->unit[$current_unit]->primary_material[0]);
            } elseif ($series->unit[$current_unit]->primary_material[0]->content_type == 3) { // -------- if it's a vimeo URL
                $this->load->view('materials/vimeo-v', $series->unit[$current_unit]->primary_material[0]);
            } elseif ($series->unit[$current_unit]->primary_material[0]->content_type == 5) { // -------- if it's a slideshare URL
                $this->load->view('materials/slideshare-v', $series->unit[$current_unit]->primary_material[0]);
            }
            echo '<br /><br />';
        }
        ?>
    </div>
    <table>
        <tr>
            <td width="250px" align="center">
        <?php
        if ($current_unit != 0) {
            echo '<input type="submit" name="first_unit" value="<< First Unit">';
            echo '<input type="submit" name="previous_unit" value="< Previous Unit">';
        }
        ?>
            </td>
            <td width="300px" align="center">
        <?php
        if ($this->user->status() != 'anonymous') {
            if (!empty($completed_units) && in_array($series->unit[$current_unit]->id,$completed_units))
            {
                    echo '<em>You have completed this unit.</em><br /><input type="submit" name="mark_as_incomplete" value="Mark as Incomplete!">';
            }
            else if ((!empty($completed_units) && !in_array($series->unit[$current_unit]->id,$completed_units)) || empty($completed_units))
            {
                echo '<input type="submit" name="mark_as_complete" value="Mark this Unit as Complete!">';
            }
        } else {
            echo 'Log in to track progress.';
        }
        ?>

            </td>
            <td width="250px" align="center">
                <?php
                if ($current_unit != ($ctr - 1)) {
                    echo '<input type="submit" name="next_unit" value="Next Unit >">';
                    echo '<input type="submit" name="last_unit" value="Last Unit >>">';
                }
                ?>

            </td>
        </tr>
    </table>
    <input type="hidden" name="curr_unit" value="<?php echo $current_unit ?>" />
</form>
<br />
<br />