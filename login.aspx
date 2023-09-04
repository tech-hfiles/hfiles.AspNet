<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hfiles.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css" />
    <title>H Files | Sign In</title>
</head>

<body style="overflow: hidden;">
    <div class="language">
        <details>
            <summary>language</summary>
            <ul id="language">
                <li>English</li>
            </ul>
        </details>
    </div>
    <form class="row h-100 align-ceter h-70" runat="server">
        <asp:HiddenField runat="server" ID="hfId" />
        <div class="col-sm-12 col-lg-6 h-100 h-70" style="text-align: center;">

            <img src="../assets/features-hero-6.png" alt="" style="width: 80%; margin: 145px 0 0 0;">
        </div>
        <div class="col-sm-12 col-lg-6 inner-main">
            <div class="d-flex align-items-center justify-content-center h-100 inner-body">
                <div class="text-center">
                    <h1>Welcome Back!</h1>
                    <div>
                        <input runat="server" required id="emailTextBox" class="w-100 login-input" type="Text" placeholder="Phone No / Email" />
                    </div>
                    <div runat="server" id="divOtp">
                        <input runat="server" required id="otpTextBox" autocomplete="off" class="w-100 login-input" type="Text" placeholder="Enter OTP" />
                    </div>
                    <div class="text-center my-1">
                        <asp:Button ID="otpButton" OnClick="signup_Click" runat="server" Text="GET OTP" class="btn thm-button my-2"></asp:Button>
                        <asp:Label Text="" ID="errorLabel" runat="server" />
                    </div>
                    <div class="text-center resend-otp-div">
                        <span class="mx-2">
                            <asp:LinkButton ID="resendLinkButton" runat="server">Resend OTP</asp:LinkButton></span>
                        <span>New User? Click <a href="signup.aspx">here</a> to Signup</span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
