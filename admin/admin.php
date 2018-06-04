<p>Overview</p><br>
<?php
$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
$sql="SELECT reason, COUNT(reason) as jumlah FROM `data` GROUP BY reason";
$result=mysqli_query($con,$sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Type: " . $row["reason"]. " - Count: " . $row["jumlah"]."<br>";
    }
} else {
    echo "0 results";
}
$sql="SELECT COUNT(reason) as jumlah FROM `data`";
$result=mysqli_query($con,$sql);
echo '<br>';
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Total: " . $row["jumlah"]."<br>";
    }
} else {
    echo "0 results";
}

?>
<a href="exportcsv.php">Export to CSV</a> <br>
<a href="exportxls.php">Export to XLS</a> <br>
<br> Filter Data
<form action="viewdata.php" method="POST">

<br />
<p>Range1</p> <input type="date" name="date1">
<p>Range2</p> <input type="date" name="date2">
<br>
<input type="submit" value="View Filtered Data">
</form>
<br> Current Data <br>
<?php
echo '<br>';
echo '<table border=1>';
echo '<tr>';
echo '<th> Reason </th>';
echo '<th> Name </th>';
echo '<th> Email </th>';
echo '<th> Contact </th>';
echo '<th> Remarks </th>';
echo '<th> Date </th>';
echo '<th> Action </th>';
echo '</tr>';
$sql="SELECT * FROM `data`";
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
    	echo '<td>';
    	echo "<a href='view.php?id=$row[id]'>View</a> | <a href='print.php?id=$row[id]'>Print</a> | <a href='delete.php?id=$row[id]'>Delete</a>";
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