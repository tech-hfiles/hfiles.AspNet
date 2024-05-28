<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="samanta.aspx.cs" Inherits="hfiles.samanta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Samanta</title>

    <link rel="stylesheet" href="./style2.css" />
    <style>
        body{
            margin:0 !important;
            padding: 0 0 0 0 !important;
        }
        .footer {
            position: absolute;
            width: 100%;
            margin:0 0 0 0!important; 
        }

        @media(max-width: 540px) {
            .footer {
                bottom: 0;
            }
        }

        @media (max-width: 900px) {
            body {
                min-height: 100vh;
            }
        }

        @media (min-width: 500px) and (max-width: 540px) {
            .footer {
                position: relative;
            }
        }

        .journal {
            background-image: url('../Reception Page/samanta-bg.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            height:100%;
        }

        .comming-soon {
            font-size: 14px;
        }


        @keyframes blink {
            0% {
                color: black;
            }

            50% {
                color: red;
            }

            100% {
                color: darkgreen;
            }
        }

        .blink {
            animation: blink 1s infinite; /* Change the duration as needed */
        }

        @media(max-width: 1024px) {
            .comming-soon {
                font-size: 12px;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .footer {
                position: relative;
            }
        }

        @media (min-height: 1364px) and (max-height: 1366px) {
            .footer {
                position: absolute;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="journal">
        <div class="journal_main">
            <div class="jur-width-div" style="width: 85%;">
                <%-- <div class="row inner_div mt-5 w-1000
                    <div class="col-12 heading">
                        <a href="<%= ResolveUrl("~/journal.aspx") %>">
                            <h3>Journal</h3>
                        </a>
                    </div>
                </div>--%>
                <div class="row w-100 mt-5">
                    <div class="col-lg-6 col-12 col-xl-4 col-md-5  dropdown ">
                        <%--<div class="inner_div mb-lg-5 w-100">
                                <div class="heading w-100">
                                    <a class="w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                                        <h3>Journal</h3>
                                    </a>
                                </div>
                            </div>--%>

                        <a class="support-group my-5" href="additionalinformation.aspx">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/health-report-icon.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>My Medical History</h3>
                                    </div>
                                </div>
                            </div>
                        </a>

                        <a class="support-group mb-lg-5 w-100" href="avatar2.aspx">
                            <div class="my_profile">
                                <div class="row align-items-center">

                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/h-files-icon.png" />
                                    </div>
                                    <div class="col-9" >
                                        <h3>My H-Files</h3>
                                    </div>

                                    <%--<a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                    aria-expanded="false">My H-Files
                                <span class="caret"></span>
                                </a>--%>
                                    <%--<ul class="dropdown-menu p-0 pt-2 px-4">
                                    <div>
                                         <li><img class="dropdown-icon" src="../Reception Page/lock-icon.png" alt=""><a
                                            tabindex="-1" href="#">UNIQUE ID</a></li> 
                                        <a class="color-white" tabindex="-1" href="additionalinformation.aspx">
                                            <li class="color-white">
                                                <img class="dropdown-icon" src="../Reception Page/user-icon.png" alt="">My Personal Data
                                            </li>
                                        </a>
                                         <li><img class="dropdown-icon" src="../Reception Page/add-icon.png" alt=""><a
                                        tabindex="-1" href="#">ADD MY REPORTS</a></li> 
                                        <a href="<%= ResolveUrl("~/avatar.aspx") %>">
                                            <li class="color-white">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">My Medical History
                                            </li>
                                        </a>
                                        <a href="<%= ResolveUrl("~/addmember.aspx") %>">
                                            <li class="color-white" style="border: 0;">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">Add Member
                                            </li>
                                        </a>
                                    </div>
                                </ul>--%>
                                </div>
                            </div>
                        </a>



                    </div>
                    <div class="col-4 col-md-2 col-lg-1 col-xl-4">
                    </div>
                    <div class="col-lg-5 col-xl-4 col-md-5 col-12 dropdown ">

                        <%--<div class="inner_div mb-lg-5 w-100">
                            <div class="heading w-100">
                                <a class="w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                                    <h3>Journal</h3>
                                </a>
                            </div>
                        </div>--%>
                        <a class="support-group mb-5 w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/journal.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>Journal</h3>
                                    </div>
                                </div>

                            </div>
                        </a>

                        <a class="support-group mb-5 w-100" href="<%= ResolveUrl("~/supportgroup.aspx") %>">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/chat-icon.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>Chat Room  <%--<small id="typingEffect" class="comming-soon"><span id="comingSoon"  class="blink"></span>--%><%--( Comming Soon ! )--%><%--</small>--%></h3>
                                        <%--<img src="Reception Page/coming-soon.png" />--%>
                                    </div>
                                    <%--   <div class="col-4">
                                        <h5>Comming Soon</h5>
                                        <%--  <img src="Reception Page/coming-soon.png" />--%>
                                    <%--  <span class="badge bg-warning rounded-circle">Comming Soon !</span>
                                    </div>--%>
                                </div>
                            </div>
                        </a>

                        <%--<a class="support-group my-5" href="additionalinformation.aspx">
                            <div class="my_profile">
                                <div>
                                    <h3>My Medical History</h3>
                                </div>
                            </div>
                        </a>--%>
                    </div>
                </div>
                <div class="row w-100">
                    <div class="col-12 d-flex justify-content-center ">
                        <img class="samanta-image" src="../Reception Page/SamantaGIF.gif" alt="">
                        <%--  <img class="samanta-image" src="../Reception Page/Samanta1.jpeg" alt="">--%>
                    </div>
                </div>
                <%--<div class="progress_div">
                    <p for="">30% Completed</p>
                    <progress class="progress progress1" max="100" value="30"></progress>
                    <div class="span">
                        <span>Complete Your Profile</span>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <div class="backdrop" id="backdrop"></div>
    <div class="modal-popup">
        <div id="myModal" class="modal">
            <div class="modal-header">
                <h1 class="modal-title">Steps</h1>
                <span class="modal-close" onclick="closeModal()">&times;</span>
            </div>
            <div class="modal-body">
                <p>This is your modal content.</p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <script>

        var text = "Coming Soon !"; // Text to be typed
        var speed = 100; // Typing speed in milliseconds
        var index = 0; // Index of the current character being typed

        function typeWriter() {
            if (index < text.length) {
                document.getElementById("comingSoon").innerHTML += text.charAt(index);
                index++;
                setTimeout(typeWriter, speed);
            }
        }

        typeWriter(); // Start typing when the page loads


        // Function to open the modal and backdrop when the page renders
        //window.onload = function () {
        //    openModal();
        //};

        // Function to open the modal and backdrop
        function openModal() {
            document.getElementById("myModal").style.display = "block";
            document.getElementById("backdrop").style.display = "block";
        }

        // Function to close the modal and backdrop
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
            document.getElementById("backdrop").style.display = "none";
        }
    </script>
</asp:Content>
