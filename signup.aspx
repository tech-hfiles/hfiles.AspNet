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
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
    <title>Sign IN</title>
    <style>
        @media (min-width: 992px) {
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="signin-main">
        <form class="w-100 h-100" runat="server">
            <div class="row vert-cent w-100 ">
                <div class="col-lg-6 col-xl-6 col-md-6 col-sm-12 samanta-stand-image h-lg-100vh ">
                    <img src="<%= ResolveUrl("~/Reception Page/002A.jpg") %>" alt="" width="100%" height="100%" />
                </div>
                <div class="col-lg-6 col-xl-6 col-md-5 col-sm-12 px-5 d-flex justify-content-center align-items-center vh-lg
                
                
                
                -100"
                    style="background-image: url('<%= ResolveUrl("~/Reception Page/002B.png") %>')">
                    <div>
                        <div class="text-center signin-heading">
                            <img src="<%= ResolveUrl("~/Sign Up Page/Hfiles Logo.png") %>" alt="" width="120px" />
                            <br />
                            <h3 class="color-white">SIGN UP</h3>
                        </div>
                        <div class="row signin-form form-group has-search text-center justify-content-center">
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <!-- <span class="fa fa-user form-control-feedback"></span> -->
                                <input id="firstnameTextBox" runat="server" required type="text" class="form-control my-2" placeholder="Name" />
                            </div>
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5">
                                <i class="fa-solid fa-user form-control-feedback"></i>
                                <input id="lastnameTextBox" runat="server" required type="text" class="form-control my-2" placeholder="Last Name" />
                            </div>
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5">
                                <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                <input type="number" id="phoneTextBox" required runat="server" class="form-control my-2" placeholder="Phone No" />
                            </div>
                            <div class="col-sm-12 col-lg-7 col-xl-7 px-5">
                                <i class="fa-regular fa-envelope form-control-feedback"></i>
                                <input id="emailTextBox" runat="server" required type="text" class="form-control my-2" placeholder="Email ID" />
                            </div>
                        </div>
                        <div class="text-center my-3" runat="server" id="divOtp">
                            <asp:Button ID="genOTPButton" runat="server" Text="Generate OTP" OnClick="signup_Click" OnClientClick="JSalert()" class="btn thm-button"></asp:Button>
                        </div>
                        <div runat="server" id="divSubmit">
                            <div class="signin-form d-flex justify-content-center mt-2">
                                <div class="text-end w-100 px-4">
                                    <input id="otpTextBox" runat="server" type="text" required class="form-control w-100 OTP-input" placeholder="Enter OTP" />
                                    <span style="color: #dcdcdc;"><a href="#" style="color: #dcdcdc;">Resend OTP</a></span>
                                </div>
                            </div>
                            <div class="text-center my-2">
                                <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" class="btn thm-blue-button"></asp:Button>
                                <asp:Label ID="errorLabel" Text="" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <img class="plus-top-right" src="<%= ResolveUrl("~/assets/plus-1.png") %>" alt="" />
            <img class="plus-bottom-left" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="" />
            <a href="<%= ResolveUrl("~/login.aspx") %>">
                <img class="triangle-top-right-cancel" src="<%= ResolveUrl("~/assets/cancel-icon.png") %>" alt="" /></a>
        </form>
    </div>

    <script type="text/javascript">
        function JSalert() {
            swal("An OTP is sent to your email, enter the OTP to proceed.");
        }
    </script>
</body>
</html>
