<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="samanta.aspx.cs" Inherits="hfiles.samanta" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/style2.css") %>" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Samanta</title>
</head>

<body class="journal">


    <img class="about_top_icon" src="<%= ResolveUrl("~/Reception Page/about.png") %>" alt="about icon">
    <img class="shutdown_top_icon" src="<%= ResolveUrl("~/Reception Page/shutdown.png") %>"  alt="home icon">
    <img class="blue_trangle_top_left" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle6.png") %>"alt="">
    <img class="plus_top_right" src="<%= ResolveUrl("~/Terms & Conditions/plus-1.png") %>"  alt="">
    <form id="form1" runat="server" class="journal_main">
        <div style="width: 85%;">
            <div class="row inner_div mt-5">
                <div class="col-12 heading">
                    <h3>Journal</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-xl-4 col-md-4 col-sm-12 dropdown ">
                    <div class="my_profile">
                        <div>
                            <a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                aria-expanded="false">My Profile
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu p-0">
                                <li>
                                    <img class="dropdown-icon" src="<%= ResolveUrl("~/Reception Page/lock-icon.png") %>"  alt=""><a tabindex="-1" href="#"><asp:Label Text="" ID="lblUniqueId" runat="server" /></a></li>
                                <li>
                                    <img class="dropdown-icon" src="<%= ResolveUrl("~/Reception Page/user-icon.png") %>"  alt=""><a tabindex="-1" href="<%= ResolveUrl("~/additionalinformation.aspx") %>">MY INFO</a></li>
                                <li>
                                    <img class="dropdown-icon" src="<%= ResolveUrl("~/Reception Page/add-icon.png") %>"  alt=""><a tabindex="-1" href="#">ADD MY REPORTS</a></li>
                                <li>
                                    <img class="dropdown-icon" src="<%= ResolveUrl("~/Reception Page/add-icon.png") %>"  alt=""><a tabindex="-1" href="#">ADD MEMBERS</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                </div>
                <div class="col-lg-4 col-xl-4 col-md-4 col-sm-12 dropdown ">
                    <div class="my_profile">
                        <div>
                            <a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                aria-expanded="false">Support Group
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu p-0">
                                <li><a tabindex="-1" href="#">JOIN GROUP</a></li>
                                <li class="disable-group"><a tabindex="-1" href="#">CREATE GROUP</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 d-flex justify-content-center ">
                    <img class="samanta-image" src="<%= ResolveUrl("~/Reception Page/Samanta.png") %>"  alt="">
                </div>
            </div>
        </div>
    </form>
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
    <img class="blue_trangle_bottom_right" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle4.png") %>"  alt="">
    <img class="plus_bottom_right" src="<%= ResolveUrl("~/Terms & Conditions/plus-2.png") %>"  alt="">
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
    crossorigin="anonymous"></script>

</html>
