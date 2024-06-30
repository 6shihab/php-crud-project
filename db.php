<?php
//server with default setting (user 'root' with no password)
$host = getenv('DB_HOST');
$port = getenv('DB_PORT');
$username = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$database = getenv('DB_NAME');   // 'login_crud' db name

$host_with_port = $host . ':' . $port;

// establishing connection
$conn = mysqli_connect($host_with_port, $username, $password, $database);

      

 // for displaying an error msg in case the connection is not established
  if (!$conn) {                                             
    die("Connection failed: " . mysqli_connect_error());     
  }
?>
