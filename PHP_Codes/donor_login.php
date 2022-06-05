
<?php

if($_POST){
	include 'conn.php';
    $email = $_POST['email'];
	$password = $_POST['password'];
    $consult=$connect->query("SELECT * FROM user AS u left join contact as c ON u.contact_id =c.contact_id WHERE c.email ='".$email."' AND u.password = '".$password."'");
    $result =array();
    while($extractdata =$consult->fetch_assoc()){
$result[]=$extractdata;
    }
    echo json_encode($result);

}else{
	echo "hiçbir veri post edilmedi";
}

?>