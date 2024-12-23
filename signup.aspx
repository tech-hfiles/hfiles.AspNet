<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="hfiles.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



        <link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.21.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/uploads/elementor/css/post-22.css?ver=1714086109' media='all' />
     <link rel='stylesheet'  href='https://hfiles.in/wp-content/themes/hello-elementor/style.min.css?ver=3.0.1' media='all' />
     <link rel='stylesheet' href='https://hfiles.in/wp-content/uploads/elementor/css/post-89.css?ver=1714086109' media='all' />
    <link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/widget-styles.css?ver=3.1.3' media='all' />







        <%--<title>Hfiles | Create and Manage Your E-health Record(EHR) With Us</title>--%>
<%--<meta name='robots' content='noindex, nofollow' />--%>
<link rel="alternate" type="application/rss+xml" title="Hfiles | Create and Manage Your E-health Record(EHR) With Us &raquo; Feed" href="https://hfiles.in/feed/" />
<link rel="alternate" type="application/rss+xml" title="Hfiles | Create and Manage Your E-health Record(EHR) With Us &raquo; Comments Feed" href="https://hfiles.in/comments/feed/" />
<script>
    window._wpemojiSettings = { "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/72x72\/", "ext": ".png", "svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/svg\/", "svgExt": ".svg", "source": { "concatemoji": "https:\/\/hfiles.in\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.5.2" } };
    /*! This file is auto-generated */
    !function (i, n) { var o, s, e; function c(e) { try { var t = { supportTests: e, timestamp: (new Date).valueOf() }; sessionStorage.setItem(o, JSON.stringify(t)) } catch (e) { } } function p(e, t, n) { e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(t, 0, 0); var t = new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data), r = (e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(n, 0, 0), new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data)); return t.every(function (e, t) { return e === r[t] }) } function u(e, t, n) { switch (t) { case "flag": return n(e, "\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f", "\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f") ? !1 : !n(e, "\ud83c\uddfa\ud83c\uddf3", "\ud83c\uddfa\u200b\ud83c\uddf3") && !n(e, "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f", "\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f"); case "emoji": return !n(e, "\ud83d\udc26\u200d\u2b1b", "\ud83d\udc26\u200b\u2b1b") }return !1 } function f(e, t, n) { var r = "undefined" != typeof WorkerGlobalScope && self instanceof WorkerGlobalScope ? new OffscreenCanvas(300, 150) : i.createElement("canvas"), a = r.getContext("2d", { willReadFrequently: !0 }), o = (a.textBaseline = "top", a.font = "600 32px Arial", {}); return e.forEach(function (e) { o[e] = t(a, e, n) }), o } function t(e) { var t = i.createElement("script"); t.src = e, t.defer = !0, i.head.appendChild(t) } "undefined" != typeof Promise && (o = "wpEmojiSettingsSupports", s = ["flag", "emoji"], n.supports = { everything: !0, everythingExceptFlag: !0 }, e = new Promise(function (e) { i.addEventListener("DOMContentLoaded", e, { once: !0 }) }), new Promise(function (t) { var n = function () { try { var e = JSON.parse(sessionStorage.getItem(o)); if ("object" == typeof e && "number" == typeof e.timestamp && (new Date).valueOf() < e.timestamp + 604800 && "object" == typeof e.supportTests) return e.supportTests } catch (e) { } return null }(); if (!n) { if ("undefined" != typeof Worker && "undefined" != typeof OffscreenCanvas && "undefined" != typeof URL && URL.createObjectURL && "undefined" != typeof Blob) try { var e = "postMessage(" + f.toString() + "(" + [JSON.stringify(s), u.toString(), p.toString()].join(",") + "));", r = new Blob([e], { type: "text/javascript" }), a = new Worker(URL.createObjectURL(r), { name: "wpTestEmojiSupports" }); return void (a.onmessage = function (e) { c(n = e.data), a.terminate(), t(n) }) } catch (e) { } c(n = f(s, u, p)) } t(n) }).then(function (e) { for (var t in e) n.supports[t] = e[t], n.supports.everything = n.supports.everything && n.supports[t], "flag" !== t && (n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && n.supports[t]); n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && !n.supports.flag, n.DOMReady = !1, n.readyCallback = function () { n.DOMReady = !0 } }).then(function () { return e }).then(function () { var e; n.supports.everything || (n.readyCallback(), (e = n.source || {}).concatemoji ? t(e.concatemoji) : e.wpemoji && e.twemoji && (t(e.twemoji), t(e.wpemoji))) })) }((window, document), window._wpemojiSettings);
</script>
<%--<link rel='stylesheet' id='elementor-frontend-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.21.3' media='all' />--%>
<%--<link rel='stylesheet' id='elementor-post-22-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-22.css?ver=1714086109' media='all' />--%>
<%--<link rel='stylesheet' id='elementor-post-23-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-23.css?ver=1714086109' media='all' />--%>
<style id='wp-emoji-styles-inline-css'>
    img.wp-smiley, img.emoji {
        display: inline !important;
        border: none !important;
        box-shadow: none !important;
        height: 1em !important;
        width: 1em !important;
        margin: 0 0.07em !important;
        vertical-align: -0.1em !important;
        background: none !important;
        padding: 0 !important;
    }
</style>
<style id='classic-theme-styles-inline-css'>
    /*! This file is auto-generated */
    .wp-block-button__link {
        color: #fff;
        background-color: #32373c;
        border-radius: 9999px;
        box-shadow: none;
        text-decoration: none;
        padding: calc(.667em + 2px) calc(1.333em + 2px);
        font-size: 1.125em
    }

    .wp-block-file__button {
        background: #32373c;
        color: #fff;
        text-decoration: none
    }
