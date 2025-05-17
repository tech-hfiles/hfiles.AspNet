<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addbasicdetails.aspx.cs" Inherits="hfiles.addbasicdetails" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="addbasicdetails.aspx.cs" Inherits="hfiles.addbasicdetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<meta charset="UTF-8">
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <%--<link rel="stylesheet" href="./style.css">--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Signup - Basic Information</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

        .body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .user-info-main {
            background: linear-gradient(180deg, #FFFFFF 20%, #CAE5FF 85%);
            z-index: -1;
        }

        .seleced-option-color {
            color: #0512b9 !important;
        }

        #contentPlaceHolder1_ddlCountry {
            color: #0512b9 !important;
        }

        input::placeholder, input::selection {
            color: #0512b9 !important;
        }

        .signin-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 0 20px;
        }

            .signin-form .form-select {
                border-radius: 30px;
            }


            .signin-form input,
            select {
                width: 100%;
                border: 1px solid black !important;
                border-radius: 19px;
                padding: 10px 40px 10px 50px !important;
                /* margin: 10px 0px !important; */
                outline: 0 !important;
                box-shadow: none !important;
                height: auto !important
            }

                .signin-form input[type="date"] {
                    text-align: left;
                    color: #0512b9 !important;
                }

            .signin-form input {
                font-family: 'Montserrat', sans-serif;
                color: #0331B5;
                font-size: 12px;
            }

            .signin-form select {
                font-family: 'Montserrat', sans-serif;
                color: #e6e6e6;
            }

            .signin-form input:focus {
                outline: 0;
                box-shadow: none;
            }

            .signin-form input::placeholder {
                color: #ccc;
                font-weight: 500;
            }

            .signin-form .form-select {
                color: #0331B5;
                font-size: 12px;
            }

            .signin-form .imp-star {
                position: relative;
                left: 100%;
                top: 15px;
                color: red;
            }

            .signin-form .form-select option {
                color: #a1a1a1;
            }


            .signin-form input::placeholder {
                color: #0512b9 !important;
            }

            .signin-form input, select {
                /*                padding: 16px 40px 16px 50px !important;*/
                border-radius: 30px;
            }

        .has-search .form-control-feedback {
            position: absolute;
            z-index: 2;
            display: block;
            width: 2.375rem;
            height: 2.375rem;
            line-height: 2.375rem;
            text-align: center;
            pointer-events: none;
            color: #fdd001;
            /*            margin-top: 5px;*/
            margin-left: 5px;
        }

        .has-search .form-control-feedback {
            /*            margin-top: 10px !important;*/
            margin-top: 2px !important;
        }

        .Addbasicbtnboth {
            /*display: flex;*/
            justify-content: space-around;
            gap: 10px;
        }

            .Addbasicbtnboth .button-change {
                padding: 12px;
                border-radius: 50px;
                border: 0;
                outline: 0;
                color: #000000;
                cursor: pointer;
                margin-top: 20px;
                font-family: 'Poppins', Sans-serif !important;
                /*                font-weight: 700;*/
                font-size: 13px;
                background-color: #F9E380;
                width: 200px; /* Set a fixed width for consistent size */
                box-shadow: 0px 5px 5px #00000045;
            }

        .back-arrow-btn-2 {
            position: absolute;
            display: flex;
            gap: 5px;
            align-items: center;
            /*    padding: 5px 20px;*/
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: #333333;
            cursor: pointer;
            margin-top: 3px !important;
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 600;
            font-size: 13px;
        }

        .change-password-link {
            display: block;
            color: blue;
            text-decoration: underline !important;
            text-align: center;
            font-size: 12px
        }

        .click-text {
            font-family: 'Montserrat', sans-serif;
            color: black;
            letter-spacing: 0.5px;
        }

        .password-text {
            font-family: 'Montserrat', sans-serif;
            color: blue;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        input.form-control {
            padding-right: 40px;
        }

        .country-flag {
            position: absolute;
            right: 15px;
            width: 25px;
            height: 18px;
        }


        .hidden {
            visibility: hidden;
        }

        .profile-img img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            object-position: center;
            border: 1px solid #FFD100;
        }

        .profile-details-1 {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .profile-details-2 {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

            .profile-details-2 p {
                margin: 10px 0 0 0;
                font-family: 'Montserrat';
                font-size: 12px;
            }

        .update-button {
            padding: 10px 12px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: #000000;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Poppins', Sans-serif !important;
            font-weight: 400;
            font-size: 15px;
            background-color: #F9E380;
            width: 200px;
            border: 1px solid #333333;
        }

        .profile_buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .profile-img {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .profile_heading {
            display: none;
        }

        .pincode-input-error {
            color: red;
            display: none;
            font-family: 'Montserrat', sans-serif;
            font-size: 12px;
            margin-top: 5px;
        }

        /*        Tablet Responsiveness */
        @media (min-width: 768px) {
            .signin-form {
                flex-direction: row;
                align-items: center;
                justify-content: center;
                gap: 50px;
            }

            .profile-details-2 p {
                display: none;
            }

            .signin-form input, select {
                border-radius: 15px;
                width: 275px;
            }

            .signin-form .form-select {
                border-radius: 15px;
                width: 275px;
            }

            .update-button {
                margin-top: 40px;
                border: none;
                box-shadow: 0px 5px 5px #00000045
            }

            .profile_buttons {
                gap: 15px;
            }

            .user-info-main .profile-img img {
                margin: 0;
            }

            .profile-img {
                margin-top: 50px;
            }

            .back-arrow-btn-2 {
                font-size: 14px;
            }

            .update-button {
                font-size: 14px;
                width: 210px
            }

            .Addbasicbtnboth .button-change {
                font-size: 14px;
                width: 210px
            }
        }

        /*Laptop Responsiveness*/
        @media (min-width: 1024px) {
            .profile-container {
                display: flex;
                margin-top: 25px;
                justify-content: space-around;
                align-items: center;
            }

            .profile_subcontainer {
                display: flex;
                flex-direction: column;
                gap: 15px
            }

            .profile-img img {
                width: 275px;
                height: 275px;
            }

            .profile_heading {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 5px
            }

                .profile_heading p {
                    margin: 0;
                    font-family: 'Poppins';
                    font-size: 22px;
                    font-weight: 600;
                    color: #0331B5;
                    text-align: center;
                }

                .profile_heading span {
                    font-family: 'Montserrat';
                    font-size: 16px;
                    letter-spacing: 1px;
                    text-align: center;
                }

            .profile_heading_divider {
                height: 1px;
                background-color: #000000;
                width: 80%;
                max-width: 125px;
                margin: 10px auto;
                font-weight: normal;
            }

            .update-button {
                margin-top: 20px;
            }

            .back-arrow-btn-2 {
                font-size: 15px;
            }

            .Addbasicbtnboth .button-change {
                font-size: 15px;
                width: 225px;
            }

            .update-button {
                font-size: 15px;
                width: 225px;
            }

            .signin-form input, select {
                font-size: 14px;
                font-weight: normal;
                padding-right: 20px !important;
            }

            .signin-form .form-select {
                font-size: 12.5px;
            }


            .has-search .form-control-feedback {
                margin-top: 2px;
            }

            .pincode-input-error {
                font-size: 14px;
            }
        }

        /*Desktop Responsiveness*/
        @media (min-width: 1200px) {

            .profile-container {
                margin-top: 25px;
                gap: 40px;
            }

            .profile_subcontainer {
                gap: 20px;
            }

            .profile-img img {
                width: 350px;
                height: 350px;
            }

            .profile_heading p {
                font-size: 24px;
            }

            .profile-span {
                font-size: 18px;
            }

            .signin-form {
                gap: 70px;
            }

                .signin-form input, select {
                    font-size: 15px;
                    font-weight: normal;
                    width: 300px;
                }

                .signin-form .form-select {
                    font-size: 15px;
                    width: 300px;
                }

            .has-search .form-control-feedback {
                margin-top: 3px;
            }

            .back-arrow-btn-2 {
                font-size: 16px;
            }

            .Addbasicbtnboth .button-change {
                padding: 14px;
                font-size: 16px;
                width: 250px;
            }

            .update-button {
                padding: 14px;
                font-size: 16px;
                width: 250px;
                margin-top: 10px;
            }

            .change-password-link {
                font-size: 14px;
            }

            .pincode-input-error {
                font-size: 15px;
            }
        }



        @media (max-width: 480px) {
            .Addbasicbtnboth button {
                padding: 8px 15px;
                font-size: 9px;
            }
        }

        @media (max-width: 540px) {
            .Addbasicbtnboth {
                flex-direction: column;
            }

                .Addbasicbtnboth button {
                    padding: 8px 10px;
                    font-size: 9px;
                }

            .profile-img img {
                width: 200px;
                height: 200px;
            }

            . /*back-arrow-btn {
                top: 10% !importank;
            }*/
        }

        @media (max-width: 280px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 9px;
            }
        }

        @media (min-width: 700px) and (max-width: 1022px) {
            .footer {
                position: absolute !important;
                width: 100%;
                bottom: 0;
            }

            .user-info-main .profile-img img {
                width: 200px;
                height: 200px;
            }

            .Addbasicbtnboth button {
                font-size: 10px;
            }

            .Addbasicbtnboth {
                flex-direction: column;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 10px
            }

            .back-arrow-btn {
                top: 10% !important;
            }
        }

        @media (min-width: 1022px) and (min-height: 1366px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0px !important;
            }
        }

        @media (min-width: 1024px) and (min-height: 600px) {
            .footer {
                /*position: relative;*/
            }

            .user-info-main {
                height: auto;
            }
        }

        @media (min-width: 1300px) {
            .footer {
                position: absolute !important;
                width: 100%;
                bottom: 0;
            }

            .user-info-main {
                height: auto !important;
            }

            .profile-img img {
                width: 400px;
                height: 400px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="user-info-main" style="padding-bottom: 20vh" runat="server">
                <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">

                    <a class="back-arrow-btn-2" href="Dashboard.aspx"><i class="fa-solid fa-chevron-left"></i>Back to Home
                    </a>
                </div>
                <div class="container">
                    <%--<img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                    <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">--%>
                    <img class="plus-top-left" src="../assets/plus-1.png" alt="">


                    <div class="profile-container">
                        <div class="text-center profile-img">
                            <img id="imagePreview" class="" alt="profile_image" runat="server" style="border: 1px solid #FFD100; border-radius: 50%;" />
                            <%-- <img id="imagePreview" runat="server" class="w-75" src="../My Data/default-user-profile.png" alt="" />--%>
                            <div class="Addbasicbtnboth">
                                <asp:Button ID="showInputButton" CssClass="button-change" runat="server" Text="Change Profile Image" OnClientClick="showFileUpload(); return false;" />
                                <%--  <li><a href="changepassword.aspx" class="color-thm-blue"><i class="fa fa-solid fa-circle-info"></i>Change Password</a></li>--%>
                                <%--<asp:Button ID="removeProfileButton" CssClass="button-change" runat="server" OnClick="removeProfileButton_Click" Text="Remove Profile Image"></asp:Button>
                                    <asp:Button ID="btnpasswdchange" CssClass="button-change" runat="server" Text="Change Password" OnClick="btnpasswdchange_Click" />--%>
                            </div>

                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:FileUpload CssClass="form-control hidden" runat="server" accept=".png,.jpg,.jpeg,.PNG,.JPG,.JPEG" ID="Profileupload" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="submitButton" />

                                </Triggers>
                            </asp:UpdatePanel>

                            <%-- <p style="color: #ffd101;"><i class="fa-regular fa-pen-to-square mx-2"></i>Edit</p>--%>
                        </div>

                        <%--<div class="col-md-4 col-12 col-lg-4 col-xl-4 d-flex align-items-start mt-lg-5 justify-content-center">--%>
                        <div class="profile_subcontainer">

                            <div class="profile_heading">
                                <p>Ready to manage your health? Let’s get you set up!</p>
                                <span>Fill in your details to kickstart your health journey</span>
                                <div class="profile_heading_divider"></div>
                            </div>
                            <div class="signin-form form-group has-search">
                                <div class="profile-details-1">
                                    <%--First Name--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-solid fa-circle-user form-control-feedback"></i>
                                        <input required id="firstNameTextBox" runat="server" type="text" class="form-control" placeholder="First Name">
                                    </div>

                                    <%--Last Name--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-solid fa-circle-user form-control-feedback"></i>
                                        <input required id="lastNameTextBox" runat="server" type="text" class="form-control" placeholder="Last Name">
                                    </div>

                                    <%--DOB--%>

                                    <div class="col-12">
                                        <i class="fa-solid fa-cake-candles form-control-feedback"></i>
                                        <asp:TextBox runat="server" placeholder="dd-mm-yyyy" ID="txtDate" required class="form-control" />
                                        <ajaxToolkit:CalendarExtender ID="dateajax" runat="server" Format="dd-mm-yyyy" Enabled="true" TargetControlID="txtDate" />

                                        <input runat="server" id="dobTextBox1" onclick="setMaxDate()" style="display: none; visibility: hidden; padding-right: 10px !important;" type="date" class="form-control" placeholder="" max="" />
                                    </div>

                                    <%--Phone--%>
                                    <div class="col-12 input-wrapper">
                                        <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                        <%--<span class="form-control-feedback">
                                            <asp:Label ID="dialcode" Style="color: #fdd001; font-weight: 600" Text="" runat="server"></asp:Label>
                                        </span>--%>

                                        <input class="form-control" required id="contactTextBox" name="phone" readonly="true"
                                            runat="server" type="tel" placeholder="Contact Number" />

                                        <img class="country-flag" id="flagImage" runat="server" src="" />
                                    </div>



                                    <%--Email--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-solid fa-envelope form-control-feedback"></i>
                                        <input id="emailTextBox" readonly="true" runat="server" type="email" class="form-control" placeholder="Email ID" required />
                                    </div>
                                </div>


                                <div class="profile-details-2">
                                    <%-- <p>Enter these details to get started</p>--%>
                                    <%--Gender--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-solid fa-venus-mars form-control-feedback"></i>
                                        <select runat="server" id="selectgender" class="form-select form-control mySelect" style="color: blue" aria-label="Default select example" required>
                                            <option value="" disabled selected>Select Gender</option>
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                            <option value="3">Others</option>
                                        </select>
                                    </div>

                                    <%--Blood Group--%>
                                    <div class="col-12">
                                        <span for="" class="imp-star"></span>
                                        <i class="fa-sharp fa-solid fa-droplet form-control-feedback"></i>
                                        <select id="bloodgroup" runat="server" class="form-select form-control mySelect" aria-label="Default select example">
                                            <option selected value="0">Blood Group</option>
                                            <option value="1">A+</option>
                                            <option value="2">A-</option>
                                            <option value="3">B+</option>
                                            <option value="4">B-</option>
                                            <option value="5">AB+</option>
                                            <option value="6">AB-</option>
                                            <option value="7">O+</option>
                                            <option value="8">O-</option>
                                        </select>
                                    </div>

                                    <%--Pincode (need to change input id of this update pincode) --%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">&nbsp;</span>--%>
                                        <i class="fa-solid fa-map-pin form-control-feedback"></i>
                                        <input id="txtpincode" runat="server" type="text" class="form-control pincode-input" placeholder="Pincode" />
                                        <span id="error-message" class="pincode-input-error">Invalid Pincode</span>
                                    </div>


                                    <%--Country--%>
                                    <%--<div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-earth-americas form-control-feedback"></i>--%>
                                    <%--<input required id="countryTextBox" runat="server" type="text" class="form-control" placeholder="Enter Country">--%>
                                    <%--<asp:DropDownList ID="ddlCountry" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="0" runat="server" ControlToValidate="ddlCountry" placeholder="Select Your Country" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Select Country" CssClass=""></asp:RequiredFieldValidator>
                                </div>--%>


                                    <%--State--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-solid fa-map-location-dot form-control-feedback"></i>

                                        <asp:DropDownList ID="stateDropDownList" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                        <input id="stateTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter State" />

                                        <asp:RequiredFieldValidator runat="server" ID="rfvstateDropDownList" ControlToValidate="stateDropDownList" InitialValue="0" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Select State" CssClass=""></asp:RequiredFieldValidator>

                                        <asp:RequiredFieldValidator runat="server" ID="rfvstateTextbox" ControlToValidate="stateTextBox" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Enter State" CssClass=""></asp:RequiredFieldValidator>
                                    </div>

                                    <%--City--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">*</span>--%>
                                        <i class="fa-sharp fa-solid fa-city form-control-feedback"></i>
                                        <asp:DropDownList ID="cityDropDownList" CssClass="form-select form-control mySelect" runat="server" AutoPostBack="true"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ID="rfvcitycityTextBox" Display="Dynamic" ValidationGroup="updateProfile" ControlToValidate="cityDropDownList" ErrorMessage="Please Select City" CssClass=""></asp:RequiredFieldValidator>
                                        <input id="cityTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter City" />

                                        <asp:RequiredFieldValidator runat="server" ID="rfvcityDropDownList" ControlToValidate="cityDropDownList" InitialValue="0" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Select City" CssClass=""></asp:RequiredFieldValidator>

                                        <asp:RequiredFieldValidator runat="server" ID="rfvcityTextBox" ControlToValidate="cityTextBox" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Enter City" CssClass=""></asp:RequiredFieldValidator>
                                    </div>

                                    <%--Emergency Contact--%>
                                    <div class="col-12">
                                        <%--<span for="" class="imp-star">&nbsp;</span>--%>
                                        <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                        <input id="icecontactTextBox" runat="server" type="tel" class="form-control" placeholder="Emergency Contact Number" />
                                    </div>
                                </div>

                            </div>




                            <%--<div class="col-md-4 col-12 col-lg-4 col-xl-4 d-flex align-items-start mt-lg-5 justify-content-center mt-lg-5 mt-sm-0">
                            <div class="row signin-form form-group has-search">--%>

                            <%--<div class="col-12">
                                    <span for="" class="imp-star">&nbsp;</span>
                                   
                                    <i class="fa-solid fa-user-group form-control-feedback"></i>
                                    <input id="relativecontactTextBox" runat="server" type="text" class="form-control" placeholder="Relation To Emergency Contact No" />
                                </div>--%>

                            <%--<div class="col-12">
                                    <span for="" class="imp-star">&nbsp;</span>
                                    <i class="fa-solid fa-user-doctor form-control-feedback"></i>
                                    <input id="famdocTextBox" runat="server" type="text" class="form-control" placeholder="Family Doctor Name" />
                                </div>--%>

                            <%-- </div>
                        </div>--%>


                            <div class="profile_buttons">
                                <div class="text-center">
                                    <asp:Button ID="submitButton" runat="server" CssClass="update-button" OnClick="submitButton_Click" ValidationGroup="updateProfile" Text="Update"></asp:Button>
                                </div>

                                <a href="ChangePassword.aspx" class="change-password-link">
                                    <span class="click-text">Click Here to </span>
                                    <span class="password-text">Change Password</span>
                                </a>
                            </div>
                        </div>
                    </div>



                </div>

            </div>
            </div>
            <div id="toast">
                <div id="img">Icon</div>
                <div id="desc">A notification message..</div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">




        //document.getElementById("change-profile-img").addEventListener("click", function () {
        //    var inputBox = document.getElementById("Profileupload");
        //    inputBox.classList.remove("hidden");
        //});
        function showFileUpload() {
            var fileUpload = document.getElementById('<%= Profileupload.ClientID %>');
            fileUpload.classList.remove("hidden");
        }
        function previewImage() {
            var fileInput = document.getElementById('Profileupload');
            var preview = document.getElementById('imagePreview');

            // Check if file input and preview elements exist
            if (!fileInput || !preview) {
                console.error("File input or preview element not found.");
                return;
            }

            var file = fileInput.files[0];

            // Check if a file is selected
            if (file) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    // Create an image element
                    var img = document.createElement('img');
                    img.src = e.target.result;

                    img.width = 100;
                    img.height = 100;

                    // Clear any previous preview
                    preview.innerHTML = '';

                    // Append the image to the preview div
                    preview.appendChild(img);
                };

                // Read the file as a data URL
                reader.readAsDataURL(file);
            } else {
                // Clear the preview if no file is selected
                preview.innerHTML = '';
            }
        }


        //function uploadImage() {
        //    var fileUpload = document.getElementById("Profileupload");
        //    var imagePreview = document.getElementById("imagePreview");

        //    if (fileUpload.files.length > 0) {
        //        var file = fileUpload.files[0];
        //        var reader = new FileReader();

        //        reader.onloadend = function () {
        //            var base64String = reader.result;
        //            PageMethods.UploadImage(base64String, onSuccess, onError);
        //        };

        //        reader.readAsDataURL(file);
        //    }
        //}

        function onSuccess(response) {
            // Update the image preview source
            document.getElementById("imagePreview").src = response;
        }

        function onError(error) {
            // Handle error (display error message, log, etc.)
            console.error(error);
        }
        function launch_toast() {
            var x = document.getElementById("toast")
            x.className = "show";
            setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
        }
        //launch_toast()

    </script>


    <script type="text/javascript">


        $(function () {
            console.log("fun 1")
            $('.form-select').change(function () {
                console.log("fun 1 inner")
                var val = $(this).val()
                var firstVal = $(this).find("option:first").val()
                console.log(val)
                console.log(firstVal)
                if (val == firstVal) {
                    console.log("fun 1 if")
                    $(this).removeClass('color-thm-blue');
                } else {
                    $(this).addClass('color-thm-blue');
                    console.log("fun 1 else")
                }

            })
            $(".form-select").each(function () {
                console.log("fun 1 each")
                var val = $(this).val()
                var firstVal = $(this).find("option:first").val()
                console.log(val)
                console.log(firstVal)
                if (val == '') {
                    $(this).removeClass('color-thm-blue');
                    console.log("fun 1 each if")
                } else {
                    $(this).addClass('color-thm-blue');

                }
            });
        })

        $(function () {
            $('#ContentPlaceHolder1_dobTextBox1').change(function () {
                $(this).css('color', '#0512b9');
            })
            $('#ContentPlaceHolder1_dobTextBox1').change(function () {
                var val = $(this).val()
                console.log(val)
                if (val == '') {
                    $(this).removeClass('color-thm-blue');
                } else {
                    $(this).addClass('color-thm-blue');

                }

            })
            $("#ContentPlaceHolder1_dobTextBox1").each(function () {
                var val = $(this).val()
                console.log(val)
                if (val == '') {
                    $(this).removeClass('color-thm-blue');
                } else {
                    $(this).addClass('color-thm-blue');

                }
            });
        })
        const phoneInputField = document.querySelector("#contactTextBox");
        const phoneInput = window.intlTelInput(phoneInputField, {
            utilsScript:
                "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
        }); fileName;

        //var today = new Date().toISOString().split('T')[0];
        //// Set the max attribute of the date input to today's date
        //console.log(today, "Today")
        //document.getElementById("dobTextBox1").setAttribute("max", today);
        console.log(today, "Today")
        //document.addEventListener("DOMContentLoaded", function () {
        //    // Get today's date in YYYY-MM-DD format
        //    var today = new Date().toISOString().split('T')[0];
        //    // Log today's date for debugging
        //    console.log(today, "Today");
        //    // Set the max attribute of the date input to today's date
        //    document.getElementById("dobTextBox1").setAttribute("max", today);
        //});

        function setMaxDate() {
            // Get today's date in YYYY-MM-DD format
            var today = new Date().toISOString().split('T')[0];
            // Log today's date for debugging
            console.log(today, "Today");
            // Set the max attribute of the date input to today's date
            var dobTextBox = document.getElementById("ContentPlaceHolder1_dobTextBox1");
            if (dobTextBox) {
                dobTextBox.setAttribute("max", today);
            } else {
                console.error("Element with ID 'dobTextBox1' not found");
            }
        }

    </script>
    <script> 
        document.addEventListener("DOMContentLoaded", function () {
            var pincodeInputs = document.querySelectorAll(".pincode-input"); // Select all elements with class
            var typingTimer;
            var doneTypingInterval = 1000; // 1 second delay after typing stops

            function validatePincode(input) {
                var errorMessage = input.nextElementSibling; // Find the nearest error message span
                var pincode = input.value.trim();
                var pincodePattern = /^[1-9][0-9]{5}$/; // 6-digit validation

                if (!pincodePattern.test(pincode)) {
                    errorMessage.style.display = "block"; // Show error
                } else {
                    errorMessage.style.display = "none"; // Hide error
                }
            }

            pincodeInputs.forEach(function (input) {
                input.addEventListener("input", function () {
                    clearTimeout(typingTimer);
                    typingTimer = setTimeout(() => validatePincode(input), doneTypingInterval);
                });

                input.addEventListener("blur", function () {
                    validatePincode(input);
                });
            });
        });


    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const txtDate = document.getElementById("<%= txtDate.ClientID %>");
       let prevValue = "";

       txtDate.addEventListener("input", function () {
           let value = txtDate.value.replace(/[^0-9]/g, '');
           let formatted = "";
           const isDeleting = txtDate.value.length < prevValue.length;

           if (value.length >= 1) {
               formatted += value.substring(0, 2);
               if (value.length >= 2) {
                   formatted += '-';
               }
           }
           if (value.length >= 3) {
               formatted += value.substring(2, 4);
               if (value.length >= 4) {
                   formatted += '-';
               }
           }
           if (value.length >= 5) {
               formatted += value.substring(4, 8);
           }

           if (isDeleting && prevValue.length === 6 && txtDate.value.length === 5) {
               formatted = formatted.slice(0, 5);
           } else if (isDeleting && prevValue.length === 3 && txtDate.value.length === 2) {
               formatted = formatted.slice(0, 2);
           }

           txtDate.value = formatted.slice(0, 10);
           prevValue = txtDate.value;
       });
   });

