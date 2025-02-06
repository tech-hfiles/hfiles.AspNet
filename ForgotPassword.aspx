<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="hfiles.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        .inner-main{
            height:100vh;
        }
        .container {
            max-width: 100%;
            overflow-x: hidden;
        }

        .form-container {
            max-width: 400px;
            margin: 0 auto;
            text-align: center;
        }

            .form-container .login-input, .form-container .btn {
                width: 100%;
                border-radius: 30px;
                margin: 10px 0;
            }

        .thm-button {
            padding: 10px 40px;
            background: #fdd001;
            border-radius: 20px;
            color: #08138f;
            font-weight: 700;
        }

        .inner-body .login-input, .divOtp .login-input {
            border: none;
            background: white;
            border-bottom: 1px solid #ffffff3d;
            padding: 10px 20px;
            color: #08138f;
            outline: 0;
        }

        .footer {
            background: #0331b5;
            color: #ffffff;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px;
        }

        .password-div {
            position: relative;
            border-radius: 30px;
        }

            .password-div .hide-password-toggal {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 20px;
            }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    
    <style>
        #toast-container > .toast-success {
            background-color: #fdd001;
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
    <div class="container">
        <form class="row h-100 align-center h-sm-100vh" runat="server">
            <asp:HiddenField runat="server" ID="hfId" />
            <div class="col-sm-12 col-lg-6 h-100 h-70 d-none d-lg-flex align-items-center" style="text-align: center;">
                <img src="../assets/features-hero-6.png" alt="" style="width: 100%; height: 90vh; object-fit: contain" />
            </div>
            <div class="col-sm-12 col-lg-6 inner-main p-5">
                <div class="d-flex align-items-center justify-content-center h-100 inner-body">
                    <div class="form-container">
                        <div class="signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <h1 class="color-white">Forgot Password</h1>
                        </div>

                        <div>
                            <asp:TextBox ID="emailTextBox" CssClass="login-input" TextMode="SingleLine" placeholder="Email ID" runat="server" required></asp:TextBox>
                        </div>

                        <div runat="server" id="divOtp">
                            <input runat="server" required id="otpTextBox" autocomplete="off" class="login-input" type="Text" placeholder="Enter OTP" />
                            <div class="text-end">
                                <asp:Label Text="" ID="errorLabel" runat="server" Style="color: #fff" />
                                <span id="timer" style="color: #fff"></span>
                                <span class="mx-2">
                                    <asp:LinkButton ID="resendLinkButton" OnClick="resendLinkButton_Click" runat="server">Resend OTP</asp:LinkButton></span>
                            </div>

                            <div class="password-div">
                                <i id="passwordView1" class="fa fa-solid fa-eye-slash hide-password-toggal color-theme-yellow"></i>
                                <asp:TextBox runat="server" ID="txtPassword" class="login-input" type="password" placeholder="Password" />
                            </div>

                            <div class="password-div">
                                <i id="passwordView2" class="fa fa-solid fa-eye-slash hide-password-toggal color-theme-yellow"></i>
                                <asp:TextBox runat="server" ID="cpwdTextBox" class="login-input" type="password" placeholder="Password" />

                            </div>
                            <asp:RequiredFieldValidator ControlToValidate="cpwdTextBox" Display="Dynamic" ErrorMessage="Please enter Password" ForeColor="White" runat="server"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ControlToValidate="cpwdTextBox" Display="Dynamic" ControlToCompare="txtPassword" ErrorMessage="Both Password should be same" runat="server" ForeColor="White"></asp:CompareValidator>
                        </div>

                        <div>
                            <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="Get OTP" class="btn thm-button"></asp:Button>
                        </div>

                        <div>
                            <asp:LinkButton class="btn thm-button" Text="Login" ValidationGroup="login" OnClick="btnSubmit_Click" ID="btnSubmit" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="row footer justify-content-around align-items-center m-0">
    <div class="col-4 t-c d-xl-flex justify-content-center text-center">
        <p class="m-0"><a href="Terms&Conditions.aspx">Terms & Conditions</a></p>
        <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
        <p class="m-0"><a href="privacypolicy.aspx">Privacy & Policy</a></p>
    </div>
    <div class="col-4 copy-right text-center p-0 d-xl-flex text-center justify-content-center">
        <p class="m-0"><a href="/FAQ.aspx" class="text-white">FAQ's</a></p>
        <div class="d-none d-xl-block" style="border-left: 2px solid #fff; height: 20px; margin: 0 10px;"></div>
        <p class="m-0"><a class="text-white" href="copyright.aspx">Copyright@2025</a></p>
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

    <script language="JavaScript">
        $('.password-div .hide-password-toggal').click(function () {
            var passwordTextBox = $(this).siblings('.login-input');
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

        $('#btnSubmit').hide();
        document.getElementById('changeLoginMode').value = 'Login with Password';

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
                return;
            }

            $('#timer').hide();
            $('#resendLinkButton').show();
        }
        timer(60);
        $('#resendLinkButton').click(function () {
            $('#resendLinkButton').hide();
            $('#timer').show();
            timer(60);
        });
    </script>
</body>
</html>
