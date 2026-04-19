<?php
include_once 'components/nav-small.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

include_once("includes/helpers.php");
$conn = getDB();

$characters = getCharacterList($conn);
?>

<div>
    <h1>Pomůcky</h1>
    <p>Všechno, co se může o postavách hodit.</p>
</div>

<div class="flex-container flex-center">
     <button type="button" class="btn-circle" id="slider-prev"><img src="assets/images/submit.svg" style="transform: rotate(180deg);"></button>

    <div id="charactersList" class="m-auto" style="width: 80%;max-width: 960px;display: flex;">

    <?php foreach ($characters as $character): ?>
        <div class="box" style="align-self: stretch;margin-bottom: 20px;">
            <img src="assets/images/corner.svg" class="corner top-left" />
            <img src="assets/images/corner.svg" class="corner top-right" />
            <img src="assets/images/corner.svg" class="corner bottom-right" />
            <img src="assets/images/corner.svg" class="corner bottom-left" />

            <div class="flex-container flex-column-phone">  
                <div class="flex-container flex-center panel-40 p-2">
                    <img src="assets/images/characters/<?= htmlspecialchars($character['id']) ?>.jpg" style="width: 80%;max-height: 400px;object-fit: contain;">
                </div>
                <div class="panel-60 text-left p-2">
                    <h2><?= htmlspecialchars($character['name']) ?></h2>
                    <p><?= htmlspecialchars($character['hint']) ?></p>

                    <h3>Vlastnosti</h3>
                    <p style="line-height: 1.5em;">
                        <strong>Typ:</strong> <?= htmlspecialchars($character['type']) ?><br>
                        <strong>Prostředi:</strong> <?= htmlspecialchars($character['environment']) ?><br>
                        <strong>Morálka:</strong> <?= htmlspecialchars($character['morality']) ?><br>
                        <strong>Kultura:</strong> <?= htmlspecialchars($character['culture']) ?><br>
                        <strong>Era:</strong> <?= htmlspecialchars($character['era']) ?><br>
                        <strong>Síla:</strong> <?= htmlspecialchars($character['power']) ?>
                    </p>

                    <h3>Emoji</h3>
                    <p class="text-big"><?= htmlspecialchars($character['emoji']) ?></p>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
    </div>

    <button type="button" class="btn-circle" id="slider-next"><img src="assets/images/submit.svg"></button>
</div>