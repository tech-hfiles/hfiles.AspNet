<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hfiles.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

   <%-- <link rel='stylesheet' id='elementor-frontend-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.21.3' media='all' />
<link rel='stylesheet' id='elementor-post-22-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-22.css?ver=1714086109' media='all' />
     <link rel='stylesheet' id='hello-elementor-css' href='https://hfiles.in/wp-content/themes/hello-elementor/style.min.css?ver=3.0.1' media='all' />
     <link rel='stylesheet' id='elementor-post-89-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-89.css?ver=1714086109' media='all' />
    <link rel='stylesheet' id='ekit-widget-styles-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/widget-styles.css?ver=3.1.3' media='all' />--%>




    <%-- <title>Hfiles | Create and Manage Your E-health Record(EHR) With Us</title>--%>
 <%--<meta name='robots' content='noindex, nofollow' />--%>
 <link rel="alternate" type="application/rss+xml" title="Hfiles | Create and Manage Your E-health Record(EHR) With Us &raquo; Feed" href="https://hfiles.in/feed/" />
 <link rel="alternate" type="application/rss+xml" title="Hfiles | Create and Manage Your E-health Record(EHR) With Us &raquo; Comments Feed" href="https://hfiles.in/comments/feed/" />
 <script>
     window._wpemojiSettings = { "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/72x72\/", "ext": ".png", "svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/svg\/", "svgExt": ".svg", "source": { "concatemoji": "https:\/\/hfiles.in\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.5.2" } };
     /*! This file is auto-generated */
     !function (i, n) { var o, s, e; function c(e) { try { var t = { supportTests: e, timestamp: (new Date).valueOf() }; sessionStorage.setItem(o, JSON.stringify(t)) } catch (e) { } } function p(e, t, n) { e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(t, 0, 0); var t = new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data), r = (e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(n, 0, 0), new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data)); return t.every(function (e, t) { return e === r[t] }) } function u(e, t, n) { switch (t) { case "flag": return n(e, "\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f", "\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f") ? !1 : !n(e, "\ud83c\uddfa\ud83c\uddf3", "\ud83c\uddfa\u200b\ud83c\uddf3") && !n(e, "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f", "\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f"); case "emoji": return !n(e, "\ud83d\udc26\u200d\u2b1b", "\ud83d\udc26\u200b\u2b1b") }return !1 } function f(e, t, n) { var r = "undefined" != typeof WorkerGlobalScope && self instanceof WorkerGlobalScope ? new OffscreenCanvas(300, 150) : i.createElement("canvas"), a = r.getContext("2d", { willReadFrequently: !0 }), o = (a.textBaseline = "top", a.font = "600 32px Arial", {}); return e.forEach(function (e) { o[e] = t(a, e, n) }), o } function t(e) { var t = i.createElement("script"); t.src = e, t.defer = !0, i.head.appendChild(t) } "undefined" != typeof Promise && (o = "wpEmojiSettingsSupports", s = ["flag", "emoji"], n.supports = { everything: !0, everythingExceptFlag: !0 }, e = new Promise(function (e) { i.addEventListener("DOMContentLoaded", e, { once: !0 }) }), new Promise(function (t) { var n = function () { try { var e = JSON.parse(sessionStorage.getItem(o)); if ("object" == typeof e && "number" == typeof e.timestamp && (new Date).valueOf() < e.timestamp + 604800 && "object" == typeof e.supportTests) return e.supportTests } catch (e) { } return null }(); if (!n) { if ("undefined" != typeof Worker && "undefined" != typeof OffscreenCanvas && "undefined" != typeof URL && URL.createObjectURL && "undefined" != typeof Blob) try { var e = "postMessage(" + f.toString() + "(" + [JSON.stringify(s), u.toString(), p.toString()].join(",") + "));", r = new Blob([e], { type: "text/javascript" }), a = new Worker(URL.createObjectURL(r), { name: "wpTestEmojiSupports" }); return void (a.onmessage = function (e) { c(n = e.data), a.terminate(), t(n) }) } catch (e) { } c(n = f(s, u, p)) } t(n) }).then(function (e) { for (var t in e) n.supports[t] = e[t], n.supports.everything = n.supports.everything && n.supports[t], "flag" !== t && (n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && n.supports[t]); n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && !n.supports.flag, n.DOMReady = !1, n.readyCallback = function () { n.DOMReady = !0 } }).then(function () { return e }).then(function () { var e; n.supports.everything || (n.readyCallback(), (e = n.source || {}).concatemoji ? t(e.concatemoji) : e.wpemoji && e.twemoji && (t(e.twemoji), t(e.wpemoji))) })) }((window, document), window._wpemojiSettings);
 </script>
 <link rel='stylesheet' id='elementor-frontend-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.21.3' media='all' />
 <link rel='stylesheet' id='elementor-post-22-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-22.css?ver=1714086109' media='all' />
 <link rel='stylesheet' id='elementor-post-23-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-23.css?ver=1714086109' media='all' />
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

     <link rel='stylesheet' id='sweetalert2-css' href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/sweetalert2.min.css?ver=1.2.0' media='all' />
 <link rel='stylesheet' id='cf7-popups-frontend-css' href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/frontend.css?ver=1.2.0' media='all' />
 <link rel='stylesheet' id='cpsh-shortcodes-css' href='https://hfiles.in/wp-content/plugins/column-shortcodes/assets/css/shortcodes.css?ver=1.0.1' media='all' />
 <link rel='stylesheet' id='contact-form-7-css' href='https://hfiles.in/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.9.3' media='all' />
 <link rel='stylesheet' id='hello-elementor-css' href='https://hfiles.in/wp-content/themes/hello-elementor/style.min.css?ver=3.0.1' media='all' />
 <link rel='stylesheet' id='hello-elementor-theme-style-css' href='https://hfiles.in/wp-content/themes/hello-elementor/theme.min.css?ver=3.0.1' media='all' />
 <link rel='stylesheet' id='hello-elementor-header-footer-css' href='https://hfiles.in/wp-content/themes/hello-elementor/header-footer.min.css?ver=3.0.1' media='all' />
 <link rel='stylesheet' id='elementor-post-89-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-89.css?ver=1714086109' media='all' />
 <link rel='stylesheet' id='elementor-icons-ekiticons-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/modules/elementskit-icon-pack/assets/css/ekiticons.css?ver=3.1.3' media='all' />
 <link rel='stylesheet' id='elementor-icons-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=5.29.0' media='all' />
 <link rel='stylesheet' id='swiper-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css?ver=8.4.5' media='all' />
 <link rel='stylesheet' id='font-awesome-5-all-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css?ver=3.21.3' media='all' />



 <link rel='stylesheet' id='font-awesome-4-shim-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/v4-shims.min.css?ver=3.21.3' media='all' />
 <link rel='stylesheet' id='she-header-style-css' href='https://hfiles.in/wp-content/plugins/sticky-header-effects-for-elementor/assets/css/she-header-style.css?ver=1.6.10' media='all' />
 <link rel='stylesheet' id='elementor-post-26-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-26.css?ver=1714111713' media='all' />
 <link rel='stylesheet' id='child-style-css' href='https://hfiles.in/wp-content/themes/hello-theme-child-master/style.css?ver=6.5.2' media='all' />
 <link rel='stylesheet' id='ekit-widget-styles-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/widget-styles.css?ver=3.1.3' media='all' />
 <link rel='stylesheet' id='ekit-responsive-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/responsive.css?ver=3.1.3' media='all' />
 <link rel='stylesheet' id='google-fonts-1-css' href='https://fonts.googleapis.com/css?family=Poppins%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRed+Hat+Display%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&amp;display=swap&amp;ver=6.5.2' media='all' />
 <link rel='stylesheet' id='elementor-icons-shared-0-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/fontawesome.min.css?ver=5.15.3' media='all' />
 <link rel='stylesheet' id='elementor-icons-fa-brands-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/brands.min.css?ver=5.15.3' media='all' />
 <link rel='stylesheet' id='elementor-icons-fa-solid-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/solid.min.css?ver=5.15.3' media='all' />
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

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
     integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
     crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <link rel="stylesheet" href="style.css" />
    <title>H Files | Sign In</title>
    <style>
        .body {
            margin: 0;
            height: auto;
            
            max-width: 100%;

                /*overflow: hidden;*/
        }
        .container-fluid {
            
        }
        .container {
            margin: 0 !important;
            width: 100%;
            padding: 0 0;
            /*overflow-x: hidden;
            overflow-y: hidden;*/
            background-color: #0331b5;
        }

        .thm-button {
            padding: 10px 40px;
            background: #fdd001;
            border-radius: 20px;
            color: #08138f;
            font-weight: 700;
            width: 100% !important;
        }

        .inner-body .login-input {
            border: none;
            background: white;
            border-bottom: 1px solid #ffffff3d;
            padding: 10px 40px;
            margin: 8px 0;
            color: #08138f;
            outline: 0;
            width: 100%;
        }

        .inner-main {
            background-image: url('../Reception Page/002B.png');
            background-size: cover; /* Ensures the background image covers the entire container */
            background-position: center; /* Centers the background image */
            background-repeat: no-repeat; /* Prevents the background image from repeating */
            height: 100vh; /* Sets the height to 100% of the viewport height */
            display: flex; /* Enables flexbox layout */
            align-items: center; /* Centers content vertically */
            justify-content: center; /* Centers content horizontally */
            margin: 0; /* Resets any default margin */
            padding: 0; /* Resets any default padding */
        }


        .footer {
            background: #0331b5;
            color: #ffffff;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: auto !important;
        }

       



        .password-div {
            position: relative;
        }

            .password-div .hide-password-toggal {
                position: absolute;
                right: 10px;
                top: 22px;
                cursor: pointer;
                font-size: 15px;
            }

        @media(max-width:600px) {
            .container {
                padding: 0 0;
                /*overflow-y: hidden;*/
            }

            .inner-main {
                height: 92vh;
            }

            .footer {
                position: fixed;
                height: 5vh;
            }

            .signin-heading img {
                width: 80px;
            }

            /*.inner-main {
                height: 92vh;
            }

            .footer {
                height: 5vh;
            }
        }*/

            @media (max-height: 580px) {
                .footer {
                    position: fixed;
                }

                .container-fluid {
                    padding: 0 0;
                    /*overflow-y: visible;*/
                    overscroll-behavior-y: none;
                }

                .inner-main {
                    height: 92vh;
                }

                .footer {
                    height: 5vh;
                }

                .signin-heading img {
                    width: 80px;
                }
            }

            @media (max-height: 920px) {
                .inner-main {
                    height: 92vh;
                }

                .footer {
                    position: fixed;
                }
            }

            @media (max-width: 430px) {
                .footer {
                    position: fixed;
                }
            }

            @media (min-height: 598px) and (max-height: 600px) {
                .footer {
                    bottom: 0;
                }
            }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    <style>
        #toast-container > .toast-success {
            background-color: #fdd001;
            opacity:2;
            color:#0331b5;
            font-weight:600;
        }
       
        @media(max-width:640px){
            #toast-container>.toast-success{
                font-size:14px;
            }
        }
        /*.toast-message {
            background-color: #0331b5;
        }*/
        .fixed-div {
   position: fixed;
   top: 0;
   left: 0;
   right: 0;
 }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        toastr.options = {
            closeButton: true,
            progressBar: true,
            positionClass: 'toast-top-right'
        };

    </script>

