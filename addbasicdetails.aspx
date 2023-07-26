<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addbasicdetails.aspx.cs" Inherits="hfiles.addbasicdetails" %>

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
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <title>User Data</title>
</head>
<body class="user-info-main">

    <form class="h-100 container" runat="server">

        <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
        <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">
        <img class="plus-top-left" src="../assets/plus-1.png" alt="">
        <div class="row h-100">
            <div class="col-md-4 col-sm-12 col-lg-4 col-xl-4 d-flex mt-sm-5 mt-lg-0 align-items-center justify-content-center">
                <div class="text-center profile-img">
                    <img class="w-100" src="../My Data/default-user-profile.png" alt="">
                    <p style="color: #cac9c9;"><i class="fa-regular fa-pen-to-square mx-2"></i>Edit</p>
                </div>

            </div>
            <div class="col-md-4 col-sm-12 col-lg-4 col-xl-4 d-flex align-items-start mt-5 justify-content-center">
                <div class="row signin-form form-group has-search">
                    <div class="col-12">
                        <span class="fa fa-user form-control-feedback"></span>
                        <input id="firstNameTextBox" runat="server" type="text" class="form-control" placeholder="First Name">
                    </div>
                    <div class="col-12">
                        <span class="fa fa-user form-control-feedback"></span>
                        <input id="lastNameTextBox" runat="server" type="text" class="form-control" placeholder="Last Name">
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-venus-mars form-control-feedback"></span>
                        <select runat="server" id="selectgender" class="form-select form-control" aria-label="Default select example">
                            <option selected>Gender</option>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-cake-candles form-control-feedback"></span>
                        <input id="dobTextBox" runat="server" type="text" class="form-control" placeholder="Enter DOB">
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-droplet form-control-feedback"></span>
                        <select id="bloodgroup" runat="server" class="form-select form-control" aria-label="Default select example">
                            <option selected>Blood Group</option>
                            <option value="1">A+</option>
                            <option value="2">A-</option>
                            <option value="3">B+</option>
                            <option value="3">B-</option>
                            <option value="3">AB+</option>
                            <option value="3">AB-</option>
                            <option value="3">O+</option>
                            <option value="3">O-</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <span class="fa fa-user form-control-feedback"></span>
                        <input id="stateTextBox" runat="server" type="text" class="form-control" placeholder="Enter State">
                        <%--<span class="fa-solid fa-map-pin form-control-feedback"></span>
                        <select class="form-select form-control" aria-label="Default select example">
                            <option selected>State</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>--%>
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-map-pin form-control-feedback"></span>
                        <input id="cityTextBox" runat="server" type="text" class="form-control" placeholder="Enter City">
                        <%--<select class="form-select form-control" aria-label="Default select example">
                            <option selected>State</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>--%>
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-city form-control-feedback"></span>
                        <input id="countryTextBox" runat="server" type="text" class="form-control" placeholder="Enter Country">
                        <%-- <select class="form-select form-control" aria-label="Default select example">
                            <option selected>City</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>--%>
                    </div>
                </div>
            </div>
            <div
                class="col-md-4 col-sm-12 col-lg-4 col-xl-4 d-flex align-items-start justify-content-center mt-lg-5 mt-sm-0">
                <div class="row signin-form form-group has-search mt-1">
                    <div class="col-12 my-2">
                        <input id="contactTextBox" readonly="true" runat="server" type="tel" placeholder="Contact Number" />
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-phone-volume form-control-feedback"></span>
                        <input id="icecontactTextBox" runat="server" type="text" class="form-control" placeholder="Emergency Contact No. (Optional)">
                    </div>
                    <div class="col-12">
                        <span class="fa-solid fa-phone-volume form-control-feedback"></span>
                        <input id="relativecontactTextBox" runat="server" type="text" class="form-control" placeholder="Relative To Emergency Contact No">
                    </div>
                    <div class="col-12">
                        <span class="fa-regular fa-envelope form-control-feedback"></span>
                        <input id="emailTextBox" readonly="true" runat="server" type="text" class="form-control" placeholder="Email ID">
                    </div>
                    <div class="col-12">
                        <span class="fa-sharp fa-solid fa-user-doctor form-control-feedback"></span>
                        <input id="famdocTextBox" runat="server" type="text" class="form-control" placeholder="Family Doctor NAme">
                    </div>
                    <div class="text-center">
                        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="SUBMIT" class="btn thm-button mb-2"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
        <img class="blue-trangle-bottom-left" src="../assets/blue-trangle.png" alt="">
        <img class="blue-trangle-bottom-right" src="../assets/blue-trangle-bottom.png" alt="">
        <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
    </form>
</body>
<script>
    const phoneInputField = document.querySelector("#phone");
    const phoneInput = window.intlTelInput(phoneInputField, {
        utilsScript:
            "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
    });
</script>

</html>
