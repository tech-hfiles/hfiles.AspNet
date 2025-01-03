<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="addmember.aspx.cs" Inherits="hfiles.addmember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet' />
    <link rel="stylesheet" href="./style3.css" />

    <title>Add Members</title>
    <style>
        .btn-div {
            padding: 0 20px 0 20px;
        }

        #back-btn {
            background-color: #FFD101 !important;
        }
        /* *{
        border:1px solid #000;
    }*/
        .body {
            margin: 0;
            height: auto;
            /*            overflow:hidden;
*/ /*max-width:100%;*/
        }

        .container-fluid {
            margin: 0;
            width: 100%;
            height: auto;
            /*            max-height:fit-content;
*/ margin-bottom: 0.5%;
            overflow:;
        }

        body {
            overflow-x: hidden
        }

        .member-type-tabs {
            padding: 10px 15px;
            background: #fff;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            border-radius: 50px;
            width: 100%;
        }

        .Dateinputfield input[type=date] {
            display: block;
        }


        .phoneTextBox-input {
            position: relative;
        }

            .phoneTextBox-input svg {
                position: absolute;
                top: 20px;
                right: 16px;
            }

        .avatar-group-img {
            object-fit: contain !important;
            object-position: center !important;
            width: 100%;
            height: 100%;
            margin: 0 0 0 0 !important;
        }

    @media (max-width: 1400px) {
      .member-type-tabs {
        font-size: smaller;
      }
    }
      @media (max-width: 780px) {
        .member-type-tabs{
            padding:5px 5px;
        }
      }
    @media (max-width: 480px) {

            .phoneTextBox-input svg {
                right: 5px;
            }
        }


        .tab-content {
            display: none;
        }


        .active-tab {
            display: block;
        }

        .member-type-tabs {
            cursor: pointer;
        }

        .active-tab-label {
            background: #0331b5 !important;
            color: #fff;
        }

        .request-btn {
            padding: 15px 50px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            background-image: linear-gradient(to right, #0512B9 0%, #081466 100%);
            color: #ffffff;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Red Hat Display', sans-serif !important;
            font-weight: 700;
        }


        /* @media (min-width: 1024px) {
            .inner-div {
                height: auto;
            }
        }*/

        /*@media (max-width: 816px) {
            .inner-div {
                height: 100vh !important;
                width: 65% !important;
            }
        }*/
        @media only screen and (min-device-width: 375px) and (max-device-width: 812px) and (-webkit-device-pixel-ratio: 3) {
            .container-fluid {
                margin-bottom: 5% !important; /* Adjust the margin value as needed */
            }

            #back-btn {
                background-color: #FFD101;
            }

            .add-member-battans {
                margin: 15px 7px !important;
            }
            /*.plus-top-left{
            visibility:hidden;
            display:none;
        }*/

        }


        @media (min-width: 768px) {
            /*.footer {
                position: relative !important;
            }*/

            .blue-t-bottom-right {
                position: relative !important;
            }
        }

        @media (max-width:768px) {
            .inner-div {
                height: auto !important;
            }

            .member-type-tabs strong {
                font-size: 12px;
            }
        }

        /*@media (min-width: 300px) and (max-width: 375px) {
            .footer {
                position: relative !important;
                bottom: 0px !important;
            }
        }*/

        /* @media (min-width: 1022px) and (max-width: 1024px) {
            .footer {
                position: absolute !important;
                bottom: 0px;
            }
        }

        @media (min-width: 900px) and (max-width: 912px) {
            .add-member .inner-div {
                min-height: 90vh;
            }

            .footer {
                position: absolute;
                bottom: 0px;
            }
        }*/

        /* @media (max-width: 480px) {
            .footer {
                position: absolute;
                bottom: 0px;
            }
        }*/



        @media (min-width: 1800px) {


            .blue-t-bottom-right {
                position: absolute !important;
            }
        }

        @media (max-width:540px) {
            .footer {
                position: relative !important;
            }
        }

        @media (max-width:850px) {
            .footer {
                position: relative !important;
            }
        }

        #back_btn_add_member {
            font-weight: 700;
            font-size: 18px;
            background-color: #fdd001;
            padding: 3px 8px;
            border: 1px solid transparent;
            border-radius: 50px;
        }

        ::-webkit-input-placeholder, selected { /* Chrome/Opera/Safari */
            color: black !important; /* Change the color */
            text-align: center !important;
        }

        ::-webkit-keygen-select .form-select {
            text-align: center !important;
            justify-content: center !important;
        }
        /*keygen::-webkit-keygen-select{*/
        /* Your styles here }*/
        .input-group .btn {
            margin-bottom: 50px;
            z-index: 0;
        }

        @media (max-width: 780px) {
            .member-type-tabs {
                padding: 5px 5px;
            }
        }



        .form-select::placeholder,
        .form-select option:checked,
        .form-select {
            color: black !important;
            text-align: center !important;
        }

        /* Centering text in the select element */
        .form-select {
            text-align-last: center !important;
            -moz-text-align-last: center !important;
        }

        /* Webkit-specific styles */
        @media screen and (-webkit-min-device-pixel-ratio:0) {
            .form-select {
                text-align: center !important;
            }
        }

        /* Firefox-specific styles */
        @-moz-document url-prefix() {
            .form-select {
                text-align: center !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="container-fluid h-100" style="overflow:auto;max-height:90vh">
                <div class="add-member">
                    <%--<img class="blue-t-top-left" src="../Avatar/blue-trangle-1.png" alt="">--%>
                    <img class="blue-t-top-right" src="../Avatar/blue-trangle-2.png" alt="">
                    <img class="blue-t-right" src="../Add Members/blue-trangle-3.png" alt="">
                    <a href="#">
                    <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
                   <a class="back-arrow-btn-2" href="avatar2.aspx">Back
                    </a>
                     </div>
                        <%--<img class="home-icon-top-right" src="../Add Members/home-icon.png" alt="">--%></a>
                    <img class="plus-top-left" src="../assets/plus-icon-3.png" alt="">
                    <div class="main-div">

                        <!--<a class="back-arrow-btn" href="javascript: history.go(-1)" id="back_btn_add_member">
                        &nbsp Back&nbsp</a>-->
                        <div class="container-fluid d-flex justify-content-center p-0">
                            <div class="inner-div pt-5">
                                <div class="row">
                                    <div class="col-12 text-blue">
                                        <h2 class="font-weight-bold">Add Members</h2>
                                    </div>
                                </div>
                                <div class="row input-group">
                                    <div class="col-12 col-md-12 col-lg-5 col-xl-6 col-xxl-6 d-none d-md-block mb-md-5 text-center justify-content-center">
                                        <img class="avatar-group-img" src="../Add Members/addmember-avatar.png" />
                                    </div>
                                    <div class="col-12 col-md-12 col-lg-7 col-xl-6 col-xxl-6 d-flex justify-content-center">
                                        <div class="w-100">
                                            <div class="row mb-2 justify-item-center">
                                                <div class="col-6">
                                                    <label id="addNewMemberTab" class="member-type-tabs active-tab-label" onclick="showTab('abc', 'addNewMemberTab'), updateFooterPosition()"><strong>Add New Member</strong></label>
                                                </div>
                                                <div class="col-6">
                                                    <label id="addExisitingMemberTab" class="member-type-tabs" onclick="showTab('xyz', 'addExisitingMemberTab'), updateFooterPosition()"><strong>Add Existing Member</strong></label>
                                                </div>
                                            </div>
                                            <div id="abc" class="tab-content active-tab">
                                                <div class="mt-2">
                                                    <input type="text" id="firstnameTextBox" minlength="3" runat="server" placeholder="First Name" />
                                                    <asp:RequiredFieldValidator ID="fname" ControlToValidate="firstnameTextBox" runat="server" Display="Dynamic" ValidationGroup="First" />
                                                </div>
                                                <div class="">
                                                    <input type="text" id="lastnameTextBox" runat="server" placeholder="Last Name" />
                                                    <asp:RequiredFieldValidator ID="lname" ControlToValidate="lastnameTextBox" runat="server" Display="Dynamic" ValidationGroup="First"></asp:RequiredFieldValidator>
                                                </div>
                                                <div id="relation-input" class="">
                                                    <asp:HiddenField runat="server" ID="hfMemberType" />
                                                    <div class="relation-div">
                                                        <%-- <span class="fa-solid fa-earth-americas form-control-feedback"></span>--%>
                                                        <asp:DropDownList ID="relation" runat="server" CssClass="form-select form-control mySelect">
                                                            <asp:ListItem Value="0" Text="Select Relation" />
                                                            <asp:ListItem Value="father" Text="Father" />
                                                            <asp:ListItem Value="mother" Text="Mother" />
                                                            <asp:ListItem Value="sister" Text="Sister" />
                                                            <asp:ListItem Value="brother" Text="Brother" />
                                                            <asp:ListItem Value="son" Text="Son" />
                                                            <asp:ListItem Value="daughter" Text="Daughter" />
                                                            <asp:ListItem Value="wife" Text="Wife" />
                                                            <asp:ListItem Value="husband" Text="Husband" />
                                                            <asp:ListItem Value="grandmother" Text="Grand Mother" />
                                                            <asp:ListItem Value="grandfather" Text="Grand Father" />
                                                            <asp:ListItem Value="uncle" Text="Uncle" />
                                                            <asp:ListItem Value="aunt" Text="Aunt" />
                                                            <asp:ListItem Value="staffmale" Text="Male Staff" />
                                                            <asp:ListItem Value="stafffemale" Text="Female Staff" />
                                                            <asp:ListItem Value="cat" Text="Cat" />
                                                            <asp:ListItem Value="dog" Text="Dog" />
                                                        </asp:DropDownList>
                                                        <%--<select id="relation" runat="server" class="relationdiv10 form-select form-control relation-select"
                              aria-label="Default select example">
                              onchange="handleRelation()"
                              <option selected style="color: black;">Relation</option>
                              <option value="father">Father</option>
                              <option value="mother">Mother</option>
                              <option value="sister">Sister</option>
                              <option value="brother">Brother</option>
                              <option value="son">Son</option>
                              <option value="daughter">Daughter</option>
                              <option value="wife">Wife</option>
                              <option value="husband">Husband</option>
                              <option value="grandMother">Grand Mother</option>
                              <option value="grandFather">Grand Father</option>
                              <option value="uncle">Uncle</option>
                              <option value="aunt">Aunt</option>
                              <option value="friend">Friend</option>
                              <option value="staffmale">Male Staff</option>
                              <option value="stafffemale">Female Staff</option>
                              <option value="pet">Pet</option>
                              <option value="cat">Cat</option>
                              <option value="dog">Dog</option>
                            </select>--%>
                                                        <asp:RequiredFieldValidator ID="relationvalidator" ControlToValidate="relation" runat="server" Display="Dynamic" InitialValue="0" ValidationGroup="First"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="Dateinputfield">
                                                    <asp:TextBox runat="server" onkeypress="return false" AutoComplete="Off" placeholder="yyyy-mm-dd" ID="txtDate" Style="padding-right: 10px !important;" class="form-control my-2" />
                                                    <ajaxToolkit:CalendarExtender ID="dateajax" runat="server" Format="yyyy-MM-dd" Enabled="true" TargetControlID="txtDate" />

                                                    <input class="date-input" type="date" id="dobTextBox1" runat="server" style="display: none; visibility: hidden; padding-right: 10px !important;" onchange="calculateAge()" /><%--onchange="calculateAge()"--%>
                                                    <asp:RequiredFieldValidator ID="dob" ControlToValidate="txtDate" runat="server" Display="Dynamic" ValidationGroup="First"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="">
                                                    <div class="phoneTextBox-input">

                                                        <input class="email-input" id="emailTextBox" runat="server" type="email" placeholder="Email ID" />
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512">
                                                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                            <path fill="#FFD43B" d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z" />
                                                        </svg>
                                                    </div>


                                                    <asp:RequiredFieldValidator ID="email" ControlToValidate="emailTextBox" runat="server" Display="Dynamic" ValidationGroup="First"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="">
                                                    <div class="phoneTextBox-input">
                                                        <input id="phoneTextBox" runat="server" type="number" placeholder="Phone No." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" />
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512">
                                                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                            <path fill="#FFD43B" d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z" />
                                                        </svg>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="phone" ControlToValidate="phoneTextBox" runat="server" Display="Dynamic" ValidationGroup="First"></asp:RequiredFieldValidator>
                                                </div>

                                                <%--  <div class="">
     <input class="number-input" id="default-number" type="number" placeholder="default number." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" />
</div>--%>
                                                <div class="btn-div">
                                                    <%--<asp:Button runat="server" Text="Submit" CssClass="btn submit-btn" ID="btnSubmit"></asp:Button>--%>
                                                    <%--<a class="" href="javascript: history.go(-1)" id="back_btn_add_member"float="left">&nbsp Back&nbsp</a>--%>
                                                    <asp:Button runat="server" ID="btn_Submit" Text="Submit" OnClick="btn_Submit_ServerClick" CssClass="btn add-mem"></asp:Button>
                                                    <%--<asp:Button ID="btnAddNewMember"  ValidationGroup="First" Text="Submit" OnClick="btnAddNewMember_Click" CssClass="add-member-battans" runat="server" />--%>
                                                </div>
                                            </div>

                                            <div id="xyz" class="tab-content">
                                                <div class="mt-5">
                                                    <asp:TextBox type="text" ID="hfnumber" runat="server" placeholder="Enter HFiles ID" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorExistingMember" ControlToValidate="hfnumber" runat="server" Display="Dynamic" ValidationGroup="Second"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="btn-div">
                                                     <%--<asp:Button runat="server" ID="btnSendRequst" Text="Send Request" OnClick="request_Click" ValidationGroup="Second" CssClass="btn submit-btn"></asp:Button>--%>
                                                    <button runat="server" id="request" onserverclick="request_Click" type="submit" class="btn submit-btn" validationgroup="Second">Send Request</button><%--btn submit-btn request-btn--%>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <%-- <div class="row my-xl-5 my-lg-3">
                   s <div class="col-lg-5 col-md-5 col-sm-4 pl-lg-5 pr-0 d-xl-flex justify-content-end">
                        <div id="family" class="tab" style="color: #0116b8;" onclick="handleTabs('family')">
                            Family
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 or p-0" style="color: #bababa; font-size: 28px;">OR </div>
                    <div class="col-lg-5 col-md-5 col-sm-4 pr-lg-5 pl-0">
                        <div id="friends" class="tab" style="color: #bababa;" onclick="handleTabs('friend')">
                            Friends
                        </div>
                    </div>
                   
                </div>--%>
                            </div>
                        </div>
                    </div>
                    <img class="plus-bottom-right" src="../Add Members/plus-2.png" alt="" />
                    <img class="blue-t-bottom-left" src="../Add Members/blue-trangle-4.png" alt="" />
                    <%--<img class="blue-t-bottom-right" src="../Add Members/blue-trangle-5.png" alt="" />--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        function handleRelation() {
            var relationValue = document.getElementById(<%=relation.ClientID%>);
        var dobString = document.getElementById(<%=dobTextBox1.ClientID%>);
        var age = calculateAge(dobString);
        console.log("Age:", age);

        if ((relationValue === 'grandFather' || relationValue === 'grandMother' ||
            relationValue === 'cat' || relationValue === 'dog') && age >= 18 && age <= 75) {
            // Set email and contact number from session
            document.getElementById(<%=emailTextBox.ClientID%>).value = "<%= Session["Email"] %>";
            document.getElementById(<%=phoneTextBox.ClientID%>).value = "<%= Session["ContactNo"] %>";
        } else {
            // Clear email and contact number
            document.getElementById(<%=emailTextBox.ClientID%>).value = "test";
            document.getElementById(<%=phoneTextBox.ClientID%>).value = "test";
            }
        }

        function calculateAge() {
            var dobString = document.getElementById(<%=dobTextBox1.ClientID%>);
            var dob = new Date(dobString);
            var today = new Date();
            var age = today.getFullYear() - dob.getFullYear();
            var monthDiff = today.getMonth() - dob.getMonth();
            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                age--;
            }
            return age;
        }

        function showTab(tabId, tabLabelId) {
            //updateFooterPosition();
            // Hide all tabs and remove active-tab class from labels
            var tabs = document.getElementsByClassName('tab-content');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove('active-tab');
            }

            var labels = document.getElementsByClassName('member-type-tabs');
            for (var i = 0; i < labels.length; i++) {
                labels[i].classList.remove('active-tab-label');
            }

            // Show the selected tab and update label style
            document.getElementById(tabId).classList.add('active-tab');
            document.getElementById(tabLabelId).classList.add('active-tab-label');
        }
        // Function to check the class and change footer position
        function updateFooterPosition() {
            // Get the element with ID 'xyz'
            var label = document.getElementById('addExisitingMemberTab');

            // Check if the element has the class 'active-tab-label'
            if (label && label.classList.contains('active-tab-label')) {
                // Get all elements with the class 'footer'
                var footers = document.querySelectorAll('.footer');

                // Change the position to 'fixed' for each footer element
                footers.forEach(function (footer) {
                    footer.style.setProperty('position', 'fixed', 'important');
                });
            } else {
                var footers = document.querySelectorAll('.footer');
                footers.forEach(function (footer) {
                    footer.style.removeProperty('position', 'fixed', 'important');
                });
                // Change the position to 'fixed' for each footer element
                //footers.forEach(function (footer) {
                //  footer.style.setProperty('position', 'relative', 'important');
                //});
            }
        }

        // Run the function when the document is ready
        //document.addEventListener('DOMContentLoaded', updateFooterPosition);

        //let selected = true
        //var relation = ''

        //const family = document.getElementById('family');
        //const friends = document.getElementById('friends');
        //const relationInput = document.getElementById('relation-input');
        //const friendInput = document.getElementById('friend-input');
        //const defaultNumber = document.getElementById('default-number');

        //family.classList.add('active')
        //friends.classList.add('inactive')

        //defaultNumber.style.display = 'none'
        //friendInput.style.display = 'none'
        //notSelectMobile.style.display = 'none'
        //selectMobile.style.display = 'block'
        //relationInput.style.display = 'flex'


    </script>
</asp:Content>
