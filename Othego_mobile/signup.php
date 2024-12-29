<?php
include 'conn.php';

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['fullName']) && isset($data['email']) && isset($data['password'])) {
    $fullName = $conn->real_escape_string($data['fullName']);
    $email = $conn->real_escape_string($data['email']);
    $password = password_hash($data['password'], PASSWORD_BCRYPT); // Encrypt password

    $sql = "INSERT INTO user (userName, userEmail, password) VALUES ('$fullName', '$email', '$password')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["status" => "success", "message" => "User registered successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error: " . $sql . " - " . $conn->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
}

$conn->close();
?>
