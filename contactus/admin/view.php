<?php
$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
$id = $_GET['id'];
$sql 	= "SELECT * FROM data WHERE id=$id";
$result 	= mysqli_query($con, $sql);
if($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
    	echo '<tr>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["reason"];
    	echo '</td>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["name"];
    	echo '</td>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["email"];
    	echo '</td>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["contact"];
    	echo '</td>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["remarks"];
    	echo '</td>';
    	echo '<td>';
    	echo '<br>';
    	echo $row["date"];
    	echo '</tr>';
    	   	echo '<br>';
       //echo "Total: " . $row["jumlah"]."<br>";    
   }
} 
?>
<a href='admin.php'>back</a> 