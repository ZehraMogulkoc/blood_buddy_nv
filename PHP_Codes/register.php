<?php 
// connect the database with the server
include 'conn.php';
/*//take necessary info from user by using flutter 
$first_name = mysqli_real_escape_string($connect, $_POST['first_name']) ;
$last_name = mysqli_real_escape_string($connect, $_POST['last_name']);
$password = mysqli_real_escape_string($connect, $_POST['password']) ;
$dob = mysqli_real_escape_string($connect, $_POST['dob']);
$phone = mysqli_real_escape_string($connect, $_POST['phone']);   
$email = mysqli_real_escape_string($connect, $_POST['email']) ;
$address = mysqli_real_escape_string($connect, $_POST['address']) ;
*/
$first_name = isset($_POST['first_name']) ;
$last_name = isset($_POST['last_name']);
$password =  isset($_POST['password']);
$dob =  isset($_POST['dob']);
//$phone =  isset($_POST['phone']);   
//$email =  isset($_POST['email']) ;
//$address = isset($_POST['address']);

	 //insert new data to the user table 
$query = "INSERT INTO user (first_name,last_name,password,dob) VALUES('".$first_name."','".$last_name."','".$password."','".$dob."')";
//$query2 = "INSERT INTO contact (phone,email,address) VALUES('".$phone."','".$email."','".$address."')";

$results = mysqli_query($connect, $query);
if($results>0) //if it is added then there should be user more than 0 
{
   echo "user added to DB successfully, user table ";
}else{
   echo "no adding ";
}
 
// $results2 = mysqli_query($connect, $query2);
//if($results>0) //if it is added then there should be user more than 0 
//{
  // echo "user added to DB successfully, contact table";
//}
?>