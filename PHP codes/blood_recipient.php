<?php

include 'conn.php';
$blood_type = mysqli_real_escape_string($connect, $_POST['blood_type']);
$amount = mysqli_real_escape_string($connect, $_POST['amount']);
//$blood_type2 ="A+";

    //$sql="update blood as b set b.blood_type='$blood_type' where b.donor_id=(select max(d.donor_id) from donor as d)";

  $sql = ("UPDATE blood as b SET b.blood_type = '$blood_type',b.amount= '$amount', b.recipient_id= (select max(r.recipient_id) from recipient as r)WHERE b.recipient_id=(select max(r.recipient_id) from recipient as r)");
     if ($connect->query($sql) === TRUE) {
    echo "blood type, recepient id , amount added";
 
  } else {
    echo "Error: " . $query . "<br>" . $connect->error;
  }
  
  $connect->close();
?>