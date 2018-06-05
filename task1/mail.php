<?php
$con = @mysqli_connect('localhost', 'root', '', 'task');

if (!$con) {
    echo "Error: " . mysqli_connect_error();
	exit();
}
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$reason = $_POST['reason'];
$remarks = $_POST['remarks'];

$sql 	= "insert into data (reason, name, contact, email, remarks) values ('".$reason."','".$name."','".$phone."', '".$email."','".$remarks."')";
$query 	= mysqli_query($con, $sql);

$recipient = "tommy+123@vi8e.com";
$subject = "Contact Form Notification" ."-". $reason;
$mailheader = "From: $email \r\n";
$formcontent=" From: $name \n Phone: $phone \n Email: $email \n Type: $reason \n Message: $remarks";
mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");

$recipient2 = "$email";
$subject2 = "Your Contact Request";
$mailheader2 = "From: $email \r\n";
$formcontent2 = "We have received your request. Please be informed that the earliest response might take up to THREE working days. In the meantime, please do not hesitate to call us directly at +65 6823 3888 if you have any questions.";
mail($recipient2, $subject2, $formcontent2, $mailheader2) or die("Error!");
echo "Thank You!" . " -" . "<a href='index.html' style='text-decoration:none;color:#ff0099;'> Return Home</a>";
?>
