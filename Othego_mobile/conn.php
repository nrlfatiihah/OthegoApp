<?php
$host = "db";           // MySQL container name from docker-compose
$user = "othego";       // MySQL user from docker-compose
$pass = "othego123";    // MySQL password
$dbname = "othego_db";  // Database name inside MySQL container

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "Connection failed: " . $conn->connect_error
    ]));
}
?>
