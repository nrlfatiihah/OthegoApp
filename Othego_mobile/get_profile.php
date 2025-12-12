<?php
header("Content-Type: application/json");

include 'conn.php';

// Get the userEmail from the query parameters
$userEmail = $_GET['userEmail'];

// Check if the user exists using the userEmail
$query = "SELECT * FROM user_profile WHERE userEmail = '$userEmail'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    echo json_encode([
        'success' => true,
        'user' => $user
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'User not found'
    ]);
}

$conn->close();
?>
