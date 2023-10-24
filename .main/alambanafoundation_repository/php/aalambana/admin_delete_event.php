+<?php
  $status = session_status();
  if ($status == PHP_SESSION_NONE) {
    session_start();
  }

  // Block unauthorized users from accessing the page
  if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] != 'admin') {
      http_response_code(403);
      die('Forbidden');
    }
  } else {
    http_response_code(403);
    die('Forbidden');
  }

$Event_ID = $_POST['Event_ID'];

require 'db_configuration.php';
// Create connection
$conn = new mysqli(DATABASE_HOST, DATABASE_USER, DATABASE_PASSWORD, DATABASE_DATABASE);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
// get any records from event_pictures that match the Event_Id to be deleted
$sql = "SELECT * FROM event_pictures where Event_ID='$Event_ID'";
$result = $conn->query($sql);

// if There are pictures to be deleted from the dt base
if ($result->num_rows > 0) 
{
	// loop through the rows of the result set deleting the row AND the picture from the server
	while($row = $result->fetch_assoc()) {
  		$sql = "DELETE FROM  event_pictures WHERE Picture_Id=".$row['Picture_Id'];
		if (!$conn->query($sql)) {
  			echo "Error deleting record: " . $conn->error;
		}
  		unlink($row['Location']);
	}
}

// Once there are no pictures associated with the Event_ID, delete the events record
$sql = "DELETE FROM events WHERE Event_ID = " . $_POST['Event_ID'];
if (!$conn->query($sql)) {
  echo "Error deleting record: " . $conn->error;
}

$conn->close();
echo "<script type=\"text/javascript\">setTimeout(function(){document.getElementById('form_submitted').submit();},500);
	  </script>";
?>
<div style="text-align:center;margin-top:200px;"><h3>One moment please. Deleting records...</h3>
       <img src="images/loadingIcon.gif"></img>
</div>
<form method="POST" id="form_submitted" action="admin_events.php">
</form>
