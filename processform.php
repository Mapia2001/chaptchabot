<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "", "ticket");
/*$link = mysqli_connect("localhost", "root", "P@55w0rd@sql", "ticket");*/
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
 if(isset($_POST["first-question"]))
 {
	// Escape user inputs for security
	$full_name = mysqli_real_escape_string($link, $_POST['name']);
	$email = mysqli_real_escape_string($link, $_POST['email']);
	 
	// Attempt insert query execution

	$sql = "INSERT INTO submission_tbl (full_name,email) VALUES ('".$full_name."','".$email."')";
	if(mysqli_query($link, $sql)){
	    echo "Records added successfully.";
	} 
	else{
	    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
	}
	header("Location: admin/index.php");
 }
else
{
	header("Location: index.php");
 }
// Close connection
mysqli_close($link);


?>