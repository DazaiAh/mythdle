<?php

header('Content-Type: application/json');

include_once("helpers.php");
$conn = getDB();

$result = $conn->query("SELECT id, name FROM characters ORDER BY name ASC");

$characters = [];
while ($row = $result->fetch_assoc()) {
    $characters[] = $row;
}

echo json_encode($characters);