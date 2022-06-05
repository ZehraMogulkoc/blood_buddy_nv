<?php

include 'conn.php';
$blood_type = mysqli_real_escape_string($connect, $_POST['blood_type']);
$blood_type2 ="A+";
$query = "
CREATE  TRIGGER blood after INSERT
ON donor 
FOR EACH ROW
BEGIN
  INSERT INTO bloodbuddy.blood (blood_type,donor_id) VALUES('$blood_type',NEW.donor_id) ;

END; " ;

       if ($connect->query($query) === TRUE) {
    echo "New record created successfully to blood table";
  } else {
    echo "Error: " . $query . "<br>" . $connect->error;
  }
    //$sql="update blood as b set b.blood_type='$blood_type' where b.donor_id=(select max(d.donor_id) from donor as d)";

  $sql = ("UPDATE blood as b SET b.blood_type = '$blood_type' WHERE b.donor_id=(select max(d.donor_id) from donor as d)");
     if ($connect->query($sql) === TRUE) {
    echo "blood type added";
 
  } else {
    echo "Error: " . $query . "<br>" . $connect->error;
  }
  
  $connect->close();
?>
