<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once("helpers.php");
$conn = getDB();

$row = getTodayCharacter($conn, 'image');

if (!$row) {
    echo json_encode([
        'success' => false,
        'message' => 'No character set for today.'
    ]);
    exit;
}

$images = array_filter(explode(',', $row['image']));

echo json_encode([
    'success' => true,
    'correctId' => intval($row['id']),
    'images' => array_values($images),
    'hint' => $row['hint']
]);
