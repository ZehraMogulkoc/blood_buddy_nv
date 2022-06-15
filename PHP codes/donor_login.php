
<?php

if($_POST){
	include 'conn.php';
    $email = $_POST['email'];
	$password = $_POST['password'];
    $status =  mysqli_real_escape_string($connect, $_POST['status']);


    $result = $connect->query("SELECT status FROM user Left join contact on contact.contact_id=user.contact_id where contact.email ='".$email."'  and user.status='".$status."'; ");
    
    if ($result->num_rows != 0) 
   {
  $consult=$connect->query("SELECT * FROM user AS u left join contact as c ON u.contact_id =c.contact_id WHERE c.email ='".$email."' AND u.password = '".$password."'");
   }else{
    echo "statusle ilgili bir şey var sanki";
   }
    
    $result =array();
    while($extractdata =$consult->fetch_assoc()){
$result[]=$extractdata;
    }
    echo json_encode($result);

}else{
	echo "hiçbir veri post edilmedi";
}

?>