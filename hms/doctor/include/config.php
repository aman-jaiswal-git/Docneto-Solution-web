<?php
define('DB_SERVER','localhost');
define('DB_USER','u798180659_docneto');
define('DB_PASS' ,'Docneto@200776');
define('DB_NAME', 'u798180659_hms_db');
$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASS,DB_NAME);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>