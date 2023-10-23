<?php
$host = 'database-1.c8lgvoyptaku.us-west-2.rds.amazonaws.com';
$username = 'admin';
$password = 'passwordX!';
$database = 'demodb';



//mysqli_set_charset($connection, "utf8"); // or "utf8" if that's what the serv>// Your database connection is established. Yo>

$db_conn = @mysqli_connect($host, $username, $password, $database);

if (!$db_conn) {
    echo "DB Connection Status: Failed";
} else {
    echo "DB Connection Status: Successful";
}

// Hostname of the instance
echo "<br>";
echo "Hostname: " . gethostname();

?>
