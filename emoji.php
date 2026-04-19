
<?php include_once 'components/nav-small.php' ?>

<div>
    <h1>Emoji</h1>
    <p>"Uhádni bytost podle Emoji. Každé emoji poukazuje na něco co se týče bytosti.</p>
</div>

<form id="emojiForm" style="margin-bottom:20px;" class="flex-container flex-center">
    <input list="characterList" type="text" name="character" id="characterInput" placeholder="Zadej postavu" maxlength="32">
    <datalist id="characterList">
        <!-- Options will be inserted by JS -->
    </datalist>
    <button type="submit" class="btn-submit" id="submitBtn"></button>
</form>

<h4 id="emojiDailyAnswer">Máš to! Správná odpověd pro dnešek je <span class="correctCharacter"></span>.</h4>

<h3 style="display: none;" id="emojiHintTitle">Nápověda</h3>
<h4 style="display: none;margin:0;margin-bottom: 2em;" id="emojiHint"></h4>

<div id="emojiContainer" class="box" style="padding: 3em;max-width:768px;width:100%;margin:auto;margin-bottom: 50px;">
        <img src="assets/images/corner.svg" class="corner top-left" />
        <img src="assets/images/corner.svg" class="corner top-right" />
        <img src="assets/images/corner.svg" class="corner bottom-right" />
        <img src="assets/images/corner.svg" class="corner bottom-left" />
    <p>Jakou bytost popisují tyhle emoji?</p>

    <div id="emojiList">
    </div>

    <p>Každý pokus odhalí další emoji.</p>
</div>

<?php include_once 'components/footer.php' ?>