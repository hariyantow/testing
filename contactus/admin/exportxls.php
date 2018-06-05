<?php 
$conn = new mysqli('localhost', 'root', ''); 
mysqli_select_db($conn, 'task'); 
$sql = "SELECT * FROM `data`"; 
$setRec = mysqli_query($conn, $sql); 
$columnHeader = ''; 
$columnHeader = "ID" . "\t" . "Reason" . "\t" . "Name" . "\t". "Email" . "\t". "Contact" . "\t" . "Remarks" . "\t" . "Date" . "\t"; 
$setData = ''; 
while ($rec = mysqli_fetch_row($setRec)) { 
$rowData = ''; 
foreach ($rec as $value) { 
$value = '"' . $value . '"' . "\t"; 
$rowData .= $value; 
} 
$setData .= trim($rowData) . "\n"; 
} 
header("Content-type: application/octet-stream"); 
header("Content-Disposition: attachment; filename=Export.xls"); 
header("Pragma: no-cache"); 
header("Expires: 0"); 
echo ucwords($columnHeader) . "\n" . $setData . "\n"; 
?>

