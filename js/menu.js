let targetPage = null;
    let menuData = {};
    let currentPage = null;
    let animationRunning = false;

$(document).ready(function () {
    $.getJSON("assets/menu.json", function (data) {
        menuData = data;
        loadDesc("welcome", false);
    });

    $(".btn-menu").on("mouseenter", function () {
        const page = $(this).data("page");
        if (page === currentPage || animationRunning) return;
        loadDesc(page, true);

    });
});

/**
 * Pomocná funkce pro načítaní popisku herního modu v hlavním menu. Zajištuje taky jQuery animaci pŕes fadeIn/fadeOut.
 * @param page = URL, o které si to má načíst popis
 * @param animate = jestli chceme přechod animovat (někdy to nechceme, třeba u prvního loadu)
 */

function loadDesc(page, animate = true) {
    const info = menuData[page];
    if (!info) return;

    targetPage = page;

    const $title = $(".main-menu-desc-title");
    const $text = $(".main-menu-desc-text");

    function buildContent() {
        let html = "";

        if (info.description) {
            info.description.forEach(p => {
                html += `<p>${p}</p>`;
            });
        }

        if (info.hints && info.hints.length > 0) {
            html += `<h3 style="margin-top:3rem;">Nápovědy</h3>`;
            info.hints.forEach(hint => {
                html += `
                <div class="menu-hint">
                    <button class="btn-circle" style="margin:0;">
                        <img src="${hint.icon}">
                    </button>
                    ${hint.text}
                </div>
                `;
            });
        }

        return html;
    }

    $title.stop(true, true);
    $text.stop(true, true);

    if (!animate) {
        $title.html(`<h2>${info.title}</h2>`).show();
        $text.html(buildContent()).show();
        currentPage = targetPage;
        return;
    }

    $title.fadeOut(175);
    $text.fadeOut(175, function () {
        if (targetPage !== page) return;

        $title.html(`<h2>${info.title}</h2>`);
        $text.html(buildContent());

        $title.fadeIn(175);
        $text.fadeIn(175, function () {
            currentPage = targetPage;
        });
    });
}