<?php

include 'conn.php';

// Check connection
if ($connect->connect_error) {
  die("Connection failed: " . $connect->connect_error);
}

// sql to create table
//table is consist of id username password mail phone columns 
$sql = "CREATE TABLE `user` (
  `user_id` int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `contact_id` int(50) DEFAULT NULL
)";
$altering="ALTER TABLE user
ADD status varchar(50);";
//if table is created print it or show the error
$sql2 ="CREATE TABLE `donor` (
  `donor_id` int(11)  UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `user_id` int(11) UNSIGNED NOT NULL,
CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(user_id)

)";


$sql3 ="CREATE TABLE `medical_personnel` (
  `emp_id` int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `user_id` int(11) UNSIGNED ,
  `hospital_name` varchar(500) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)

)"; 
$sql4="CREATE TABLE `blood` (
  `blood_id` INT NOT NULL AUTO_INCREMENT,
  `blood_type` varchar(50) ,
  `donor_id` INT UNSIGNED ,
  `recipient_id` INT UNSIGNED ,
  PRIMARY KEY (`blood_id`),
  FOREIGN KEY (donor_id) REFERENCES donor(donor_id)
);";



if ($connect->query($sql) === TRUE) {
  echo "Table user created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}
if ($connect->query($sql4) === TRUE) {
  echo "Table blood created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}
if ($connect->query($altering) === TRUE) {
  echo "column status added";
} else {
  echo "Error creating table: " . $connect->error;
}
if ($connect->query($sql2) === TRUE) {
  echo "Table donor created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}
if ($connect->query($sql3) === TRUE) {
  echo "Table medical_personnel created successfully";
} else {
  echo "Error creating table: " . $connect->error;
}
$connect->close();
?>