</script>
 

  <script type="text/javascript">
      window.onload = function () {
          const txtPincode = document.getElementById('<%= txtpincode.ClientID %>');

        if (!txtPincode) return;

        txtPincode.addEventListener('input', function () {
            const pincode = txtPincode.value.trim();

            if (pincode.length === 6 && /^\d{6}$/.test(pincode)) {
                PageMethods.GetCityStateByPincode(pincode, function (response) {
                    if (response) {
                        // Autofill State
                        var stateDDL = document.getElementById("<%= stateDropDownList.ClientID %>");
                        for (var i = 0; i < stateDDL.options.length; i++) {
                            if (stateDDL.options[i].text.trim().toLowerCase() === response.state.trim().toLowerCase()) {
                                stateDDL.selectedIndex = i;
                                break;
                            }
                        }

                        // Trigger postback to populate city dropdown
                        __doPostBack('<%= stateDropDownList.UniqueID %>', '');

                        // Autofill City (after postback if cities depend on state)
                        setTimeout(function () {
                            var cityDDL = document.getElementById("<%= cityDropDownList.ClientID %>");
                            for (var i = 0; i < cityDDL.options.length; i++) {
                                if (cityDDL.options[i].text.trim().toLowerCase() === response.city.trim().toLowerCase()) {
                                    cityDDL.selectedIndex = i;
                                    break;
                                }
                            }
                        }, 500);
                    } else {
                        alert("Pincode not found.");
                    }
                }, function (err) {
                    console.error("WebMethod Error:", err);
                });
            }
        });
      };
  </script>

</asp:Content>

