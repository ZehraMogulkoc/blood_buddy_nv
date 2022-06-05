<?php

include 'conn.php';

$a = 'Donor';
$query = "
CREATE  TRIGGER test_donor after INSERT
ON user
FOR EACH ROW
If NEW.status='".$a."' Then
BEGIN
  INSERT INTO bloodbuddy.donor(user_id) VALUES(NEW.user_id);
END; END If  " ;
	 
	    if ($connect->query($query) === TRUE) {
  echo "New record created successfully to donor table";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
  


$connect->close();
?>