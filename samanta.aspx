<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="samanta.aspx.cs" Inherits="hfiles.samanta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Samanta</title>

    <link rel="stylesheet" href="./style2.css" />
    <style>
        .footer {
            position: absolute;
            width: 100%;
            bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="journal">
        <div class="journal_main">
            <div class="jur-width-div" style="width: 85%;">
                <div class="row inner_div mt-5">
                    <div class="col-12 heading">
                        <a href="<%= ResolveUrl("~/journal.aspx") %>">
                            <h3>Journal</h3>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-12 col-xl-4 col-md-4  dropdown ">
                        <div class="my_profile">
                            <div>
                                <a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                    aria-expanded="false">My Profile
                                <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu p-0 pt-2 px-4">
                                    <div>
                                        <!-- <li><img class="dropdown-icon" src="../Reception Page/lock-icon.png" alt=""><a
                                            tabindex="-1" href="#">UNIQUE ID</a></li> -->
                                        <a class="color-white" tabindex="-1" href="addbasicdetails.aspx">
                                        <li class="color-white">
                                            <img class="dropdown-icon" src="../Reception Page/user-icon.png" alt="">My Info
                                        </li>
                                            </a>
                                        <!-- <li><img class="dropdown-icon" src="../Reception Page/add-icon.png" alt=""><a
                                        tabindex="-1" href="#">ADD MY REPORTS</a></li> -->
                                            <a  href="<%= ResolveUrl("~/avatar.aspx") %>">
                                        <li class="color-white" style="border-bottom:0">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">Add member
                                        </li>
                                                </a>
                                         <%--<a  href="<%= ResolveUrl("~/addbasicdetails.aspx") %>">
                                        <li class="color-white" style="border: 0;">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">Add basic details
                                        </li>
                                                </a>--%>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                    </div>
                    <div class="col-lg-4 col-xl-4 col-md-4 col-sm-12 dropdown ">
                                <a class="support-group" href="supportgroup.aspx">
                        <div class="my_profile">
                            <div>
                                <h3>Support Group</h3>
                            </div>
                        </div>
                                    </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 d-flex justify-content-center ">
                        <img class="samanta-image" src="../Reception Page/Samanta.png" alt="">
                    </div>
                </div>
            </div>
            <div class="progress_div">
                <p for="">30% Completed</p>
                <progress class="progress progress1" max="100" value="30"></progress>
                <div class="span">
                    <span>Complete Your Profile</span>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</asp:Content>
