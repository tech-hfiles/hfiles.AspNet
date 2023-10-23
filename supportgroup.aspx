<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="supportgroup.aspx.cs" EnableViewState="true" Inherits="hfiles.supportgroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Support Group</title>
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(to left, #c9c8c8, #f8f8f8);
        }
    </style>
    <link rel="stylesheet" href="./style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="support-group">
                <section class=" header">
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
                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="1" runat="server" class="mental-health-link nav-link p-2 px-3" ID="v_pills_home_tab">
                            <img src="../Suppor Group (BG  & Icons)/mental-health-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Mental health</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="2" runat="server" class="skin-care-link nav-link p-2 px-3" ID="v_pills_profile_tab">
                            <img src="../Suppor Group (BG  & Icons)/skin-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Skin</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="3" runat="server" class="dental-link nav-link p-2 px-3" ID="v_pills_messages_tab">
                            <img src="../Suppor Group (BG  & Icons)/dental-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Dental</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="4" runat="server" class="nutrition-link nav-link p-2 px-3" ID="v_pills_settings_tab">
                            <img src="../Suppor Group (BG  & Icons)/nutrition-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Nutrition</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="5" runat="server" class="pet-care-link nav-link p-2 px-3" ID="pet_care_tab">
                            <img src="../Suppor Group (BG  & Icons)/petcare-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Pet care</span></asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-md-8 col-lg-9 p-0">
                            <!-- Tabs content -->
                            <div class="tab-content h-lg-96vh h-xl-94vh h-md-98vh h-sm-100vh" id="v-pills-tabContent">
                                <div class="tab-pane fade rounded bg-white show active p-4 h-100 mental-health-div"
                                    id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <h4 runat="server" id="h1HeadingLatestQuestion" class=" my-4 pl-4"></h4>
                                    <asp:HiddenField runat="server" ID="hfPostId" />
                                    <asp:HiddenField runat="server" ID="hfDiscussionId" />
                                    <h6 class="pl-4 mb-2">
                                        <img class="mx-2" src="../Suppor Group (BG  & Icons)/pin-icon.png" alt="" width="20px" />
                                        <asp:Label ID="forumtitleLabel" runat="server" Text=""></asp:Label>
                                    </h6>
                                    <div class="chat-history-div pl-4">
                                        <asp:Repeater ID="RepeaterPosts" runat="server">
                                            <ItemTemplate>
                                                <div class="chat-text-div d-flex py-2">
                                                    <div class="chat-name">
                                                        <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px" height="30px">
                                                        <span><em>user name</em></span>
                                                    </div>
                                                    <div class="chat-container">
                                                        <div class="arrow">
                                                            <div class="outer"></div>
                                                            <div class="inner"></div>
                                                        </div>
                                                        <div class="message-body">
                                                            <div class="d-flex">
                                                                 <p>
                                                                <%# Eval("PostText") %>
                                                            </p>
                                                            <span class="chat-more">...</span>
                                                               
                                                            <div class="show-edit-chat">
                                                                <div class="msg-edit-box">
                                                                    <span>Delete</span>
                                                                </div>
                                                            </div>
                                                            </div>

                                                           <span class="chat-date"><em><%# Eval("PostDate", "{0:MM/dd/yyyy HH:mm:ss}") %></em></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="row chat-input-div">
                                        <div class="col-10 ">
                                            <asp:TextBox ID="TextBoxPost" AutoComplete="Off" runat="server" placeholder="Enter your message..."></asp:TextBox>
                                        </div>
                                        <div class="col-2 d-flex align-items-center">
                                            <asp:ImageButton ID="ImageButton1" Width="60px" OnClick="submitImageButton_Click" ImageUrl="https://cdn-icons-png.flaticon.com/512/60/60525.png" runat="server" />
                                            <%-- <img class="cursor-pointer"
                                            src="https://cdn-icons-png.flaticon.com/512/60/60525.png" alt="" width="30px">--%>
                                        </div>
                                    </div>
                                </div>
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
                </section>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        console.log('javasrcipt')
      
        $(function () {

            console.log('hellllloo')
            $('.chat-more').click(function () {
                console.log('in')
                $('.show-edit-chat').hide();
                $(this).prev('.show-edit-chat').show();
            });
            $('body').on('click', function (event) {
                if (!$(event.target).closest('.chat-more').length) {
                    $('.show-edit-chat').hide();
                }
            });

            $(".nav-link").click(function () {
                console.log('class')
                if ($(this).hasClass("mental-health-link")) {
                    $('.tab-pane').addClass('mental-health-div')
                } else if ($(this).hasClass("skin-care-link")) {
                    $('.tab-pane').removeClass('mental-health-div')
                    $('.tab-pane').addClass('pet-care-div')
                }
            });

        });

    </script>


</asp:Content>
