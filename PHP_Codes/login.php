<?php
if($_POST){
    // firstly connection with database should be done. I did not add conn.php file since it contains my password. 
    //it basicly consist of $connect= new mysqli("localhost","root","","login");
	include 'conn.php';
    $username=$_POST['username']; //find the user from list and log in 
    $password=$_POST['password'];
    $consult=$connect->query("SELECT * FROM user WHERE username='".$username."' and password='" .$password."'");
    $result =array();
    while($extractdata =$consult->fetch_assoc()){
$result[]=$extractdata; //list the result here 
    }
    echo json_encode($result); 

}else{
	echo "hiçbir veri post edilmedi";
}

?>