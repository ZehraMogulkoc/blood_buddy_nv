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
     $query = "INSERT INTO user (first_name,last_name,password,dob,status)
	  			  VALUES('$first_name', '$last_name','$password','$dob','$status')";
   }
else
   {

	 $query = "INSERT INTO user (first_name,last_name,password,status)
	  			  VALUES('$first_name', '$last_name','$password','$status')";
    //  echo "Please Select Day, Month and Year!!!";
   }   
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$phone = intval($phone);
$email =  mysqli_real_escape_string($connect, $_POST['email']);
$address = mysqli_real_escape_string($connect, $_POST['address']);
$query2 = "INSERT INTO contact (phone,email,address) VALUES('".$phone."','".$email."','".$address."')";

	     
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
$connect->close();
?>

