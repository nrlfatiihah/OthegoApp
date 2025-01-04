<?php

// Set headers to allow cross-origin requests (if needed)
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'conn.php';

// Get POST data from Flutter app (JSON format)
$data = json_decode(file_get_contents("php://input"), true);

// Check if the necessary data exists
if (isset($data['fullName']) && isset($data['email']) && isset($data['complain'])) {
    // Sanitize the input data
    $fullName = $conn->real_escape_string($data['fullName']);
    $email = $conn->real_escape_string($data['email']);
    $complain = $conn->real_escape_string($data['complain']);

    // Set default complaintStatus (e.g., 'new')
    $complaintStatus = 'New';

    // Prepare SQL query to insert the complaint into the database
    $sql = "INSERT INTO complaint (fullName, userEmail, complaintComments, complaintStatus) 
            VALUES ('$fullName', '$email', '$complain', '$complaintStatus')";

    // Execute the query
    if ($conn->query($sql) === TRUE) {
        // Send a success response back to Flutter
        echo json_encode(['status' => 'success', 'message' => 'Complaint submitted successfully']);
    } else {
        // Send a failure response back to Flutter
        echo json_encode(['status' => 'error', 'message' => 'Failed to submit complaint']);
    }
} else {
    // Handle missing parameters
    echo json_encode(['status' => 'error', 'message' => 'Missing parameters']);
}

// Close the database connection
$conn->close();
?>
