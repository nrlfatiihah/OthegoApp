<?php
include 'conn.php';

// Query to fetch data
$sql = "SELECT userName, userEmail, userphoneNo FROM user_profile";
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    // Fetch rows as associative array
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Return data as JSON
header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
