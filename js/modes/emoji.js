function initEmojiPage() {
    const STORAGE_KEY = 'emoji_game_';
    let gameState = {
        guesses: [],
        guessCount: 0,
        solved: false,
        emojis: [],
        hint: null,
        revealCount: 0
    };

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

    clearOldGames();

    // --- FETCH EMOJIS ---
    checkDailyAnswers("emoji");

    $.getJSON('includes/emoji.php')
        .done(function (data) {
            if (!data.success) {
                console.error(data.message);
                return;
            }

            correctId = data.correctId;
            function splitEmojis(str) {
                if (typeof Intl !== 'undefined' && Intl.Segmenter) {
                    const seg = new Intl.Segmenter([], { granularity: 'grapheme' });
                    return Array.from(seg.segment(str), s => s.segment);
                } else {
                    // fallback: match surrogate pairs + variation selectors
                    return str.match(/\p{Extended_Pictographic}/gu) || [];
                }
            }

            // Usage:
            const str = data.emojis[0];
            gameState.emojis = splitEmojis(str);
            gameState.hint = data.hint;

            // Load saved state
            const saved = loadGame();
            if (saved) {
                gameState = saved;
                if (gameState.solved) {
                    $('#characterInput').prop('disabled', true).css('opacity', 0.5);
                    $('#emojiContainer').css('filter', 'saturate(0.2)');
                    $("#emojiDailyAnswer").css('display', 'block');
                    $(".correctCharacter").text(gameState.correctCharacter);
                }
            }

            renderEmojis(); // <-- show the question marks
        })
        .fail(function (err) {
            console.error("Failed to fetch emojis:", err);
        });

    // Load character list for guesses
    getCharactersList(); // assumes global characters array

    // --- RENDER ---
    function renderEmojis() {
        const $list = $('#emojiList');
        if (!$list.length) return; // prevent errors
        $list.empty();

        for (let i = 0; i < gameState.emojis.length; i++) {
            if (i < gameState.revealCount) {
                $list.append(`<span class="emoji">${gameState.emojis[i]}</span>`);
            } else {
                $list.append(`<span class="emoji">❓</span>`);
            }
        }
    }

    // --- SUBMIT ---
    $('#content').off('submit', '#emojiForm');
    $('#content').on('submit', '#emojiForm', function (e) {
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

        if (gameState.guesses.includes(characterId)) {
            alert("Already guessed!");
            return;
        }

        $('#characterInput').val('');

        const isCorrect = characterId == correctId;

        gameState.guesses.push(characterId);
        gameState.guessCount++;

        if(gameState.guessCount > 5) {
            $("#emojiHintTitle").fadeIn(250);
            $("#emojiHint").fadeIn(250).text(gameState.hint);
        }

        if (gameState.revealCount < gameState.emojis.length) {
            gameState.revealCount++;
        }

        if (isCorrect) {
            gameState.solved = true;
            gameState.correctCharacter = characterObj.name;
            launchConfetti();

            $("#emojiDailyAnswer").css('display', 'block');
            $("#correctCharacter").text(characterObj.name);
            $(".correctCharacter").text(characterObj.name);

            $('#characterInput')
                .prop('disabled', true)
                .css('opacity', 0.5);


            $('#emojiContainer').css('filter', 'saturate(0.2)');

            gameState.revealCount = gameState.emojis.length;
        }

        saveGame();
        renderEmojis();
    });
}