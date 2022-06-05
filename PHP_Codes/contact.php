<?php

include 'conn.php';

$sql=select contact_id  from bloodbuddy.user where  user_id = (SELECT 
            MAX(user_id)
        FROM
            user); 
$query = "
CREATE  TRIGGER test_user after INSERT
ON contact
FOR EACH ROW
BEGIN
  UPDATE bloodbuddy.user SET $sql = NEW.contact_id;
END";
	 
	    if ($connect->query($query) === TRUE) {
  echo "user trigger sucessfull";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
  


$connect->close();
?>


