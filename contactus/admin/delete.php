<?php
$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
$id = $_GET['id'];
$sql 	= "DELETE FROM data WHERE id=$id";
$query 	= mysqli_query($con, $sql);
header("Location:admin.php");
?>
