<?php
header("Content-Type: application/json");
include 'conn.php';

// Check if POST data is set before accessing it
$roomID = isset($_POST['roomID']) ? $_POST['roomID'] : null;
$roomName = isset($_POST['roomName']) ? $_POST['roomName'] : null;
$roomDesc = isset($_POST['roomDesc']) ? $_POST['roomDesc'] : null;
$roomLoc = isset($_POST['roomLoc']) ? $_POST['roomLoc'] : null;
$roomPrice = isset($_POST['roomPrice']) ? $_POST['roomPrice'] : null;
$roomAvailability = isset($_POST['roomAvailability']) ? $_POST['roomAvailability'] : null;

// Ensure all required data is received
if ($roomID && $roomName && $roomDesc && $roomLoc && $roomPrice && $roomAvailability) {
    // Update the room details in the database
    $sql = "UPDATE room SET 
            roomName = ?, 
            roomDesc = ?, 
            roomLoc = ?, 
            roomPrice = ?, 
            roomAvailability = ? 
            WHERE roomID = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssidi", $roomName, $roomDesc, $roomLoc, $roomPrice, $roomAvailability, $roomID);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Room details updated successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to update room details."]);
    }

    // Close the connection
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Missing required fields."]);
}

$conn->close();
?>
