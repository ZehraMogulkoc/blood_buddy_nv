<?php 

	include 'conn.php';

	$id = $_POST['id'];
	$username = $_POST['username'];
	$mail = $_POST['mail'];
	$phone = $_POST['phone'];

if ($connect->connect_error) {
  die("Connection failed: " . $connect->connect_error);
}

$sql = ("UPDATE user SET username = '".$username."',mail = '".$mail."',phone = '".$phone."' WHERE id = '".$id."'");

if ($connect->query($sql) === TRUE) {
  echo "Record updated successfully";
} else {
  echo "Error updating record: " . $conn->error;
}

$connect->close();
?>


