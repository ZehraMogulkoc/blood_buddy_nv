<?php

// connect the database with the server
include 'conn.php';
	// if error occurs
	if ($connect -> connect_errno)
	{
	echo "Failed to connect to MySQL: " . $connect -> connect_error;
	exit();
	}


	$sql2 = "select address  from contact as c inner Join user inner join donor on  user.user_id=donor.user_id   on user.contact_id=c.contact_id;";


	$result2 = ($connect->query($sql2));
	//declare array to store the data of database
	
$row2 = [];

	if ($result2->num_rows > 0)
	{
		// fetch all data from db into array
		$row2 = $result2->fetch_all(MYSQLI_ASSOC);
	}
	echo json_encode($row2);
?>

<?php
	mysqli_close($connect);
?>