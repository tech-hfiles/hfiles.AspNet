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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="user-info-main" runat="server">
                <a class="back-arrow-btn" href="javascript: history.go(-1)"><img src="../assets/back-arrow.png" alt="">Back</a>
                <div class="container mt-768-80">
                    <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                    <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">
                    <img class="plus-top-left" src="../assets/plus-1.png" alt="">


                    <div class="row p-5">
                        <div class="col-md-4 col-sm-12 col-lg-4 col-xl-4 d-flex mt-sm-5 mt-lg-0 align-items-center justify-content-center">
                            <div class="text-center profile-img">
                                <img id="imagePreview" runat="server" class="w-75" src="../My Data/default-user-profile.png" alt="" />
                                <br />
                                <br />
                                <asp:FileUpload ID="Profileupload" runat="server" class="form-control" onchange="uploadImage();" />

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
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Please Select Country" CssClass="imp-star"></asp:RequiredFieldValidator>

                                    <%--<select runat="server" id="countryTextBox" class="form-select form-control mySelect" aria-label="Default select example">
                            <option selected value="">Country</option>
                            <option value="1">India</option>
                            <option value="2">US</option>
                            <option value="3">UAE</option>
                        </select>--%>
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-solid fa-map-pin form-control-feedback"></i>

                                    <%--  <asp:DropDownList ID="ddlState" runat="server" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>

                                    <asp:DropDownList ID="stateDropDownList" CssClass="form-select form-control mySelect" OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="stateDropDownList" ErrorMessage="Please Select State" CssClass="imp-star"></asp:RequiredFieldValidator>
                                    <input id="stateTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter State" />
                                </div>
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <i class="fa-sharp fa-solid fa-city form-control-feedback"></i>
                                    <asp:DropDownList ID="cityDropDownList" CssClass="form-select form-control mySelect" runat="server"></asp:DropDownList>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="cityDropDownList" ErrorMessage="Please Select City" CssClass="imp-star"></asp:RequiredFieldValidator>
                                    <input id="cityTextBox" visible="false" runat="server" type="text" class="form-control" placeholder="Enter City">
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4 col-12 col-lg-4 col-xl-4 d-flex align-items-start mt-lg-5 justify-content-center mt-lg-5 mt-sm-0">
                            <div class="row signin-form form-group has-search">
                                <div class="col-12">
                                    <span for="" class="imp-star">*</span>
                                    <span class="form-control-feedback">
                                        <%-- <i class="fa-solid fa-phone-volume form-control-feedback"></i>--%>
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
                                    <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Update" class="btn thm-button mb-2 mt-4"></asp:Button>
                                </div>
                                <%-- <div class="text-center">
                            <asp:Button ID="nextButton" runat="server" PostBackUrl="~/additionalinformation.aspx" Text="Next" class="btn thm-blue-button mb-2 mt-4"></asp:Button>
                        </div>--%>
                            </div>
                        </div>

                    </div>
                    <img class="blue-trangle-bottom-left" src="../assets/blue-trangle.png" alt="">
                    <img class="blue-trangle-bottom-right" src="../assets/blue-trangle-bottom.png" alt="">
                    <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
                </div>
            </div>
            <div id="toast"><div id="img">Icon</div><div id="desc">A notification message..</div></div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function uploadImage() {
            var fileUpload = document.getElementById("Profileupload");
            var imagePreview = document.getElementById("imagePreview");

            if (fileUpload.files.length > 0) {
                var file = fileUpload.files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    var base64String = reader.result;
                    PageMethods.UploadImage(base64String, onSuccess, onError);
                };

                reader.readAsDataURL(file);
            }
        }

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

