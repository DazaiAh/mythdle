var characters = [];
var correctId = null;

/**
 * Získání seznamu postav.
 * S tímto seznamem pak pracujou všechny herní mody - využívá se po předvyplnění jmen. 
 * Pozor, má jednu podmínku - uužívatel musí napsať alespoň jedno písmeno!
 */
function getCharactersList() {
    $.getJSON('includes/characters.php')
        .done(function (data) {
            characters = data;

            const $input = $('#characterInput');
            const $datalist = $('#characterList');

            $input.on('input', function () {
                const value = $(this).val().trim().toLowerCase();
                $datalist.empty();
                if (value.length < 1) return;

                const filtered = characters.filter(c =>
                    c.name.toLowerCase().startsWith(value)
                );

                if (filtered.length === 0) return;

                filtered.forEach(c => {
                    $datalist.append($('<option>').val(c.name));
                });
            });
            return characters;
        })
        .fail(console.error);
}

/**
 * Kontrola správné denní odpovědi, s kterou se pak pracuje v herních modech.
 * @param mode = herní mod, který si vybere uživatel (emoji, classic, image...)
 */
function checkDailyAnswers(mode = 'classic') {
    const $submitBtn = $('#submitBtn');
    $submitBtn.prop('disabled', true);

    return $.getJSON('includes/daily.php')
        .done(function (data) {
            if (data[mode] !== undefined) {
                correctId = data[mode]; // pick the ID for the selected mode
                $submitBtn.prop('disabled', false);
            } else {
                console.error("No correctId found for mode:", mode);
            }
        })
        .fail(console.error);
}

/**
 * Uložení a načítaní lokálně uložených dat podle klíče - tahle helper funkce získá právě klíč ve formatu datum+mod.
 * @param STORAGE_KEY = klíč - většinou podle herního modu
 */
function getTodayKey(STORAGE_KEY) {
    const today = new Date();
    return `${STORAGE_KEY}_${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
}