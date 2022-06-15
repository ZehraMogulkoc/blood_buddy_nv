<?php

include 'conn.php';
$first_name = mysqli_real_escape_string($connect, $_POST['first_name']);
$last_name = mysqli_real_escape_string($connect, $_POST['last_name']);
$status =  mysqli_real_escape_string($connect, $_POST['status']);
//$Date = mysqli_real_escape_string($connect, $_POST['Date']);
$Year = mysqli_real_escape_string($connect, $_POST['Year']);
$Month = mysqli_real_escape_string($connect, $_POST['Month']);
$Day = mysqli_real_escape_string($connect, $_POST['Day']);
  
if ($Year != '' && $Month != '' && $Day != '') 
   {
   $dob = $Year.'-'.$Month.'-'.$Day;
$query = "INSERT INTO user (first_name,last_name,status,dob,contact_id)
            VALUES('$first_name', '$last_name','$status','$dob',0)";
   }  
else
   {

  $query = "INSERT INTO user (first_name,last_name,status,contact_id)
            VALUES('$first_name', '$last_name','$status',0)";
    //  echo "Please Select Day, Month and Year!!!";
   }  
   
    //  echo "Please Select Day, Month and Year!!!";
 
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$phone = intval($phone);
$address = mysqli_real_escape_string($connect, $_POST['address']);
$query2 = "INSERT INTO contact (phone,address) VALUES('".$phone."','".$address."')";


 $sql = ("UPDATE user as u SET u.contact_id = (select max(c.contact_id) from contact as c) Where  contact_id=0;");


 
	     
	    if ($connect->query($query) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
    if ($connect->query($query2) === TRUE) {
  echo "New contact record created successfully";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}

if ($connect->query($sql) === TRUE) {
  echo "contact id is added";
} else {
  echo "Error: " . $query . "<br>" . $connect->error;
}
$connect->close();
?>


