<?php

// connect the database with the server
include 'conn.php';
	// if error occurs
	if ($connect -> connect_errno)
	{
	echo "Failed to connect to MySQL: " . $connect -> connect_error;
	exit();
	}

	$sql = "select blood_type  from blood as b inner Join donor as d on d.donor_id=b.donor_id;";
	

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
