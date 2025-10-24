<?php
include('include/config.php');

// Doctor list (HTML option)
if(!empty($_POST["specilizationid"])) 
{
    $spec = mysqli_real_escape_string($con, $_POST['specilizationid']);
    $sql = mysqli_query($con, "SELECT doctorName,id FROM doctors WHERE specilization='$spec'");
    ?>
    <option selected="selected">Select Doctor </option>
    <?php
    while($row = mysqli_fetch_array($sql)){ ?>
        <option value="<?php echo htmlentities($row['id']); ?>">
            <?php echo htmlentities($row['doctorName']); ?>
        </option>
    <?php }
    exit;
}

// Doctor details (JSON)
if(!empty($_POST["doctor"])) 
{
    $docId = (int) $_POST['doctor']; // safe integer cast
    $sql = mysqli_query($con, "SELECT id, doctorName, docFees, docImage, available_days, address, contactno, docEmail 
                               FROM doctors WHERE id='$docId'");
    if(mysqli_num_rows($sql) > 0){
        $doctor = mysqli_fetch_assoc($sql);
        if(!empty($doctor['docImage'])){
            $doctor['docImage'] = 'admin/doctor-images/'.$doctor['docImage'];
        }
        echo json_encode($doctor);
    } else {
        echo json_encode(["error" => "Doctor not found"]);
    }
    exit;
}
?>
