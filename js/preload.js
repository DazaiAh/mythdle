// Automatically detect the subdirectory
(function setDynamicBase() {
    const path = window.location.pathname;
    const lastSlash = path.lastIndexOf('/');
    const basePath = path.substring(0, lastSlash + 1);

    if (!$('base').length) {
        const base = document.createElement('base');
        base.href = basePath;
        document.head.prepend(base);
    }
})();

$(document).ready(function () {

    const $progressText = $("#progress-text");
    const $loader = $("#loader");

    const $fileName = $("#file-name");
    const $fileCount = $("#file-count");
    const $downloadedSize = $("#downloaded-size"); // new element

    // Collect assets
    const images = $("img").map(function () { return this.src; }).get();
    const scripts = $("script[src]").map(function () { return this.src; }).get();
    const styles = $("link[rel='stylesheet']").map(function () { return this.href; }).get();
    const assets = [...images, ...scripts, ...styles];

    let loaded = 0;
    const total = assets.length;
    let lastPercent = 0;
    let totalDownloadedBytes = 0; // track downloaded size

    function updateProgress(asset, size = 0) {
        loaded++;
        totalDownloadedBytes += size;

        let percent = Math.floor((loaded / total) * 100);

        $("#progress-full-wrapper").css("width", (percent / 1.4).toFixed(0) + "%");
        $progressText.text((percent / 1.4).toFixed(0) + "%");

        $fileCount.text(loaded + " / " + total);
        $fileName.text(asset.split('/').pop());

        // Show total downloaded size in MB
        $downloadedSize.text("(" + (totalDownloadedBytes / 1024 / 1024).toFixed(2) + " MB)");

        lastPercent = percent / 1.4;

        if (loaded === total) {
            finishLoading();
        }
    }

    function finishLoading() {
        $("body").addClass("loaded");

        let currentPercent = lastPercent;
        let targetPercent = 100;
        let duration = 1500;
        let startTime = Date.now();

        function animateProgress() {
            let elapsed = Date.now() - startTime;
            let progress = Math.min(elapsed / duration, 1);
            let newPercent = currentPercent + (targetPercent - currentPercent) * progress;

            $("#progress-full-wrapper").css("width", newPercent + "%");
            $progressText.text(Math.floor(newPercent) + "%");

            if (progress < 1) {
                requestAnimationFrame(animateProgress);
            } else {
                $loader.css({ opacity: 0, pointerEvents: "none" });
                setTimeout(() => $loader.remove(), 500);
            }
        }

        requestAnimationFrame(animateProgress);
    }

    // Preload assets and track downloaded size
    assets.forEach(asset => {
        fetch(asset)
            .then(res => res.blob())
            .then(blob => updateProgress(asset, blob.size))
            .catch(() => updateProgress(asset, 0));
    });

});