<?php

include 'conn.php';
$first_name = mysqli_real_escape_string($connect, $_POST['first_name']);
$last_name = mysqli_real_escape_string($connect, $_POST['last_name']);
$password =  mysqli_real_escape_string($connect, $_POST['password']);
$status =  mysqli_real_escape_string($connect, $_POST['status']);
$Year = mysqli_real_escape_string($connect, $_POST['Year']);
$Month = mysqli_real_escape_string($connect, $_POST['Month']);
$Date = mysqli_real_escape_string($connect, $_POST['Date']);
if ($Year != '' && $Month != '' && $Date != '') 
   {
   $dob = $Year.'-'.$Month.'-'.$Date;
     $query = "INSERT INTO user (first_name,last_name,password,dob,status,contact_id)
	  			  VALUES('$first_name', '$last_name','$password','$dob','$status',0)";
   }  
else
   {

	 $query = "INSERT INTO user (first_name,last_name,password,status,contact_id)
	  			  VALUES('$first_name', '$last_name','$password','$status',0)";
    //  echo "Please Select Day, Month and Year!!!";
   }   
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$phone = intval($phone);
$email =  mysqli_real_escape_string($connect, $_POST['email']);
$address = mysqli_real_escape_string($connect, $_POST['address']);
$query2 = "INSERT INTO contact (phone,email,address) VALUES('".$phone."','".$email."','".$address."')";


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


