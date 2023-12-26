<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Memberignup.aspx.cs" Inherits="hfiles.MemberSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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


    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <title>member sign up</title>
    <style>
        @media (min-width: 992px) {
            /* .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }*/


            .footer {
                background: #0331b5;
                color: #ffffff;
                text-align: center;
                position: absolute;
                bottom: 0;
                width: 100%;
                padding: 10px
            }
        }
    </style>
</head>
<body>
    <div class="signin-main">
            <div id="google_translate_element" class="language"></div>
        <form class="w-100 h-100" runat="server">
            <asp:HiddenField runat="server" ID="hfId" />
            <asp:ScriptManager ID="scmSignUp" runat="server"></asp:ScriptManager>

            <div class="row vert-cent w-100 h-sm-100vh m-0">
                <div class="col-lg-6 col-xl-6 col-md-6 col-12 samanta-stand-image h-lg-100vh d-none d-md-block">
                    <img src="<%= ResolveUrl("~/Reception Page/002A.jpg") %>" alt="" width="100%" height="100%" />
                </div>

                <div class="col-lg-6 col-xl-6 col-md-6 col-12 px-5 d-flex justify-content-center align-items-center vh-lg-100"
                    style="background-image: url('<%= ResolveUrl("~/assets/bg-blue.png") %>')">
                    <div>
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <%-- below line added for google translator --%>
                            <div id="google_element"></div>

                            <h3 class="color-white">SIGN UP</h3>
                        </div>
                          <div class="row signin-form form-group has-search text-center ">
                        <div class="col-12 px-1 input-div">
                            <i class="fa-solid fa-user form-control-feedback"></i>
                            <asp:TextBox ID="emailTextBox" CssClass="form-control my-2" TextMode="SingleLine" placeholder="Email Id / Contact No." runat="server"></asp:TextBox>
                            <%-- <asp:TextBox runat="server"  id="emailTextBox" class="w-100 login-input" type="Text" placeholder="Username" />--%>
                        </div>

                  
                              <div class="col-12 px-1 password-div input-div">
                        <div runat="server" id="divOtp">
                            <i class="fa-solid fa-lock form-control-feedback"></i>
                            <input runat="server"  id="otpTextBox" autocomplete="off" class="form-control my-2" type="Text" placeholder="Enter OTP" />
                            <div class="text-end">
                                <asp:Label Text="" ID="errorLabel" runat="server" Style="color: #fff" />
                                <span id="timer" style="color: #fff"></span>
                                <span class="mx-2">
                                    <asp:LinkButton ID="resendLinkButton" OnClick="resendLinkButton_Click" runat="server">Resend OTP</asp:LinkButton></span>
                            </div>
                        </div>
                                  </div>
                              </div>
                        <div class="my-1" id="btnSubmitDiv">
                            <div class="resend-otp-div">
                                <input type="checkbox" /><span style="color: #fff"> I agree to <a target="_blank" style="color: #fdd001; font-weight: 700" href="tc.aspx">Terms and Conditions</a> </span>
                            </div>
                         
                        </div>

                        <div class="text-center my-1" id="otpButtonDiv">
                       
                            <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>

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
                    <p class="m-0"><a class="px-lg-3" href="TermsAndConditions.aspx">Terms & Conditions</a></p>
                    <p class="m-0"><a href="Policy.aspx">Privacy & Policy</a></p>
                </div>

                <div class="col-4 copy-right text-center p-0">
                    <span>Copyright@2023</span>
                </div>
                <div class="col-4 p-p d-xl-flex text-center">
                    <p class="m-0"><a class="px-xl-3" href="https://wa.me/919930372831"><i class="fa-brands fa-whatsapp"></i>&nbsp; +91-9930372831</a></p>
                    <p class="m-0"><a class="" href="mailto:contact@hfiles.in"><i class="fa fa-solid fa-envelope"></i>&nbsp; contact@hfiles.in</a></p>

                </div>
            </div>

        </form>
    </div>

    <script>


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
         
        let timerOn = true;
        //$('#resendLinkButton').hide();
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
        //timer(60);
        $('#resendLinkButton').click(function () {
            $('#resendLinkButton').hide();
            $('#timer').show()
            timer(60);
        })
        $('#otpButton').click(function () {
            $('#resendLinkButton').hide();
            $('#timer').show()
            timer(60);
        })

    </script>

  <%--  <script>
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'en,hi,mr',
            }, 'google_translate_element');
        }
    </script>--%>
   
</body>
</html>
