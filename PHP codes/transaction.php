<?php

include 'conn.php';
$recipient_name = mysqli_real_escape_string($connect, $_POST['recipient_name']);
$donor_id = mysqli_real_escape_string($connect, $_POST['donor_id']);
$emp_id =  mysqli_real_escape_string($connect, $_POST['emp_id']);
$quantity = mysqli_real_escape_string($connect, $_POST['quantity']);
$Year = mysqli_real_escape_string($connect, $_POST['Year']);
$Month = mysqli_real_escape_string($connect, $_POST['Month']);
$Date = mysqli_real_escape_string($connect, $_POST['Date']);
$donor_idi= intval($donor_id);
$emp_idi= intval($emp_id);
$quantityi= intval($quantity);
if ($Year != '' && $Month != '' && $Date != '') 
   {
   $dateout = $Year.'-'.$Month.'-'.$Date;
     $query = "INSERT INTO blood_transacted (recipient_name,donor_id,emp_id,quantity,date_out)
	  			  VALUES('$recipient_name', '$donor_idi','$emp_idi','$quantityi','$dateout')";
   }
else
   {

 $query = "INSERT INTO blood_transacted (recipient_name,donor_id,emp_id,quantity)
            VALUES('$recipient_name', '$donor_idi','$emp_idi','$quantityi')";
 
   }   




	     
	    if ($connect->query($query) === TRUE) {
  echo "New record created successfully to transaction";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
   

$connect->close();
?>
