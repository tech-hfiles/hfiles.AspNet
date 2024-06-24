<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hfiles.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            /*            overflow:hidden;
*/ max-width: 100%;
        }

        .container-fluid {
            
        }

        .container {
            margin: 0 !important;
            width: 100%;
            padding: 0 0;
            overflow-x: hidden;
            overflow-y: hidden;
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
                font-size: 25px;
            }

        @media(max-width:600px) {
            .container {
                padding: 0 0;
                overflow-y: hidden;
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
                    overflow-y: visible;
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

    </script>

</head>

<body>
    <div class="container-fluid ">
        <form class="row h-100 align-ceter" runat="server">
            <%--<div id="google_translate_element" class="language"></div>--%>
            <asp:HiddenField runat="server" ID="hfId" />
            <div class="col-sm-12 col-lg-6 h-100 h-70 d-none d-lg-block px-5 justify-content-center align-items-center">
                <img src="../assets/login-samanta-w-bg.png" alt="" style="width: 100%; height: 80vh; object-fit: contain" />
            </div>
            <div class="col-sm-12 col-lg-6 inner-main" id="right-side-bar">
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
                            <i id="passwordView1" class="fa fa-solid fa-eye-slash hide-password-toggal  color-theme-yellow"></i>
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
                            <span style="color: #fff">New User? Click <a style="color: #fdd001; font-weight: 700" href="signup.aspx">here</a> to Sign Up</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row footer justify-content-around align-items-center m-0 mr-0">
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
                    <div class="col-4 p-p d-xl-flex text-center justify-content-center">
                        <p class="m-0"><a href="https://wa.me/919930372831"><i class="fa fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a></p>
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
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"

        };
        //toastr.success("MacIds added successfully.");

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
</body>
</html>
