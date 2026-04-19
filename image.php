
<?php include_once 'components/nav-small.php' ?>

<div>
    <h1>Obrázek</h1>
    <p>Uhádni bytost podle pomalu se oddalovacího se obrázku.</p>
</div>

<form id="imageForm" style="margin-bottom:50px;" class="flex-container flex-center">
    <input list="characterList" type="text" name="character" id="characterInput" placeholder="Zadej postavu" maxlength="32">
    <datalist id="characterList">
        <!-- Options will be inserted by JS -->
    </datalist>
    <button type="submit" class="btn-submit" id="submitBtn"></button>
</form>

<h4 id="imageDailyAnswer">Máš to! Správná odpověd pro dnešek je <span class="correctCharacter"></span>.</h4>

<div id="imageContainer" class="box" style="padding: 3em;max-width:768px;width:100%;margin:auto;margin-bottom: 50px;">
        <img src="assets/images/corner.svg" class="corner top-left" />
        <img src="assets/images/corner.svg" class="corner top-right" />
        <img src="assets/images/corner.svg" class="corner bottom-right" />
        <img src="assets/images/corner.svg" class="corner bottom-left" />


    <p id="imageContainerTitle">Jaká postava je zobrazena na obrázku?</p>

    <div id="image" class="box" style="width: 80%;max-width: 300px;height: auto;margin: auto; overflow: hidden;">
        <img src="assets/images/corner.svg" class="corner top-left" />
        <img src="assets/images/corner.svg" class="corner top-right" />
        <img src="assets/images/corner.svg" class="corner bottom-right" />
        <img src="assets/images/corner.svg" class="corner bottom-left" />

        <img id="mainImage" style="object-fit: contain; transform: scale(4); transition: transform 0.4s ease;" src="" width="100%">
    </div>

    <p>Každý pokus ukáže větší část obrázku.</p>
</div>