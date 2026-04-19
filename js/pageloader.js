const pageMap = {
    classic: 'classic.php',
    image: 'image.php',
    emoji: 'emoji.php',
    cheatsheet: 'cheatsheet.php',
    about: 'about.php'
};

const pageInitMap = {
    classic: 'initClassicPage',
    image: 'initImagePage',
    emoji: 'initEmojiPage',
    cheatsheet: 'initCheatsheet'
};

const basePath = window.location.pathname.replace(/\/[^\/]*$/, '');

$(document).ready(function () {

    $('#menu-nav button').click(function () {
        loadPage($(this).data('page'));
    });

    // Kontrola URL při načtení
    const initialPath = getCurrentPath();
    if (pageMap[initialPath]) {
        $('#main-menu').hide();
        loadPage(initialPath);
    } else {
        loadPage('');
    }

    // Back button
    window.addEventListener('popstate', handlePopState);

    $('#menu-nav button').on('mouseenter', playButtonSound);
});

function getCurrentPath() {
    return window.location.pathname.split('/').pop();
}

function handlePopState() {
    const path = getCurrentPath();

    if (pageMap[path]) {
        $('#main-menu').hide();
        loadPage(path);
    } else {
        $('#content').empty();
        $('#main-menu').show();
    }
}

function updateURL(pageKey) {
    const url = new URL(window.location);
    url.pathname = pageKey ? `${basePath}/${pageKey}` : basePath;
    window.history.pushState({}, '', url);
}

function initPage(pageKey) {
    const fn = window[pageInitMap[pageKey]];
    if (typeof fn === 'function') fn();
}

function setActiveButtons(pageKey) {
    $('nav button').each(function () {
        const isActive = $(this).data('page') === pageKey;
        $(this).toggleClass('active', isActive)
               .prop('disabled', isActive);
    });
}

function attachNavHandlers() {
    $('#content nav button')
        .off('mouseenter')
        .on('mouseenter', function () {
            if (!$(this).hasClass('active')) playButtonSound();
        });

    $('#content nav button')
        .off('click')
        .on('click', function () {
            if (!$(this).hasClass('active')) {
                loadPage($(this).data('page'));
            }
        });
}

function playButtonSound() {
    const buttonSound = new Audio('assets/audio/buttonpush.mp3');
    buttonSound.currentTime = 0.15;
    buttonSound.play();
}

function loadPage(pageKey) {
    const pageFile = pageMap[pageKey];

    if (!pageFile) {
        $('#content').fadeOut(150, function () {
            $('#content').empty();
            $('#main-menu').fadeIn(150);
        });

        updateURL('');
        return;
    }

    $('#main-menu').fadeOut(150, function () {
        $('#content').fadeOut(150, function () {

            $('#content').load(pageFile, function () {

                $('#content').fadeIn(150);

                initPage(pageKey);
                setActiveButtons(pageKey);
                attachNavHandlers();
            });

        });
    });

    updateURL(pageKey);
}