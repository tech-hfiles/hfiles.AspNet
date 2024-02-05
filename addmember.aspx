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
        }

        .tab-content {
            display: none;
        }

        .active-tab {
            display: block;
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
                        <div class="col-12 text-blue">
                            <h1>Add Members</h1>
                        </div>
                    </div>
                    <div class="row input-group">
                        <div class="col-12 col-md-7 d-none d-md-block">
                            <img src="../Add Members/addmember-avatar.png" width="80%" />
                        </div>
                        <div class="col-12 col-md-5 d-flex justify-content-center">
                            <div class="w-75">
                                <div class="row mb-2">
                                    <div class="col-6">
                                        <label id="addNewMemberTab" class="member-type-tabs" onclick="showTab('abc')"><strong>Add New Member</strong></label>
                                    </div>
                                    <div class="col-6">
                                        <label id="addExisitingMemberTab" class="member-type-tabs" onclick="showTab('xyz')"><strong>Add Existing Member</strong></label>
                                    </div>
                                </div>
                                <div id="abc" class="tab-content active-tab">
                                    <!-- Content for addNewMemberTab -->
                                    <p>Add New Member Content Here</p>
                                </div>

                                <div id="xyz" class="tab-content">
                                    <!-- Content for addExisitingMemberTab -->
                                    <p>Add Existing Member Content Here</p>
                                </div>
                                <div class="">
                                    <input type="text" id="firstnameTextBox" runat="server" placeholder="First Name" />
                                </div>
                                <div class="">
                                    <input type="text" id="lastnameTextBox" runat="server" placeholder="Last Name" />
                                </div>
                                <div id="relation-input" class="">
                                    <asp:HiddenField runat="server" ID="hfMemberType" />
                                    <div class="relation-div">
                                        <%-- <span class="fa-solid fa-earth-americas form-control-feedback"></span>--%>
                                        <select id="relation" runat="server" class="form-select form-control relation-select"
                                            aria-label="Default select example" onchange="handleRelation()">
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
                                    </div>
                                </div>
                                <div class="">
                                    <input class="date-input" type="date" id="dobTextBox1" runat="server" />
                                </div>
                                <div class="">
                                    <input class="email-input" id="emailTextBox" runat="server" type="email" placeholder="Email ID" />
                                </div>
                                <div class="">
                                    <input id="phoneTextBox" runat="server" type="number" placeholder="Phone No." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" />
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

        function showTab(tabId) {
            // Hide all tabs
            var tabs = document.getElementsByClassName('tab-content');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove('active-tab');
            }

            // Show the selected tab
            document.getElementById(tabId).classList.add('active-tab');
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
        //function handleRelation() {
        //    var relationValue = $(".relation-select").find(":selected").val();
        //    relation = relationValue;
        //    console.log(relation)
        //    $('.email-input').attr('disabled', 'false');
        //    $('.number-input').attr('disabled', 'false');
        //    if (relation === 'grandFather' || relation === 'grandMother') {
        //        defaultNumber.style.display = 'block'
        //        $(".email-input").removeAttr('disabled');
        //        $(".number-input").removeAttr('disabled');
        //    } else if (relation === 'pet') {
        //        $('.email-input').attr('disabled', 'disabled');
        //        $('.number-input').attr('disabled', 'disabled');
        //        defaultNumber.style.display = 'block'
        //    } else {
        //        defaultNumber.style.display = 'none'
        //        $(".email-input").removeAttr('disabled');
        //        $(".number-input").removeAttr('disabled');
        //    }
        //    console.log("relation")
        //}
        //console.log("relation")
    </script>

</asp:Content>
