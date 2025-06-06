﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberSignup.aspx.cs" Inherits="hfiles.MemberSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


    <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
    <title>member sign up</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
   <script>
       toastr.options = {
           closeButton: true,
           progressBar: true,
           positionClass: 'toast-top-right'
       };

   </script>

    <script>
        function toggleDropdown() {
            var inputField = document.getElementById('<%= emailTextBox.ClientID %>');
         var dropdown = document.getElementById('<%= ddlCountry.ClientID %>');

    if (inputField && dropdown) {
        if (/^\d+$/.test(inputField.value)) {
            dropdown.style.display = "block"; // Show dropdown
            inputField.style.paddingLeft = "100px !important"; // Move text after dropdown
            // Adjust width dynamically
        } else {
            dropdown.style.display = "none"; // Hide dropdown
            inputField.style.paddingLeft = "51px !important "; // Reset for email input
             // Reset width
        }
    }
}

// Call function on input change
$(document).ready(function () {
    updateDialingCode();
    toggleDropdown();
    $("#<%= emailTextBox.ClientID %>").on("input", function () {
        toggleDropdown();
    });
});</script>

  <script>

      function updateDialingCode() {
          var dropdown = document.getElementById("ddlCountry");

          if (dropdown) {
              let selectedIndex = dropdown.selectedIndex;
              let selectedOption = dropdown.options[selectedIndex];

              // Extract values: text (Country + Dialing Code) and value (ISO Code + Dialing Code)
              let isoValue = selectedOption.value; // e.g., "ARM +374"

              // Update the selected option's visible text in the dropdown
              selectedOption.text = isoValue;  // Change visible dropdown text
          }
      }


  </script>


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
            


        @media (min-width: 992px) {
            /* .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }*/

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

            @media (max-height: 580px) {
                .footer {
                    position: fixed;
                }

                .container-fluid {
                    padding: 0 0;
                    overflow-y: visible;
                    overscroll-behavior-y: none;
                }
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
            }
    </style>

</head>
<body>
    <div class="signin-main">
       
        <form class="w-100 h-100" runat="server">
            <asp:HiddenField runat="server" ID="hfId" />
            <asp:ScriptManager ID="scmSignUp" runat="server"></asp:ScriptManager>

            <div class="row vert-cent w-100 h-sm-100vh m-0">
                <div class="col-lg-6 col-xl-6 col-md-6 col-12 samanta-stand-image h-lg-100vh d-none d-md-block">
                    <img src="../assets/login-samanta-w-bg.png" alt="" style="width: 100%; height: 80vh; object-fit: contain" />
                </div>

                <div class="col-lg-6 col-xl-6 col-md-6 col-12 px-5 d-flex justify-content-center align-items-center vh-lg-100"
                    style="background-image: url('<%= ResolveUrl("~/Reception Page/002B.png") %>'); background-repeat: no-repeat; background-size: cover;">
                    <div>
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <%-- below line added for google translator --%>
                            <div id="google_element"></div>

                            <h1 class="color-white">Sign Up</h1>
                        </div>
                        <div class="row signin-form form-group has-search text-center ">
                            <div class="col-12 px-1 input-div">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                               <%-- <asp:TextBox ID="emailTextBox" CssClass="form-control my-2" TextMode="SingleLine" placeholder="Email Id / Contact No." runat="server"></asp:TextBox>--%>
                              
                                                                              <div style="position: relative;">  
    <div class="form-control" id="inputWrapper" 
        style="border-radius:20px; display:flex; padding:0; margin-top:7px; margin-bottom:7px; 
               width: 100%; height: 50px; align-items: center; overflow: hidden; border: 1px solid #ccc;">

        <!-- Dropdown for email or contact selection -->
        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select" onchange="updateDialingCode()" style="display: block;    left: 23px;    top: 1px;    border: none !important;    padding-left: 21px !important;    width: 137px  !important;    height: 49px !important;    margin-left: 9px;
    margin-right: -15px;">
           
        </asp:DropDownList>
         
        <asp:TextBox ID="emailTextBox" CssClass="w-95 login-input" required TextMode="SingleLine"
            placeholder="Email Id / Contact No." runat="server" 
            Style="border:none !important;padding-left: 43px !important; width: calc(100% - 15px); height: 48px; padding-right: 10px;padding-bottom: 4px;background-color:white !important">
        </asp:TextBox>
    </div>
</div>






                            </div>


                            <div class="col-12 px-1 password-div input-div">
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
                        </div>

                           <div class="text-center my-1" id="otpButtonDiv">
                            <div class="text-center resend-otp-div">
                            <input type="checkbox" /><span style="color: #fff"> I agree to <a target="_blank" style="color: #fdd001; font-weight: 700" href="Terms&Conditions.aspx">Terms and Conditions</a> </span>
                        </div>
                            <asp:Button ID="otpButton" OnClick="signup_Click" ValidationGroup="otp" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>

                        </div>

                        

                      <%--  <div class="text-center my-1" id="otpButtonDiv">

                            <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>

                        </div>--%>
                        <%--<div class="text-center my-1" id="otpButtonDiv">
                            <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>
                        </div>--%>


                    </div>
                </div>

            </div>

            <img class="plus-top-right" src="<%= ResolveUrl("~/assets/plus-1.png") %>" alt="" />
            <img class="plus-bottom-left" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="" />
            <a href="<%= ResolveUrl("~/login.aspx") %>">
                <img class="triangle-top-right-cancel" src="<%= ResolveUrl("~/assets/cancel-white.png") %>" alt="" /></a>
            <div class="row footer justify-content-around align-items-center m-0 mr-0">
                <div class="col-4 t-c d-xl-flex justify-content-center text-center">
                    <p class="m-0"><a href="TermsAndConditions.aspx">Terms & Conditions</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
                </div>

                <div class="col-4 copy-right text-center p-0 d-xl-flex text-center justify-content-center">
                    <p class="m-0"><a href="/FAQ.aspx" class="text-white">FAQ's</a></p>
                    <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
                    <p class="m-0"><a class="text-white">Copyright@2025</a></p>
                </div>
                <div class="col-4 p-p d-xl-flex text-center justify-content-center">
                    <p class="m-0"><a href="https://wa.me/919930372831"><i class="fa fa-brands fa-whatsapp"></i>&nbsp; 9978043453</a></p>
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
