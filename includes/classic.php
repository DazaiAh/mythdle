<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

include_once("helpers.php");
$conn = getDB();

if (!isset($_POST['characterId'])) {
    echo "No character ID posted!";
    exit;
}

$characterId = intval($_POST['characterId']);
$correctId   = isset($_POST['correctId']) 
    ? intval($_POST['correctId']) 
    : getTodayCorrectId($conn, 'classic');

$guess   = getCharacterById($conn, $characterId);
$correct = getCharacterById($conn, $correctId);

if (!$guess || !$correct) {
    echo "<tr><td colspan='7'>Character not found</td></tr>";
    exit;
}

$isCorrect = ($characterId === $correctId);

$rowHtml = buildComparisonRow($guess, $correct);

$guessCount = isset($_POST['guessCount']) ? intval($_POST['guessCount']) : 0;

$hint = null;
if ($guessCount > 5) {
    $hint = $correct['hint'];
}

echo json_encode([
    'html' => $rowHtml,
    'correct' => $isCorrect,
    'name' => $guess['name'],
    'hint' => $hint
]);
