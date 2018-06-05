<?php
// Open Connection
$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
echo 'Connected to MySQL';

// Some Query
//$sql 	= 'SELECT * FROM product';
//$query 	= mysqli_query($con, $sql);
//while ($row = mysqli_fetch_array($query))
//{
//	echo $row['id'];
//}

// Close connection
mysqli_close ($con);
?>