</head>

<body>
  <div class="fixed-div" style="width:100%;z-index:100000;">


  
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
                                            <i aria-hidden="true" class="ekit-menu-icon icon icon-menu-5" style="color:white"></i>
                                        </button>
                                        <div id="ekit-megamenu-primary-menu" class="elementskit-menu-container elementskit-menu-offcanvas-elements elementskit-navbar-nav-default ekit-nav-menu-one-page-no ekit-nav-dropdown-hover">
                                            <ul id="menu-primary-menu" class="elementskit-navbar-nav elementskit-menu-po-right submenu-click-on-icon">
                                                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-649 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                    <a href="/index.aspx#why" class="ekit-menu-nav-link">Why hfiles?</a></li>
                                                <li class="menu-item menu-item-type-custom elementor-hidden-desktop elementor-hidden-tablet menu-item-object-custom menu-item-649 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                <a href="/login.aspx" class="ekit-menu-nav-link">Login</a></li>
                                                                                            <li class="menu-item menu-item-type-custom elementor-hidden-desktop elementor-hidden-tablet menu-item-object-custom menu-item-649 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                <a href="/signup.aspx" class="ekit-menu-nav-link">Sign up</a></li>
                                                <%--  <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-650 nav-item elementskit-mobile-builder-content" data-vertical-menu="750px">
                                                  <a href="#ABHA" class="ekit-menu-nav-link">ABHA</a></li> --%>
                                            </ul>
                                            <div class="elementskit-nav-identity-panel">
                                                <div class="elementskit-site-title">
                                                    <%--<a class="elementskit-nav-logo" href="https://hfiles.in/" target="_self" rel="">
                                                        <img fetchpriority="high" width="512" height="512" src="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon.png" class="attachment-full size-full" alt="" decoding="async" srcset="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon.png 512w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-300x300.png 300w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-150x150.png 150w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png 270w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png 192w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png 180w, https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png 32w" sizes="(max-width: 512px) 100vw, 512px" />
                                                    </a>--%>
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
                                                                <span class="elementor-button-text" style="color:white;"> User Login</span>
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

      </div>



   <div class="container-fluid">
        <form class="row h-100 align-ceter" runat="server" style="display: flex; flex-wrap: wrap;">
            <%--<div id="google_translate_element" class="language"></div>--%>
            <asp:HiddenField runat="server" ID="hfId" />
           <%-- <div class="col-sm-12 col-lg-6 h-100 h-70 d-none d-lg-block px-5 justify-content-center align-items-center">--%>
            <div class="col-sm-12 col-lg-6 <%--h-100 h-70--%> d-none d-lg-block px-5 justify-content-center align-items-center" style="padding-top:100px">
                <img src="../assets/login-samanta-w-bg.png" alt="" style="width: 100%; height: 80vh; object-fit: contain" />
            </div>
       
           <%-- <div class="col-sm-12 col-lg-6 inner-main" id="right-side-bar">--%>
             <div class="col-sm-12 col-lg-6 inner-main" id="right-side-bar" style="/*overflow-y: auto;*/ height: 100vh !important; /*padding: 20px;*/">
                <div class="d-flex align-items-center justify-content-center h-100 inner-body">
                    <div class="text-center">
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <h1 class="color-white pl-3">Welcome Back!</h1>
                        </div>
                        <div>
                            <asp:TextBox ID="emailTextBox" CssClass="w-95 login-input" required TextMode="SingleLine" placeholder="Email Id / Contact No." runat="server" Style="border-radius: 30px"></asp:TextBox>
                            <%-- <asp:TextBox runat="server"  id="emailTextBox" class="w-100 login-input" type="Text" placeholder="Username" />--%>
                        </div>

                        <div class="password-div" id="divpassword" runat="server">
                            <asp:HiddenField runat="server" ID="hfIsPasswordDivActive" />
                            <asp:TextBox runat="server" ID="txtPassword" class="w-95 login-input" type="password" placeholder="Password" Style="border-radius: 30px" />
                            <%--<i id="passwordView1" class="fa fa-solid fa-eye-slash hide-password-toggal  color-theme-yellow"></i>--%>
                            <i id="passwordView2" class="fa-solid fa-eye-slash hide-password-toggal"></i>
                            <div class="text-end">
                                <span style="color: #fff"><a id="forgotlink" style="color: #fdd001; font-weight: 700" href="ForgotPassword.aspx">Forgot Password ? </a></span>
                            </div>
                        </div>

                        <div runat="server" id="divOtp">
                            <input runat="server" required id="otpTextBox" onkeypress="return isNumberKey(event)" autocomplete="off" class="w-100 login-input" style="border-radius: 30px" type="Text" placeholder="Enter OTP" />
                            <div class="text-end">
                                <asp:Label Text="" ID="errorLabel" runat="server" Style="color: #fff" />
                                <span id="timer" style="color: #fff"></span>
                                <span class="mx-2">
                                    <asp:LinkButton ID="resendLinkButton" OnClick="resendLinkButton_Click" ForeColor="Black" runat="server">Resend OTP</asp:LinkButton></span>
                            </div>
                        </div>

                        <div class="text-center my-1" id="otpButtonDiv">
                            <%--<div class="text-center resend-otp-div">
                            <input type="checkbox" /><span style="color: #fff"> I agree to <a target="_blank" style="color: #fdd001; font-weight: 700" href="tc.aspx">Terms and Conditions</a> </span>
                        </div>--%>
                            <asp:Button ID="otpButton" OnClick="signup_Click" ValidationGroup="otp" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>

                        </div>

                        <div class="text-center my-1" id="btnSubmitDiv">
                            <%--<div class="text-center resend-otp-div">
                            <input type="checkbox" /><span style="color: #fff"> I agree to <a target="_blank" style="color: #fdd001; font-weight: 700" href="tc.aspx">Terms and Conditions</a> </span>
                        </div>--%>
                            <asp:LinkButton class="btn thm-button my-2" Text="Login" ValidationGroup="login" OnClick="btnSubmit_Click" ID="btnSubmit" runat="server" meta:resourcekey="btnsubmitlogin" />

                        </div>

                        <div class="text-center my-1">
                            <span style="color: #fff">Or</span>
                        </div>

                        <div class="text-center my-1">
                            <input type="button" id="changeLoginMode" value="Login with Password" class="btn thm-button my-2" onclick="handleLogin()" />
                        </div>

                        <div class="text-center resend-otp-div mt-lg-3">
                            <span style="color: #fff">New User? Click <a style="color: #fdd001; font-weight: 700" href="signup.aspx" >here</a> to Sign Up</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <%--<div class="row footer justify-content-around align-items-center m-0 mr-0">--%>
                 <div class="row footer justify-content-around align-items-center m-0 mr-0" style="z-index:1000000">
                    <div class="col-4 t-c d-xl-flex justify-content-center text-center">
                        <p class="m-0"><a href="tc.aspx">Terms & Conditions</a></p>
                        <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                        <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
                    </div>

                    <div class="col-4 copy-right text-center p-0 d-xl-flex text-center justify-content-center">
                        <p class="m-0"><a href="/FAQ.aspx" class="text-white">FAQ's</a></p>
                        <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                        <p class="m-0"><a class="text-white" href="copyright.aspx">Copyright@2024</a></p>
                    </div>
                    <div class="col-4 p-p d-xl-flex text-center justify-content-center">
                        <p class="m-0"><a href="https://wa.me/919978043453"><i class="fa fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a></p>
                        <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                        <p class="m-0"><a class="" href="mailto:contact@hfiles.in"><i class="fa fa-solid fa-envelope"></i>&nbsp; contact@hfiles.in</a></p>

                    </div>
                </div>
            </div>
        </form>
    </div>

  
    

    




    

   
    
  

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
            "timeOut": "3600000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"

        };
     //   toastr.success("MacIds added successfully.");

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        $('.password-div .hide-password-toggal').click(function () {
            console.log('password');
            // Find the associated password textbox
            var passwordTextBox = $('#txtPassword');

            // Toggle the password visibility
            if (passwordTextBox.attr('type') == 'password') {
                passwordTextBox.attr('type', 'text');
                $(this).removeClass('fa-eye-slash');
                $(this).addClass('fa-eye');
            } else if (passwordTextBox.attr('type') == 'text') {
                passwordTextBox.attr('type', 'password');
                $(this).removeClass('fa-eye');
                $(this).addClass('fa-eye-slash');
            }
        });

        document.addEventListener('DOMContentLoaded', function () {
            var iframes = document.querySelectorAll('.VIpgJd-ZVi9od-ORHb-OEVmcd skiptranslate'); // Select all iframes with class 'hideMe'
            for (var i = 0; i < iframes.length; i++) {
                iframes[i].style.display = 'none'; // Hide each iframe by setting display property to 'none'
            }
        });
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'en,hi,mr',
            }, 'google_translate_element');
        }

        //console.log('chal rha hai')
        //var changeloginmodebtn = document.getElementById('changeloginmode')
        var loginMode = 'password'

        function changemodevalue() {
            if (loginMode == 'password') {
                loginMode = 'OTP';
            } else if (loginMode == 'OTP') {
                loginMode = 'password';
            }
        }

        $('.password-div').hide()
        $('#btnSubmitDiv').hide()
        $('#forgotlink').hide()
        document.getElementById('changeLoginMode').value = 'Login with Password'

        function handleLogin() {
            console.log('logn mode')
            if (loginMode == 'password') {
                $('#divOtp').hide()
                $('#otpButtonDiv').hide()
                $('.password-div').show()
                $('#btnSubmitDiv').show()
                $('#forgotlink').show()
                $('#changeLoginMode').val('Login with OTP')
                //document.getElementById('changeLoginMode').value = 'Login with OTP'
                loginMode = 'OTP'
            } else if (loginMode == 'OTP') {
                $('#divOtp').show()
                $('#otpButtonDiv').show()
                $('.password-div').hide()
                $('#btnSubmitDiv').hide()
                $('#forgotlink').hide()
                $('#changeLoginMode').val('Login with password')
                //document.getElementById('changeLoginMode').value = 'Login with password'
                loginMode = 'password'
            }

        }

        let timerOn = true;
        $('#resendLinkButton').hide();

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
            $('#resendLinkButton').show()
        }

        timer(60);

        $('#resendLinkButton').click(function () {
            $('#resendLinkButton').hide();
            $('#timer').show()
            timer(60);
        })


    </script>







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
