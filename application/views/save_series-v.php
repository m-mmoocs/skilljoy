<h2>Create a Series</h2>

<form action="" method="post">
    <br />
    <label for='series_title'>Title for Series: </label>
    <input type='text' name='series_title' value='<?php if (isset($_POST['series_title'])) echo ($_POST['series_title']); ?>' /><?php if (isset($_POST['create_series'])) echo form_error('series_title');?>
    <br />
    <br />
    <label for='description'>Description: </label>
    <textarea name='description' rows='5' cols='60'><?php if (isset($_POST['description'])) echo ($_POST['description']); ?></textarea>
    <br />
    <hr>
    <br />
    <div id='subject-chooser'>
        <label for='subject_filter'>Filter units by subject: </label>
        <select name='subject_filter'>
            <option value='all' >All Subjects</option>
            <?php
            foreach ($subjects as $s)
                if (isset($_POST['subject_filter']) && ($_POST['subject_filter'] == $s->id)) {
                    echo "<option value='" . $s->id . "' selected>" . $s->name . "</option>";
                } else {
                    echo "<option value='" . $s->id . "'>" . $s->name . "</option>";
                }
            ?>
        </select>
        <input type='submit' name='apply_subject_filter' value='Apply Filter / Refresh Unit List' />
    </div>
    <br />
    <?php if (isset($add_remove_error)) {echo $add_remove_error;} ?>
    <?php if (isset($bump_error)) {echo $bump_error;} ?>
    <br />
    <table name="select_units">
        <tr>
            <td align="center">Available Units</td><td align="center"></td><td align="center">Selected Units</td>
        </tr>
        <tr>
            <br />
            <td align="center"></td>
            <td align="center"></td>
            <td align="center"><?php if (isset($_POST['create_series'])) echo form_error('current_selected_units[]');?></td>
        </tr>
        <tr>
            <td height='100%'>
                <div id='available-units'>
                    <select name='available_units' size='15' style='width: 300px'>
                        <?php
                        foreach ($avail_units as $u) {
                            if (isset($_POST['available_units']) && $_POST['available_units'] == $u->id) {
                                echo "<option value='" . $u->id . "' selected>" . $u->title . "</option>";
                            } else {
                                echo "<option value='" . $u->id . "' >" . $u->title . "</option>";
                            }
                        }
                        ?>
                    </select>
                </div>
            </td>
            <td style='vertical-align: middle;' align='center' height='100%'>
                <div id='add-remove-unit'>
                    <input type='submit' name='add_to_selected' value='--> Add -->' />
                    <br />
                    <input type='submit' name='remove_from_selected' value='<-- Remove <--' />

                </div>
            </td>
            <td height='100%'>
                <div id='selected-units'>
                    <select name='selected_units' size='15' style='width: 300px'>
                        <?php
                        $ctr = 1;
                        foreach ($selected_units as $selected) {
                            echo "<option value='" . $selected->id . "'>" . $ctr++ . " : " . $selected->title . "</option>";
                        }
                        ?>
                    </select>
                    <?php
                    foreach ($selected_units as $selected) {
                        echo "<input type='hidden' name='current_selected_units[]' value='" . $selected->id . "' >";
                    }
                    ?>
                </div>  
            </td>
            <td style='vertical-align: middle;' align='center' height='100%'>
                <div id='add-remove-unit'>
                    <input type='submit' name='bump_unit_up' value='Bump Unit Up' />
                    <br />
                    <input type='submit' name='bump_unit_down' value='Bump Unit Down' />
                </div>
            </td>
        </tr>
        <tr>
            <td></td><td></td><td><input type='submit' name='create_series' value='Create Series' /></td>
        </tr>
    </table>
</form>