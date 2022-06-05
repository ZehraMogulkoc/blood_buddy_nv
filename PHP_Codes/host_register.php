<?php

include 'conn.php';
$first_name = mysqli_real_escape_string($connect, $_POST['first_name']);
$last_name = mysqli_real_escape_string($connect, $_POST['last_name']);
$password =  mysqli_real_escape_string($connect, $_POST['password']);
$Year = mysqli_real_escape_string($connect, $_POST['Year']);
$Month = mysqli_real_escape_string($connect, $_POST['Month']);
$Date = mysqli_real_escape_string($connect, $_POST['Date']);
if ($Year != '' && $Month != '' && $Date != '') 
   {
   $dob = $Year.'-'.$Month.'-'.$Date;
     $query = "INSERT INTO user (first_name,last_name,password,dob)
	  			  VALUES('$first_name', '$last_name','$password','$dob')";
   }
else
   {

	 $query = "INSERT INTO user (first_name,last_name,password)
	  			  VALUES('$first_name', '$last_name','$password')";
    //  echo "Please Select Day, Month and Year!!!";
   }   
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$phone = intval($phone);
$email =  mysqli_real_escape_string($connect, $_POST['email']);
$address = mysqli_real_escape_string($connect, $_POST['address']);
$query2 = "INSERT INTO contact (phone,email,address) VALUES('".$phone."','".$email."','".$address."')";
	$results2 = mysqli_query($connect, $query2);
	    $results = mysqli_query($connect, $query);
	     
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