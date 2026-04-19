function initImagePage() {
    // --- CONFIG ---
    const maxZoom = 4;
    const minZoom = 1;
    const maxGuesses = 15;

    const STORAGE_KEY = 'image_game_';

    // Add to gameState
    let gameState = {
        guesses: [],
        guessCount: 0,
        solved: false,
        originX: null,
        originY: null
    };

    // --- STORAGE ---
    function getStorageKey() {
        return STORAGE_KEY + getTodayKey();
    }

    function saveGame() {
        localStorage.setItem(getStorageKey(), JSON.stringify(gameState));
    }

    function loadGame() {
        const data = localStorage.getItem(getStorageKey());
        return data ? JSON.parse(data) : null;
    }

    function clearOldGames() {
        const todayKey = getStorageKey();
        for (let i = 0; i < localStorage.length; i++) {
            const key = localStorage.key(i);
            if (key.startsWith(STORAGE_KEY) && key !== todayKey) {
                localStorage.removeItem(key);
            }
        }
    }

    // --- IMAGE CONTROL ---
    function setDailyImage() {
        if (!correctId) return;

        const imgPath = `assets/images/characters/${correctId}.jpg`;
        $('#mainImage').attr('src', imgPath);
    }

function updateZoom() {
    const zoomStep = (maxZoom - minZoom) / maxGuesses;
    const newZoom = Math.max(minZoom, maxZoom - (gameState.guessCount * zoomStep));

    // Set random origin only once
    if (gameState.originX === null) {
        gameState.originX = Math.random() * 100;
        gameState.originY = Math.random() * 100;
    }

    $('#mainImage').css({
        transform: `scale(${newZoom})`,
        transformOrigin: `${gameState.originX}% ${gameState.originY}%`
    });
}

    // --- INIT ---
    clearOldGames();

    // This should set correctId globally or via callback
    checkDailyAnswers("image").done(function() {
        // correctId is now set
        setDailyImage();
        updateZoom();

        // Load saved game state
        const saved = loadGame();
        if (saved) {
            gameState = saved;
            updateZoom();

            if (gameState.solved) {
                $('#characterInput').prop('disabled', true).css('opacity', 0.5);
                $('#mainImage').css('transform', 'scale(1)');

                $('#imageContainer').css('filter', 'saturate(0.2)');
                $("#imageDailyAnswer").css('display', 'block');
                $(".correctCharacter").text(gameState.correctCharacter);
            }
        }

        saveGame();
    });

    // Load characters list
    getCharactersList();

    // --- SUBMIT HANDLER ---
    $('#content').off('submit', '#imageForm');

    $('#content').on('submit', '#imageForm', function (e) {
        e.preventDefault();

        const input = $('#characterInput').val().trim();

        const characterObj = characters.find(
            c => c.name.toLowerCase() === input.toLowerCase()
        );

        if (!characterObj) {
            alert('Musíš si zvolit postavu se seznamu!');
            return;
        }

        if (!correctId) {
            alert("Ještě se nenačetla správná postava pro tento den. Počkej chvíli.");
            return;
        }

        const characterId = characterObj.id;

        // Prevent duplicate guesses
        if (gameState.guesses.includes(characterId)) {
            alert("Already guessed!");
            return;
        }

        $('#characterInput').val('');

        // --- CHECK GUESS ---
        // (You can replace this with AJAX if you want server validation)
        const isCorrect = characterId == correctId;

        // Update state
        gameState.guesses.push(characterId);
        gameState.guessCount++;

        if(gameState.guessCount == 5) {
            gameState.guessCount = gameState.guessCount + 4;
        }

        updateZoom();

        if (isCorrect) {
            gameState.solved = true;
            gameState.correctCharacter = characterObj.name;

            launchConfetti();
            $("#correctCharacter").text(characterObj.name);
            $(".correctCharacter").text(characterObj.name);

            $('#characterInput')
                .prop('disabled', true)
                .css('opacity', 0.5);

            // Fully reveal
            $('#mainImage').css('transform', 'scale(1)');

            $('#imageContainer').css('filter', 'saturate(0.2)');
        }

        saveGame();
    });
}