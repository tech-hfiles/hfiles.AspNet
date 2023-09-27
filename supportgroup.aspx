<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supportgroup.aspx.cs" Inherits="hfiles.supportgroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./style.css">
    <title>Support Group</title>
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(to left, #c9c8c8, #f8f8f8);
        }
    </style>
</head>

<body class="support-group">
    <form id="form1" runat="server">
        <a href="#">
            <div class="top-profile-div d-flex align-items-center">
                <img src="../Suppor Group (BG  & Icons)/default-profile.png" alt="" width="40px">
                <span>Alam Khan</span>
            </div>
        </a>
        <div class="top-menu-div d-flex align-items-center">
            <a href="#">
                <img src="../Suppor Group (BG  & Icons)/home-gray.png" alt="" width="25px"></a>
            <a href="#">
                <img class="box-shadow" src="../Suppor Group (BG  & Icons)/message-active.png" alt="" width="30px"></a>
            <a href="#">
                <img src="../Suppor Group (BG  & Icons)/bell-gray.png" alt="" width="25px"></a>
            <a href="#">
                <img src="../Suppor Group (BG  & Icons)/search-gray.png" alt="" width="25px"></a>
        </div>
        <section class=" header">
            <div>
                <div class="row m-0">
                    <div class="col-md-3 left-nav-bar">
                        <!-- Tabs nav -->
                        <div class="nav flex-column nav-pills nav-pills-custom w-100" id="v-pills-tab" role="tablist"
                            aria-orientation="vertical">
                            <div class="support-group-title d-flex justify-content-center">
                                <h2>Support Group</h2>
                            </div>
                            <div class="select-category">
                                <span>select Category</span>
                            </div>
                            <a class="mental-health-link nav-link p-2 px-3 active" id="v-pills-home-tab" data-toggle="pill"
                                href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                                <img src="../Suppor Group (BG  & Icons)/mental-health-icon.png" alt="" width="30px">
                                <span class="font-weight-bold large mx-3">Mental health</span></a>

                            <a class="skin-care-link nav-link p-2 px-3" id="v-pills-profile-tab" data-toggle="pill"
                                href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                                <img src="../Suppor Group (BG  & Icons)/skin-icon.png" alt="" width="30px">
                                <span class="font-weight-bold large mx-3">Skin</span></a>

                            <a class="dental-link nav-link p-2 px-3" id="v-pills-messages-tab" data-toggle="pill"
                                href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                                <img src="../Suppor Group (BG  & Icons)/dental-icon.png" alt="" width="30px">
                                <span class="font-weight-bold large mx-3">Dental</span></a>

                            <a class="nutrition-link nav-link p-2 px-3" id="v-pills-settings-tab" data-toggle="pill"
                                href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                                <img src="../Suppor Group (BG  & Icons)/nutrition-icon.png" alt="" width="30px">
                                <span class="font-weight-bold large mx-3">Nutrition</span></a>

                            <a class="pet-care-link nav-link p-2 px-3" id="pet-care-tab" data-toggle="pill" href="#pet-care"
                                role="tab" aria-controls="pet-care" aria-selected="false">
                                <img src="../Suppor Group (BG  & Icons)/petcare-icon.png" alt="" width="30px">
                                <span class="font-weight-bold large mx-3">Pet care</span></a>
                        </div>
                    </div>

                    <div class="col-md-9 p-0">
                        <!-- Tabs content -->
                        <div class="tab-content h-100vh" id="v-pills-tabContent">
                            <div class="tab-pane fade rounded bg-white show active p-4 h-100 mental-health-div"
                                id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                <h4 class=" my-4 pl-4">Mental Health Support Group</h4>
                                <h6 class="pl-4 mb-2">
                                    <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png"
                                        alt="" width="20px">
                                    <asp:Label ID="forumtitleLabel" runat="server" Text=""></asp:Label>
                                </h6>
                                <div class="chat-history-div pl-4">
                                    <asp:Repeater ID="RepeaterPosts" runat="server">
                                        <ItemTemplate>
                                            <div class="chat-text-div d-flex py-2">
                                                <div class="chat-name">
                                                    <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                        height="30px">
                                                    <span><em><%# Eval("PostDate", "{0:MM/dd/yyyy HH:mm:ss}") %></em></span>
                                                </div>
                                                <div class="chat-container">
                                                    <div class="arrow">
                                                        <div class="outer"></div>
                                                        <div class="inner"></div>
                                                    </div>
                                                    <div class="message-body d-flex">

                                                        <p>
                                                            <%# Eval("PostText") %>
                                                        </p>
                                                        <div class="show-edit-chat">
                                                            <div class="msg-edit-box">
                                                                <span>Delete</span>
                                                            </div>
                                                        </div>
                                                        <span class="chat-more">...</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="row chat-input-div">
                                    <div class="col-10 ">
                                        <asp:TextBox ID="TextBoxPost" runat="server" placeholder="Enter your message..."></asp:TextBox>
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <asp:ImageButton ID="ImageButton1" Width="60px" OnClick="submitImageButton_Click" ImageUrl="https://cdn-icons-png.flaticon.com/512/60/60525.png" runat="server" />
                                        <%-- <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">--%>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="tab-pane fade rounded bg-white p-4 h-100 skin-care-div" id="v-pills-profile"
                                role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <h4 class=" my-4 pl-4">Skin Care Support Group</h4>
                                <h6 class="pl-4 mb-2">
                                    <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png" alt="" width="20px">
                                    How do you
                                prevent tickets
                                from entering your Skin health </h6>
                                <div class="chat-history-div pl-4">
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Me</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row chat-input-div">
                                    <div class="col-10 ">
                                        <input type="text" placeholder="Type Your Message...">
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade rounded bg-white p-4 h-100 dental-care-div" id="v-pills-messages"
                                role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <h4 class=" my-4 pl-4">Dental Support Group</h4>
                                <h6 class="pl-4 mb-2">
                                    <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png" alt="" width="20px">
                                    How do you
                                prevent tickets
                                from entering your mental health </h6>
                                <div class="chat-history-div pl-4">
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Me</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row chat-input-div">
                                    <div class="col-10 ">
                                        <input type="text" placeholder="Type Your Message...">
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade rounded bg-white p-4 h-100 nutrition-care-div" id="v-pills-settings"
                                role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                <h4 class=" my-4 pl-4">Nutrition Support Group</h4>
                                <h6 class="pl-4 mb-2">
                                    <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png" alt="" width="20px">
                                    How do you
                                prevent tickets
                                from entering your mental health </h6>
                                <div class="chat-history-div pl-4">
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Me</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row chat-input-div">
                                    <div class="col-10 ">
                                        <input type="text" placeholder="Type Your Message...">
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">
                                    </div>
                                </div>
                            </div>--%>
                            <%--<div class="tab-pane fade rounded bg-white p-4 h-100 pet-care-div" id="pet-care" role="tabpanel"
                                aria-labelledby="pet-care-tab">
                                <h4 class=" my-4 pl-4">Pet Care Support Group</h4>
                                <h6 class="pl-4 mb-2">
                                    <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png" alt="" width="20px">
                                    How do you
                                prevent tickets
                                from entering your mental health </h6>
                                <div class="chat-history-div pl-4">
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Me</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="chat-text-div d-flex py-2">
                                        <div class="chat-name">
                                            <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px"
                                                height="30px">
                                            <span>Guest</span>
                                        </div>
                                        <div class="chat-container">
                                            <div class="arrow">
                                                <div class="outer"></div>
                                                <div class="inner"></div>
                                            </div>
                                            <div class="message-body d-flex">

                                                <p>
                                                    Hello world! This is a test message to show how to make an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box. Hello world! This is a test message to show how to make
                                                an arrow on the
                                                side of the box.
                                                </p>
                                                <div class="show-edit-chat">
                                                    <div class="msg-edit-box">
                                                        <span>Delete</span>
                                                    </div>
                                                </div>
                                                <span class="chat-more">...</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row chat-input-div">
                                    <div class="col-10 ">
                                         <asp:TextBox ID="a" runat="server" Width="400"></asp:TextBox>
                                       <!-- <input type="text" placeholder="Type Your Message...">-->
                                    </div>
                                    <div class="col-2 d-flex align-items-center">
                                        <asp:ImageButton ID="submitImageButton" OnClick="submitImageButton_Click" ImageUrl="https://cdn-icons-png.flaticon.com/512/60/60525.png" runat="server" />
                                       <%-- <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">--%>
                        </div>
                    </div>
                </div>
                --%>
            </div>
            </div>
                </div>
            </div>
        </section>
        <script>
            $(function () {
                $('.chat-more').click(function () {
                    $('.show-edit-chat').hide();
                    $(this).prev('.show-edit-chat').show();
                });
                $('body').on('click', function (event) {
                    if (!$(event.target).closest('.chat-more').length) {
                        $('.show-edit-chat').hide();
                    }
                });
            });
        </script>
    </form>
</body>
</html>
