<h2>Add New Unit</h2>

<form action="" method="post">
    <br>
    <label for="title">Title: </label>
    <input type="text" name="title" value="<?php if (isset($_POST['title'])) echo ($_POST['title']); ?>"><?php if (isset($_POST['add_unit'])) echo form_error('title');?>
    
    <br><br>
    <label for="title">Description: </label>
    <textarea name="description" rows="5" cols="60"><?php if (isset($_POST['description'])) echo ($_POST['description']); ?></textarea>
    <br><br>
    <p>Materials:</p>
    <?php if (isset($_POST['add_unit'])) echo form_error('materials');?>
    <table>
        <tr><td> Primary Content (Required)</td></tr>
        <tr>
            <td><input type="text" name="materials[0][content]" 
           value="<?php if (isset($_POST['materials'][0]['content'])) echo ($_POST['materials'][0]['content']); ?>"></td>
        <input type="hidden" name="materials[0][primary_mat]" value="1">
            <td><?php if (isset($_POST['add_unit'])) echo form_error('materials[0][content]');?></td>
        </tr>
    </table>
    <br><br>
    <table>
        <tr><td>Supporting Content (Optional)</td></tr>
        <tr><td><input type="text" name="materials[1][content]" 
           value="<?php if (isset($_POST['materials'][1]['content'])) echo ($_POST['materials'][1]['content']); ?>"></td>
            <td><?php if (isset($_POST['add_unit'])) echo form_error('materials[1][content]');?></td>
            <input type="hidden" name="materials[1][primary_mat]" value="0">
        </tr>
        <tr><td><input type="text" name="materials[2][content]" 
           value = "<?php if (isset($_POST['materials'][2]['content'])) echo ($_POST['materials'][2]['content']); ?>"></td>
            <td><?php if (isset($_POST['add_unit'])) echo form_error('materials[2][content]');?></td>
            <input type="hidden" name="materials[2][primary_mat]" value="0">
        </tr>
        
    </table>
    <br><br>
    
    <h3>Subjects related to this unit: (Select all that apply)</h3>
    <?php if (count($subjects) > 0) : ?>
    <table cellspacing="10">
        <tr>
            <?php 
            $ctr = 0;
            foreach ($subjects as $s)
            {
                echo '<td><label><input type="checkbox" name="subjects[]" value = "'.$s->id. '"';
                if (isset($_POST['subjects']))
                {
                if (in_array($s->id, $_POST['subjects']))
                {
                    echo ' checked ';
                }
                }
                echo '>'.$s->name.'</label></td>';
                $ctr++;
                if ($ctr == 4)
                {
                    echo '</tr><tr>';
                    $ctr = 0;
                }
            }
            ?>
        </tr>    
    </table>
    <?php else : ?>
    <p>There are no subjects in in the database.</p>
    <?php endif; ?>
    <label for="new_subject"> Suggest a new subject : <input type="text" name="new_subject" 
           value="<?php if (isset($_POST['new_subject'])) echo ($_POST['new_subject']); ?>"></label>
    <br><br>
    <input type="submit" name="add_unit" value="Save">
</form>