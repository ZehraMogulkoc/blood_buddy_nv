<?php

include 'conn.php';
/*
$sql="SELECT user_id FROM `user`";
$query = "INSERT INTO medical_personnel (hospital_name) VALUES('".$hospital."')";

	  //  $results = mysqli_query($connect, $query);
	     
	    if ($connect->query($query) === TRUE) {
  echo "New record created successfully to medical personnel table";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}*/
$hospital_name = mysqli_real_escape_string($connect, $_POST['hospital_name']);
$a = 'Medical Personnel';
$query = "
CREATE  TRIGGER host_staff after INSERT
ON user
FOR EACH ROW
If NEW.status='".$a."' Then
BEGIN
  INSERT INTO bloodbuddy.medical_personnel (user_id,hospital_name) VALUES(NEW.user_id ,'".$hospital_name."') ;
END; END If  ";
   
      if ($connect->query($query) === TRUE) {
  echo "New record created successfully to medical_personnel table";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
  
$connect->close();
?>