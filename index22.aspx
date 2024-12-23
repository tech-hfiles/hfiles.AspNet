<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index22.aspx.cs" Inherits="hfiles.index" %>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
  
   
    <link rel='stylesheet' id='elementor-frontend-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.21.3' media='all' />
    <link rel='stylesheet' id='elementor-post-22-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-22.css?ver=1714086109' media='all' />
<%--    <link rel='stylesheet' id='elementor-post-23-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-23.css?ver=1714086109' media='all' />--%>




    <%--<link rel='stylesheet' id='sweetalert2-css' href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/sweetalert2.min.css?ver=1.2.0' media='all' />
    <link rel='stylesheet' id='cf7-popups-frontend-css' href='https://hfiles.in/wp-content/plugins/cf7-popups//views/assets/css/frontend.css?ver=1.2.0' media='all' />
    <link rel='stylesheet' id='cpsh-shortcodes-css' href='https://hfiles.in/wp-content/plugins/column-shortcodes/assets/css/shortcodes.css?ver=1.0.1' media='all' />--%>
<%--    <link rel='stylesheet' id='contact-form-7-css' href='https://hfiles.in/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.9.3' media='all' />--%>
    <link rel='stylesheet' id='hello-elementor-css' href='https://hfiles.in/wp-content/themes/hello-elementor/style.min.css?ver=3.0.1' media='all' />
<%--    <link rel='stylesheet' id='hello-elementor-theme-style-css' href='https://hfiles.in/wp-content/themes/hello-elementor/theme.min.css?ver=3.0.1' media='all' />--%>
<%--    <link rel='stylesheet' id='hello-elementor-header-footer-css' href='https://hfiles.in/wp-content/themes/hello-elementor/header-footer.min.css?ver=3.0.1' media='all' />--%>
    <link rel='stylesheet' id='elementor-post-89-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-89.css?ver=1714086109' media='all' />
<%--    <link rel='stylesheet' id='elementor-icons-ekiticons-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/modules/elementskit-icon-pack/assets/css/ekiticons.css?ver=3.1.3' media='all' />--%>
   <%-- <link rel='stylesheet' id='elementor-icons-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=5.29.0' media='all' />
    <link rel='stylesheet' id='swiper-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css?ver=8.4.5' media='all' />
    <link rel='stylesheet' id='font-awesome-5-all-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css?ver=3.21.3' media='all' />--%>
   <%-- <link rel='stylesheet' id='font-awesome-4-shim-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/v4-shims.min.css?ver=3.21.3' media='all' />
    <link rel='stylesheet' id='she-header-style-css' href='https://hfiles.in/wp-content/plugins/sticky-header-effects-for-elementor/assets/css/she-header-style.css?ver=1.6.10' media='all' />
    <link rel='stylesheet' id='elementor-post-26-css' href='https://hfiles.in/wp-content/uploads/elementor/css/post-26.css?ver=1714111713' media='all' />--%>
<%--    <link rel='stylesheet' id='child-style-css' href='https://hfiles.in/wp-content/themes/hello-theme-child-master/style.css?ver=6.5.2' media='all' />--%>
    <link rel='stylesheet' id='ekit-widget-styles-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/widget-styles.css?ver=3.1.3' media='all' />
  <%--  <link rel='stylesheet' id='ekit-responsive-css' href='https://hfiles.in/wp-content/plugins/elementskit-lite/widgets/init/assets/css/responsive.css?ver=3.1.3' media='all' />
    <link rel='stylesheet' id='google-fonts-1-css' href='https://fonts.googleapis.com/css?family=Poppins%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRed+Hat+Display%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&amp;display=swap&amp;ver=6.5.2' media='all' />
   --%> <%--<link rel='stylesheet' id='elementor-icons-shared-0-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/fontawesome.min.css?ver=5.15.3' media='all' />
    <link rel='stylesheet' id='elementor-icons-fa-brands-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/brands.min.css?ver=5.15.3' media='all' />--%>
    <%--<link rel='stylesheet' id='elementor-icons-fa-solid-css' href='https://hfiles.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/solid.min.css?ver=5.15.3' media='all' />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>--%>
    <%--<script src="https://hfiles.in/wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
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
    <meta name="msapplication-TileImage" content="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png" />--%>
   
</head>
<body class="home page-template page-template-elementor_header_footer page page-id-26 elementor-default elementor-template-full-width elementor-kit-89 elementor-page elementor-page-26">
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
                                                    <a href="#ABHA" class="ekit-menu-nav-link">ABHA</a></li>
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
                                                        <a class="elementor-button elementor-button-link elementor-size-sm" href="http://web.hfiles.in/login.aspx">
                                                            <span class="elementor-button-content-wrapper">
                                                                <span class="elementor-button-text">User Login</span>
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
                                                        <a class="elementor-button elementor-button-link elementor-size-sm" href="http://web.hfiles.in/signup.aspx">
                                                            <span class="elementor-button-content-wrapper">
                                                                <span class="elementor-button-text">Sign up</span>
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
   
   
 
</body>
</html>

