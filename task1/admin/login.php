<?php

$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
echo 'Connected to MySQL';
$name = $_POST['username'];
$password = $_POST['password'];

$sql="SELECT * FROM user WHERE username='$name' and password='$password'";
$result=mysqli_query($con,$sql);
$row=mysqli_fetch_array($result,MYSQLI_ASSOC);

//If username and password exist in our database then create a session.
//Otherwise echo error.

if(mysqli_num_rows($result) == 1)
{

$_SESSION['username'] = $login_user; // Initializing Session
header("location: admin.php"); // Redirecting To Other Page
}else
{
$error = "Incorrect username or password.";
}


?>