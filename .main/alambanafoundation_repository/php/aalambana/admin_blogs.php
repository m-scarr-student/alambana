<?php
  $status = session_status();
  if ($status == PHP_SESSION_NONE) {
    session_start();
  }

  // Block unauthorized users from accessing the page
  if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 'admin') {
      http_response_code(403);
      die('Forbidden');
    }
  } else {
    http_response_code(403);
    die('Forbidden');
  }
 ?>

<!DOCTYPE html>
<script>
</script>
<html>
  <head>
    <link rel="icon" href="images/icon_logo.png" type="image/icon type">
    <title>Administration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;900&display=swap" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function () {
      $('#Blog_table thead tr').clone(true).appendTo( '#Blog_table thead' );
      $('#Blog_table thead tr:eq(1) th').each(function () {
      var title = $(this).text();
      $(this).html('<input type="text" placeholder="Search ' + title + '" />');
      });

      var table = $('#Blog_table').DataTable({
         initComplete: function () {
             // Apply the search
             this.api()
                 .columns()
                 .every(function () {
                     var that = this;

                     $('input', this.header()).on('keyup change clear', function () {
                         if (that.search() !== this.value) {
                             that.search(this.value).draw();
                         }
                     });
                 });
             },
         });

      $('a.toggle-vis').on('click', function (e) {
      e.preventDefault();

      // Get the column API object
      var column = table.column($(this).attr('data-column'));

      // Toggle the visibility
      column.visible(!column.visible());
      });
     });
    </script>
  </head>
  <body>
  
    <header class="inverse">
      <div class="container">
        <h1><span class="accent-text">Blogs</span></h1>
      </div>
    </header>

    <div class="toggle_columns">
      Toggle column: <a class="toggle-vis" data-column="0">Blog ID</a>
        - <a class="toggle-vis" data-column="1">Title</a>
        - <a class="toggle-vis" data-column="2">Author</a>
        - <a class="toggle-vis" data-column="3">Description</a>
        - <a class="toggle-vis" data-column="3">Video_Link</a>
        - <a class="toggle-vis" data-column="3">Modified_Time</a>
        - <a class="toggle-vis" data-column="3">Created_Time</a>
		- <a class="toggle-vis" data-column="3">Option</a>
        
    </div>
    <div style="padding-top: 10px; padding-bottom: 30px; width:90%; margin:auto; overflow:auto">
      <table id="Blog_table" class="display compact">
        <thead>
          <tr>
            <th>Blog ID</th>
            <th>Title</th>
			<th>Author</th>
			<th>Description</th>
            <th>Video Link</th>
            <th>Modified Time</th>
            <th>Created Time</th>
            <th>Option</th>
          </tr>
        </thead>
        <tbody>
          <!-- Populating table with data from the database-->
          <?php
            require 'db_configuration.php';
            // Create connection
            $conn = new mysqli(DATABASE_HOST, DATABASE_USER, DATABASE_PASSWORD, DATABASE_DATABASE);
            // Check connection
            if ($conn->connect_error) {
              die("Connection failed: " . $conn->connect_error);
            }

            $sql = "SELECT * FROM blogs";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
              // Create table with data from each row
              while($row = $result->fetch_assoc()) {
				  echo "<tr><td>" . $row["Blog_Id"]. "</td>
					    <td>" . $row["Title"] . "</td>
					    <td>" . $row["Author"] . "</td>
					    <td>" . $row["Description"]. "</td> 
                        <td>" . $row["Video_Link"]. "</td> 
                        <td>" . $row["Modified_Time"]. "</td> 
                        <td>" . $row["Created_Time"]. "</td> 
                <td>
           			<form action='admin_edit_blog.php' method='POST'>
            			<input type='hidden' name='Blog_Id' value='". $row["Blog_Id"] . "'>
            			<input type='submit' id='admin_buttons' name='edit' value='Edit'/>
          			</form>
                  <form action='admin_delete_blog.php' method='POST'>
                    <input type='hidden' name='Blog_Id' value='". $row["Blog_Id"] . "'>
                    <input type='submit' id='admin_buttons' name='delete' value='Delete'/>
                  </form>
                </td>
                </tr>";
              }
            } else {
              echo "0 results";
            }
            $conn->close();
		?>
        </tbody>
      </table>
</div>
  </body>
</html>
