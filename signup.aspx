<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="hfiles.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

    <title>Sign Up</title>
    <style>
        @media (min-width: 992px) {
           
            .footer {
                background: #0331b5;
                color: #ffffff;
                text-align: center;
                position: absolute;
                bottom: 0;
                left:0;
                width: 100%;
                padding: 10px
            }
        }
        @media (max-width: 992px) {
           
            .footer {
                background: #0331b5;
                color: #ffffff;
                text-align: center;
                position: relative;
                bottom: 0;
                left:0;
                width: 100%;
                padding: 10px
            }
            .signin-main .vert-cent {
                min-height: 95vh;
            }
        }

    </style>

    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
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

              <div id="google_translate_element" class="language"></div>
            <asp:ScriptManager ID="scmSignUp" runat="server"></asp:ScriptManager>

            <div class="row vert-cent w-100 h-sm-100vh m-0 ">
                <div class="col-lg-6 col-xl-6 col-md-6 col-sm-12 samanta-stand-image h-lg-100vh d-none d-lg-block px-5" style="background:#fff">
                    <img src="<%= ResolveUrl("~/Reception Page/signup-samanta.png") %>" alt="" style="width: 100%; height: 90%; object-fit:contain" />
                </div>

                <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12 px-5 d-flex justify-content-center align-items-center vh-lg-100"
                    style="background-image: url('<%= ResolveUrl("~/Reception Page/002B.png") %>'); background-repeat:no-repeat; background-size:cover;">
                    <div>
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <%-- below line added for google translator --%>
                            <div id="google_element"></div>

                            <h3 class="color-white">SIGN UP</h3>
                        </div>
                        <div class="row signin-form form-group has-search text-center justify-content-center ">
                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <!-- <span class="fa fa-user form-control-feedback"></span> -->
                                <input id="firstnameTextBox" runat="server" required type="text" class="form-control my-2" placeholder="Name" />
                            </div>
                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <input id="lastnameTextBox" runat="server" type="text" class="form-control my-2" placeholder="Last Name" required />
                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 input-div">
                                <i class="fa-solid fa-cake-candles form-control-feedback"></i>
                                <input runat="server" id="dobTextBox1" type="date" class="form-control my-2" placeholder="Date Of Birth" required />
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
                                <asp:UpdatePanel ID="uplSignUp" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="pwdTextBox" runat="server" type="password" class="form-control my-2" placeholder="Password" required />
                                        <i id="passwordView1" class="fa-solid fa-eye-slash hide-password-toggal"></i>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>

                            <div class="col-12 col-md-7 col-lg-6 col-xl-6 px-1 password-div input-div">
                                <i class="fa-solid fa-lock form-control-feedback"></i>
                                <asp:TextBox ID="cpwdTextBox" runat="server" type="password" class="form-control my-2" placeholder="Confirm Password" required />
                                <i id="passwordView2" class="fa-solid fa-eye-slash hide-password-toggal"></i>
                               <%-- <asp:RequiredFieldValidator ControlToValidate="cpwdTextBox" ErrorMessage="Please Enter Confirm Password" runat="server" ForeColor="White"></asp:RequiredFieldValidator Display="">
                                <asp:CompareValidator ControlToValidate="cpwdTextBox" ControlToCompare="pwdTextBox" ErrorMessage="Password and Confirm Password should be same" runat="server" ForeColor="White"></asp:CompareValidator>--%>
                            </div>

                        </div>
                        <div class="text-center my-3" runat="server" id="divOtp">
                            <asp:Button ID="genOTPButton" runat="server" Text="Sign Up" OnClick="signup_Click" OnClientClick="JSalert()" class="btn thm-button"></asp:Button>
                        </div>
                        <div class="row signin-form form-group has-search text-center justify-content-center">
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5">
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


            <img class="plus-top-right" src="<%= ResolveUrl("~/assets/plus-1.png") %>" alt="" />
            <img class="plus-bottom-left" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="" />
            <a href="<%= ResolveUrl("~/login.aspx") %>">
                <img class="triangle-top-right-cancel" src="<%= ResolveUrl("~/assets/cancel-white.png") %>" alt="" /></a>

            <div class="row footer justify-content-around align-items-center m-0">
                <div class="col-4 t-c d-xl-flex justify-content-center text-center">
                    <p class="m-0"><a href="tc.aspx">Terms & Conditions</a></p>
                     <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
                </div>

                <div class="col-4 copy-right text-center p-0">
                    <span><a href="/FAQ.aspx" class="text-white">FAQ's</a></span>
                </div>
                <div class="col-4 p-p d-xl-flex text-center">
                    <p class="m-0"><a 
                        href="https://wa.me/919930372831"><i class="fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a></p>
                     <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="" href="mailto:contact@hfiles.in"><i class="fa fa-solid fa-envelope"></i>&nbsp; contact@hfiles.in</a></p>

                </div>
            </div>

        </form>
    </div>

   <script>
       function googleTranslateElementInit() {
           new google.translate.TranslateElement({
               pageLanguage: 'en',
               includedLanguages: 'en,hi,mr',
           }, 'google_translate_element');
       }
   </script>


    <script type="text/javascript">
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
       
    </script>

    <script>
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en'
            }, 'google_translate_element');
        }
    </script>
</body>
</html>
