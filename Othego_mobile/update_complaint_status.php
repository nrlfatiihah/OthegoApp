<?php
header('Content-Type: application/json');
include 'conn.php';

// Get data from POST request
$data = json_decode(file_get_contents('php://input'), true); // Decode JSON data
$complaint_id = $data['complaint_id'] ?? ''; // Match Flutter key
$status = $data['status'] ?? ''; // Match Flutter key
$reply = $data['reply'] ?? ''; // Match Flutter key

if (empty($complaint_id) || empty($status)) {
    echo json_encode(['success' => false, 'message' => 'Complaint ID and status are required.']);
    exit;
}

$sql = "UPDATE complaint SET complaintStatus = ?, complaintReply = ? WHERE complaintID = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('ssi', $status, $reply, $complaint_id);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Failed to update complaint.',
        'error' => $stmt->error // Log the error message
    ]);
}

$stmt->close();
$conn->close();
?>
