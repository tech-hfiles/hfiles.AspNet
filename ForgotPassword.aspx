<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="hfiles.ForgotPassword" %>

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
    <link rel="stylesheet" href="style.css" />

    <title>H Files | Sign In</title>
    <style>
        .footer {
            background: #0331b5;
            color: #ffffff;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 10px
        }
               .password-div {
    position:relative;
}
.password-div .hide-password-toggal {
    position:absolute;
       right: 10px;
    top: 22px;
    cursor:pointer;
    font-size:25px;
}
    </style>

</head>

<body style="overflow: hidden;">
    <form class="row h-100 align-ceter h-sm-100vh" runat="server">
        <div class="language">
            <details>
                <summary>language</summary>
                <ul id="language">
                    <li>English</li>
                </ul>
            </details>
        </div>
        <asp:HiddenField runat="server" ID="hfId" />
        <div class="col-sm-12 col-lg-6 h-100 h-70 d-none d-lg-flex align-items-center" style="text-align: center;">
            <img src="../assets/features-hero-6.png" alt="" style="width: 100%; height: 90vh; object-fit: contain">
        </div>
        <div class="col-sm-12 col-lg-6 inner-main p-0">
            <div class="d-flex align-items-center justify-content-center h-100 inner-body">
                <div class="text-center w-50">
                    <div class="text-center signin-heading">
                        <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                        <br />
                        <h1 class="color-white">Forgot Password</h1>
                    </div>

                    <div>
                        <asp:TextBox ID="emailTextBox" CssClass="w-100 login-input" TextMode="SingleLine" placeholder="Email ID" runat="server"></asp:TextBox>
                        <%-- <asp:TextBox runat="server"  id="emailTextBox" class="w-100 login-input" type="Text" placeholder="Username" />--%>
                    </div>

                    <div runat="server" id="divOtp">
                        <input runat="server" required id="otpTextBox" autocomplete="off" class="w-100 login-input" type="Text" placeholder="Enter OTP" />
                        <div class="text-end">
                            <asp:Label Text="" ID="errorLabel" runat="server" Style="color: #fff" />
                            <span id="timer" style="color: #fff"></span>
                            <span class="mx-2">
                                <asp:LinkButton ID="resendLinkButton" OnClick="resendLinkButton_Click" runat="server">Resend OTP</asp:LinkButton></span>
                        </div>



                        <div class="password-div">
                             <i id="passwordView1" class="fa fa-solid fa-eye-slash hide-password-toggal color-theme-yellow"></i>
                            <asp:TextBox runat="server" ID="txtPassword" class="w-100 login-input" type="password" placeholder="Password" />
                        </div>
                        <div class="password-div">
                             <i id="passwordView2" class="fa fa-solid fa-eye-slash hide-password-toggal color-theme-yellow"></i>
                            <asp:TextBox ID="cpwdTextBox" runat="server" type="password" class="w-100 login-input" placeholder="Confirm Password" required />
                            <asp:RequiredFieldValidator ControlToValidate="cpwdTextBox" ErrorMessage="Please Enter Confirm Password" runat="server"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ControlToValidate="cpwdTextBox" ControlToCompare="txtPassword" ErrorMessage="Password and Confirm Password should be same" runat="server" ForeColor="White"></asp:CompareValidator>
                        </div>

                    </div>

                    <div class="text-center my-1">
                        <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="Get OTP" class="btn thm-button my-2"></asp:Button>
                    </div>

                    <div class="text-center my-1">

                        <asp:LinkButton class="btn thm-button my-2" Text="Login" ValidationGroup="login" OnClick="btnSubmit_Click" ID="btnSubmit" runat="server" />
                    </div>

                    <%--<div class="text-center my-1">
                        <span style="color: #fff">Or</span>
                    </div>

                    <%--  <div class="text-center my-1">
                        <input type="button" id="changeLoginMode" value="Login with Password" class="btn thm-button my-2" onclick="handleLogin()" />
                    </div>--%>

                    <%-- <div class="text-center resend-otp-div">
                        <br />
                        <span style="color: #fff">New User? Click <a style="color: #fdd001; font-weight: 700" href="signup.aspx">here</a> to Signup</span>
                    </div>--%>
                </div>
            </div>



        </div>
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

    <script language="JavaScript">

        $('.password-div .hide-password-toggal').click(function () {
            console.log('password');
            // Find the associated password textbox
            var passwordTextBox = $(this).siblings('.login-input');

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
        //var changeloginmodebtn = document.getElementById('changeloginmode')
        var loginMode = 'password'

        // $('#txtPassword').hide()
        $('#btnSubmit').hide()
        document.getElementById('changeLoginMode').value = 'Login with Password'

        //function handleLogin() {
        //    console.log('logn mode')
        //    if (loginMode == 'password') {
        //        $('#divOtp').hide()
        //        $('#otpButton').hide()
        //        $('#txtPassword').show()
        //        $('#btnSubmit').show()
        //        $('#changeLoginMode').val('Login with OTP')
        //        //document.getElementById('changeLoginMode').value = 'Login with OTP'
        //        loginMode = 'OTP'
        //    } else if (loginMode == 'OTP') {
        //        $('#divOtp').show()
        //        $('#otpButton').show()
        //        $('#txtPassword').hide()
        //        $('#btnSubmit').hide()
        //        $('#changeLoginMode').val('Login with password')
        //        //document.getElementById('changeLoginMode').value = 'Login with password'
        //        loginMode = 'password'
        //    }

        //}

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
