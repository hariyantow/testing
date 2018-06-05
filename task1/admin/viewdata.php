<?php

$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
$range1 = $_POST['date1'];
$range2 = $_POST['date2'];
echo "Viewing data from ";
echo $range1;
echo " to ";
echo $range2;

echo '<table>';
echo '<tr>';
echo '<th> Reason </th>';
echo '<th> Name </th>';
echo '<th> Contact </th>';
echo '<th> Email </th>';
echo '<th> Remarks </th>';
echo '<th> Date </th>';
echo '</tr>';
$sql="SELECT * FROM `data` where date between '$range1' and '$range2'";
$result=mysqli_query($con,$sql);
if($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
    	echo '<tr>';
    	echo '<td>';
    	echo $row["reason"];
    	echo '</td>';
    	echo '<td>';
    	echo $row["name"];
    	echo '</td>';
    	echo '<td>';
    	echo $row["email"];
    	echo '</td>';
    	echo '<td>';
    	echo $row["contact"];
    	echo '</td>';
    	echo '<td>';
    	echo $row["remarks"];
    	echo '</td>';
    	echo '<td>';
    	echo $row["date"];
    	echo '</td>';
    	echo '</tr>';
       //echo "Total: " . $row["jumlah"]."<br>";    
   }
} 
else {
    echo "0 results";
}
echo '</table>';

?>