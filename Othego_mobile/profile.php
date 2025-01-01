<?php
include 'conn.php'; // Include the database connection

// Decode the incoming JSON data
$data = json_decode(file_get_contents('php://input'), true);

// Validate the input
if (isset($data['userID']) && isset($data['name']) && isset($data['email']) && isset($data['contactNumber'])) {
    // Sanitize the input data to prevent SQL injection
    $userID = $conn->real_escape_string($data['userID']);
    $name = $conn->real_escape_string($data['name']);
    $email = $conn->real_escape_string($data['email']);
    $contactNumber = $conn->real_escape_string($data['contactNumber']);

    // Update the user details in the database
    $sql = "UPDATE users SET name='$name', email='$email', contact_number='$contactNumber' WHERE userID='$userID'";

    if ($conn->query($sql) === TRUE) {
        // Success response
        echo json_encode(["status" => "success", "message" => "Profile updated successfully"]);
    } else {
        // Error response
        echo json_encode(["status" => "error", "message" => "Error: " . $sql . " - " . $conn->error]);
    }
} else {
    // Invalid input response
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
}

// Close the database connection
$conn->close();
?>
