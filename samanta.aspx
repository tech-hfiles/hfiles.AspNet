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
       /*  @media (min-width: 1000px) and (max-width: 1400px) {
             .footer {
                 position:relative;
             }
         }*/
        @media (min-width: 500px) and (max-width: 540px) {
            .footer {
                position:relative;
            }
        }
        .journal {
            background-image:url('../Reception Page/samanta-bg.png');
            background-size:contain;
            background-repeat:no-repeat;
            background-position:center
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
                                   <div class="col-3 tab-icon-div">
                                       <img src="../Reception Page/health-report-icon.png" />
                                   </div>
                                    <div class="col-9">
                                         <h3>My Medical History</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                        
                                <a class="support-group mb-lg-5 w-100" href="avatar.aspx">
                        <div class="my_profile">
                            <div class="row align-items-center">
                                
                                   <div class="col-3 tab-icon-div">
                                       <img src="../Reception Page/h-files-icon.png" />
                                   </div>
                                    <div class="col-9">
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
                                    <div class="col-3 tab-icon-div">
                                       <img src="../Reception Page/journal.png"/>
                                   </div>
                                    <div class="col-9">
                                          <h3>Journal</h3>
                                    </div>
                                </div>
                                   
                                </div>
                        </a>

                        <a class="support-group mb-5 w-100" href="supportgroup.aspx">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div">
                                       <img src="../Reception Page/chat-icon.png" />
                                   </div>
                                    <div class="col-9">
                                         <h3>Chat Room</h3>
                                    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</asp:Content>