</style>
<style id='global-styles-inline-css'>
    body {
        --wp--preset--color--black: #000000;
        --wp--preset--color--cyan-bluish-gray: #abb8c3;
        --wp--preset--color--white: #ffffff;
        --wp--preset--color--pale-pink: #f78da7;
        --wp--preset--color--vivid-red: #cf2e2e;
        --wp--preset--color--luminous-vivid-orange: #ff6900;
        --wp--preset--color--luminous-vivid-amber: #fcb900;
        --wp--preset--color--light-green-cyan: #7bdcb5;
        --wp--preset--color--vivid-green-cyan: #00d084;
        --wp--preset--color--pale-cyan-blue: #8ed1fc;
        --wp--preset--color--vivid-cyan-blue: #0693e3;
        --wp--preset--color--vivid-purple: #9b51e0;
        --wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);
        --wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);
        --wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);
        --wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);
        --wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);
        --wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);
        --wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);
        --wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);
        --wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);
        --wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);
        --wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);
        --wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);
        --wp--preset--font-size--small: 13px;
        --wp--preset--font-size--medium: 20px;
        --wp--preset--font-size--large: 36px;
        --wp--preset--font-size--x-large: 42px;
        --wp--preset--spacing--20: 0.44rem;
        --wp--preset--spacing--30: 0.67rem;
        --wp--preset--spacing--40: 1rem;
        --wp--preset--spacing--50: 1.5rem;
        --wp--preset--spacing--60: 2.25rem;
        --wp--preset--spacing--70: 3.38rem;
        --wp--preset--spacing--80: 5.06rem;
        --wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);
        --wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);
        --wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);
        --wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);
        --wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);
    }

    :where(.is-layout-flex) {
        gap: 0.5em;
    }

    :where(.is-layout-grid) {
        gap: 0.5em;
    }

    body .is-layout-flow > .alignleft {
        float: left;
        margin-inline-start: 0;
        margin-inline-end: 2em;
    }

    body .is-layout-flow > .alignright {
        float: right;
        margin-inline-start: 2em;
        margin-inline-end: 0;
    }

    body .is-layout-flow > .aligncenter {
        margin-left: auto !important;
        margin-right: auto !important;
    }

    body .is-layout-constrained > .alignleft {
        float: left;
        margin-inline-start: 0;
        margin-inline-end: 2em;
    }

    body .is-layout-constrained > .alignright {
        float: right;
        margin-inline-start: 2em;
        margin-inline-end: 0;
    }

    body .is-layout-constrained > .aligncenter {
        margin-left: auto !important;
        margin-right: auto !important;
    }

    body .is-layout-constrained > :where(:not(.alignleft):not(.alignright):not(.alignfull)) {
        max-width: var(--wp--style--global--content-size);
        margin-left: auto !important;
        margin-right: auto !important;
    }

    body .is-layout-constrained > .alignwide {
        max-width: var(--wp--style--global--wide-size);
    }

    body .is-layout-flex {
        display: flex;
    }

    body .is-layout-flex {
        flex-wrap: wrap;
        align-items: center;
    }

        body .is-layout-flex > * {
            margin: 0;
        }

    body .is-layout-grid {
        display: grid;
    }

        body .is-layout-grid > * {
            margin: 0;
        }

    :where(.wp-block-columns.is-layout-flex) {
        gap: 2em;
    }

    :where(.wp-block-columns.is-layout-grid) {
        gap: 2em;
    }

    :where(.wp-block-post-template.is-layout-flex) {
        gap: 1.25em;
    }

    :where(.wp-block-post-template.is-layout-grid) {
        gap: 1.25em;
    }

    .has-black-color {
        color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-color {
        color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-color {
        color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-color {
        color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-color {
        color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-color {
        color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-color {
        color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-color {
        color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-color {
        color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-color {
        color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-color {
        color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-color {
        color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-black-background-color {
        background-color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-background-color {
        background-color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-background-color {
        background-color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-background-color {
        background-color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-background-color {
        background-color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-background-color {
        background-color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-background-color {
        background-color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-background-color {
        background-color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-background-color {
        background-color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-background-color {
        background-color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-background-color {
        background-color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-background-color {
        background-color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-black-border-color {
        border-color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-border-color {
        border-color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-border-color {
        border-color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-border-color {
        border-color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-border-color {
        border-color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-border-color {
        border-color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-border-color {
        border-color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-border-color {
        border-color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-border-color {
        border-color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-border-color {
        border-color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-border-color {
        border-color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-border-color {
        border-color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-vivid-cyan-blue-to-vivid-purple-gradient-background {
        background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;
    }

    .has-light-green-cyan-to-vivid-green-cyan-gradient-background {
        background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;
    }

    .has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background {
        background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-orange-to-vivid-red-gradient-background {
        background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;
    }

    .has-very-light-gray-to-cyan-bluish-gray-gradient-background {
        background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;
    }

    .has-cool-to-warm-spectrum-gradient-background {
        background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;
    }

    .has-blush-light-purple-gradient-background {
        background: var(--wp--preset--gradient--blush-light-purple) !important;
    }

    .has-blush-bordeaux-gradient-background {
        background: var(--wp--preset--gradient--blush-bordeaux) !important;
    }

    .has-luminous-dusk-gradient-background {
        background: var(--wp--preset--gradient--luminous-dusk) !important;
    }

    .has-pale-ocean-gradient-background {
        background: var(--wp--preset--gradient--pale-ocean) !important;
    }

    .has-electric-grass-gradient-background {
        background: var(--wp--preset--gradient--electric-grass) !important;
    }

    .has-midnight-gradient-background {
        background: var(--wp--preset--gradient--midnight) !important;
    }

    .has-small-font-size {
        font-size: var(--wp--preset--font-size--small) !important;
    }

    .has-medium-font-size {
        font-size: var(--wp--preset--font-size--medium) !important;
    }

    .has-large-font-size {
        font-size: var(--wp--preset--font-size--large) !important;
    }

    .has-x-large-font-size {
        font-size: var(--wp--preset--font-size--x-large) !important;
    }

    .wp-block-navigation a:where(:not(.wp-element-button)) {
        color: inherit;
    }

    :where(.wp-block-post-template.is-layout-flex) {
        gap: 1.25em;
    }

    :where(.wp-block-post-template.is-layout-grid) {
        gap: 1.25em;
    }

    :where(.wp-block-columns.is-layout-flex) {
        gap: 2em;
    }

    :where(.wp-block-columns.is-layout-grid) {
        gap: 2em;
    }

    .wp-block-pullquote {
        font-size: 1.5em;
        line-height: 1.6;
    }
</style>




        <link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/sweetalert2.min.css?ver=1.2.0' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/frontend.css?ver=1.2.0' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/column-shortcodes/assets/css/shortcodes.css?ver=1.0.1' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.9.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/themes/hello-elementor/style.min.css?ver=3.0.1' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/themes/hello-elementor/theme.min.css?ver=3.0.1' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/themes/hello-elementor/header-footer.min.css?ver=3.0.1' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/uploads/elementor/css/post-89.css?ver=1714086109' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementskit-lite/modules/elementskit-icon-pack/assets/css/ekiticons.css?ver=3.1.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=5.29.0' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css?ver=8.4.5' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css?ver=3.21.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/v4-shims.min.css?ver=3.21.3' media='all' />
<link rel='stylesheet' href='https://hfiles.in/wp-content/plugins/sticky-header-effects-for-elementor/assets/css/she-header-style.css?ver=1.6.10' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/uploads/elementor/css/post-26.css?ver=1714111713' media='all' />
<link rel='stylesheet' href='https://hfiles.in/wp-content/themes/hello-theme-child-master/style.css?ver=6.5.2' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/widget-styles.css?ver=3.1.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/responsive.css?ver=3.1.3' media='all' />
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRed+Hat+Display%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&amp;display=swap&amp;ver=6.5.2' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/fontawesome.min.css?ver=5.15.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/brands.min.css?ver=5.15.3' media='all' />
<link rel='stylesheet'  href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/solid.min.css?ver=5.15.3' media='all' />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<script src="https://hfiles.in/wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
<script src="https://hfiles.in/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1" id="jquery-migrate-js"></script>
<script src="https://hfiles.in/wp-content/plugins/sticky-header-effects-for-elementor/assets/js/she-header.js?ver=1.6.10" id="she-header-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/js/v4-shims.min.js?ver=3.21.3" id="font-awesome-4-shim-js"></script>
<link rel="https://api.w.org/" href="https://hfiles.in/wp-json/" />
<link rel="alternate" type="application/json" href="https://hfiles.in/wp-json/wp/v2/pages/26" />
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://hfiles.in/xmlrpc.php?rsd" />
<meta name="generator" content="WordPress 6.5.2" />
<link rel="canonical" href="https://hfiles.in/" />
<link rel='shortlink' href='https://hfiles.in/' />
<link rel="alternate" type="application/json+oembed" href="https://hfiles.in/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fhfiles.in%2F" />
<link rel="alternate" type="text/xml+oembed" href="https://hfiles.in/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fhfiles.in%2F&amp;format=xml" />
<meta name="generator" content="Elementor 3.21.3; features: e_optimized_assets_loading, e_optimized_css_loading, additional_custom_breakpoints; settings: css_print_method-external, google_font-enabled, font_display-swap">
<link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png" sizes="32x32" />
<link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png" sizes="192x192" />
<link rel="apple-touch-icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png" />
<meta name="msapplication-TileImage" content="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png" />
<style>
    @media (min-width: 850px) {
        #menu-item-649 {
            display: none !important;
            visibility: hidden !important;
        }
    }
</style>













    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

    <title>Sign Up</title>
    <style>
        .signin-form {
            /* margin-bottom:50px;*/
        }

            .signin-form input::placeholder {
                color: black !important;
            }

        .input-div input[type='date'] {
            color: #000 !important;
        }

        @media (min-width: 992px) {

            .footer {
                background: #0331b5;
                color: #ffffff;
                text-align: center;
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                padding: 10px
            }
        }

        .signin-main {
            /*display:flex;
            flex-direction:column;
            flex:1;
            height:auto;
            width:100%;
            position:relative;*/
        }

        @media (min-width: 730px) {
            html, body {
                /*overflow: hidden !important;*/
            }

            .signup-right {
                height: 95vh !important;
                overflow: hidden !important;
            }
        }

        @media (max-width: 992px) {

            .footer {
                background: #0331b5;
                color: #ffffff;
                text-align: center;
                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;
                padding: 10px
            }

            .signin-main .vert-cent {
                min-height: 95vh;
            }
        }

        @media(max-width:540px) {
            .footer {
                position: fixed;
            }

            .div-for-otp {
                margin-bottom: 100px;
            }

            .signin-main .vert-cent {
                height: fit-content;
            }
        }

        .input-div input[type='date'] {
            -webkit-appearance: none; /* Remove default styling */
            color: #000 !important; /* Apply text color */
            font-family: inherit; /* Use the same font as the rest of the document */
        }

            .input-div input[type='date']::-webkit-inner-spin-button,
            .input-div input[type='date']::-webkit-calendar-picker-indicator {
                display: none; /* Remove the spin buttons and calendar icon */
                -webkit-appearance: none; /* Remove default appearance */
            }


        /*@media (min-width: 768px) and (max-width: 991px) {
            .footer {
                position: absolute;
            }
        }

        @media (min-width: 415px) and (max-width: 480px) {
            .signin-main .vert-cent {
                height: 110vh !important;
            }
        }

        @media (max-width: 414px) {
            .footer {
                position: relative;
            }
        }

        @media (max-width: 430px) {
            .footer {
                position: relative;
            }

            .signin-main .vert-cent {*/
        /*height: 100vh !important;*/
        /*}
        }

        @media (min-width: 360px) and (max-height: 640px) {
            .footer {
                position: relative;
            }

            .signin-main .vert-cent {*/
        /*                height: 110vh !important;
*/ /*}
        }

        @media (min-width: 370px) and (max-height: 667px) {
            .footer {
                position: relative;
            }
        }

        @media (min-width: 360px) and (max-height: 740px) {
            .footer {
                position: relative;
            }
        }*/
    </style>

    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <style>
        #toast-container > .toast-success {
            background-color: #fdd001;
            opacity: 2;
            color: #0331b5;
            font-weight: 600;
        }

        @media(max-width:640px) {
            #toast-container > .toast-success {
                font-size: 14px;
            }
        }
        /*.toast-message {
         background-color: #0331b5;
     }*/
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>


    <script>
        toastr.options = {
            closeButton: true,
            progressBar: true,
            positionClass: 'toast-top-right'
        };
        /* Style for checkbox */


    </script>
</head>
<body>


    <header>
            <div class="ekit-template-content-markup ekit-template-content-header ekit-template-content-theme-support">
        <div data-elementor-type="wp-post" data-elementor-id="22" class="elementor elementor-22">
            <section class="elementor-section elementor-top-section elementor-element elementor-element-398692e4 she-header-yes elementor-section-full_width elementor-section-height-default elementor-section-height-default" data-id="398692e4" data-element_type="section" data-settings="{&quot;transparent&quot;:&quot;yes&quot;,&quot;background_background&quot;:&quot;classic&quot;,&quot;shrink_header&quot;:&quot;yes&quot;,&quot;custom_height_header&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:50,&quot;sizes&quot;:[]},&quot;transparent_on&quot;:[&quot;desktop&quot;,&quot;tablet&quot;,&quot;mobile&quot;],&quot;scroll_distance&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:60,&quot;sizes&quot;:[]},&quot;scroll_distance_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;scroll_distance_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;custom_height_header_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;custom_height_header_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]}}">
                <div class="elementor-container elementor-column-gap-default">
                    <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-5fe2b7fd" data-id="5fe2b7fd" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                        <div class="elementor-widget-wrap elementor-element-populated">
                            <div class="elementor-element elementor-element-321fbce elementor-widget elementor-widget-image" data-id="321fbce" data-element_type="widget" data-widget_type="image.default">
                                <div class="elementor-widget-container">
                                    <style>
                                        /*! elementor - v3.21.0 - 25-04-2024 */
                                        .text-white {
                                            color: #FFFFFF !important;
                                        }

                                        .elementor-widget-image {
                                            text-align: center
                                        }

                                            .elementor-widget-image a {
                                                display: inline-block
                                            }

                                                .elementor-widget-image a img[src$=".svg"] {
                                                    width: 48px
                                                }

                                            .elementor-widget-image img {
                                                vertical-align: middle;
                                                display: inline-block
                                            }
                                    </style>
<img width="207" height="80" src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" class="attachment-full size-full wp-image-361" alt="hfiles logo" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-37d29820" data-id="37d29820" data-element_type="column">
                        <div class="elementor-widget-wrap elementor-element-populated">
                            <div class="elementor-element elementor-element-1b85bfcc elementor-widget elementor-widget-ekit-nav-menu" data-id="1b85bfcc" data-element_type="widget" data-widget_type="ekit-nav-menu.default">
                                <div class="elementor-widget-container">
                                    <div class="ekit-wid-con ekit_menu_responsive_tablet" data-hamburger-icon="icon icon-menu-5" data-hamburger-icon-type="icon" data-responsive-breakpoint="1024">
                                        <button class="elementskit-menu-hamburger elementskit-menu-toggler" type="button" aria-label="hamburger-icon">
                                            <i aria-hidden="true" class="ekit-menu-icon icon icon-menu-5"></i>
                                        </button>
                                        <div id="ekit-megamenu-primary-menu" class="elementskit-menu-container elementskit-menu-offcanvas-elements elementskit-navbar-nav-default ekit-nav-menu-one-page-no ekit-nav-dropdown-hover">
                                            <ul id="menu-primary-menu" class="elementskit-navbar-nav elementskit-menu-po-right submenu-click-on-icon">
                                                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-649 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                    <a href="#why" class="ekit-menu-nav-link">Why hfiles?</a></li>
                                                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-650 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                   <%-- <a href="#ABHA" class="ekit-menu-nav-link">ABHA</a></li>--%>
                                            </ul>
                                            <div class="elementskit-nav-identity-panel">
                                                <div class="elementskit-site-title">
                                                    <a class="elementskit-nav-logo" href="https://hfiles.in/" target="_self" rel="">
                                                        <img fetchpriority="high" width="512" height="512" src="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon.png" class="attachment-full size-full" alt="" decoding="async" srcset="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon.png 512w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-300x300.png 300w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-150x150.png 150w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png 270w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png 192w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png 180w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png 32w" sizes="(max-width: 512px) 100vw, 512px" />
                                                    </a>
                                                </div>
                                                <button class="elementskit-menu-close elementskit-menu-toggler" type="button">X</button>
                                            </div>
                                        </div>
                                        <div class="elementskit-menu-overlay elementskit-menu-offcanvas-elements elementskit-menu-toggler ekit-nav-menu--overlay"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-2347957b elementor-hidden-mobile" data-id="2347957b" data-element_type="column">
                        <div class="elementor-widget-wrap elementor-element-populated">
                            <section class="elementor-section elementor-inner-section elementor-element elementor-element-d5de6cc elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="d5de6cc" data-element_type="section">
                                <div class="elementor-container elementor-column-gap-default">
                                    <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-5e07fc7" data-id="5e07fc7" data-element_type="column">
                                        <div class="elementor-widget-wrap elementor-element-populated">
                                            <div class="elementor-element elementor-element-0fd294a elementor-align-center elementor-tablet-align-right elementor-widget elementor-widget-button" data-id="0fd294a" data-element_type="widget" data-widget_type="button.default">
                                                <div class="elementor-widget-container">
                                                    <div class="elementor-button-wrapper">
                                                        <a class="elementor-button elementor-button-link elementor-size-sm" href="/login.aspx">
                                                            <span class="elementor-button-content-wrapper">
                                                                <span class="elementor-button-text" style="color:white;">User Login</span>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-51a43c9" data-id="51a43c9" data-element_type="column">
                                        <div class="elementor-widget-wrap elementor-element-populated">
                                            <div class="elementor-element elementor-element-43a819f elementor-align-center elementor-tablet-align-right elementor-widget elementor-widget-button" data-id="43a819f" data-element_type="widget" data-widget_type="button.default">
                                                <div class="elementor-widget-container">
                                                    <div class="elementor-button-wrapper">
                                                        <a class="elementor-button elementor-button-link elementor-size-sm" style="background-color:#fdd001" href="/signup.aspx">
                                                            <span class="elementor-button-content-wrapper">
                                                                <span class="elementor-button-text" style="color:black;">Sign up</span>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

        </header>




    <%-- <div id="google_translate_element" class="language">
        Select Language
        <%--<details>
        <summary>Language</summary>

        <ul id="language">
            <li>English</li>
        </ul>
    </details>
    </div>--%>

    <div class="signin-main">
        <form class="w-100 h-100" runat="server">

            <%--<div id="google_translate_element" class="language"></div>--%>
            <asp:ScriptManager ID="scmSignUp" runat="server"></asp:ScriptManager>

            <%--<div class="row vert-cent w-100 h-sm-100vh m-0 ">--%>
                <div class="row vert-cent w-100 h-sm-90vh m-0 " style="overflow-y:auto;max-height:95vh">
                <div class="col-lg-6 col-xl-6 col-md-6 col-sm-12 samanta-stand-image h-lg-100vh d-none d-lg-block px-5" style="background: #fff">
                    <img src="<%= ResolveUrl("~/assets/signup-samanta.png") %>" alt="" style="width: 100%; height: 100%; object-fit: contain" />
                </div>

                <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12 px-5 d-flex justify-content-center align-items-center signup-right"
                    style="background-image: url('<%= ResolveUrl("~/Reception Page/002B.png") %>'); background-repeat: no-repeat; background-size: cover;">
                    <div>
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <%-- below line added for google translator --%>
                            <div id="google_element"></div>

                            <h1 class="color-white">Sign Up</h1>
                        </div>
                        <div class="row signin-form form-group has-search text-center justify-content-center ">
                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <!-- <span class="fa fa-user form-control-feedback"></span> -->
                                <input id="firstnameTextBox" minlength="3" runat="server" required type="text" class="form-control my-2" placeholder="First Name" />
                            </div>
                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <input id="lastnameTextBox" runat="server" type="text" class="form-control my-2" placeholder="Last Name" required />
                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-cake-candles form-control-feedback"></i>
                                <asp:TextBox runat="server" placeholder="yyyy-mm-dd" ID="txtDate" required onkeypress="return false" AutoComplete="Off" class="form-control my-2" />
                                <ajaxToolkit:CalendarExtender ID="dateajax" runat="server" Format="yyyy-MM-dd" Enabled="true" TargetControlID="txtDate" />
                                <input runat="server" id="dobTextBox1" style="display: none; visibility: hidden;" type="date" class="form-control my-2" value="2024-01-01" required />
                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                <input type="number" id="phoneTextBox" runat="server" class="form-control my-2" placeholder="Phone No" required />
                            </div>
                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-regular fa-envelope form-control-feedback"></i>
                                <input id="emailTextBox" runat="server" type="email" class="form-control my-2" placeholder="Email ID" required />
                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 password-div input-div">
                                <i class="fa-solid fa-lock form-control-feedback"></i>

                                <asp:TextBox ID="pwdTextBox" runat="server" type="password" class="form-control my-2" placeholder="Password" required />
                                <i id="passwordView1" class="fa-solid fa-eye-slash hide-password-toggal"></i>


                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 password-div input-div">
                                <i class="fa-solid fa-lock form-control-feedback"></i>
                                <asp:TextBox ID="cpwdTextBox" runat="server" type="password" class="form-control my-2" placeholder="Confirm Password" required />
                                <i id="passwordView2" class="fa-solid fa-eye-slash hide-password-toggal"></i>
                                <%-- <asp:RequiredFieldValidator ControlToValidate="cpwdTextBox" ErrorMessage="Please Enter Confirm Password" runat="server" ForeColor="White"></asp:RequiredFieldValidator Display="">--%>
                            </div>
                            <asp:CompareValidator ControlToValidate="cpwdTextBox" Display="Dynamic" ControlToCompare="pwdTextBox" ErrorMessage="Password and Confirm Password should be same" runat="server" ForeColor="White"></asp:CompareValidator>

                        </div>


                        <div style="text-align: center !important;">
                            <asp:Image ID="captchaimage" runat="server"   Height="40px" Width="150px" ImageUrl="~/captchacode.aspx"/>
                            <asp:Label ID="Lblcaptcha" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="txtcaptcha" runat="server"  Height="40px" Width="250px" placeholder="Enter captcha code"></asp:TextBox>
                        </div>




                        <div class="text-center my-3 text-white">
                            <input type="checkbox" id="termsCheckbox" required />
                            <label for="termsCheckbox">I accept the <a href="tc.aspx" target="_blank">Terms & Conditions</a></label>
                        </div>

                        <div class="text-center my-3" runat="server" id="divOtp">
                            <asp:Button ID="genOTPButton" runat="server" Text="Sign Up" OnClick="signup_Click" OnClientClick="JSalert()" class="btn thm-button"></asp:Button>
                        </div>
                        <div class="row signin-form form-group has-search text-center justify-content-center">
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5 div-for-otp">
                                <div runat="server" id="divSubmit">
                                    <div class="signin-form mt-2">
                                        <div class="w-100">
                                            <input id="otpTextBox" runat="server" type="text" required class="form-control w-100 OTP-input" placeholder="Enter OTP" />
                                            <div class="d-flex justify-content-between align-items-center">
                                                <asp:Label ID="errorLabel" Text="" runat="server" CssClass="color-theme-yellow" />
                                                <span class="mx-2">
                                                    <span id="timer" style="color: #fff"></span>
                                                    <asp:LinkButton ID="resendLinkButtonTest" runat="server" OnClick="resendLinkButtonTest_Click">Resend OTP</asp:LinkButton></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center my-2">
                                        <asp:Button ID="submitButton" runat="server" Text="Register" OnClick="submitButton_Click" class="btn thm-button"></asp:Button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


            <%--<img class="plus-top-right" src="<%= ResolveUrl("~/assets/plus-1.png") %>" alt="" />
            <img class="plus-bottom-left" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="" />--%>
            <%--<a href="<%= ResolveUrl("~/login.aspx") %>">
                <img class="triangle-top-right-cancel" src="<%= ResolveUrl("~/assets/cancel-white.png") %>" alt="" /></a>--%>

            <%--<div class="row footer justify-content-around align-items-center m-0">--%>
            <div class="row footer justify-content-around align-items-center m-0" style="z-index:1000000">
                <div class="col-4 t-c d-xl-flex justify-content-center text-center">
                    <p class="m-0"><a href="TermsAndConditions.aspx">Terms & Conditions</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
                </div>
                <div class="col-4 copy-right text-center p-0 d-xl-flex text-center justify-content-center">
                    <p class="m-0"><a href="/FAQ.aspx" class="text-white">FAQ's</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="text-white" href="copyright.aspx">Copyright@2024</a></p>
                </div>

                <div class="col-4 p-p d-xl-flex text-center justify-content-center">
                    <p class="m-0">
                        <a
                            href="https://wa.me/919978043453"><i class="fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a>
                    </p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="" href="mailto:contact@hfiles.in"><i class="fa fa-solid fa-envelope"></i>&nbsp; contact@hfiles.in</a></p>

                </div>
            </div>

        </form>
    </div>



   


    <footer>
    <div class="home page-template page-template-elementor_header_footer page page-id-26 elementor-default elementor-template-full-width elementor-kit-89 elementor-page elementor-page-26">
     <div data-elementor-type="wp-page" data-elementor-id="26" class="elementor elementor-26">
        <section class="elementor-section elementor-top-section elementor-element elementor-element-40c8b6f7 elementor-section-height-min-height elementor-section-items-stretch elementor-section-boxed elementor-section-height-default" data-id="40c8b6f7" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-5f3c790b" data-id="5f3c790b" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-809e9bd animated-fast elementor-invisible elementor-widget elementor-widget-text-editor" data-id="809e9bd" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                               
                                Create your social health care network					
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-3a624f7b e-transform elementor-widget__width-initial animated-fast elementor-widget-mobile__width-initial elementor-invisible elementor-widget elementor-widget-heading" data-id="3a624f7b" data-element_type="widget" data-settings="{&quot;_transform_scale_effect&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:1.3000000000000000444089209850062616169452667236328125,&quot;sizes&quot;:[]},&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200,&quot;_transform_scale_effect_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;_transform_scale_effect_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]}}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                               
                                <h1 class="elementor-heading-title elementor-size-default">Get Smart With Your Health</h1>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-6392cbc animated-fast elementor-invisible elementor-widget elementor-widget-text-editor" data-id="6392cbc" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:250}" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                Join India&#8217;s Pioneering Social Healthcare Network					
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-827d02e elementor-mobile-align-center elementor-invisible elementor-widget elementor-widget-button" data-id="827d02e" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="button.default">
                            <div class="elementor-widget-container">
                                <div class="elementor-button-wrapper">
                                    <a class="elementor-button elementor-button-link elementor-size-sm" href="/login.aspx">
                                        <span class="elementor-button-content-wrapper">
                                            <span class="elementor-button-text">Create your health file</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-5a58fa8 elementor-widget elementor-widget-spacer" data-id="5a58fa8" data-element_type="widget" data-widget_type="spacer.default">
                            <div class="elementor-widget-container">
                                <style>
                                    /*! elementor - v3.21.0 - 25-04-2024 */
                                    .elementor-column .elementor-spacer-inner {
                                        height: var(--spacer-size)
                                    }

                                    .e-con {
                                        --container-widget-width: 100%
                                    }

                                        .e-con-inner > .elementor-widget-spacer, .e-con > .elementor-widget-spacer {
                                            width: var(--container-widget-width,var(--spacer-size));
                                            --align-self: var(--container-widget-align-self,initial);
                                            --flex-shrink: 0
                                        }

                                            .e-con-inner > .elementor-widget-spacer > .elementor-widget-container, .e-con > .elementor-widget-spacer > .elementor-widget-container {
                                                height: 100%;
                                                width: 100%
                                            }

                                                .e-con-inner > .elementor-widget-spacer > .elementor-widget-container > .elementor-spacer, .e-con > .elementor-widget-spacer > .elementor-widget-container > .elementor-spacer {
                                                    height: 100%
                                                }

                                                    .e-con-inner > .elementor-widget-spacer > .elementor-widget-container > .elementor-spacer > .elementor-spacer-inner, .e-con > .elementor-widget-spacer > .elementor-widget-container > .elementor-spacer > .elementor-spacer-inner {
                                                        height: var(--container-widget-height,var(--spacer-size))
                                                    }

                                            .e-con-inner > .elementor-widget-spacer.elementor-widget-empty, .e-con > .elementor-widget-spacer.elementor-widget-empty {
                                                position: relative;
                                                min-height: 22px;
                                                min-width: 22px
                                            }

                                                .e-con-inner > .elementor-widget-spacer.elementor-widget-empty .elementor-widget-empty-icon, .e-con > .elementor-widget-spacer.elementor-widget-empty .elementor-widget-empty-icon {
                                                    position: absolute;
                                                    top: 0;
                                                    bottom: 0;
                                                    left: 0;
                                                    right: 0;
                                                    margin: auto;
                                                    padding: 0;
                                                    width: 22px;
                                                    height: 22px
                                                }
                                </style>
                                <div class="elementor-spacer">
                                    <div class="elementor-spacer-inner"></div>
                                </div>
                            </div>
                        </div>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-649188a elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="649188a" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-632884a" data-id="632884a" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-7b119aa animated-fast elementor-invisible elementor-widget elementor-widget-image" data-id="7b119aa" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:300}" data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <img decoding="async" width="108" height="109" src="~/wp-content/uploads/2023/03/ayushman-icon.svg" class="attachment-full size-full wp-image-744" alt="Ayushman Bharat" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-e87af08" data-id="e87af08" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-75f29ae animated-fast elementor-invisible elementor-widget elementor-widget-image" data-id="75f29ae" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:400}" data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <img loading="lazy" decoding="async" width="107" height="108" src="~/wp-content/uploads/2023/03/secure-icon.svg" class="attachment-full size-full wp-image-745" alt="Secure Storage Assured" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-5698aa0" data-id="5698aa0" data-element_type="column">
                                    <div class="elementor-widget-wrap">
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="elementor-element elementor-element-669ce5b elementor-widget elementor-widget-spacer" data-id="669ce5b" data-element_type="widget" data-widget_type="spacer.default">
                            <div class="elementor-widget-container">
                                <div class="elementor-spacer">
                                    <div class="elementor-spacer-inner"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-6654418c" data-id="6654418c" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-4a3b27bd animated-fast elementor-invisible elementor-widget elementor-widget-image" data-id="4a3b27bd" data-element_type="widget" data-settings="{&quot;_animation_delay&quot;:200,&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="image.default">
                            <div class="elementor-widget-container">
                                <img loading="lazy" decoding="async" width="1318" height="1089" src="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png" class="elementor-animation-grow attachment-full size-full wp-image-992" alt="" srcset="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png 1318w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-300x248.png 300w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-1024x846.png 1024w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-768x635.png 768w" sizes="(max-width: 1318px) 100vw, 1318px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-32480c6 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="32480c6" data-element_type="section" id="why" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-container elementor-column-gap-no">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-f1bc2e1" data-id="f1bc2e1" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-9bf08d5 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="9bf08d5" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-100 elementor-inner-column elementor-element elementor-element-d0071a8" data-id="d0071a8" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-db5ed71 elementor-invisible elementor-widget elementor-widget-heading" data-id="db5ed71" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="heading.default">
                                            <div class="elementor-widget-container">
                                                <h2 class="elementor-heading-title" style="font-size:50px !important;">Why get your hFile?</h2>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-8050479 elementor-widget__width-initial elementor-invisible elementor-widget elementor-widget-text-editor" data-id="8050479" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="text-editor.default">
                                            <div class="elementor-widget-container">
                                                One secure hfile can replace all physical copies of your medical history.
Update your bond with health by signing up with us today!					
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-9ecd0b9 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="9ecd0b9" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-100 elementor-inner-column elementor-element elementor-element-8d75464" data-id="8d75464" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-3120f85 elementor-hidden-desktop elementor-hidden-tablet elementor-widget elementor-widget-image" data-id="3120f85" data-element_type="widget" data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <img loading="lazy" decoding="async" width="784" height="1070" src="https://hfiles.in/wp-content/uploads/2023/03/iPad-Pro-Mockup.png" class="attachment-full size-full wp-image-790" alt="" srcset="https://hfiles.in/wp-content/uploads/2023/03/iPad-Pro-Mockup.png 784w, https://hfiles.in/wp-content/uploads/2023/03/iPad-Pro-Mockup-220x300.png 220w, https://hfiles.in/wp-content/uploads/2023/03/iPad-Pro-Mockup-750x1024.png 750w, https://hfiles.in/wp-content/uploads/2023/03/iPad-Pro-Mockup-768x1048.png 768w" sizes="(max-width: 784px) 100vw, 784px" />
                                            </div>
                                        </div>
                                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-7aea0a7 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="7aea0a7" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-6963542" data-id="6963542" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-52b06f4 elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="52b06f4" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <link rel="stylesheet" href="https://hfiles.in/wp-content/plugins/elementor/assets/css/widget-icon-box.min.css">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><path d="M68.1617 64.9812L68.1617 64.9812C67.8536 64.6731 67.4357 64.5 67 64.5C66.5643 64.5 66.1464 64.6731 65.8383 64.9812C65.5302 65.2893 65.3571 65.7071 65.3571 66.1429V71.3571H60.1429C59.7071 71.3571 59.2893 71.5302 58.9812 71.8383L59.3347 72.1919L58.9812 71.8383C58.6731 72.1464 58.5 72.5643 58.5 73C58.5 73.4357 58.6731 73.8536 58.9812 74.1617C59.2893 74.4698 59.7071 74.6429 60.1429 74.6429H65.3571V79.8571C65.3571 80.2929 65.5302 80.7107 65.8383 81.0188L66.1919 80.6653L65.8383 81.0188C66.1464 81.3269 66.5643 81.5 67 81.5C67.4357 81.5 67.8536 81.3269 68.1617 81.0188C68.4698 80.7107 68.6429 80.2929 68.6429 79.8571V74.6429H73.8571C74.2929 74.6429 74.7107 74.4698 75.0188 74.1617C75.3269 73.8536 75.5 73.4357 75.5 73C75.5 72.5643 75.3269 72.1464 75.0188 71.8383C74.7107 71.5302 74.2929 71.3571 73.8571 71.3571H68.6429V66.1429C68.6429 65.7071 68.4698 65.2893 68.1617 64.9812Z" fill="white" stroke="white"></path><path d="M82.8602 93H51.3375C50.7605 92.9968 50.1899 92.8791 49.6586 92.6539C49.1274 92.4286 48.6462 92.1001 48.2428 91.6875C47.8395 91.2749 47.522 90.7864 47.3087 90.2502C47.0955 89.7141 46.9908 89.1409 47.0006 88.564V50.4245C47.0006 49.2743 47.4576 48.1712 48.2709 47.3579C49.0842 46.5446 50.1873 46.0876 51.3375 46.0876H82.8602C84.0104 46.0876 85.1135 46.5446 85.9268 47.3579C86.7401 48.1712 87.1971 49.2743 87.1971 50.4245V88.564C87.2069 89.1409 87.1022 89.7141 86.8889 90.2502C86.6757 90.7864 86.3582 91.2749 85.9548 91.6875C85.5515 92.1001 85.0702 92.4286 84.539 92.6539C84.0078 92.8791 83.4372 92.9968 82.8602 93ZM51.3375 49.8049C51.1732 49.8049 51.0156 49.8702 50.8994 49.9864C50.7832 50.1026 50.7179 50.2602 50.7179 50.4245V88.564C50.7179 88.7283 50.7832 88.8859 50.8994 89.0021C51.0156 89.1183 51.1732 89.1836 51.3375 89.1836H82.8602C83.0245 89.1836 83.1821 89.1183 83.2983 89.0021C83.4145 88.8859 83.4798 88.7283 83.4798 88.564V50.4245C83.4798 50.2602 83.4145 50.1026 83.2983 49.9864C83.1821 49.8702 83.0245 49.8049 82.8602 49.8049H51.3375Z" fill="#0331B5"></path><path d="M73.5424 56.8678H60.6558C60.1628 56.8678 59.6901 56.672 59.3415 56.3234C58.9929 55.9749 58.7971 55.5021 58.7971 55.0092V40.8587C58.8035 40.3677 59.0014 39.8987 59.3486 39.5515C59.6958 39.2043 60.1648 39.0064 60.6558 39H73.5424C74.0334 39.0064 74.5024 39.2043 74.8496 39.5515C75.1968 39.8987 75.3946 40.3677 75.4011 40.8587V55.0092C75.4011 55.5021 75.2052 55.9749 74.8567 56.3234C74.5081 56.672 74.0354 56.8678 73.5424 56.8678ZM62.5144 53.1505H71.7829V42.7173H62.5144V53.1505Z" fill="#0331B5"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Manage All Health Records						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Tracking your entire health history has never been simpler				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-e9ec30b" data-id="e9ec30b" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-eae6eff elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="eae6eff" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><path d="M39.608 38.84C41.2355 38.3975 42.965 38 44 38C45.035 38 46.7645 38.3975 48.392 38.84C50.057 39.29 51.7355 39.8225 52.7225 40.145C53.1352 40.2813 53.501 40.5312 53.778 40.8661C54.055 41.2009 54.232 41.6071 54.2885 42.038C55.1825 48.7535 53.108 53.7305 50.591 57.023C49.5237 58.4315 48.251 59.6718 46.8155 60.7025C46.3191 61.0592 45.7932 61.3728 45.2435 61.64C44.8235 61.838 44.372 62 44 62C43.628 62 43.178 61.838 42.7565 61.64C42.2068 61.3728 41.6809 61.0592 41.1845 60.7025C39.749 59.6717 38.4764 58.4314 37.409 57.023C34.892 53.7305 32.8175 48.7535 33.7115 42.038C33.768 41.6071 33.945 41.2009 34.222 40.8661C34.499 40.5312 34.8648 40.2813 35.2775 40.145C36.7103 39.6752 38.1542 39.2401 39.608 38.84Z" fill="white"></path><path d="M79.5 92.25H73.875C72.8807 92.249 71.9275 91.8536 71.2244 91.1506C70.5214 90.4475 70.126 89.4943 70.125 88.5V79.125H73.875V88.5H79.5V79.125H83.25V71.625C83.2495 71.1279 83.0518 70.6513 82.7003 70.2997C82.3488 69.9482 81.8721 69.7505 81.375 69.75H65.025L61.275 58.5H49.5C49.0029 58.5005 48.5262 58.6982 48.1747 59.0497C47.8232 59.4012 47.6255 59.8779 47.625 60.375V71.625H51.375V88.5H58.875V75.375H62.625V88.5C62.624 89.4943 62.2286 90.4475 61.5256 91.1506C60.8225 91.8536 59.8693 92.249 58.875 92.25H51.375C50.3807 92.249 49.4275 91.8536 48.7244 91.1506C48.0214 90.4475 47.626 89.4943 47.625 88.5V75.375C46.6307 75.374 45.6775 74.9786 44.9744 74.2756C44.2714 73.5725 43.876 72.6193 43.875 71.625V60.375C43.8765 58.8836 44.4696 57.4537 45.5242 56.3992C46.5787 55.3446 48.0086 54.7515 49.5 54.75H61.275C62.062 54.7495 62.8291 54.9968 63.4675 55.4569C64.106 55.917 64.5833 56.5665 64.8319 57.3131L67.725 66H81.375C82.8664 66.0015 84.2963 66.5946 85.3508 67.6492C86.4054 68.7037 86.9985 70.1336 87 71.625V79.125C86.999 80.1193 86.6036 81.0725 85.9006 81.7756C85.1975 82.4786 84.2443 82.874 83.25 82.875V88.5C83.249 89.4943 82.8536 90.4475 82.1506 91.1506C81.4475 91.8536 80.4943 92.249 79.5 92.25ZM94.5 92.25H90.75V71.625H96.375V60.375C96.3745 59.8779 96.1768 59.4012 95.8253 59.0497C95.4738 58.6982 94.9971 58.5005 94.5 58.5H87V54.75H94.5C95.9914 54.7515 97.4213 55.3446 98.4758 56.3992C99.5304 57.4537 100.124 58.8836 100.125 60.375V71.625C100.124 72.6193 99.7286 73.5725 99.0256 74.2756C98.3225 74.9786 97.3693 75.374 96.375 75.375H94.5V92.25ZM55.125 52.875C53.6416 52.875 52.1916 52.4351 50.9582 51.611C49.7249 50.7869 48.7636 49.6156 48.1959 48.2451C47.6282 46.8747 47.4797 45.3667 47.7691 43.9118C48.0585 42.457 48.7728 41.1206 49.8217 40.0717C50.8706 39.0228 52.207 38.3085 53.6618 38.0191C55.1167 37.7297 56.6247 37.8782 57.9951 38.4459C59.3656 39.0136 60.5369 39.9749 61.361 41.2082C62.1851 42.4416 62.625 43.8916 62.625 45.375C62.6225 47.3634 61.8315 49.2696 60.4256 50.6756C59.0196 52.0815 57.1134 52.8725 55.125 52.875ZM55.125 41.625C54.3833 41.625 53.6583 41.8449 53.0416 42.257C52.4249 42.669 51.9443 43.2547 51.6605 43.9399C51.3766 44.6252 51.3024 45.3792 51.4471 46.1066C51.5917 46.834 51.9489 47.5022 52.4733 48.0267C52.9978 48.5511 53.666 48.9083 54.3934 49.0529C55.1208 49.1976 55.8748 49.1234 56.5601 48.8396C57.2453 48.5557 57.831 48.0751 58.243 47.4584C58.6551 46.8417 58.875 46.1167 58.875 45.375C58.874 44.3807 58.4786 43.4275 57.7756 42.7244C57.0725 42.0214 56.1193 41.626 55.125 41.625ZM88.875 52.875C87.3916 52.875 85.9416 52.4351 84.7082 51.611C83.4749 50.7869 82.5136 49.6156 81.9459 48.2451C81.3782 46.8747 81.2297 45.3667 81.5191 43.9118C81.8085 42.457 82.5228 41.1206 83.5717 40.0717C84.6206 39.0228 85.957 38.3085 87.4118 38.0191C88.8667 37.7297 90.3747 37.8782 91.7451 38.4459C93.1156 39.0136 94.2869 39.9749 95.111 41.2082C95.9351 42.4416 96.375 43.8916 96.375 45.375C96.3725 47.3634 95.5815 49.2696 94.1756 50.6756C92.7696 52.0815 90.8634 52.8725 88.875 52.875ZM88.875 41.625C88.1333 41.625 87.4083 41.8449 86.7916 42.257C86.1749 42.669 85.6943 43.2547 85.4104 43.9399C85.1266 44.6252 85.0524 45.3792 85.1971 46.1066C85.3418 46.834 85.6989 47.5022 86.2234 48.0267C86.7478 48.5511 87.416 48.9083 88.1434 49.0529C88.8708 49.1976 89.6248 49.1234 90.3101 48.8396C90.9953 48.5557 91.581 48.0751 91.993 47.4584C92.4051 46.8417 92.625 46.1167 92.625 45.375C92.624 44.3807 92.2286 43.4275 91.5256 42.7244C90.8225 42.0214 89.8693 41.626 88.875 41.625Z" fill="#0331B5"></path><path d="M76.6875 64.125C75.3896 64.125 74.1208 63.7401 73.0416 63.019C71.9624 62.2979 71.1212 61.273 70.6245 60.0739C70.1278 58.8747 69.9979 57.5552 70.2511 56.2822C70.5043 55.0092 71.1293 53.8399 72.0471 52.9221C72.9649 52.0043 74.1342 51.3793 75.4072 51.1261C76.6802 50.8729 77.9997 51.0028 79.1989 51.4995C80.398 51.9962 81.4229 52.8374 82.144 53.9166C82.8651 54.9958 83.25 56.2646 83.25 57.5625C83.248 59.3024 82.556 60.9704 81.3257 62.2007C80.0954 63.431 78.4274 64.123 76.6875 64.125ZM76.6875 54.75C76.1312 54.75 75.5875 54.915 75.125 55.224C74.6624 55.533 74.302 55.9723 74.0891 56.4862C73.8762 57.0001 73.8205 57.5656 73.929 58.1112C74.0376 58.6568 74.3054 59.1579 74.6988 59.5512C75.0921 59.9446 75.5932 60.2124 76.1388 60.321C76.6844 60.4295 77.2499 60.3738 77.7638 60.1609C78.2777 59.948 78.717 59.5876 79.026 59.125C79.3351 58.6625 79.5 58.1188 79.5 57.5625C79.499 56.8169 79.2024 56.1021 78.6751 55.5749C78.1479 55.0476 77.4331 54.751 76.6875 54.75Z" fill="#0331B5"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Secure family data						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Store all your family medical records in a single, secure space				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-badee4a elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="badee4a" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-48db1b1" data-id="48db1b1" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-e8d5883 elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="e8d5883" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><circle cx="90.5" cy="84.5" r="8.5" fill="white"></circle><path d="M43.6875 46.625C40.5003 46.625 37.875 49.2503 37.875 52.4375V79.5625C37.875 82.7497 40.5003 85.375 43.6875 85.375H86.3125C89.4997 85.375 92.125 82.7497 92.125 79.5625V52.4375C92.125 49.2503 89.4997 46.625 86.3125 46.625H43.6875ZM43.6875 50.5H86.3125C87.4091 50.5 88.25 51.3409 88.25 52.4375V79.5625C88.25 80.6591 87.4091 81.5 86.3125 81.5H43.6875C42.5909 81.5 41.75 80.6591 41.75 79.5625V52.4375C41.75 51.3409 42.5909 50.5 43.6875 50.5ZM55.3125 54.375C51.05 54.375 47.5625 57.8625 47.5625 62.125C47.5625 64.2814 48.4867 66.2267 49.9243 67.6353C48.6055 68.5252 47.5243 69.7241 46.775 71.1276C46.0256 72.5311 45.6308 74.0965 45.625 75.6875H49.5C49.5 72.4557 52.0808 69.875 55.3125 69.875C58.5443 69.875 61.125 72.4557 61.125 75.6875H65C64.9942 74.0965 64.5994 72.5311 63.85 71.1276C63.1007 69.7241 62.0195 68.5252 60.7007 67.6353C62.1383 66.2267 63.0625 64.2834 63.0625 62.125C63.0625 57.8625 59.575 54.375 55.3125 54.375ZM68.875 56.3125V60.1875H84.375V56.3125H68.875ZM55.3125 58.25C57.4767 58.25 59.1875 59.9608 59.1875 62.125C59.1875 64.2892 57.4767 66 55.3125 66C53.1483 66 51.4375 64.2892 51.4375 62.125C51.4375 59.9608 53.1483 58.25 55.3125 58.25ZM68.875 64.0625V67.9375H84.375V64.0625H68.875ZM68.875 71.8125V75.6875H78.5625V71.8125H68.875Z" fill="#0331B5"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Join ABHA today						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Connect healthcare benefits to your ABHA number for streamlined management				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-ee19269" data-id="ee19269" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-919f1f2 elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="919f1f2" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><path d="M99.0768 89.5756C97.1538 89.5756 95.5193 88.9026 94.1732 87.5565C92.8271 86.2104 92.1541 84.5759 92.1541 82.6529C92.1541 82.3837 92.1733 82.1045 92.2118 81.8153C92.2502 81.5261 92.3079 81.2669 92.3848 81.0376L76.1165 71.5766C75.4627 72.1535 74.732 72.6058 73.9244 72.9335C73.1167 73.2612 72.2706 73.4242 71.3861 73.4227C69.4631 73.4227 67.8286 72.7497 66.4825 71.4036C65.1364 70.0575 64.4634 68.423 64.4634 66.5C64.4634 64.5771 65.1364 62.9425 66.4825 61.5965C67.8286 60.2504 69.4631 59.5773 71.3861 59.5773C72.2706 59.5773 73.1167 59.7412 73.9244 60.0689C74.732 60.3965 75.4627 60.848 76.1165 61.4234L92.3848 51.9624C92.3079 51.7316 92.2502 51.4724 92.2118 51.1848C92.1733 50.8971 92.1541 50.6179 92.1541 50.3471C92.1541 48.4241 92.8271 46.7896 94.1732 45.4436C95.5193 44.0975 97.1538 43.4244 99.0768 43.4244C101 43.4244 102.634 44.0975 103.98 45.4436C105.326 46.7896 105.999 48.4241 105.999 50.3471C105.999 52.2701 105.326 53.9046 103.98 55.2507C102.634 56.5968 101 57.2698 99.0768 57.2698C98.1922 57.2698 97.3461 57.1067 96.5384 56.7806C95.7308 56.4545 95.0001 56.0022 94.3463 55.4237L78.078 64.8847C78.1549 65.1155 78.2126 65.3755 78.251 65.6647C78.2895 65.9539 78.3087 66.2323 78.3087 66.5C78.3087 66.7692 78.2895 67.0485 78.251 67.3377C78.2126 67.6269 78.1549 67.8861 78.078 68.1153L94.3463 77.5763C95.0001 76.9994 95.7308 76.5479 96.5384 76.2218C97.3461 75.8956 98.1922 75.7318 99.0768 75.7303C101 75.7303 102.634 76.4033 103.98 77.7494C105.326 79.0954 105.999 80.73 105.999 82.6529C105.999 84.5759 105.326 86.2104 103.98 87.5565C102.634 88.9026 101 89.5756 99.0768 89.5756ZM99.0768 52.6547C99.7306 52.6547 100.279 52.4331 100.722 51.9901C101.165 51.547 101.386 50.9994 101.384 50.3471C101.384 49.6933 101.163 49.1449 100.72 48.7018C100.277 48.2588 99.729 48.038 99.0768 48.0396C98.4229 48.0396 97.8745 48.2611 97.4315 48.7041C96.9884 49.1472 96.7677 49.6948 96.7692 50.3471C96.7692 51.0009 96.9907 51.5494 97.4338 51.9924C97.8768 52.4355 98.4245 52.6562 99.0768 52.6547ZM71.3861 68.8076C72.0399 68.8076 72.5883 68.5861 73.0313 68.143C73.4744 67.7 73.6952 67.1523 73.6936 66.5C73.6936 65.8462 73.4721 65.2978 73.029 64.8547C72.586 64.4117 72.0383 64.1909 71.3861 64.1925C70.7322 64.1925 70.1838 64.414 69.7408 64.857C69.2977 65.3001 69.077 65.8478 69.0785 66.5C69.0785 67.1538 69.3 67.7023 69.7431 68.1453C70.1861 68.5884 70.7338 68.8091 71.3861 68.8076ZM99.0768 84.9605C99.7306 84.9605 100.279 84.739 100.722 84.2959C101.165 83.8529 101.386 83.3052 101.384 82.6529C101.384 81.9991 101.163 81.4507 100.72 81.0076C100.277 80.5646 99.729 80.3438 99.0768 80.3454C98.4229 80.3454 97.8745 80.5669 97.4315 81.0099C96.9884 81.453 96.7677 82.0007 96.7692 82.6529C96.7692 83.3067 96.9907 83.8552 97.4338 84.2982C97.8768 84.7413 98.4245 84.962 99.0768 84.9605Z" fill="#0331B5"></path><path d="M50.0836 64.1925H45.4685V59.5774H40.8534V64.1925H36.2383V68.8076H40.8534V73.4227H45.4685V68.8076H50.0836V64.1925Z" fill="white"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M83.2623 43.4244C83.2623 40.8756 81.1961 38.8093 78.6472 38.8093H45.4679C44.2443 38.8105 43.0711 39.2972 42.2059 40.1624C41.3407 41.0276 40.854 42.2008 40.8528 43.4244V50.5317C37.0083 51.0799 33.4906 52.9968 30.9458 55.9302C28.4011 58.8636 27 62.6166 27 66.5C27 70.3834 28.4011 74.1365 30.9458 77.0699C33.4906 80.0033 37.0083 81.9201 40.8528 82.4683V89.5756C40.854 90.7992 41.3407 91.9724 42.2059 92.8377C43.0711 93.7029 44.2443 94.1895 45.4679 94.1907L80.2624 94.1907C81.9192 94.1907 83.2623 92.8475 83.2623 91.1907V89.5756H83.2626V79.1873H78.6475V89.5756L45.4679 89.5756V82.4683C49.3125 81.9201 52.8301 80.0033 55.3749 77.0699C57.9197 74.1365 59.3208 70.3834 59.3208 66.5C59.3208 62.6166 57.9197 58.8636 55.3749 55.9302C52.8301 52.9968 49.3125 51.0799 45.4679 50.5317V43.4244L78.6475 43.4244V53.8127H83.2626V43.4244H83.2623ZM54.6982 66.5C54.6982 68.782 54.0215 71.0127 52.7537 72.9101C51.4859 74.8075 49.684 76.2863 47.5757 77.1596C45.4674 78.0328 43.1476 78.2613 40.9095 77.8161C38.6714 77.3709 36.6155 76.2721 35.0019 74.6585C33.3883 73.0449 32.2895 70.989 31.8443 68.7509C31.3991 66.5128 31.6276 64.193 32.5008 62.0847C33.3741 59.9764 34.8529 58.1745 36.7503 56.9067C38.6477 55.6389 40.8784 54.9622 43.1604 54.9622C46.2193 54.9659 49.1518 56.1827 51.3148 58.3456C53.4777 60.5086 54.6945 63.4411 54.6982 66.5Z" fill="#0331B5"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Share your data						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Securely share your health data with healthcare providers through a user-friendly platform				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-e035d78 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="e035d78" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-89be87b" data-id="89be87b" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-a360219 elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="a360219" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><circle cx="52.5" cy="45.5" r="8.5" fill="white"></circle><path d="M47.6667 46.6666C47.6667 45.3848 48.176 44.1554 49.0824 43.249C49.9888 42.3425 51.2182 41.8333 52.5001 41.8333H71.8334C72.4743 41.8334 73.0889 42.0882 73.542 42.5414L85.6253 54.6247C86.0786 55.0778 86.3333 55.6924 86.3334 56.3333V85.3333C86.3334 86.6152 85.8242 87.8446 84.9178 88.751C84.0113 89.6574 82.782 90.1666 81.5001 90.1666H52.5001C51.2182 90.1666 49.9888 89.6574 49.0824 88.751C48.176 87.8446 47.6667 86.6152 47.6667 85.3333V46.6666ZM80.4996 56.3333L71.8334 47.6671V56.3333H80.4996ZM67.0001 46.6666H52.5001V85.3333H81.5001V61.1666H69.4167C68.7758 61.1666 68.1611 60.912 67.7079 60.4588C67.2547 60.0056 67.0001 59.3909 67.0001 58.75V46.6666Z" fill="#0331B5"></path><circle cx="66.5" cy="66.5" r="66.5" fill="black" fill-opacity="0.47"></circle><rect x="9.36837" y="67.5716" width="99.1296" height="55.3101" rx="4.5" transform="rotate(-30 9.36837 67.5716)" stroke="white" stroke-width="3"></rect><path d="M34.1979 75.7759C33.6486 74.8244 33.3704 73.8519 33.3633 72.8583C33.3601 71.8501 33.608 70.9249 34.1071 70.0825C34.61 69.2256 35.3233 68.5305 36.2471 67.9971C37.3279 67.3731 38.4347 67.1036 39.5676 67.1885C40.7005 67.2734 41.7113 67.7122 42.6 68.5047L40.3691 69.7927C39.8807 69.4588 39.3666 69.2937 38.8268 69.2974C38.2963 69.2958 37.7677 69.447 37.2412 69.751C36.6777 70.0764 36.2516 70.501 35.9629 71.0249C35.678 71.5342 35.5496 72.101 35.5775 72.7254C35.6146 73.3444 35.8199 73.9772 36.1932 74.6239C36.5612 75.2613 37.0066 75.7554 37.5295 76.1063C38.0562 76.4427 38.614 76.6195 39.2029 76.6367C39.7956 76.6394 40.3737 76.478 40.9372 76.1527C41.4637 75.8487 41.859 75.4666 42.1228 75.0063C42.3906 74.5314 42.502 73.9991 42.4571 73.4092L44.688 72.1212C44.9353 73.2963 44.8125 74.3956 44.3196 75.4192C43.8306 76.4282 43.0411 77.2474 41.9511 77.8767C41.0273 78.4101 40.0713 78.6849 39.0831 78.7012C38.0987 78.7029 37.1735 78.455 36.3073 77.9574C35.4504 77.4545 34.7472 76.7273 34.1979 75.7759ZM51.4124 72.4697C50.6733 72.8964 49.9149 73.1187 49.137 73.1367C48.3538 73.1455 47.618 72.9483 46.9295 72.5452C46.2503 72.1368 45.684 71.54 45.2307 70.7548C44.7774 69.9696 44.5483 69.1781 44.5434 68.3803C44.5478 67.5772 44.7568 66.8406 45.1706 66.1707C45.579 65.4914 46.1528 64.9385 46.8918 64.5118C47.6308 64.0852 48.3965 63.8648 49.189 63.8507C49.9761 63.8273 50.7139 64.0172 51.4023 64.4203C52.1 64.8181 52.6755 65.4096 53.1289 66.1948C53.5822 66.98 53.8021 67.7768 53.7885 68.5852C53.7841 69.3883 53.5731 70.1322 53.1554 70.8167C52.7416 71.4867 52.1606 72.0377 51.4124 72.4697ZM50.4364 70.7792C50.7874 70.5765 51.0673 70.3041 51.2762 69.9618C51.4889 69.6049 51.589 69.2023 51.5764 68.7538C51.5638 68.3054 51.4162 67.8363 51.1335 67.3468C50.7122 66.617 50.1955 66.1701 49.5836 66.0061C48.9755 65.8276 48.3943 65.8983 47.8401 66.2183C47.2858 66.5383 46.934 67.0062 46.7846 67.6221C46.6391 68.2234 46.777 68.889 47.1983 69.6188C47.6196 70.3485 48.1251 70.808 48.7147 70.9972C49.3082 71.1719 49.8821 71.0992 50.4364 70.7792ZM61.6318 56.0201C62.5741 55.4761 63.4996 55.3298 64.4083 55.5811C65.3209 55.8178 66.0759 56.4535 66.6733 57.4881L69.2733 61.9914L67.3334 63.1114L64.8854 58.8714C64.5387 58.2709 64.1223 57.9017 63.6361 57.7636C63.1446 57.6163 62.6356 57.6946 62.109 57.9986C61.5825 58.3026 61.2555 58.7069 61.1281 59.2116C61.0046 59.7017 61.1162 60.2469 61.4628 60.8474L63.9108 65.0874L61.9709 66.2074L59.5229 61.9674C59.1763 61.3669 58.7598 60.9977 58.2737 60.8596C57.7822 60.7123 57.2731 60.7906 56.7466 61.0946C56.2108 61.4039 55.8792 61.8109 55.7518 62.3156C55.6283 62.8057 55.7399 63.3509 56.0865 63.9514L58.5345 68.1914L56.5946 69.3114L52.1626 61.635L54.1025 60.515L54.6385 61.4433C54.7013 60.976 54.8733 60.538 55.1546 60.1292C55.4452 59.7152 55.826 59.3721 56.2971 59.1001C56.8976 58.7535 57.508 58.5734 58.1285 58.5601C58.7436 58.5375 59.3165 58.6871 59.8471 59.0089C59.8405 58.4215 59.9955 57.8578 60.3119 57.318C60.6376 56.7727 61.0776 56.3401 61.6318 56.0201ZM66.9647 51.8696C66.6229 52.067 66.2752 52.1261 65.9216 52.0469C65.5719 51.9532 65.3037 51.7447 65.117 51.4214C64.9304 51.0981 64.8866 50.7662 64.9856 50.4257C65.0885 50.0707 65.3109 49.7945 65.6527 49.5972C65.9945 49.3998 66.3402 49.348 66.6899 49.4417C67.0435 49.5209 67.3137 49.7221 67.5003 50.0454C67.687 50.3687 67.7289 50.7079 67.6259 51.0629C67.5269 51.4034 67.3065 51.6723 66.9647 51.8696ZM68.4488 52.2322L72.8808 59.9086L70.9409 61.0286L66.5089 53.3522L68.4488 52.2322ZM74.3821 48.6587C75.2966 48.1307 76.2037 47.9951 77.1031 48.2517C77.9973 48.4991 78.7431 49.1401 79.3404 50.1747L81.9404 54.678L80.0005 55.798L77.5525 51.558C77.2005 50.9483 76.7787 50.5698 76.2872 50.4225C75.7904 50.2659 75.2787 50.3397 74.7522 50.6437C74.2164 50.953 73.8874 51.3646 73.7654 51.8785C73.6472 52.3778 73.7641 52.9323 74.1161 53.542L76.5641 57.782L74.6242 58.902L70.1922 51.2256L72.1321 50.1056L72.6841 51.0617C72.7508 50.5798 72.9294 50.1318 73.2199 49.7177C73.5144 49.2891 73.9018 48.9361 74.3821 48.6587ZM82.1148 44.1758C82.6875 43.8452 83.2576 43.67 83.8251 43.6502C84.3873 43.6213 84.8971 43.7149 85.3545 43.9312L84.7225 42.8365L86.6762 41.7085L91.1402 49.4404C91.5509 50.1517 91.7731 50.8671 91.8067 51.5867C91.8457 52.3156 91.6721 53.007 91.286 53.6609C90.9053 54.3242 90.3085 54.8904 89.4956 55.3598C88.4055 55.9891 87.3628 56.2524 86.3674 56.1497C85.3813 56.0416 84.5887 55.5755 83.9896 54.7512L85.9157 53.6392C86.22 53.9316 86.5971 54.0834 87.0469 54.0946C87.5114 54.1097 87.9838 53.9786 88.4642 53.7013C89.0277 53.376 89.3863 52.9411 89.5399 52.3966C89.699 51.8614 89.5812 51.252 89.1865 50.5684L88.4985 49.3768C88.4571 49.881 88.284 50.3812 87.9793 50.8774C87.6838 51.3683 87.2543 51.7764 86.6908 52.1017C86.0441 52.475 85.3569 52.6501 84.6291 52.6269C83.9014 52.6036 83.2071 52.3825 82.5464 51.9634C81.8895 51.5297 81.3344 50.9202 80.8811 50.135C80.4331 49.3591 80.1882 48.5829 80.1464 47.8064C80.1138 47.0247 80.2674 46.3201 80.6073 45.6928C80.9564 45.0601 81.4589 44.5545 82.1148 44.1758ZM86.9385 46.6748C86.6665 46.2036 86.3421 45.8551 85.9654 45.6292C85.5833 45.3941 85.1845 45.2795 84.7691 45.2853C84.3484 45.2819 83.9579 45.3842 83.5976 45.5922C83.2373 45.8002 82.9554 46.0799 82.7519 46.4314C82.5484 46.7829 82.4483 47.1856 82.4517 47.6394C82.4589 48.0786 82.5959 48.5292 82.8626 48.991C83.1292 49.4529 83.4563 49.806 83.8437 50.0504C84.235 50.2802 84.6364 50.3995 85.0479 50.4082C85.4687 50.4116 85.8546 50.312 86.2056 50.1093C86.5659 49.9013 86.8524 49.6189 87.0651 49.2621C87.2725 48.896 87.3726 48.4933 87.3654 48.0541C87.3528 47.6057 87.2105 47.1459 86.9385 46.6748ZM60.2526 88.1134C59.5783 88.5027 58.902 88.7393 58.2236 88.823C57.5545 88.9014 56.9376 88.8142 56.3728 88.5613C55.8081 88.3085 55.3504 87.8891 54.9998 87.3033L57.0783 86.1033C57.3353 86.4845 57.6552 86.7186 58.038 86.8055C58.43 86.8871 58.8477 86.7999 59.2911 86.5439C59.7437 86.2826 60.038 85.971 60.174 85.6092C60.3047 85.2382 60.2687 84.8771 60.066 84.5261C59.9007 84.2398 59.6769 84.0549 59.3947 83.9714C59.1126 83.888 58.8082 83.8728 58.4816 83.9259C58.159 83.9644 57.7294 84.0523 57.1928 84.1896C56.458 84.3675 55.8413 84.4834 55.3428 84.5372C54.8481 84.5765 54.3536 84.4986 53.8592 84.3037C53.3688 84.0942 52.9476 83.6846 52.5956 83.0749C52.2649 82.5022 52.1201 81.9207 52.1611 81.3304C52.2021 80.7402 52.4173 80.1848 52.8066 79.6645C53.1906 79.1349 53.7151 78.6781 54.3802 78.2941C55.3779 77.7181 56.3275 77.4962 57.2291 77.6285C58.1346 77.7461 58.8703 78.2205 59.4363 79.0515L57.3024 80.2835C57.092 79.9616 56.7915 79.7718 56.4009 79.714C56.0142 79.6416 55.6038 79.7307 55.1697 79.9814C54.7909 80.2001 54.5421 80.4731 54.4231 80.8004C54.3134 81.1224 54.3653 81.4681 54.5786 81.8376C54.7279 82.0963 54.9364 82.2654 55.204 82.3449C55.4755 82.4098 55.768 82.4257 56.0814 82.3926C56.3987 82.3449 56.8283 82.257 57.3702 82.1288C58.105 81.9509 58.7244 81.8397 59.2283 81.7951C59.7321 81.7505 60.2339 81.8303 60.7336 82.0345C61.2333 82.2387 61.6565 82.641 62.0032 83.2414C62.3018 83.7587 62.4452 84.3164 62.4333 84.9145C62.4215 85.5126 62.2342 86.0949 61.8716 86.6614C61.5036 87.2187 60.9639 87.7027 60.2526 88.1134ZM68.6085 83.3261C67.8695 83.7528 67.111 83.9751 66.3332 83.9931C65.5499 84.0019 64.8141 83.8048 64.1257 83.4016C63.4464 82.9932 62.8802 82.3964 62.4268 81.6112C61.9735 80.826 61.7444 80.0345 61.7395 79.2367C61.7439 78.4336 61.9529 77.6971 62.3667 77.0271C62.7752 76.3479 63.3489 75.7949 64.0879 75.3682C64.8269 74.9416 65.5926 74.7212 66.3851 74.7071C67.1722 74.6837 67.91 74.8736 68.5984 75.2767C69.2961 75.6745 69.8716 76.266 70.325 77.0512C70.7783 77.8364 70.9982 78.6332 70.9846 79.4416C70.9802 80.2448 70.7692 80.9886 70.3515 81.6731C69.9377 82.3431 69.3567 82.8941 68.6085 83.3261ZM67.6325 81.6356C67.9835 81.433 68.2634 81.1605 68.4723 80.8182C68.685 80.4614 68.7851 80.0587 68.7725 79.6103C68.7599 79.1618 68.6123 78.6928 68.3297 78.2032C67.9083 77.4734 67.3917 77.0265 66.7797 76.8626C66.1716 76.684 65.5904 76.7547 65.0362 77.0747C64.4819 77.3947 64.1301 77.8627 63.9807 78.4786C63.8352 79.0799 63.9731 79.7454 64.3944 80.4752C64.8158 81.205 65.3212 81.6644 65.9108 81.8537C66.5043 82.0283 67.0782 81.9556 67.6325 81.6356ZM77.2714 78.3246C76.5324 78.7512 75.774 78.9736 74.9961 78.9916C74.2129 79.0004 73.4771 78.8032 72.7886 78.4001C72.1094 77.9916 71.5431 77.3948 71.0898 76.6096C70.6365 75.8244 70.4073 75.0329 70.4025 74.2352C70.4068 73.432 70.6159 72.6955 71.0297 72.0255C71.4381 71.3463 72.0119 70.7934 72.7509 70.3667C73.4899 69.94 74.2556 69.7196 75.048 69.7055C75.8352 69.6822 76.5729 69.872 77.2614 70.2752C77.9591 70.6729 78.5346 71.2644 78.9879 72.0496C79.4413 72.8348 79.6611 73.6316 79.6475 74.4401C79.6432 75.2432 79.4322 75.987 79.0145 76.6716C78.6007 77.3416 78.0197 77.8926 77.2714 78.3246ZM76.2954 76.6341C76.6465 76.4314 76.9264 76.1589 77.1352 75.8167C77.348 75.4598 77.4481 75.0572 77.4355 74.6087C77.4229 74.1602 77.2753 73.6912 76.9926 73.2016C76.5713 72.4718 76.0546 72.025 75.4426 71.861C74.8346 71.6824 74.2534 71.7532 73.6991 72.0732C73.1449 72.3932 72.7931 72.8611 72.6437 73.477C72.4981 74.0783 72.6361 74.7438 73.0574 75.4736C73.4787 76.2034 73.9842 76.6629 74.5738 76.8521C75.1673 77.0267 75.7412 76.9541 76.2954 76.6341ZM82.2116 64.923C83.1262 64.395 84.0332 64.2593 84.9327 64.5159C85.8268 64.7633 86.5726 65.4043 87.1699 66.439L89.7699 70.9423L87.83 72.0623L85.382 67.8222C85.03 67.2125 84.6082 66.834 84.1167 66.6867C83.6199 66.5302 83.1082 66.6039 82.5817 66.9079C82.0459 67.2172 81.717 67.6288 81.5949 68.1427C81.4767 68.642 81.5936 69.1965 81.9456 69.8062L84.3936 74.0463L82.4537 75.1663L78.0217 67.4898L79.9616 66.3698L80.5136 67.3259C80.5803 66.844 80.7589 66.3961 81.0494 65.982C81.3439 65.5533 81.7313 65.2003 82.2116 64.923Z" fill="white"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Analysis health data						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Make informed health decisions with in-depth analysis and insights				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-cce175c" data-id="cce175c" data-element_type="column">
                                                    <div class="elementor-widget-wrap elementor-element-populated">
                                                        <div class="elementor-element elementor-element-525a647 elementor-widget__width-initial elementor-widget-tablet__width-initial elementor-widget-mobile__width-inherit animated-fast elementor-view-default elementor-position-top elementor-mobile-position-top elementor-invisible elementor-widget elementor-widget-icon-box" data-id="525a647" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:150}" data-widget_type="icon-box.default">
                                                            <div class="elementor-widget-container">
                                                                <div class="elementor-icon-box-wrapper">

                                                                    <div class="elementor-icon-box-icon">
                                                                        <span class="elementor-icon elementor-animation-shrink">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="133" height="133" viewBox="0 0 133 133" fill="none">
                                                                                <circle cx="66.5" cy="66.5" r="66.5" fill="#FFD100"></circle><circle cx="66.5" cy="87.5" r="8.5" fill="white"></circle><path d="M50.0002 88.6666C48.4418 88.6666 47.1073 88.1113 45.9967 87.0007C44.886 85.89 44.3316 84.5564 44.3335 83V74.5H50.0002V83H84.0002V74.5H89.6668V83C89.6668 84.5583 89.1115 85.8928 88.0008 87.0035C86.8902 88.1142 85.5566 88.6685 84.0002 88.6666H50.0002ZM67.0002 77.3333L52.8335 63.1666L56.8002 59.0583L64.1668 66.425V43.3333H69.8335V66.425L77.2002 59.0583L81.1668 63.1666L67.0002 77.3333Z" fill="#0331B5"></path></svg>
                                                                        </span>
                                                                    </div>

                                                                    <div class="elementor-icon-box-content">

                                                                        <h3 class="elementor-icon-box-title">
                                                                            <span>Download						</span>
                                                                        </h3>

                                                                        <p class="elementor-icon-box-description">
                                                                            Download your health files anywhere for seamless sharing with healthcare providers				
                                                                        </p>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-d7801ef elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="d7801ef" data-element_type="section" id="ABHA">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-f1b7fed" data-id="f1b7fed" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-4ac3051 elementor-widget__width-initial elementor-invisible elementor-widget elementor-widget-heading" data-id="4ac3051" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">Create your ABHA Health ID card today</h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-24ca986 elementor-widget elementor-widget-elementskit-heading" data-id="24ca986" data-element_type="widget" data-widget_type="elementskit-heading.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-heading elementskit-section-title-wraper text_left   ekit_heading_tablet-   ekit_heading_mobile-">
                                        <div class="ekit_heading_separetor_wraper ekit_heading_elementskit-border-divider elementskit-style-long">
                                            <div class="elementskit-border-divider elementskit-style-long"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-f620298 elementor-invisible elementor-widget elementor-widget-text-editor" data-id="f620298" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                Join India’s digital health revolution by making your ABHA (Ayushman Bharat Health Account) Health ID card!					
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-9251d2e elementor-widget elementor-widget-spacer" data-id="9251d2e" data-element_type="widget" data-widget_type="spacer.default">
                            <div class="elementor-widget-container">
                                <div class="elementor-spacer">
                                    <div class="elementor-spacer-inner"></div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-a514d9b elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-invisible elementor-widget elementor-widget-icon-list" data-id="a514d9b" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:300}" data-widget_type="icon-list.default">
                            <div class="elementor-widget-container">
                                <link rel="stylesheet" href="https://hfiles.in/wp-content/plugins/elementor/assets/css/widget-icon-list.min.css">
                                <ul class="elementor-icon-list-items">
                                    <li class="elementor-icon-list-item">
                                        <span class="elementor-icon-list-icon">
                                            <i aria-hidden="true" class="fas fa-check-circle"></i></span>
                                        <span class="elementor-icon-list-text">Establish a unique identity with healthcare providers</span>
                                    </li>
                                    <li class="elementor-icon-list-item">
                                        <span class="elementor-icon-list-icon">
                                            <i aria-hidden="true" class="fas fa-check-circle"></i></span>
                                        <span class="elementor-icon-list-text">Link all healthcare benefits to your unique ABHA number</span>
                                    </li>
                                    <li class="elementor-icon-list-item">
                                        <span class="elementor-icon-list-icon">
                                            <i aria-hidden="true" class="fas fa-check-circle"></i></span>
                                        <span class="elementor-icon-list-text">Avoid registration queues in healthcare facilities across the country</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-409eb3f" data-id="409eb3f" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-a20c1ad elementor-invisible elementor-widget elementor-widget-image" data-id="a20c1ad" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeIn&quot;}" data-widget_type="image.default">
                            <div class="elementor-widget-container">
                                <img loading="lazy" decoding="async" width="678" height="702" src="https://hfiles.in/wp-content/uploads/2022/12/user-profile-screen.png" class="attachment-full size-full wp-image-553" alt="" srcset="https://hfiles.in/wp-content/uploads/2022/12/user-profile-screen.png 678w, https://hfiles.in/wp-content/uploads/2022/12/user-profile-screen-290x300.png 290w" sizes="(max-width: 678px) 100vw, 678px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-7c53ce41 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="7c53ce41" data-element_type="section">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-79bdd334" data-id="79bdd334" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;gradient&quot;}">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-200ecd8b elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="200ecd8b" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-3738a9eb" data-id="3738a9eb" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-4c3d5035 elementor-widget__width-auto elementor-invisible elementor-widget elementor-widget-image" data-id="4c3d5035" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeIn&quot;}" data-widget_type="image.default">
                                            <div class="elementor-widget-container">
                                                <img loading="lazy" decoding="async" width="488" height="418" src="https://hfiles.in/wp-content/uploads/2023/01/sign-up.png" class="attachment-full size-full wp-image-721" alt="" srcset="https://hfiles.in/wp-content/uploads/2023/01/sign-up.png 488w, https://hfiles.in/wp-content/uploads/2023/01/sign-up-300x257.png 300w" sizes="(max-width: 488px) 100vw, 488px" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-403aef59" data-id="403aef59" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-223afac elementor-invisible elementor-widget elementor-widget-heading" data-id="223afac" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="heading.default">
                                            <div class="elementor-widget-container">
                                                <h2 class="elementor-heading-title elementor-size-default">Start creating your social medical profile.</h2>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-6108052 elementor-invisible elementor-widget elementor-widget-button" data-id="6108052" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="button.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-button-wrapper">
                                                    <a class="elementor-button elementor-button-link elementor-size-sm" href="#leadForm">
                                                        <span class="elementor-button-content-wrapper">
                                                            <span class="elementor-button-text">Create your health file</span>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
        <%--<section class="elementor-section elementor-top-section elementor-element elementor-element-57e9951 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="57e9951" data-element_type="section" id="leadForm">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-19f2bfc" data-id="19f2bfc" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-42c3f8e elementor-invisible elementor-widget elementor-widget-heading" data-id="42c3f8e" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">Get started with hfiles now.<span style="color: var( --e-global-color-primary );"></span></h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-4f04022c elementor-widget elementor-widget-elementskit-heading" data-id="4f04022c" data-element_type="widget" data-widget_type="elementskit-heading.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-heading elementskit-section-title-wraper text_left   ekit_heading_tablet-   ekit_heading_mobile-">
                                        <div class="ekit_heading_separetor_wraper ekit_heading_elementskit-border-divider elementskit-style-long">
                                            <div class="elementskit-border-divider elementskit-style-long"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-0ba1048" data-id="0ba1048" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-9c4c13b elementor-invisible elementor-widget elementor-widget-text-editor" data-id="9c4c13b" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                Sign up now to securely organise your health records with just one click. Managing your health has never been this easy!					
                            </div>
                        </div>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-879d565 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="879d565" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-4dcc240" data-id="4dcc240" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-49c51b3 elementor-position-left elementor-vertical-align-middle elementor-invisible elementor-widget elementor-widget-image-box" data-id="49c51b3" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <style>
                                                    /*! elementor - v3.21.0 - 25-04-2024 */
                                                    .elementor-widget-image-box .elementor-image-box-content {
                                                        width: 100%
                                                    }

                                                    @media (min-width:768px) {
                                                        .elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper, .elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper {
                                                            display: flex
                                                        }

                                                        .elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper {
                                                            text-align: end;
                                                            flex-direction: row-reverse
                                                        }

                                                        .elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper {
                                                            text-align: start;
                                                            flex-direction: row
                                                        }

                                                        .elementor-widget-image-box.elementor-position-top .elementor-image-box-img {
                                                            margin: auto
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-top .elementor-image-box-wrapper {
                                                            align-items: flex-start
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-middle .elementor-image-box-wrapper {
                                                            align-items: center
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-bottom .elementor-image-box-wrapper {
                                                            align-items: flex-end
                                                        }
                                                    }

                                                    @media (max-width:767px) {
                                                        .elementor-widget-image-box .elementor-image-box-img {
                                                            margin-left: auto !important;
                                                            margin-right: auto !important;
                                                            margin-bottom: 15px
                                                        }
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-img {
                                                        display: inline-block
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-title a {
                                                        color: inherit
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-wrapper {
                                                        text-align: center
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-description {
                                                        margin: 0
                                                    }
                                                </style>
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img loading="lazy" decoding="async" width="49" height="50" src="https://hfiles.in/wp-content/uploads/2022/12/icon-records.png" class="elementor-animation-shrink attachment-full size-full wp-image-578" alt="" />
                                                    </figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Store family health records</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-7cd07f0" data-id="7cd07f0" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-f9e9730 elementor-position-left elementor-vertical-align-middle elementor-invisible elementor-widget elementor-widget-image-box" data-id="f9e9730" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:100}" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img loading="lazy" decoding="async" width="49" height="50" src="https://hfiles.in/wp-content/uploads/2022/12/icon-records.png" class="elementor-animation-shrink attachment-full size-full wp-image-578" alt="" />
                                                    </figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Access verified services</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-36bdc42 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="36bdc42" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-default">
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-42bc6f5" data-id="42bc6f5" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-0b977ef elementor-position-left elementor-vertical-align-middle elementor-invisible elementor-widget elementor-widget-image-box" data-id="0b977ef" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img loading="lazy" decoding="async" width="49" height="50" src="https://hfiles.in/wp-content/uploads/2022/12/icon-alert.png" class="elementor-animation-shrink attachment-full size-full wp-image-576" alt="" />
                                                    </figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Get health alerts</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-b7f29df" data-id="b7f29df" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-f6d0ee9 elementor-position-left elementor-vertical-align-middle elementor-invisible elementor-widget elementor-widget-image-box" data-id="f6d0ee9" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:300}" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img loading="lazy" decoding="async" width="49" height="50" src="https://hfiles.in/wp-content/uploads/2022/12/icon-metrics.png" class="elementor-animation-shrink attachment-full size-full wp-image-577" alt="" />
                                                    </figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Transfer health reports</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>--%>


        <%--<section class="elementor-section elementor-top-section elementor-element elementor-element-4004501 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="4004501" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-0eed7a7" data-id="0eed7a7" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-3287fbd elementor-invisible elementor-widget elementor-widget-elementskit-contact-form7" data-id="3287fbd" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="elementskit-contact-form7.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-form">
                                        <div class="wpcf7 no-js" id="wpcf7-f343-p26-o1" lang="en-US" dir="ltr">
                                            <div class="screen-reader-response">
                                                <p role="status" aria-live="polite" aria-atomic="true"></p>
                                                <ul></ul>
                                            </div>
                                            <form action="https://hfiles.in/#wpcf7-f343-p26-o1" method="post" class="wpcf7-form init" aria-label="Contact form" novalidate="novalidate" data-status="init">
                                                <div style="display: none;">
                                                    <input type="hidden" name="_wpcf7" value="343" />
                                                    <input type="hidden" name="_wpcf7_version" value="5.9.3" />
                                                    <input type="hidden" name="_wpcf7_locale" value="en_US" />
                                                    <input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f343-p26-o1" />
                                                    <input type="hidden" name="_wpcf7_container_post" value="26" />
                                                    <input type="hidden" name="_wpcf7_posted_data_hash" value="" />
                                                </div>
                                                <div class="one_half">
                                                    <p>
                                                        <label>
                                                            First Name<br />
                                                            <span class="wpcf7-form-control-wrap" data-name="your-name">
                                                                <input size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" value="" type="text" name="your-name" /></span></label>
                                                    </p>
                                                </div>
                                                <div class="one_half">
                                                    <p>
                                                        <label>
                                                            Last name<br />
                                                            <span class="wpcf7-form-control-wrap" data-name="your-last-name">
                                                                <input size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" value="" type="text" name="your-last-name" /></span></label>
                                                    </p>
                                                </div>
                                                <div class="one_half">
                                                    <p>
                                                        <label>
                                                            Email<br />
                                                            <span class="wpcf7-form-control-wrap" data-name="email">
                                                                <input size="40" class="wpcf7-form-control wpcf7-email wpcf7-validates-as-required wpcf7-text wpcf7-validates-as-email" aria-required="true" aria-invalid="false" value="" type="email" name="email" /></span></label>
                                                    </p>
                                                </div>
                                                <div class="one_half">
                                                    <p>
                                                        <label>
                                                            Mobile<br />
                                                            <span class="wpcf7-form-control-wrap" data-name="mobile">
                                                                <input size="40" class="wpcf7-form-control wpcf7-tel wpcf7-validates-as-required wpcf7-text wpcf7-validates-as-tel" aria-required="true" aria-invalid="false" value="" type="tel" name="mobile" /></span></label>
                                                    </p>
                                                </div>
                                                <div class="full_width clsCenter">
                                                    <p>
                                                        <input class="wpcf7-form-control wpcf7-submit has-spinner" type="submit" value="Submit" />
                                                    </p>
                                                </div>
                                                <div class="full_width clsCenter">
                                                    <p>
                                                        By signing up you agree to hfiles Term of Service and Privacy Policy
                                                    </p>
                                                </div>
                                                <div class="wpcf7-response-output" aria-hidden="true"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-c1589d8 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="c1589d8" data-element_type="section">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-7f757d5 animated-fast elementor-invisible" data-id="7f757d5" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;,&quot;animation&quot;:&quot;fadeIn&quot;}">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-721a48e elementor-widget__width-auto elementor-invisible elementor-widget elementor-widget-image" data-id="721a48e" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeIn&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="image.default">
                            <div class="elementor-widget-container">
                                <img loading="lazy" decoding="async" width="661" height="517" src="https://hfiles.in/wp-content/uploads/2023/03/about.svg" class="attachment-full size-full wp-image-1011" alt="about" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-61d0182" data-id="61d0182" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-937ccc4 elementor-widget elementor-widget-spacer" data-id="937ccc4" data-element_type="widget" data-widget_type="spacer.default">
                            <div class="elementor-widget-container">
                                <div class="elementor-spacer">
                                    <div class="elementor-spacer-inner"></div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-8afee48 elementor-invisible elementor-widget elementor-widget-heading" data-id="8afee48" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">About Us</h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-c4543a5 elementor-widget elementor-widget-elementskit-heading" data-id="c4543a5" data-element_type="widget" data-widget_type="elementskit-heading.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-heading elementskit-section-title-wraper text_left   ekit_heading_tablet-   ekit_heading_mobile-">
                                        <div class="ekit_heading_separetor_wraper ekit_heading_elementskit-border-divider elementskit-style-long">
                                            <div class="elementskit-border-divider elementskit-style-long"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-d09d4b3 elementor-invisible elementor-widget elementor-widget-text-editor" data-id="d09d4b3" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                <p>Welcome to Hfiles, where we aim to simplify and manage the healthcare system for your entire family, from birth to adulthood. We believe that organization is the key to leading a successful life, and our mission is to help you organize your medical life into one neat file.</p>
                                <p>We understand that visiting a doctor can be a stressful experience, and it can be even more challenging to keep track of past prescriptions, medical records, and medications. With Hfiles, you no longer have to worry about these issues as we help manage this stress by maintaining all of your prescriptions, medical records, and history in one place.</p>
                                <p>Our system is designed to facilitate easy transfer and access to medical files, so you can be confident that your family’s health information is always up-to-date and readily available to you and your healthcare providers. We prioritize the security and privacy of your sensitive medical information, and use the latest technology to ensure that your data is safe and protected at all times.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-1e0d9fc elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="1e0d9fc" data-element_type="section">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-e93fd8e" data-id="e93fd8e" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-570dfd0 elementor-invisible elementor-widget elementor-widget-heading" data-id="570dfd0" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">Mission</h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-505e445 elementor-widget elementor-widget-elementskit-heading" data-id="505e445" data-element_type="widget" data-widget_type="elementskit-heading.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-heading elementskit-section-title-wraper text_left   ekit_heading_tablet-   ekit_heading_mobile-">
                                        <div class="ekit_heading_separetor_wraper ekit_heading_elementskit-border-divider elementskit-style-long">
                                            <div class="elementskit-border-divider elementskit-style-long"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-0b50977 elementor-widget elementor-widget-text-editor" data-id="0b50977" data-element_type="widget" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                <p>To streamline the process of managing medical records from birth to old age, ensuring that your family’s health information is organized and easily accessible when you need it the most.</p>
                                <p>We are committed to providing you with the highest quality healthcare management system, and we constantly strive to improve our platform to meet your evolving needs. With our support, you can focus on what matters most – taking care of your family’s health – while we take care of the rest. Join us on this mission to transform the way you manage your family’s medical life.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-034c65b" data-id="034c65b" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-77bd554 elementor-invisible elementor-widget elementor-widget-heading" data-id="77bd554" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;,&quot;_animation_delay&quot;:200}" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">Vision</h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-76c69e5 elementor-widget elementor-widget-elementskit-heading" data-id="76c69e5" data-element_type="widget" data-widget_type="elementskit-heading.default">
                            <div class="elementor-widget-container">
                                <div class="ekit-wid-con">
                                    <div class="ekit-heading elementskit-section-title-wraper    ekit_heading_tablet-   ekit_heading_mobile-">
                                        <div class="ekit_heading_separetor_wraper ekit_heading_elementskit-border-divider elementskit-style-long">
                                            <div class="elementskit-border-divider elementskit-style-long"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-fcd7a2f elementor-widget elementor-widget-text-editor" data-id="fcd7a2f" data-element_type="widget" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                To simplify the management of family health data by providing a user-friendly platform that seamlessly organizes all your physical copies of reports and prescriptions in one place, making it easy for you to access and transfer them whenever needed thus connecting families and health care professionals as a whole.					
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="ekit-template-content-markup ekit-template-content-footer ekit-template-content-theme-support">
        <div data-elementor-type="wp-post" data-elementor-id="23" class="elementor elementor-23">
            <section class="elementor-section elementor-top-section elementor-element elementor-element-34631969 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="34631969" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                <div class="elementor-container elementor-column-gap-default">
                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-231d9d2b" data-id="231d9d2b" data-element_type="column">
                        <div class="elementor-widget-wrap elementor-element-populated">
                            <section class="elementor-section elementor-inner-section elementor-element elementor-element-ffc89de elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="ffc89de" data-element_type="section">
                                <div class="elementor-container elementor-column-gap-default">
                                    <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-41059b22" data-id="41059b22" data-element_type="column">
                                        <div class="elementor-widget-wrap elementor-element-populated">
                                            <div class="elementor-element elementor-element-d5f6dab elementor-widget elementor-widget-image" data-id="d5f6dab" data-element_type="widget" data-widget_type="image.default">
                                                <div class="elementor-widget-container">
                                                    <img width="207" height="80" src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" class="attachment-full size-full wp-image-361" alt="hfiles logo" />
                                                </div>
                                            </div>
                                            <div class="elementor-element elementor-element-7a8d30ae elementor-widget elementor-widget-heading" data-id="7a8d30ae" data-element_type="widget" data-widget_type="heading.default">
                                                <div class="elementor-widget-container">
                                                    <h2 class="elementor-heading-title elementor-size-default">Be a part of India's first social healthcare network</h2>
                                                </div>
                                            </div>
                                            <div class="elementor-element elementor-element-297b33eb elementor-widget elementor-widget-heading" data-id="297b33eb" data-element_type="widget" data-widget_type="heading.default">
                                                <div class="elementor-widget-container">
                                                    <h2 class="elementor-heading-title elementor-size-default">FOLLOW US</h2>
                                                </div>
                                            </div>
                                            <div class="elementor-element elementor-element-40020d3a elementor-shape-circle e-grid-align-left e-grid-align-mobile-center e-grid-align-tablet-center elementor-grid-0 elementor-widget elementor-widget-social-icons" data-id="40020d3a" data-element_type="widget" data-widget_type="social-icons.default">
                                                <div class="elementor-widget-container">
                                                    <style>
                                                        /*! elementor - v3.21.0 - 25-04-2024 */
                                                        .elementor-widget-social-icons.elementor-grid-0 .elementor-widget-container, .elementor-widget-social-icons.elementor-grid-mobile-0 .elementor-widget-container, .elementor-widget-social-icons.elementor-grid-tablet-0 .elementor-widget-container {
                                                            line-height: 1;
                                                            font-size: 0
                                                        }

                                                        .elementor-widget-social-icons:not(.elementor-grid-0):not(.elementor-grid-tablet-0):not(.elementor-grid-mobile-0) .elementor-grid {
                                                            display: inline-grid
                                                        }

                                                        .elementor-widget-social-icons .elementor-grid {
                                                            grid-column-gap: var(--grid-column-gap,5px);
                                                            grid-row-gap: var(--grid-row-gap,5px);
                                                            grid-template-columns: var(--grid-template-columns);
                                                            justify-content: var(--justify-content,center);
                                                            justify-items: var(--justify-content,center)
                                                        }

                                                        .elementor-icon.elementor-social-icon {
                                                            font-size: var(--icon-size,25px);
                                                            line-height: var(--icon-size,25px);
                                                            width: calc(var(--icon-size, 25px) + 2 * var(--icon-padding, .5em));
                                                            height: calc(var(--icon-size, 25px) + 2 * var(--icon-padding, .5em))
                                                        }

                                                        .elementor-social-icon {
                                                            --e-social-icon-icon-color: #fff;
                                                            display: inline-flex;
                                                            background-color: #69727d;
                                                            align-items: center;
                                                            justify-content: center;
                                                            text-align: center;
                                                            cursor: pointer
                                                        }

                                                            .elementor-social-icon i {
                                                                color: var(--e-social-icon-icon-color)
                                                            }

                                                            .elementor-social-icon svg {
                                                                fill: var(--e-social-icon-icon-color)
                                                            }

                                                            .elementor-social-icon:last-child {
                                                                margin: 0
                                                            }

                                                            .elementor-social-icon:hover {
                                                                opacity: .9;
                                                                color: #fff
                                                            }

                                                        .elementor-social-icon-android {
                                                            background-color: #a4c639
                                                        }

                                                        .elementor-social-icon-apple {
                                                            background-color: #999
                                                        }

                                                        .elementor-social-icon-behance {
                                                            background-color: #1769ff
                                                        }

                                                        .elementor-social-icon-bitbucket {
                                                            background-color: #205081
                                                        }

                                                        .elementor-social-icon-codepen {
                                                            background-color: #000
                                                        }

                                                        .elementor-social-icon-delicious {
                                                            background-color: #39f
                                                        }

                                                        .elementor-social-icon-deviantart {
                                                            background-color: #05cc47
                                                        }

                                                        .elementor-social-icon-digg {
                                                            background-color: #005be2
                                                        }

                                                        .elementor-social-icon-dribbble {
                                                            background-color: #ea4c89
                                                        }

                                                        .elementor-social-icon-elementor {
                                                            background-color: #d30c5c
                                                        }

                                                        .elementor-social-icon-envelope {
                                                            background-color: #ea4335
                                                        }

                                                        .elementor-social-icon-facebook, .elementor-social-icon-facebook-f {
                                                            background-color: #3b5998
                                                        }

                                                        .elementor-social-icon-flickr {
                                                            background-color: #0063dc
                                                        }

                                                        .elementor-social-icon-foursquare {
                                                            background-color: #2d5be3
                                                        }

                                                        .elementor-social-icon-free-code-camp, .elementor-social-icon-freecodecamp {
                                                            background-color: #006400
                                                        }

                                                        .elementor-social-icon-github {
                                                            background-color: #333
                                                        }

                                                        .elementor-social-icon-gitlab {
                                                            background-color: #e24329
                                                        }

                                                        .elementor-social-icon-globe {
                                                            background-color: #69727d
                                                        }

                                                        .elementor-social-icon-google-plus, .elementor-social-icon-google-plus-g {
                                                            background-color: #dd4b39
                                                        }

                                                        .elementor-social-icon-houzz {
                                                            background-color: #7ac142
                                                        }

                                                        .elementor-social-icon-instagram {
                                                            background-color: #262626
                                                        }

                                                        .elementor-social-icon-jsfiddle {
                                                            background-color: #487aa2
                                                        }

                                                        .elementor-social-icon-link {
                                                            background-color: #818a91
                                                        }

                                                        .elementor-social-icon-linkedin, .elementor-social-icon-linkedin-in {
                                                            background-color: #0077b5
                                                        }

                                                        .elementor-social-icon-medium {
                                                            background-color: #00ab6b
                                                        }

                                                        .elementor-social-icon-meetup {
                                                            background-color: #ec1c40
                                                        }

                                                        .elementor-social-icon-mixcloud {
                                                            background-color: #273a4b
                                                        }

                                                        .elementor-social-icon-odnoklassniki {
                                                            background-color: #f4731c
                                                        }

                                                        .elementor-social-icon-pinterest {
                                                            background-color: #bd081c
                                                        }

                                                        .elementor-social-icon-product-hunt {
                                                            background-color: #da552f
                                                        }

                                                        .elementor-social-icon-reddit {
                                                            background-color: #ff4500
                                                        }

                                                        .elementor-social-icon-rss {
                                                            background-color: #f26522
                                                        }

                                                        .elementor-social-icon-shopping-cart {
                                                            background-color: #4caf50
                                                        }

                                                        .elementor-social-icon-skype {
                                                            background-color: #00aff0
                                                        }

                                                        .elementor-social-icon-slideshare {
                                                            background-color: #0077b5
                                                        }

                                                        .elementor-social-icon-snapchat {
                                                            background-color: #fffc00
                                                        }

                                                        .elementor-social-icon-soundcloud {
                                                            background-color: #f80
                                                        }

                                                        .elementor-social-icon-spotify {
                                                            background-color: #2ebd59
                                                        }

                                                        .elementor-social-icon-stack-overflow {
                                                            background-color: #fe7a15
                                                        }

                                                        .elementor-social-icon-steam {
                                                            background-color: #00adee
                                                        }

                                                        .elementor-social-icon-stumbleupon {
                                                            background-color: #eb4924
                                                        }

                                                        .elementor-social-icon-telegram {
                                                            background-color: #2ca5e0
                                                        }

                                                        .elementor-social-icon-threads {
                                                            background-color: #000
                                                        }

                                                        .elementor-social-icon-thumb-tack {
                                                            background-color: #1aa1d8
                                                        }

                                                        .elementor-social-icon-tripadvisor {
                                                            background-color: #589442
                                                        }

                                                        .elementor-social-icon-tumblr {
                                                            background-color: #35465c
                                                        }

                                                        .elementor-social-icon-twitch {
                                                            background-color: #6441a5
                                                        }

                                                        .elementor-social-icon-twitter {
                                                            background-color: #1da1f2
                                                        }

                                                        .elementor-social-icon-viber {
                                                            background-color: #665cac
                                                        }

                                                        .elementor-social-icon-vimeo {
                                                            background-color: #1ab7ea
                                                        }

                                                        .elementor-social-icon-vk {
                                                            background-color: #45668e
                                                        }

                                                        .elementor-social-icon-weibo {
                                                            background-color: #dd2430
                                                        }

                                                        .elementor-social-icon-weixin {
                                                            background-color: #31a918
                                                        }

                                                        .elementor-social-icon-whatsapp {
                                                            background-color: #25d366
                                                        }

                                                        .elementor-social-icon-wordpress {
                                                            background-color: #21759b
                                                        }

                                                        .elementor-social-icon-x-twitter {
                                                            background-color: #000
                                                        }

                                                        .elementor-social-icon-xing {
                                                            background-color: #026466
                                                        }

                                                        .elementor-social-icon-yelp {
                                                            background-color: #af0606
                                                        }

                                                        .elementor-social-icon-youtube {
                                                            background-color: #cd201f
                                                        }

                                                        .elementor-social-icon-500px {
                                                            background-color: #0099e5
                                                        }

                                                        .elementor-shape-rounded .elementor-icon.elementor-social-icon {
                                                            border-radius: 10%
                                                        }

                                                        .elementor-shape-circle .elementor-icon.elementor-social-icon {
                                                            border-radius: 50%
                                                        }
                                                    </style>
                                                    <div class="elementor-social-icons-wrapper elementor-grid">
                                                        <span class="elementor-grid-item">
                                                            <a class="elementor-icon elementor-social-icon elementor-social-icon-instagram elementor-repeater-item-39ed829" href="https://www.instagram.com/p/CoUwEw4tcr2/?igshid=MWI4MTIyMDE=" target="_blank">
                                                                <span class="elementor-screen-only">Instagram</span>
                                                                <i class="fab fa-instagram"></i></a>
                                                        </span>
                                                        <span class="elementor-grid-item">
                                                            <a class="elementor-icon elementor-social-icon elementor-social-icon-twitter elementor-repeater-item-b01da26" href="https://twitter.com/health_files" target="_blank">
                                                                <span class="elementor-screen-only">Twitter</span>
                                                                <i class="fab fa-twitter"></i></a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-334537a1" data-id="334537a1" data-element_type="column">
                                        <div class="elementor-widget-wrap">
                                        </div>
                                    </div>
                                    <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-5532b9b4" data-id="5532b9b4" data-element_type="column">
                                        <div class="elementor-widget-wrap">
                                        </div>
                                    </div>
                                    <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-5622afe9" data-id="5622afe9" data-element_type="column">
                                        <div class="elementor-widget-wrap">
                                        </div>
                                    </div>

                                    <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-4f4c1c7" data-id="4f4c1c7" data-element_type="column">
                                        <div class="elementor-widget-wrap elementor-element-populated">
                                            <div class="elementor-element elementor-element-2157551d elementor-widget-mobile__width-initial elementor-widget elementor-widget-heading" data-id="2157551d" data-element_type="widget" data-widget_type="heading.default">
                                                <div class="elementor-widget-container">
                                                    <h2 class="elementor-heading-title elementor-size-default">CONTACT US</h2>
                                                </div>
                                            </div>
                                            <div class="elementor-element elementor-element-2cdd472e elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="2cdd472e" data-element_type="widget" data-widget_type="icon-list.default">
                                                <div class="elementor-widget-container">
                                                    <ul class="elementor-icon-list-items">
                                                        <li class="elementor-icon-list-item">
                                                            <span class="elementor-icon-list-icon">
                                                                <i aria-hidden="true" class="fas fa-map-marker-alt"></i></span>
                                                            <span class="elementor-icon-list-text">H-Files <br />Mumbai, India</span>
                                                        </li>

                                                        <li class="elementor-icon-list-item">
                                                            <span class="elementor-icon-list-icon">
                                                                <i aria-hidden="true" class="fas fa-phone elementor-phone-icon"></i></span>
                                                                    <span class="elementor-icon-list-text"><a class="text-white" href="tel:+919978043453"/>9978043453</span>
                                                         </li>

                                                        <li class="elementor-icon-list-item">
                                                            <span class="elementor-icon-list-icon">
                                                                <i aria-hidden="true" class="icon icon-envelope1"></i></span>
                                                            <span class="elementor-icon-list-text" ><a href="https://hfiles.in/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="066e606f6a6375286f6846616b676f6a2865696b">[email&#160;protected]</a></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
            <section class="elementor-section elementor-top-section elementor-element elementor-element-75526a66 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="75526a66" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                <div class="elementor-container elementor-column-gap-default">
                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-66406b4e" data-id="66406b4e" data-element_type="column">
                        <div class="elementor-widget-wrap elementor-element-populated">
                            <div class="elementor-element elementor-element-a8cad3b elementor-widget elementor-widget-text-editor" data-id="a8cad3b" data-element_type="widget" data-widget_type="text-editor.default">
                                <div class="elementor-widget-container">
                                    Copyright 2024 h.files. All rights reserved by h.files					
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
        </div>
    </footer>









    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        toastr.options = {
            closeButton: true,
            progressBar: true,
            positionClass: 'toast-top-right',
            "showDuration": "3000",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"

        };

        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'en,hi,mr',
            }, 'google_translate_element');
        }




        $('#passwordView1').click(function () {
            console.log('password')
            if ($('#pwdTextBox').attr('type') == 'password') {
                $('#pwdTextBox').attr('type', 'text');
                $(this).removeClass('fa-eye-slash');
                $(this).addClass('fa-eye')
            } else if ($('#pwdTextBox').attr('type') == 'text') {
                $('#pwdTextBox').attr('type', 'password');
                $(this).removeClass('fa-eye')
                $(this).addClass('fa-eye-slash');
            }

        })
        $('#passwordView2').click(function () {
            console.log('password')
            if ($('#cpwdTextBox').attr('type') == 'password') {
                $('#cpwdTextBox').attr('type', 'text');
                $(this).removeClass('fa-eye-slash');
                $(this).addClass('fa-eye')
            } else if ($('#cpwdTextBox').attr('type') == 'text') {
                $('#cpwdTextBox').attr('type', 'password');
                $(this).removeClass('fa-eye')
                $(this).addClass('fa-eye-slash');
            }

        })
        $('#dobTextBox1').on('change', function () {
            document.getElementById('dobTextBox1').style.color = '#0331b5'
        })
        // $('#dobTextBox1').attr('placeholder', 'value');

        function JSalert() {
            swal("An OTP is sent to your email, enter the OTP to proceed.");
        }

        console.log("timer")
        let timerOn = true;
        $('#resendLinkButtonTest').hide();
        function timer(remaining) {

            var m = Math.floor(remaining / 60);
            var s = remaining % 60;

            m = m < 10 ? '0' + m : m;
            s = s < 10 ? '0' + s : s;
            document.getElementById('timer').innerHTML = m + ':' + s;
            remaining -= 1;

            if (remaining >= 0 && timerOn) {
                setTimeout(function () {
                    timer(remaining);
                }, 1000);
                return;
            }

            if (!timerOn) {
                // Do validate stuff here
                return;
            }

            // Do timeout stuff here
            $('#timer').hide()
            $('#resendLinkButtonTest').show();
        }
        timer(60);
        $('#resendLinkButtonTest').click(function () {
            $('#resendLinkButtonTest').hide();
            $('#timer').show()
            timer(60);
        })


        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en'
            }, 'google_translate_element');
        }
    </script>
    <%-- <script>
      function disableKeyboardInputForDateField() {
    const dateInput = document.getElementById('date-input');

    dateInput.addEventListener('keydown', function(event) {
      event.preventDefault();
    });
  }

  // Call the function to disable keyboard input on the date field
  disableKeyboardInputForDateField();
</script>--%>






            <link rel='stylesheet' id='e-animations-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/animations/animations.min.css?ver=3.21.3' media='all' />
<script data-cfasync="false" src="https://hfiles.in/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/js/sweetalert2.min.js?ver=1.2.0" id="sweetalert2-js"></script>
<script id="cf7-popups-frontend-js-extra">
    var cf7_popups_val = { "msg1": "Validation Error", "msg2": "One or more field validation error", "msg3": "Error", "msg4": "Failed to send email because possible spam activity has been detected.", "msg5": "Failed to send email.", "msg6": "Email Sent", "msg7": "Thank you for your message. It has been sent." };
</script>
<script src="https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/js/cf7-popups.js?ver=1.2.0" id="cf7-popups-frontend-js"></script>
<script src="https://hfiles.in/wp-content/plugins/contact-form-7/includes/swv/js/index.js?ver=5.9.3" id="swv-js"></script>
<script id="contact-form-7-js-extra">
    var wpcf7 = { "api": { "root": "https:\/\/hfiles.in\/wp-json\/", "namespace": "contact-form-7\/v1" } };
</script>
<script src="https://hfiles.in/wp-content/plugins/contact-form-7/includes/js/index.js?ver=5.9.3" id="contact-form-7-js"></script>
<script src="https://hfiles.in/wp-content/themes/hello-elementor/assets/js/hello-frontend.min.js?ver=3.0.1" id="hello-theme-frontend-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementskit-lite/libs/framework/assets/js/frontend-script.js?ver=3.1.3" id="elementskit-framework-js-frontend-js"></script>
<script id="elementskit-framework-js-frontend-js-after">
    var elementskit = {
        resturl: 'https://hfiles.in/wp-json/elementskit/v1/',
    }


</script>
<script src="https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/js/widget-scripts.js?ver=3.1.3" id="ekit-widget-scripts-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.21.3" id="elementor-webpack-runtime-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.21.3" id="elementor-frontend-modules-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementor/assets/lib/waypoints/waypoints.min.js?ver=4.0.2" id="elementor-waypoints-js"></script>
<script src="https://hfiles.in/wp-includes/js/jquery/ui/core.min.js?ver=1.13.2" id="jquery-ui-core-js"></script>
<script id="elementor-frontend-js-before">
    var elementorFrontendConfig = { "environmentMode": { "edit": false, "wpPreview": false, "isScriptDebug": false }, "i18n": { "shareOnFacebook": "Share on Facebook", "shareOnTwitter": "Share on Twitter", "pinIt": "Pin it", "download": "Download", "downloadImage": "Download image", "fullscreen": "Fullscreen", "zoom": "Zoom", "share": "Share", "playVideo": "Play Video", "previous": "Previous", "next": "Next", "close": "Close", "a11yCarouselWrapperAriaLabel": "Carousel | Horizontal scrolling: Arrow Left & Right", "a11yCarouselPrevSlideMessage": "Previous slide", "a11yCarouselNextSlideMessage": "Next slide", "a11yCarouselFirstSlideMessage": "This is the first slide", "a11yCarouselLastSlideMessage": "This is the last slide", "a11yCarouselPaginationBulletMessage": "Go to slide" }, "is_rtl": false, "breakpoints": { "xs": 0, "sm": 480, "md": 768, "lg": 1025, "xl": 1440, "xxl": 1600 }, "responsive": { "breakpoints": { "mobile": { "label": "Mobile Portrait", "value": 767, "default_value": 767, "direction": "max", "is_enabled": true }, "mobile_extra": { "label": "Mobile Landscape", "value": 880, "default_value": 880, "direction": "max", "is_enabled": false }, "tablet": { "label": "Tablet Portrait", "value": 1024, "default_value": 1024, "direction": "max", "is_enabled": true }, "tablet_extra": { "label": "Tablet Landscape", "value": 1200, "default_value": 1200, "direction": "max", "is_enabled": false }, "laptop": { "label": "Laptop", "value": 1366, "default_value": 1366, "direction": "max", "is_enabled": false }, "widescreen": { "label": "Widescreen", "value": 2400, "default_value": 2400, "direction": "min", "is_enabled": false } } }, "version": "3.21.3", "is_static": false, "experimentalFeatures": { "e_optimized_assets_loading": true, "e_optimized_css_loading": true, "additional_custom_breakpoints": true, "e_swiper_latest": true, "container_grid": true, "hello-theme-header-footer": true, "home_screen": true, "ai-layout": true, "landing-pages": true }, "urls": { "assets": "https:\/\/hfiles.in\/wp-content\/plugins\/elementor\/assets\/" }, "swiperClass": "swiper", "settings": { "page": [], "editorPreferences": [] }, "kit": { "active_breakpoints": ["viewport_mobile", "viewport_tablet"], "global_image_lightbox": "yes", "lightbox_enable_counter": "yes", "lightbox_enable_fullscreen": "yes", "lightbox_enable_zoom": "yes", "lightbox_enable_share": "yes", "lightbox_title_src": "title", "lightbox_description_src": "description", "hello_header_logo_type": "title", "hello_header_menu_layout": "horizontal", "hello_footer_logo_type": "logo" }, "post": { "id": 26, "title": "Hfiles%20%7C%20Create%20and%20Manage%20Your%20E-health%20Record%28EHR%29%20With%20Us", "excerpt": "", "featuredImage": false } };
</script>
<script src="https://hfiles.in/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.21.3" id="elementor-frontend-js"></script>
<script src="https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/js/animate-circle.min.js?ver=3.1.3" id="animate-circle-js"></script>
<script id="elementskit-elementor-js-extra">
    var ekit_config = { "ajaxurl": "https:\/\/hfiles.in\/wp-admin\/admin-ajax.php", "nonce": "cc30e7ab9f" };
</script>
<script src="https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/js/elementor.js?ver=3.1.3" id="elementskit-elementor-js"></script>
<%--<script>
    (function (w, d, s, c, r, a, m) {
        w['KiwiObject'] = r;
        w[r] = w[r] || function () {
            (w[r].q = w[r].q || []).push(arguments)
        };
        w[r].l = 1 * new Date();
        a = d.createElement(s);
        m = d.getElementsByTagName(s)[0];
        a.async = 1;
        a.src = c;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', "https://app.interakt.ai/kiwi-sdk/kiwi-sdk-17-prod-min.js?v=" + new Date().getTime(), 'kiwi');
    window.addEventListener("load", function () {
        kiwi.init('', 'eZeKxJeYB2RnyKisaXf6Au61e1svbuZN', {});
    });
</script>--%>



</body>
</html>
