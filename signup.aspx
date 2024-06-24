<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="hfiles.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        .signin-form{
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
            .div-for-otp{
                margin-bottom:100px;
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
        }
        /*.toast-message {
         background-color: #0331b5;
     }*/
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
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

            <div class="row vert-cent w-100 h-sm-100vh m-0 ">
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
                                <asp:TextBox runat="server" placeholder="yyyy-mm-dd" ID="txtDate" required  class="form-control my-2"/>
                                <ajaxToolkit:CalendarExtender  ID="dateajax" runat="server" Format="yyyy-MM-dd" Enabled="true" TargetControlID="txtDate" />
                                <input runat="server" id="dobTextBox1" style="display: none;visibility:hidden;" type="date" class="form-control my-2" value="2024-01-01" required />
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
            <a href="<%= ResolveUrl("~/login.aspx") %>">
                <img class="triangle-top-right-cancel" src="<%= ResolveUrl("~/assets/cancel-white.png") %>" alt="" /></a>

            <div class="row footer justify-content-around align-items-center m-0">
                <div class="col-4 t-c d-xl-flex justify-content-center text-center">
                    <p class="m-0"><a href="TermsAndConditions.aspx">Terms & Conditions</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
                </div>
                <div class="col-4 copy-right text-center p-0 d-xl-flex text-center justify-content-center">
                    <p class="m-0"><a href="/FAQ.aspx" class="text-white">FAQ's</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="text-white">Copyright@2024</a></p>
                </div>

                <div class="col-4 p-p d-xl-flex text-center">
                    <p class="m-0">
                        <a
                            href="https://wa.me/919930372831"><i class="fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a>
                    </p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="" href="mailto:contact@hfiles.in"><i class="fa fa-solid fa-envelope"></i>&nbsp; contact@hfiles.in</a></p>

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
</body>
</html>
