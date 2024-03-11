<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="addmember.aspx.cs" Inherits="hfiles.addmember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
    <link rel="stylesheet" href="./style3.css">

    <title>Add Members</title>
    <style>
        /* *{
        border:1px solid #000;
    }*/
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

        @media (max-width: 1400px) {
            .member-type-tabs {
                font-size: smaller;
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
            font-family: 'Red Hat Display' !important;
            font-weight: 700;
        }


        /* @media (min-width: 1024px) {
            .inner-div {
                height: auto;
            }
        }*/

        @media (max-width: 999px) {
            .inner-div {
                height: 90vh !important;
                width: 65% !important;
            }
        }

        @media (min-width: 768px) {
            .footer {
                position: relative !important;
            }

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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="add-member">
        <img class="blue-t-top-left" src="../Avatar/blue-trangle-1.png" alt="">
        <img class="blue-t-top-right" src="../Avatar/blue-trangle-2.png" alt="">
        <img class="blue-t-right" src="../Add Members/blue-trangle-3.png" alt="">
        <a href="#">
            <%--<img class="home-icon-top-right" src="../Add Members/home-icon.png" alt="">--%></a>
        <img class="plus-top-left" src="../assets/plus-icon-3.png" alt="">
        <div class="main-div">
            <a class="back-arrow-btn" href="javascript: history.go(-1)">
                <img src="../assets/back-arrow.png" alt="">Back</a>
            <div class="container-fluid d-flex justify-content-center p-0">
                <div class="inner-div pt-5">
                    <div class="row">
                        <div class="col-12 text-blue mt-2">
                            <h1>Add Members</h1>
                        </div>
                    </div>
                    <div class="row input-group">
                        <div class="col-12 col-md-12 col-lg-5 col-xl-6 col-xxl-6 d-none d-md-block mb-md-5">
                            <img class="avatar-group-img" src="../Add Members/addmember-avatar.png" width="100%" />
                        </div>
                        <div class="col-12 col-md-12 col-lg-7 col-xl-6 col-xxl-6 d-flex justify-content-center">
                            <div class="w-100">
                                <div class="row mb-2">
                                    <div class="col-6">
                                        <label id="addNewMemberTab" class="member-type-tabs active-tab-label" onclick="showTab('abc', 'addNewMemberTab')"><strong>Add New Member</strong></label>
                                    </div>
                                    <div class="col-6">
                                        <label id="addExisitingMemberTab" class="member-type-tabs" onclick="showTab('xyz', 'addExisitingMemberTab')"><strong>Add Existing Member</strong></label>
                                    </div>
                                </div>
                                <div id="abc" class="tab-content active-tab">
                                    <div class="mt-2">
                                        <input type="text" id="firstnameTextBox" runat="server" placeholder="First Name" />
                                        <asp:RequiredFieldValidator ID="fname" ControlToValidate="firstnameTextBox" runat="server" Display="Dynamic" />
                                    </div>
                                <div class="">
                                    <input type="text" id="lastnameTextBox" runat="server" placeholder="Last Name" />
                                    <asp:RequiredFieldValidator ID="lname" ControlToValidate="lastnameTextBox" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div id="relation-input" class="">
                                    <asp:HiddenField runat="server" ID="hfMemberType" />
                                    <div class="relation-div">
                                        <%-- <span class="fa-solid fa-earth-americas form-control-feedback"></span>--%>
                                        <select id="relation" runat="server" class="form-select form-control relation-select"
                                            aria-label="Default select example">
                                            <%--onchange="handleRelation()"--%>
                                            <option selected disabled>Relation</option>
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
                                            <option value="friend">Friend</option>
                                            <%--<option value="pet">Pet</option>--%>
                                            <option value="cat">Cat</option>
                                            <option value="dog">Dog</option>
                                        </select>
                                        <asp:RequiredFieldValidator ID="relationvalidator" ControlToValidate="relation" runat="server" Display="Dynamic" ></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="">
                                    <input class="date-input" type="date" id="dobTextBox1" runat="server" onchange="calculateAge()"/><%--onchange="calculateAge()"--%>
                                    <asp:RequiredFieldValidator ID="dob" ControlToValidate="dobTextBox1" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="">
                                    <input class="email-input" id="emailTextBox" runat="server" type="email" placeholder="Email ID" />
                                    <asp:RequiredFieldValidator ID="email" ControlToValidate="emailTextBox" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="">
                                    <input id="phoneTextBox" runat="server" type="number" placeholder="Phone No." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" />
                                    <asp:RequiredFieldValidator ID="phone" ControlToValidate="phoneTextBox" runat="server" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <%--  <div class="">
     <input class="number-input" id="default-number" type="number" placeholder="default number." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" />
</div>--%>
                                <div class="btn-div">
                                    <%--<asp:Button runat="server" Text="Submit" CssClass="btn submit-btn" ID="btnSubmit"></asp:Button>--%>
                                    <%-- <button id="back-btn"  class="btn thm-back-button mx-3">Back</button>--%>
                                    <button runat="server" id="btn_Submit" onserverclick="btn_Submit_ServerClick" class="btn submit-btn">Submit</button>
                                </div>
                            </div>

                            <div id="xyz" class="tab-content">
                                <div class="mt-5">
                                    <asp:TextBox type="text" ID="hfnumber" runat="server" placeholder="Enter HFiles ID" />
                                </div>
                                <div class="btn-div">
                                    <asp:Button runat="server" ID="request" Text="Send Request" OnClick="request_Click" class="btn submit-btn request-btn"></asp:Button>
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
    <img class="blue-t-bottom-right" src="../Add Members/blue-trangle-5.png" alt="" />
    </div>
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

        <%--function handleTabs(tab) {
            if (tab === 'family') {
                family.style.color = '#0512b9'
                friends.style.color = '#bababa'
                family.classList.remove('inactive')
                friends.classList.remove('active')
                family.classList.add('active')
                friends.classList.add('inactive')
                relationInput.style.display = 'flex'
                friendInput.style.display = 'none'
                if (relation === 'grandFather' || relation === 'grandMother') {
                    defaultNumber.style.display = 'block'
                } else {
                    defaultNumber.style.display = 'none'
                }
                document.getElementById("<%= hfMemberType.ClientID%>").value = "1";
                } else if (tab === 'friend') {
                    family.style.color = '#bababa'
                    friends.style.color = '#0512b9'
                    family.classList.remove('active')
                    friends.classList.remove('inactive')
                    family.classList.add('inactive')
                    friends.classList.add('active')
                    relationInput.style.display = 'none'
                    friendInput.style.display = 'block'
                    defaultNumber.style.display = 'none'
                    document.getElementById("<%= hfMemberType.ClientID%>").value = "2";
            }
        }--%>

    </script>

</asp:Content>
