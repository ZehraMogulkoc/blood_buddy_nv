<?php

// connect the database with the server
include 'conn.php';
	// if error occurs
	if ($connect -> connect_errno)
	{
	echo "Failed to connect to MySQL: " . $connect -> connect_error;
	exit();
	}

	$sql = "select address from contact as c left join recipient as r left join user on user.user_id= r.user_id on user.contact_id=c.contact_id;";
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
