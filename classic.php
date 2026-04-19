
<?php include_once 'components/nav-small.php' ?>

<div>
    <h1>Klasický</h1>
    <p>Uhádni bytost podle různých atributů. Zeleně vyznačené pole jsou uhodnuty správně a červené špatně.</p>
</div>

<form id="classicForm" style="margin-bottom:50px;" class="flex-container flex-center">
    <input list="characterList" type="text" name="character" id="characterInput" placeholder="Zadej postavu" maxlength="32">
    <datalist id="characterList">
        <!-- Options will be inserted by JS -->
    </datalist>
    <button type="submit" class="btn-submit" id="submitBtn"></button>
</form>

<h4 id="classicDailyAnswer">Máš to! Správná odpověd pro dnešek je <span class="correctCharacter"></span>.</h4>

<h3 style="display: none;" id="classicHintTitle">Nápověda</h3>
<h4 style="display: none;margin:0;margin-bottom: 2em;" id="classicHint"></h4>

<div id="tableContainer" class="box">
        <img src="assets/images/corner.svg" class="corner top-left" />
        <img src="assets/images/corner.svg" class="corner top-right" />
        <img src="assets/images/corner.svg" class="corner bottom-right" />
        <img src="assets/images/corner.svg" class="corner bottom-left" />

    <table>
        <thead>
            <tr>
                <th>Charakter</th>
                <th>Typ</th>
                <th>Prostředí</th>
                <th>Morálka</th>
                <th>Kultura</th>
                <th>Éra</th>
                <th>Síla</th>
            </tr>
        </thead>
        <tbody id="tableBody"></tbody>
    </table>
</div>