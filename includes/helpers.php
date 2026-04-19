<?php

/**
 * Připojení k databázi, přihlašovací údaje taháme z config.php v hlavním adresáři.
 * @param $DB_HOST = hostitel
 * @param $DB_USER = používatel
 * @param $DB_PASS = heslo
 * @param $DB_DATA = databáze
 */
function getDB() {
    include_once(__DIR__ . "/../config.php");

    $conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_DATA);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}

/**
 * Získaní všech postav. Používá se pro cheat sheet.
 * @param $conn = databázové připojení dle getDB()
 * @param $mode = herní mod, kterého se to týká
 */
function getCharacterList($conn) {
    $stmt = $conn->prepare("
        SELECT *
        FROM characters
    ");

    $stmt->execute();

    $result = $stmt->get_result();

    return $result->fetch_all(MYSQLI_ASSOC);
}

/**
 * Získaní jména správné postavy pro každý herní mod. Tohle se používá spíš pro nápovědy a pod.
 * @param $conn = databázové připojení dle getDB()
 * @param $mode = herní mod, kterého se to týká
 */
function getTodayCharacter($conn, $mode) {
    $today = date('Y-m-d');

    $stmt = $conn->prepare("
        SELECT c.*
        FROM daily_correct dc
        JOIN characters c ON dc.character_id = c.id
        WHERE dc.date = ? AND dc.mode = ?
    ");

    $stmt->bind_param("ss", $today, $mode);
    $stmt->execute();

    return $stmt->get_result()->fetch_assoc();
}

/**
 * Získaní správné postavy pro každý herní mod.
 * @param $conn = databázové připojení dle getDB()
 * @param $mode = herní mod, kterého se to týká
 */
function getTodayCorrectId($conn, $mode) {
    $today = date('Y-m-d');

    $stmt = $conn->prepare("
        SELECT character_id 
        FROM daily_correct 
        WHERE date = ? AND mode = ?
    ");

    $stmt->bind_param("ss", $today, $mode);
    $stmt->execute();

    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    return $row ? intval($row['character_id']) : null;
}


/**
 * Získaní jména postavy podle ID, vyžaduje se, jelikož interně pracujeme s ID místo jmen postav.
 * @param $conn = databázové připojení dle getDB()
 * @param $id = ID postavy
 */
function getCharacterById($conn, $id) {
    $stmt = $conn->prepare("SELECT * FROM characters WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    return $stmt->get_result()->fetch_assoc();
}

/**
 * Získaní správné postavy pro každý herní mod.
 * @param $guessVal = ID, ktero zkusil uhodnout uživatel
 * @param $correctVal = správná postava (ID)
 */
function check($guessVal, $correctVal) {
    return $guessVal === $correctVal ? "bg-green" : "bg-red";
}

/**
 * Postavení tabulky pro herní mod Classic.
 * Tohle pošle novej řádek klientovi a zabarví červenou nebo zelenou podle správnosti.
 * @param $guess = ID, ktero zkusil uhodnout uživatel
 * @param $correct = správná postava (ID)
 */
function buildComparisonRow($guess, $correct) {
    $rowHtml = "<tr>";
    $rowHtml .= "<td class='".check($guess['name'], $correct['name'])."'>".$guess['name']."</td>";
    $rowHtml .= "<td class='".check($guess['type'], $correct['type'])."'>".$guess['type']."</td>";
    $rowHtml .= "<td class='".check($guess['environment'], $correct['environment'])."'>".$guess['environment']."</td>";
    $rowHtml .= "<td class='".check($guess['morality'], $correct['morality'])."'>".$guess['morality']."</td>";
    $rowHtml .= "<td class='".check($guess['culture'], $correct['culture'])."'>".$guess['culture']."</td>";
    $rowHtml .= "<td class='".check($guess['era'], $correct['era'])."'>".$guess['era']."</td>";
    $rowHtml .= "<td class='".check($guess['power'], $correct['power'])."'>".$guess['power']."</td>";
    $rowHtml .= "</tr>";

    return $rowHtml;
}