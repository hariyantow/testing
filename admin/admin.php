<html>
<link href="css/bootstrap.min.css" rel="stylesheet">
<head>

</head>
<body>
    <div class="container">
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
<form  action="viewdata.php" method="POST">

<br />
<p>Range1</p> <input class="form-control" type="date" name="date1">
<p>Range2</p> <input class="form-control" type="date" name="date2">
<br>
<input class="btn btn-primary" type="submit" value="View Filtered Data">
</form>
<br> Current Data <br>
<?php
echo '<br>';
echo '<table class="table">';
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
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</html>