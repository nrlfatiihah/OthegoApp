<?php
header('Content-Type: application/json');
include 'conn.php';

$result = $conn->query('SELECT * FROM complaint');

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode(['success' => true, 'data' => $data]);
$conn->close();
?>
