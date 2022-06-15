<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "myDB";

include 'conn.php';

// Check connection
if ($connect->connect_error) {
  die("Connection failed: " . $connect->connect_error);
}



$sql2 = "CREATE TABLE `contact` (
  `contact_id` int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `phone` int(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(1000) NOT NULL
)";

if ($connect->query($sql2) === TRUE) {
  echo "Table contact created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}

$connect->close();
?>