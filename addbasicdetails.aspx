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
    <link rel="stylesheet" href="./style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Signup - Basic Information</title>
    <style>
        .signin-form input::placeholder {
            color: #0512b9 !important;
        }

        .Addbasicbtnboth {
            display: flex;
            justify-content: space-around;
        }

            .Addbasicbtnboth button {
                padding: 10px 12px;
                border-radius: 50px;
                border: 0;
                outline: 0;
                background-image: linear-gradient(to right, #0512B9 0%, #081466 100%);
                color: #ffffff;
                cursor: pointer;
                margin-top: 20px;
                font-family: 'Red Hat Display', Sans-serif !important;
                font-weight: 700;
                font-size: 13px;
            }

        @media (max-width: 480px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 9px;
            }
        }

        @media (max-width: 540px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 9px;
            }

            .back-arrow-btn {
                top: 10% !important;
            }
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
                width: 100% !important;
            }

            .Addbasicbtnboth button {
                font-size: 10px;
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
                bottom: -20px;
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="user-info-main" runat="server">
                <a class="back-arrow-btn" href="javascript: history.go(-1)">
                    <img src="../assets/back-arrow.png" alt="">Back</a>
                <div class="container mt-768-80">
                    <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                    <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">
                    <img class="plus-top-left" src="../assets/plus-1.png" alt="">


                    <div class="row px-5">
                        <div class="col-md-4 col-sm-12 col-lg-4 col-xl-4 d-flex mt-sm-5 mt-lg-0 align-items-center justify-content-center">
                            <div class="text-center profile-img">
                                <img id="imagePreview" class="w-75" alt="" runat="server" />
                                <%-- <img id="imagePreview" runat="server" class="w-75" src="../My Data/default-user-profile.png" alt="" />--%>
                                <br />
                                <div class="Addbasicbtnboth">
                                    <button type="button">Change Profile Image</button>
                                    <button type="button">Remove Profile Image</button>
                                </div>
                                <br />

                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:FileUpload CssClass="form-control" runat="server" ID="Profileupload" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="submitButton" />

                                    </Triggers>
                                </asp:UpdatePanel>

                                <%-- <p style="color: #ffd101;"><i class="fa-regular fa-pen-to-square mx-2"></i>Edit</p>--%>
                            </div>

                        </div>

                        <div class="col-md-4 col-12 col-lg-4 col-xl-4 d-flex align-items-start mt-lg-5 justify-content-center">
                            <div class="row signin-form form-group has-search">
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-user form-control-feedback"></i>
                                    <input required id="firstNameTextBox" runat="server" type="text" class="form-control" placeholder="First Name">
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-user form-control-feedback"></i>
                                    <input required id="lastNameTextBox" runat="server" type="text" class="form-control" placeholder="Last Name">
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-venus-mars form-control-feedback"></i>
                                    <select runat="server" id="selectgender" class="form-select form-control mySelect" style="color: blue" aria-label="Default select example" required>
                                        <option selected>Gender</option>
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                        <option value="3">Others</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-cake-candles form-control-feedback"></i>
                                    <%--<asp:Calendar ID="calendar1" runat="server" DayStyle-BorderColor="#FFCC66"></asp:Calendar>--%>
                                    <input runat="server" id="dobTextBox1" type="date" class="form-control" placeholder="" style="padding-right: 10px !important;" required />
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-sharp fa-solid fa-droplet form-control-feedback"></i>
                                    <select id="bloodgroup" runat="server" class="form-select form-control mySelect" aria-label="Default select example">
                                        <option selected>Blood Group</option>
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
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-earth-americas form-control-feedback"></i>
                                    <%--<input required id="countryTextBox" runat="server" type="text" class="form-control" placeholder="Enter Country">--%>
                                    <asp:DropDownList ID="ddlCountry" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="0" runat="server" ControlToValidate="ddlCountry" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Select Country" CssClass=""></asp:RequiredFieldValidator>


                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-map-pin form-control-feedback"></i>

                                    <asp:DropDownList ID="stateDropDownList" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="stateDropDownList" ValidationGroup="updateProfile" Display="Dynamic" ErrorMessage="Please Select State" CssClass=""></asp:RequiredFieldValidator>
                                    <input id="stateTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter State" />
                                </div>
                                <div class="col-12 mb-lg-5">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-sharp fa-solid fa-city form-control-feedback"></i>
                                    <asp:DropDownList ID="cityDropDownList" CssClass="form-select form-control mySelect" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="updateProfile" ControlToValidate="cityDropDownList" ErrorMessage="Please Select City" CssClass=""></asp:RequiredFieldValidator>
                                    <input id="cityTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter City" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4 col-12 col-lg-4 col-xl-4 d-flex align-items-start mt-lg-5 justify-content-center mt-lg-5 mt-sm-0">
                            <div class="row signin-form form-group has-search">
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <span class="form-control-feedback">
                                        <asp:Label ID="dialcode" Style="color: #fdd001; font-weight: 600" Text="" runat="server"></asp:Label></span>
                                    <input class="form-control" required id="contactTextBox" name="phone" readonly="true" runat="server" type="tel" placeholder="Contact Number" style="padding-left: 45px !important;" />

                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-regular fa-envelope form-control-feedback"></i>
                                    <input id="emailTextBox" readonly="true" runat="server" type="email" class="form-control" placeholder="Email ID" required />
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">&nbsp;</span>
                                    <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                    <input id="icecontactTextBox" runat="server" type="tel" class="form-control" placeholder="Emergency Contact No. (Optional)" />
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">&nbsp;</span>
                                    <i class="fa-solid fa-phone-volume form-control-feedback"></i>
                                    <input id="relativecontactTextBox" runat="server" type="tel" class="form-control" placeholder="Relative To Emergency Contact No" />
                                </div>

                                <div class="col-12">
                                    <span for="" class="imp-star">&nbsp;</span>
                                    <i class="fa-solid fa-user-doctor form-control-feedback"></i>
                                    <input id="famdocTextBox" runat="server" type="text" class="form-control" placeholder="Family Doctor Name" />
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" ValidationGroup="updateProfile" Text="Update" class="btn thm-button mb-2 mt-4"></asp:Button>
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
        console.log("aaaaaaaaaaaaaaaaaaaaaaaaaa")

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
        });


    </script>

</asp:Content>

