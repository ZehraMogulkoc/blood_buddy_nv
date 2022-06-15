<?php

// connect the database with the server
include 'conn.php';
	// if error occurs
	if ($connect -> connect_errno)
	{
	echo "Failed to connect to MySQL: " . $connect -> connect_error;
	exit();
	}

	$sql = "select blood_type , amount from blood as b left Join recipient as r on r.recipient_id=b.recipient_id;";
	$result = ($connect->query($sql));
	//declare array to store the data of database
	$row = [];

	if ($result->num_rows > 0)
	{
		// fetch all data from db into array
		$row = $result->fetch_all(MYSQLI_ASSOC);
	}
	echo json_encode($row);
?>

<?php
	mysqli_close($connect);
?>
