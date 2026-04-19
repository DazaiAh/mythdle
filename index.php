<!DOCTYPE html>
    <html lang="cs">
    <?php include_once 'components/header.php'?>
    <link href="css/loader.css" type="text/css" rel="stylesheet">
<body>

<div id="particles-js"></div>

<div id="loader">
    <div class="loader-box">
        <div class="loader-img"></div>

        <div id="progress-bar">
            <img id="progress-empty" src="assets/images/progress_empty.svg" />
            <div id="progress-full-wrapper">
                <img id="progress-full" src="assets/images/progress_full.svg" />
            </div>
        </div>
        <div id="progress-text">0%</div>
        <br>
        <div id="file-name" style="font-size: 0.75rem;line-height:1.5rem;"></div>
        <span id="file-count"></span> • <span id="downloaded-size"></span>
    </div>
</div>

<script src="js/preload.js"></script>

<section id="main-menu" style="padding-top: 25px;" class="flex-container flex-column fade-in">
    <div class="logo panel-100" style="text-align: center">
        <h1>Mythdle</h1>
        <img src="assets/images/divider.svg" width="20%">
        <p>Hádej postavy z mytologií, folklóru a pohádek!</p>
    </div>

    <div class="flex-container panel-100 p-2" style="height: 100%;">
        <div id="menu-nav" class="panel-40 flex-column" style="gap: 1rem;align-items: center;margin-top: 50px;">
            <button class="btn-menu" data-page="classic">Klasický</button>
            <button class="btn-menu" data-page="image">Obrázek</button>
            <button class="btn-menu" data-page="emoji">Emoji</button>
            <button class="btn-menu" data-page="cheatsheet">Pomůcky</button>
        </div>
        <div class="panel-60 p-2 hide-phone">
            <div class="panel-80 m-auto flex-container flex-column flex-center">
                <div class="main-menu-desc-title panel-100">
                    <h2></h2>
                </div>

                <div class="main-menu-desc-text" style="line-height: 2rem;font-size: 22px;">
                </div>
            </div>
        </div>
    </div>
</section>

<div id="content"></div>

<div id="cookiebar">
    <p>Tahle stránka nepoužívá žádné sušenky,<br> nevedeme si o vás data. A to je skvělé, že?</p>
    <button class="btn-close-text">Zavřít</button>
</div>

<div id="overlay">
    <h1>Správně!</h1>
    <p style="text-align: center;padding: 2em;">Gratuluji! Správná postava pro tento den a mód je <span style="color: var(--purple);" id="correctCharacter">?</span>!</p>
</div>

<canvas id="confetti"></canvas>
<script src="js/lib/confetti.js"></script>

<script src="js/pageloader.js"></script>
<script src="js/menu.js"></script>
<script src="js/game.js"></script>

<script>
  if (localStorage.getItem("cookieAccepted") === "true") {
    $("#cookiebar").hide();
  }

  $("#cookiebar button").on("click", function() {
    $("#cookiebar").fadeOut(300);
    localStorage.setItem("cookieAccepted", "true");
  });
</script>
</body>
</html>