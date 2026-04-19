function initClassicPage() {
    const STORAGE_KEY = 'dle_classic';
    let gameState = {
        guesses: [],
        guessCount: 0,
        solved: false,
    };

    function saveTable() {
        const key = getTodayKey(STORAGE_KEY);
        localStorage.setItem(key + "-gameState", JSON.stringify(gameState));
        localStorage.setItem(key, $('#tableBody').html());
    }

    function loadTable() {
        const key = getTodayKey(STORAGE_KEY);
        return localStorage.getItem(key) || '';
    }

    function loadGame() {
        const data = localStorage.getItem(getTodayKey(STORAGE_KEY) + "-gameState");
        return data ? JSON.parse(data) : null;
    }

    function clearOldTables() {
        const todayPrefix = getTodayKey(STORAGE_KEY).slice(0, STORAGE_KEY.length);
        for (let i = 0; i < localStorage.length; i++) {
            const key = localStorage.key(i);
            if (key.startsWith(STORAGE_KEY) && !key.startsWith(todayPrefix)) {
                localStorage.removeItem(key);
            }
        }
    }

    // --- Initialization ---
    clearOldTables();
    checkDailyAnswers("classic");

    getCharactersList();

    // Load saved table for today, if any
    const savedTable = loadTable();
    const saved = loadGame();
    if (saved) {
        gameState = saved;

        if (gameState.solved) {
            $(".correctCharacter").text(gameState.correctCharacter);
            $("#classicDailyAnswer").css('display', 'block');
            $('#tableContainer').css('filter', 'saturate(0.2)');
            $('#characterInput').prop('disabled', true).css('opacity', 0.5);
        }
    }

    if (savedTable) {
        $('#tableBody').html(savedTable);

        if (gameState.solved) {
            $('#characterInput').prop('disabled', true).css('opacity', 0.5);
        }
    }

    // --- Form submission ---
    $('#content').off('submit', '#classicForm'); // remove old handlers first
    $('#content').on('submit', '#classicForm', function (e) {
        e.preventDefault();

        const input = $('#characterInput').val().trim();
        const characterObj = characters.find(c => c.name.toLowerCase() === input.toLowerCase());

        if (!characterObj) {
            alert('Musíš si zvolit postavu se seznamu!');
            return;
        }

        if (!correctId) {
            alert("Ještě se nenačetla správná postava pro tento den. Počkej chvíli.");
            return;
        }

        const characterId = characterObj.id;

        $.ajax({
            url: 'includes/classic.php',
            method: 'POST',
            data: { characterId: characterId, correctId: correctId, guessCount: gameState.guessCount },
            dataType: 'json', // important for JSON response
            success: function (data) {
                $('#tableBody').prepend(data.html);
                $('#characterInput').val('');

                gameState.guesses.push(characterId);
                gameState.guessCount++;

                if(data.hint) {
                    $("#classicHintTitle").fadeIn(250);
                    $("#classicHint").fadeIn(250).text(data.hint);
                }

                if (data.correct) {
                    gameState.solved = true;
                    gameState.correctCharacter = data.name;

                    launchConfetti();

                    $("#correctCharacter").text(data.name);
                    $(".correctCharacter").text(data.name);

                    // Disable the input and make it less opaque
                    $('#tableContainer').css('filter', 'saturate(0.2)');
                    $("#classicDailyAnswer").css('display', 'block');
                    $('#characterInput').prop('disabled', true).css('opacity', 0.5);
                }

                saveTable(); // Save table after every guess
            },
            error: console.error
        });

    });
}