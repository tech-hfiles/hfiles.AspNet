<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="samanta.aspx.cs" Inherits="hfiles.samanta" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= ResolveUrl("style2.css") %>" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Samanta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<body class="journal">

    <img class="blue_trangle_top_left" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle6.png") %>" alt="">
    <img class="plus_top_right" src="<%= ResolveUrl("~/Terms & Conditions/plus-1.png") %>" alt="">


    <div class="shutdown_top_icon d-flex align-items-center">
        <a href="#">
            <div class="" style="color: #0614aa !important; font-weight: 600">hf123456</div>
        </a>
        <a href="#">
            <img class="mx-2" src="<%= ResolveUrl("~/Reception Page/about.png") %>" alt="about icon"></a>
        <a href="#">
            <img class="" src="<%= ResolveUrl("~/Reception Page/shutdown.png") %>" alt="off icon"></a>
    </div>

    <div class="journal_main">
        <div style="width: 85%;">
            <div class="row inner_div mt-5">
                <div class="col-12 heading">
                    <a href="<%= ResolveUrl("~/journal.aspx") %>">
                        <h3>Journal</h3>
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xl-4 col-md-4 col-sm-12 dropdown ">
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
                                    <li>
                                        <img class="dropdown-icon" src="../Reception Page/user-icon.png" alt=""><a tabindex="-1" href="additionalinformation.aspx">My Info</a>
                                    </li>
                                    <!-- <li><img class="dropdown-icon" src="../Reception Page/add-icon.png" alt=""><a
                                        tabindex="-1" href="#">ADD MY REPORTS</a></li> -->
                                    <li style="border: 0;">
                                        <a href="<%= ResolveUrl("~/avatar.aspx") %>">
                                            <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">Add member</a>
                                    </li>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                </div>
                <div class="col-lg-4 col-xl-4 col-md-4 col-sm-12 dropdown ">
                    <div class="my_profile">
                        <div>
                            <a class="support-group" href="supportgroup.aspx">Support Group</a>
                            <!-- <a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                            aria-expanded="false">Support Group
                            <span class="caret"></span></a>

                        <ul class="dropdown-menu p-0 pt-2">
                            <li class="px-4"><a tabindex="-1" href="#">JOIN GROUP</a></li>
                            <li class="disable-group px-4"><a tabindex="-1" href="#">CREATE GROUP</a></li>
                        </ul> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex justify-content-center ">
                    <img class="samanta-image" src="../Reception Page/Samanta.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="bottom_TC">
        <span><a href="#">Privacy & Policy</a> &nbsp;| &nbsp; <a href="#">Terms & Conditions</a></span>
    </div>
    <div class="bottom_cr_center">
        <span>&copy; 2023 hflies All Rights Reserved</span>
    </div>
    <div class="progress_div">
        <p for="">30% Completed</p>
        <progress class="progress progress1" max="100" value="30"></progress>
        <div class="span">
            <span>Complete Your Profile</span>
        </div>
    </div>
    <img class="blue_trangle_bottom_right" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle4.png") %>" alt="">
    <img class="plus_bottom_right" src="<%= ResolveUrl("~/Terms & Conditions/plus-2.png") %>" alt="">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
    crossorigin="anonymous"></script>
</asp:Content>