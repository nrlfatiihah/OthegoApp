<?php
header("Content-Type: application/json");
include 'conn.php';

$sql = "SELECT * FROM room";
$result = $conn->query($sql);

$rooms = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $rooms[] = $row;
    }
}

echo json_encode($rooms); // Returns data as JSON

$conn->close();
?>
