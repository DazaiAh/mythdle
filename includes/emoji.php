<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once("helpers.php");
$conn = getDB();

$row = getTodayCharacter($conn, 'emoji');

if (!$row) {
    echo json_encode([
        'success' => false,
        'message' => 'No character set for today.'
    ]);
    exit;
}

$emojis = array_filter(explode(',', $row['emoji']));

echo json_encode([
    'success' => true,
    'correctId' => intval($row['id']),
    'emojis' => array_values($emojis),
    'hint' => $row['hint']
]);
