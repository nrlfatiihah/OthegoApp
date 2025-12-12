<?php
header("Content-Type: application/json");

include 'conn.php';

// Get the JSON data
$input = file_get_contents('php://input');
$data = json_decode($input, true);

$userName = $conn->real_escape_string($data['userName']);
$userEmail = $conn->real_escape_string($data['userEmail']);
$userphoneNo = $conn->real_escape_string($data['userphoneNo']);
$userEmerphoneNo = $conn->real_escape_string($data['userEmerphoneNo']);
$userGender = $conn->real_escape_string($data['userGender']);

// Check if a record with the same userEmail already exists
$checkQuery = "SELECT * FROM user_profile WHERE userEmail = '$userEmail'";
$result = $conn->query($checkQuery);

if ($result->num_rows > 0) {
    // If record exists, update the existing record
    $updateQuery = "UPDATE user_profile 
                    SET userName = '$userName', 
                        userphoneNo = '$userphoneNo', 
                        userEmerphoneNo = '$userEmerphoneNo', 
                        userGender = '$userGender' 
                    WHERE userEmail = '$userEmail'";

    if ($conn->query($updateQuery) === TRUE) {
        echo json_encode(['success' => true, 'message' => 'Profile updated successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Update failed: ' . $conn->error]);
    }
} else {
    // If no record exists, insert a new one
    $insertQuery = "INSERT INTO user_profile (userName, userEmail, userphoneNo, userEmerphoneNo, userGender) 
                    VALUES ('$userName', '$userEmail', '$userphoneNo', '$userEmerphoneNo', '$userGender')";

    if ($conn->query($insertQuery) === TRUE) {
        echo json_encode(['success' => true, 'message' => 'Profile inserted successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Insert failed: ' . $conn->error]);
    }
}

$conn->close();
?>
