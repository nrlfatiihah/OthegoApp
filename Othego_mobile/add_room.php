<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Set headers for CORS (optional for local testing)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

include 'conn.php';

// Retrieve POST data
$roomName = $_POST['roomName'] ?? null;
$roomLoc = $_POST['roomLoc'] ?? null;
$roomPrice = $_POST['roomPrice'] ?? null;
$roomDesc = $_POST['roomDesc'] ?? null;
$roomAvailability = $_POST['roomAvailability'] ?? '1'; // Default to available

// Validate required fields
if (!$roomName || !$roomLoc || !$roomPrice) {
    echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    exit;
}

// SQL query to insert room data
$sql = "INSERT INTO room (roomName, roomLoc, roomPrice, roomDesc, roomAvailability) 
        VALUES ('$roomName', '$roomLoc', '$roomPrice', '$roomDesc', '$roomAvailability')";

// Execute query and return result
if ($conn->query($sql) === TRUE) {
    echo json_encode(["status" => "success", "message" => "Room added successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => $conn->error]);
}

// Close connection
$conn->close();
?>
