<?php

header('Content-Type: application/json');

include_once("helpers.php");
$conn = getDB();

$today = date('Y-m-d');
$modes = ['classic', 'emoji', 'image'];
$results = [];

$conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

try {
    foreach ($modes as $mode) {
        $stmt = $conn->prepare("
            SELECT character_id 
            FROM daily_correct 
            WHERE date = ? AND mode = ? 
            FOR UPDATE
        ");

        $stmt->bind_param("ss", $today, $mode);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($row = $result->fetch_assoc()) {
            $results[$mode] = intval($row['character_id']);
            continue;
        }

        $res = $conn->query("SELECT id FROM characters");

        $ids = [];
        while ($r = $res->fetch_assoc()) {
            $ids[] = $r['id'];
        }

        if (empty($ids)) {
            $results[$mode] = null;
            continue;
        }

        $correctId = $ids[array_rand($ids)];

        $insert = $conn->prepare("
            INSERT INTO daily_correct (date, character_id, mode) 
            VALUES (?, ?, ?)
        ");

        $insert->bind_param("sis", $today, $correctId, $mode);
        $insert->execute();

        $results[$mode] = $correctId;
    }

    $conn->commit();

    echo json_encode($results);
} catch (Exception $e) {
    $conn->rollback();

    echo json_encode([
        'error' => 'Transaction failed: ' . $e->getMessage()
    ]);
}