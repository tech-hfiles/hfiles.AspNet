<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="avatar2.aspx.cs" Inherits="hfiles.avatar2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style_avatar.css" />
    <%--<link rel="stylesheet" href="style3.css" />--%>
    <style>
        #selected-member-name {
            margin-top: 5px;
            font-family: 'Red Hat Display', sans-serif;
            color: #0331b5;
            font-size: 18px;
            font-weight: 800;
        }

        .avatar {
            background-image: url(../Avatar/avatar-background.png);
            background-size: 50%;
            background-repeat: no-repeat;
            /* background-position: center; */
            background-position-x: 40%;
            background-position-y: 50%;
        }

            .avatar .row {
                width: 100%;
                margin: 0;
            }

        @media only screen and (max-width: 414px) {
            .avatar {
                background-position-x: 75%;
                background-position-y: 25%;
                background-size: 100%;
            }
        }

        .main-div {
            background-image: url('../Avatar/lamp-light.png');
            background-repeat: no-repeat;
            background-position-x: 44%;
        }
    </style>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #f4f4f4;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 20px;
            width: 35%;
            /*height: 48%;*/
            height: auto;
            position: fixed;
            z-index: 100001;
            left: 20%;
            /*top: 20%;*/
            top: 10%;
            user-select: auto;
            border-radius: 10px;
        }

        .select-report-dropdown, .filename-txtbox {
            width: 100%;
            border-radius: 30px;
            border: none;
            padding: 15px;
            outline: 0;
            box-shadow: none;
        }

        .modalPopup .lbl {
            text-align: left !important;
        }

        /* .filename-txtbox {
            width: 100%;
            padding: 5px;
            border-radius: 10px;
            border: 1px solid #0512B9;
        }
*/
        .submit-btn {
            padding: 15px 20px;
            background: linear-gradient(to right, #0512B9 0%, #081466 100%);
            color: #fff;
            border: none;
            font-weight: 700;
            font-size: 16px;
            border-radius: 10px;
            font-size: 14px;
            width: 100px;
            cursor: pointer;
        }

        .close-btn {
            width: 100px;
            margin-left: 5px !important;
            padding: 15px 20px;
            border-radius: 10px;
            border: 0;
            color: #0512b9;
            cursor: pointer;
            /* margin-top: 20px; */
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 700;
            font-size: 16px;
            background-color: #fdd001;
        }

        }

        td, th {
            border: none;
        }

            td label {
                margin-left: 8px;
            }

        @media only screen and (max-width: 414px) {
            .modalPopup {
                width: 90%;
            }
        }

        @media only screen and (max-width: 300px) {
            .modalPopup {
                width: 90%;
                height: auto;
            }
        }
        /*   * {
        border:1px solid #000;
    }*/
        body {
            overflow-x: hidden;
        }

        .file-input {
            display: inline-block;
            text-align: left;
            background: #fff;
            padding: 16px;
            width: 100%;
            position: relative;
            border-radius: 3px;
        }

            .file-input > [type='file'] {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
                z-index: 10;
                cursor: pointer;
            }

            .file-input > .button {
                display: inline-block;
                cursor: pointer;
                background: #eee;
                padding: 8px 16px;
                border-radius: 2px;
                margin-right: 8px;
            }

            .file-input:hover > .button {
                background: dodgerblue;
                color: white;
            }

            .file-input > .label {
                color: #333;
                white-space: nowrap;
                opacity: .3;
            }

            .file-input.-chosen > .label {
                opacity: 1;
            }

        @media (max-width: 2000px) and (min-width: 1000px) {
            .footer {
                position: relative;
            }
        }

        @media (max-width: 1366px) {
            .all-member-avatar-img {
                position: relative;
            }

                .all-member-avatar-img img {
                    position: absolute;
                    top: 200px;
                    left: 50px;
                }

            .avatar {
                background-position-y: 20%;
            }
        }

        @media(max-width: 700px) {
            .all-member-avatar-img img {
                left: 0;
            }

            .member-mobile-view {
                min-height: 85vh
            }
        }

        @media(max-width: 540px) {
            .member-mobile-view {
                min-height: 85vh
            }

            .avatar {
                background-position-y: 0%;
                background-position-x: 53%;
            }
        }

        @media(max-width: 480px) {
            .avatar {
                background-position-y: 0%;
            }
        }

        .Mobile_accordion_body h2 {
            color: #172ab3;
            font-size: 20px;
            font-weight: 700;
            text-align: center;
            font-family: 'Red Hat Display',sans-serif !important;
        }

        .accordion-body {
            font-family: 'Red Hat Display',sans-serif !important;
            padding: 20px 0px;
        }

        .Mobile_delete_btn .Main_Mobile_delete_btn {
            background: #ffd101;
            color: #08138f;
            padding: 10px 15px;
            border-radius: 10px;
            display: inline-block;
        }


        .Mobile_member-list-cards {
            background: #ffffff;
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            border-radius: 10px;
            position: relative;
            text-align: center;
        }

        .Mobile_both_btn {
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .Mobile_Member_avtar_img img {
            width: 50px;
        }

        #Mobile_Avtar_accordion .accordion-button:focus {
            box-shadow: none;
            border-color: transparent;
        }

        #Mobile_Avtar_accordion .accordion-button {
            background: #0331b5;
            color: #ffffff;
        }


        /*avatar responsive*/

        .avatar .add-member-name {
            font-size: 14px;
            color: #0331b5;
            font-weight: 700;
            hanging-punctuation
        }


        .avatar .Mobile_menu-circle {
            height: 50px;
            width: 50px;
            border-radius: 50%;
            background-color: #447df0;
            color: #ffffff;
            text-align: center;
            margin: 0 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .avatar .Mobile_menu-circle img {
                height: 35px;
            }

        .avatar .Mobile_menu-circle_outer {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 10px 0px;
        }

        .avatar .Mobile_menu-circle_name span {
            text-overflow: ellipsis;
            overflow: hidden;
            width: 90px !important;
            display: inline-block;
            font-size: 11.5px;
            margin-top: 10px;
            color: black;
            text-transform: uppercase;
        }

        .Mobile_members-details span {
            text-overflow: ellipsis;
            overflow: hidden;
            width: 90px;
            display: inline-block;
            font-size: 11.5px;
            margin-top: 10px;
            color: black;
            text-transform: uppercase;
        }

        .add-member-icons_mobile_responsive img {
            width: 70px;
        }

        @media only screen and (max-width: 430px) {
            .avatar .main-div {
                background-position-x: 44%;
            }
        }

        @media only screen and (max-width: 280px) {
            .add-member-icons_mobile_responsive img {
                width: 50px;
            }

            .avatar .add-member-name {
                font-size: 11px !important;
            }

            .Mobile_members-details h4 {
                width: 44px;
            }

            .avatar .Mobile_menu-circle_name span {
                width: 60px !important;
            }
        }

        .side_user_profile_img {
            border-radius: 50%;
        }

        /*avatar responsive*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="uplavatar">
        <ContentTemplate>
            <div class="Huz_Avatar_section avatar position-relative d-lg-block d-md-block d-none d-xl=block d-xxl-block">
                <div class="Huz_Avtar_main_Content">
                    <div class="container-fluid p-0">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 p-0">
                                <div class="Huz_Addmemberside">
                                    <ul class="m-0 pt-5">
                                        <li><span class="First">
                                            <asp:LinkButton ID="member2" runat="server" Text="" OnClick="member2_Click" CommandArgument='<%# Session["UserId"] +"|"+Eval("user_relation") %>'>
                                                <asp:Label Text="" ID="lblUserName" runat="server" />
                                            </asp:LinkButton>
                                            </a></span></li>


                                        <div class="Huz_Addmembersideother" id="repeaterdiv" runat="server">
                                            <li class="Huz_AddmembersideotherLi">
                                                <asp:Repeater ID="rptMember" runat="server" OnItemDataBound="rptMember_ItemDataBound">
                                                    <ItemTemplate>
                                                        <div class="Huz_AddmembersideotherLidiv" id="divWrapper" runat="server">
                                                            <a href="">
                                                                <img src='<%# Eval("user_image") != string.Empty ? "upload/" + Eval("user_image").ToString() : "Avatar2/default-user-profile.png" %>' alt="" class="side_user_profile_img" />
                                                            </a>
                                                            <div class="Huz_AddmembersideotherLidiv_name">
                                                                <asp:LinkButton ID="member1" runat="server" Text='<%#Eval("user_FirstName") %>' OnClick="member1_Click" CommandArgument='<%#Eval("user_Id")+"|"+Eval("user_relation") %>'></asp:LinkButton>
                                                                <asp:HiddenField ID="hfmemberid" runat="server" Value='<%#Eval("user_Id") %>' />
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>


                                            </li>
                                        </div>
                                        <div id="listmembers" class="Huz_AddmembersideotherPlus" runat="server">
                                        </div>


                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                        <%--  <div class="Huz_AvtarFirstReport Zero">
                                            <div class="Huz_FirstReportInner d-flex align-items-center">
                                                <span>lab report</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=3">
                                                        <img src="Avatar2/lab-report.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>--%>
                                        <div class="Huz_AvtarFirstReport Huz_AvtarFirst">
                                            <div class="Huz_FirstReportInner d-flex align-items-center">
                                                <span>Lab Reports</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=3">
                                                        <img src="Avatar2/bill icon png (1).png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport Second">
                                            <div class="Huz_FirstReportInner d-flex align-items-center">
                                                <span>Immunization</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=5">
                                                        <img src="Avatar2/immunization.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport third">
                                            <div class="Huz_FirstReportInner d-flex align-items-center">
                                                <span>medications/<br>
                                                    prescription</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=6">
                                                        <img src="Avatar2/medications.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport forth">
                                            <div class="Huz_FirstReportInner d-flex align-items-center">
                                                <span>radiology</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=7">
                                                        <img src="Avatar2/rediology.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="Huz_Avtar_Main_image">
                                            <asp:Image ID="imgAvatar" runat="server" alt="" />
                                            <h3>
                                                <asp:Label Text="" ID="lbluser" runat="server" /></h3>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="Huz_AvtarFirstReport fifth">
                                            <div class="Huz_FirstReportInner flex-row-reverse d-flex align-items-center">
                                                <span>Opthalmology</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=8">
                                                        <img src="Avatar2/Opthalmologyicon.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport  sixth">
                                            <div class="Huz_FirstReportInner flex-row-reverse d-flex align-items-center">
                                                <span>dental report</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=4">
                                                        <img src="Avatar2/dental.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport seven">
                                            <div class="Huz_FirstReportInner flex-row-reverse d-flex align-items-center">
                                                <span>special report</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=9">
                                                        <img src="Avatar2/spacial-report.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Huz_AvtarFirstReport Eight">
                                            <div class="Huz_FirstReportInner flex-row-reverse d-flex align-items-center">
                                                <span>INVOICES/<br>
                                                    MEDICLAIM INSURANCE</span>
                                                <div class="Huz_FirstReportInnerImage">
                                                    <a href="reports.aspx?rid=10">
                                                        <img src="Avatar2/mediclaim.png" alt="">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 p-0">
                                <div class="AddmemberRightside pt-5" style="">
                                    <div class="Huz_AvatarAddReportbtn text-center">
                                        <asp:LinkButton runat="server" ID="LinkButton1" OnClick="lbtnAddReport_Click"><span style="font-size:20px;">Add Reports<br/>
                                            <img src="Avatar2/add-report-old.png" alt="file-img"></span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="AddmemberRightside_Card text-center">
                                        <span id="storageused" runat="server"></span>
                                    </div>
                                    <div class="AddmemberRightside_Card text-center">

                                        <span id="storageleft" runat="server"></span>

                                    </div>

                                    <div class="ContactUs text-center">
                                        <p>Need Space?</p>
                                        <a href="mailto:contact@hfiles.in">
                                            <p>Contact Us...</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="main-div avatar  member-mobile-view d-block d-md-none">
                <div class="d-flex justify-content-between align-items-center py-4 px-2 w-100" style="height: 250px">
                    <div class="add-member-icons add-member-icons_mobile_responsive  text-center">
                        <a class="text-center" href="addmember.aspx">
                            <img src="../My Data/Hfiles.png" alt="" />
                            <%-- <asp:ImageButton ID="addmember" runat="server" ImageUrl="../My Data/default-user-profile.png" AlternateText="Add Member" Height="90px" Width="90px"/>--%>
                            <br />
                            <div>
                                <small class="add-member-name">Add Member
                                </small>
                            </div>
                        </a>

                    </div>
                    <div class="member-avatar-img">
                        <%--<asp:Image class="avatar-img" ID="Image1" runat="server" />--%>
                        <img src="../Avatar/male/45.png" id="mobileAvatar" alt="" width="150px" />
                        <h5 class="text-center" runat="server" id="selectedmembername">Member Name</h5>
                    </div>
                    <div class="add-report-icon add-member-icons_mobile_responsive">
                        <asp:LinkButton Text="text" runat="server" ID="LinkButton2" OnClick="lbtnAddReport_Click">
                                <%--plus-icon--%>
<img class="" src="<%= ResolveUrl("~/Avatar/Hfiles2.png") %>" alt="" />
                                <br />
<div>
    <small class="add-member-name">Add Report
    </small>
</div>
                        </asp:LinkButton>
                        <%--<img class="" src="<%= ResolveUrl("~/Avatar/add-report.png") %>" alt="" />--%>
                    </div>
                </div>
                <div class="container-fluid">
                    <div id="Mobile_Avtar_accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item mb-4">
                                <h2 class="accordion-header">
                                    <button class="accordion-button text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Select Members
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="row Mobile_accordion_body">
                                            <h2>Members List</h2>
                                            <div class="col-12">
                                                <div class="Mobile_member-list-cards py-3">
                                                    <div class="row" id="repeaterdiv1" runat="server">
                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="rptMember_ItemDataBound">
                                                            <ItemTemplate>
                                                                <div class="col-4">
                                                                    <div class="Mobile_Member_avtar_img">
                                                                        <img src="/My Data/default-user-profile.png" />
                                                                    </div>
                                                                    <div class="Mobile_members-details py-2">
                                                                        <%--<h4>Kuldeep</h4>--%>
                                                                        <span>
                                                                            <asp:LinkButton ID="member2" ForeColor="Black" runat="server" Text='<%#Eval("user_FirstName") %>' OnClick="member1_Click" CommandArgument='<%#Eval("user_Id")+"|"+Eval("user_relation") %>'></asp:LinkButton></span>
                                                                        <asp:HiddenField ID="hfmemberid2" runat="server" Value='<%#Eval("user_Id") %>' />
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <%--<div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <span>Kuldeep</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="Mobile_Member_avtar_img">
                                                                    <img src="/My Data/default-user-profile.png" />
                                                                </div>
                                                                <div class="Mobile_members-details py-2">
                                                                    <h4>Kuldeep</h4>
                                                                </div>
                                                            </div>--%>
                                                    </div>
                                                    <div id="listmembers1" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion">
                            <div class="accordion-item mb-4">
                                <h2 class="accordion-header text-white">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        View Reports
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="row Mobile_accordion_body">
                                            <%--                                                <h2>Members List</h2>--%>
                                            <div class="col-12">
                                                <div class="Mobile_member-list-cards py-3">
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=3">
                                                                        <img src="../Avatar/lab-report.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>lab report</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=5">
                                                                        <img src="../Avatar/immunization.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>Immunization</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=6">
                                                                        <img src="../Avatar/medications.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>medications/prescription</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=7">
                                                                        <img src="../Avatar/rediology.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>radiology</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=8">
                                                                        <img src="../Avatar/Opthalmologyicon.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>Opthalmology</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=4">
                                                                        <img src="../Avatar/dental.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>dental report</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=9">
                                                                        <img src="../Avatar/spacial-report.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>special report</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="Mobile_menu-circle_outer">
                                                                <div class="Mobile_menu-circle">
                                                                    <a href="reports.aspx?rid=10">
                                                                        <img src="../Avatar/mediclaim.png" alt="" />
                                                                    </a>
                                                                </div>
                                                                <div class="Mobile_menu-circle_name py-2">
                                                                    <span>mediclaim/insurance</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none" />
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
                CancelControlID="btnClose" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                <div class="row my-2">
                    <div class="col-12">
                        <h2>Upload Report</h2>
                    </div>
                </div>
                <div class="row w-100 my-1" style="width: 100%">
                    <div class="col-12">
                        <div class="row">
                            <%-- <div class="col-5 lbl">
                    </div>--%>
                            <div class="col-12">
                                <label><strong>Select Report Type :</strong></label>
                                <asp:DropDownList CssClass="select-report-dropdown" runat="server" ID="ddlReports">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Report Type" ControlToValidate="ddlReports" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-1" style="width: 100%">
                    <%-- <div class="col-5 lbl">
            </div>--%>
                    <div class="col-12 text-start">
                        <label><strong>File Name : </strong></label>
                        <asp:TextBox runat="server" ID="txtReportName" AutoComplete="Off" placeHolder="Enter your Name" CssClass="filename-txtbox" required />
                    </div>
                </div>

                <div class="row my-2" style="width: 100%">
                    <%-- <div class="col-5 lbl">
            </div>--%>
                    <div class="col-12 text-start">
                        <label><strong>Select File :</strong></label>
                        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div>
                                    <asp:FileUpload ID="imageFileUpload1" CssClass="l" runat="server" required onchange="showFileName()" />
                                    <%--   <span class='button'>Choose</span>--%>
                                    <%--   <span class='label' data-js-label>No file selected</label>
                                    <span id="fileNameLabel" class='label' data-js-label>No file selected</span>--%>
                                </div>
                                <asp:Literal ID="litFileName" runat="server"></asp:Literal>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSubmit" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row w-100 my-3" style="width: 100%">
                    <div class="col-12">
                        <div class="row">
                            <%-- <div class="col-5 lbl">
                    </div>--%>
                            <div class="col-12 text-start">
                                <label><strong>Give View Access To :</strong></label><br />
                                <asp:CheckBoxList ID="chklist" runat="server"></asp:CheckBoxList>
                                <asp:CheckBoxList ID="ddlMembers2" CssClass="form-control border-0" runat="server" SelectionMode="Multiple"></asp:CheckBoxList>
                                <p>(If none selected then the document will be private)</p>
                                <%--<asp:ListBox ID="ddlMembers1" CssClass="select-report-dropdown" runat="server" SelectionMode="Multiple"></asp:ListBox>--%>

                                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" InitialValue="0" runat="server" SetFocusOnError="true" ControlToValidate="ddlMembers2" ErrorMessage="Select Members" Display="Dynamic" ValidationGroup="a"></asp:RequiredFieldValidator>--%>
                                <%--      <asp:DropDownList CssClass="select-report-dropdown" runat="server" ID="ddlMembers">
                            <%--   <asp:ListItem Text="Member1"></asp:ListItem>
                            <asp:ListItem Text="Member2"></asp:ListItem>
                            <asp:ListItem Text="Member3"></asp:ListItem>
                        </asp:DropDownList>--%>
                                <%-- <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Member" ControlToValidate="ddlMembers2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                --%>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />
                <asp:Button Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" CssClass="submit-btn" />
                <%--<asp:Label Text="" ID="lblMsg" runat="server" />--%>
                <asp:Button ID="btnClose" runat="server" OnClick="okLinkButton_Click" Text="Close" CssClass="close-btn" />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnClose" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
