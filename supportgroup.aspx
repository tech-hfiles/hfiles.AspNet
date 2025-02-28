<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="supportgroup.aspx.cs" EnableViewState="true" Inherits="hfiles.supportgroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Support Group</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(to left, #c9c8c8, #f8f8f8);
        }

        .ComingSoonPage img {
            width: 50%;
            padding-top: 50px;
        }

        .ComingSoonPage {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .footer {
            position: absolute;
            width: 100%;
            bottom: 0px;
        }

        @media (max-width: 480px) {
            .ComingSoonPage img {
                width: 100%;
                padding-top: 100px;
            }
        }

        @media (max-width: 540px) {
            .ComingSoonPage img {
                width: 100%;
            }
        }
    </style>
    <link rel="stylesheet" href="./style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:ScriptManager runat="server" />--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="ComingSoonPage">
                <img src="../Suppor Group (BG  & Icons)/ComingSoon.png" alt="" />
            </div>
            <div class="support-group d-none">
                <section class=" header">
                    <div class="row m-0">
                        <div class="col-md-4 col-lg-3 left-nav-bar">
                            <!-- Tabs nav -->
                            <div class="nav flex-column nav-pills nav-pills-custom w-100" id="v-pills-tab" role="tablist"
                                aria-orientation="vertical">
                                <div class="support-group-title d-flex justify-content-center">
                                    <h2>Support Group</h2>
                                </div>
                                <div class="select-category">
                                    <span>select Category</span>
                                </div>
                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="1" runat="server" class="mental-health-link tabs-btn nav-link p-2 px-3" data-color="#c5e26d" ID="v_pills_home_tab">
                            <img src="../Suppor Group (BG  & Icons)/mental-health-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Mental health</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="2" runat="server" class="skin-care-link tabs-btn nav-link p-2 px-3" data-color="#a7e26d" ID="v_pills_profile_tab">
                            <img src="../Suppor Group (BG  & Icons)/skin-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Skin</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="3" runat="server" class="dental-link nav-link tabs-btn p-2 px-3" data-color="#f8e26d" ID="v_pills_messages_tab">
                            <img src="../Suppor Group (BG  & Icons)/dental-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Dental</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="4" runat="server" class="nutrition-link tabs-btn nav-link p-2 px-3" data-color="#ffe26d" ID="v_pills_settings_tab">
                            <img src="../Suppor Group (BG  & Icons)/nutrition-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Nutrition</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="5" runat="server" class="pet-care-link tabs-btn nav-link p-2 px-3" data-color="#e5e26d" ID="pet_care_tab">
                            <img src="../Suppor Group (BG  & Icons)/petcare-icon.png" alt="" width="30px" />
                            <span class="font-weight-bold large mx-3">Pet care</span></asp:LinkButton>

                                <asp:LinkButton OnClick="v_pills_home_tab_Click" CommandArgument="6" runat="server" class="mental-health-link tabs-btn nav-link p-2 px-3" data-color="#c5e26d" ID="fitness_tab">
<img src="../Suppor Group (BG  & Icons)/mental-health-icon.png" alt="" width="30px" />
<span class="font-weight-bold large mx-3">Fitness</span></asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-md-8 col-lg-8 col-lg-9 p-0">
                            <!-- Tabs content -->
                            <asp:HiddenField ID="hfCatergoryId" runat="server" />
                            <div class="tab-content h-lg-96vh h-xl-94vh h-md-98vh h-sm-100vh" id="v-pills-tabContent">
                                <div class="tab-pane fade rounded show active p-4 h-100 mental-health-div"
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
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <div class="chat-text-div d-flex py-2">
                                                            <div class="chat-name">
                                                                <img src="../Suppor Group (BG  & Icons)/user-default.png" alt="" width="30px" height="30px">
                                                                <span><em><%# "User_" + Eval("user_id").ToString() %></em></span>
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
                                                                        <span class="chat-more">
                                                                            <asp:LinkButton Text="text" ID="lbtnremove" Visible='<%# Convert.ToInt32(Session["Userid"].ToString()) == Convert.ToInt32(Eval("user_id")) ? true : false %>' OnClick="lbtnremove_Click" runat="server" CommandArgument='<%# Eval("forumpostid") %>'><img src="../Suppor Group (BG  & Icons)/delete-icon.png" /></asp:LinkButton></span>
                                                                    </div>

                                                                    <span class="chat-date"><em><%# Eval("PostDate", "{0:MM/dd/yyyy HH:mm:ss}") %></em></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="lbtnremove" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="row chat-input-div p-0 p-md-5">
                                        <div class="col-10 p-0 p-md-2">
                                            <asp:TextBox ID="TextBoxPost" AutoComplete="Off" runat="server" placeholder="Enter your message..."></asp:TextBox>
                                        </div>
                                        <div class="col-2 d-flex align-items-center p-0 p-md-2">
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

        var tabDiv = $(".mental-health-div")
        tabDiv.css({ "background": "linear-gradient(to top, #b8b9f1 0%, #ffffff 100%)" })

        $(function () {
            //$("#ContentPlaceHolder1_v_pills_home_tab").click(function () {
            //    console.log('home')
            //    tabDiv.style.background = "linear-gradient(to top, #b8b9f1 0%, #ffffff 100%)"
            //})
            //$("#ContentPlaceHolder1_v_pills_profile_tab").click(function () {
            //    console.log('skin')
            //    tabDiv.css( "background", "linear-gradient(to top, #ffb4bb 0%, #ffffff 100%)" )
            //})

            $(document).on("click", ".mental-health-link", function () {
                var colorCode = $(this).data('color')
                console.log($(this).data('color'))
                console.log($(this).attr('data-color'))
                //$(".mental-health-div").css("background", `linear-gradient(to top, ${colorCode} 0%, #ffffff 100%)`)
                //$(".mental-health-div").css({ "background": "linear-gradient(to top, rgb(184, 185, 241) 0%, rgb(255, 255, 255) 100%)" })
                document.getElementsByClassName('mental-health-div').style.background = 'linear-gradient(to top, rgb(184, 185, 241) 0%, rgb(255, 255, 255) 100%)'
            })
        })

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
        });
        //.support - group.mental - health - div

    </script>


</asp:Content>
