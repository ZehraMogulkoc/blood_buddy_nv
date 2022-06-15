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

$b = 'Recipient';
$query2 = "
CREATE  TRIGGER test_recipient after INSERT
ON user
FOR EACH ROW
If NEW.status='".$b."' Then
BEGIN
  INSERT INTO bloodbuddy.recipient(user_id) VALUES(NEW.user_id);
END; END If  " ;

$query3= "
CREATE  TRIGGER blood_recipient after INSERT
ON recipient
FOR EACH ROW
BEGIN
  INSERT INTO bloodbuddy.blood(recipient_id) VALUES(NEW.recipient_id);
END; ";


 $sql = ("UPDATE user as u SET u.contact_id = (select max(c.contact_id) from contact as c) Where  contact_id=0;");
    if ($connect->query($sql) === TRUE) {
      echo "contact id is added";
    } else {
      echo "Error: " . $query . "<br>" . $connect->error;
    }

    if ($connect->query($query2) === TRUE) {
  echo "recipient trigger created ";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
	 
	    if ($connect->query($query) === TRUE) {
  echo "New record created successfully to donor table";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
   
      if ($connect->query($query3) === TRUE) {
  echo "blood trigger";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}


$connect->close();
?>