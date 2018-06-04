<?php

// memanggil library FPDF
require('fpdf.php');
// intance object dan memberikan pengaturan halaman PDF
$pdf = new FPDF('P','mm','A4');
// membuat halaman baru
$pdf->AddPage();
// setting jenis font yang akan digunakan
$pdf->SetFont('Arial','B',16);
// mencetak string 
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
    $pdf->Cell(80,6,"Reason: " . $row['reason'],1,1);
    $pdf->Cell(80,6,"Name: " . $row['name'],1,1);
    $pdf->Cell(80,6,"Contact: " . $row['contact'],1,1);
    $pdf->Cell(80,6,"Email: " . $row['email'],1,1); 
    $pdf->Cell(80,6,"Remarks ",1,1);
    $pdf->Cell(80,6,$row['remarks'],1,1);  
       //echo "Total: " . $row["jumlah"]."<br>";    
   }
} 
//$pdf->Cell(40,10,'Belajar Membuat Laporan PDF Dengan FPDF');
$pdf->Output('I','Print.pdf');
?>