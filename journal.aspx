<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/journal.aspx.cs" MasterPageFile="~/user.Master" EnableEventValidation="false" Inherits="hfiles.journal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Journal</title>
    <link rel="stylesheet" href="./style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
        integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .top-icon {
            position: absolute;
            right: 20px;
            top: 25px;
        }
 

        .top-icon img {
            cursor: pointer;
        }

        /*.journal-main-div {
            min-height: 87vh;
        }*/

        @media(max-width: 540px) {
            .back-arrow-btn-small-dev {
                top: 80px !important;
            }
        }

        @media (min-height: 598px) and (max-height: 600px) {
            .back-arrow-btn {
                top: 13% !important;
            }
        }

        @media(min-width: 1800px) {
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }

            .journal-main-div #ContentPlaceHolder1_upl1 {
                overflow-y: auto;
                max-height: 65vh;
            }
        }

        @media (min-width: 1024px) and (min-height: 600px) {
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        }

        @media (min-width: 820px) and (min-height: 1180px) {
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        }

        @media (min-width: 1024px) and (min-height: 1366px) {
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        }

        .journal-card {
            background-color: #ecedff;
            border-radius: 10px;
            padding: 10px;
        }

        .card-fun img {
            mix-blend-mode: multiply; /* or screen, overlay, etc. */
        }

        .text-black {
            color: #303030 !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <a class="back-arrow-btn d-none d-md-block" href="javascript: history.go(-1)">
        <img src="../assets/back-arrow.png" alt="" />Back</a>
    <a class="back-arrow-btn-small-dev d-block d-md-none" href="javascript: history.go(-1)">
        <img src="../assets/back-arrow.png" alt="" />Back</a>--%>
    <%-- <asp:ScriptManager ID="scm1" runat="server"></asp:ScriptManager>--%>
    <%--<body class="journal common-design">
 <form id="form1" runat="server">--%>
    <div class="journal" style="margin-bottom:280px;">

        <%-- <div class="top-icon">
        <img id="" class="" src="../Add Members/save-icon.png" alt="" width="35px">
        <img id="" class="" src="../Add Members/home-icon-gray.png" alt="" width="25px">
    </div>--%>

        <div class="filter-shorting-icon">


            <%--      <div class="popover__wrapper">
        <a href="#">
          <h2 id="shorting" class="popover__title">
            <img class="shorting-icon-top-right mx-2"
              src="../Add Members/shorting-icon-blue.png" alt="" width="20px" height="25px"></h2>
        </a>
        <div class="popover__content">
          <table class="popover__message w-100">
            <tbody>
              <tr class="px-3 py-2" style="color: #ffffff;">
                <td>Sort By</td>
              </tr>
              <tr class="px-3 py-2">
                <td><strong>New</strong></td>
              </tr>
              <tr class="px-3 py-2">
                <td><strong>Trending</strong><span><img style="margin-left: 10px;"
                  src="../assets/select.png" alt="" width="15px"></span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>--%>

            <div class="popover__wrapper">
                <asp:HiddenField ID="hfIsBookmarked" Value="0" runat="server" />
                <asp:ImageButton ID="btnBookmarked" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="~/Add Members/save-not-active.png" Width="30px" Height="30px" alt="" OnClick="btnBookmarked_Click" CommandName="ToggleBookmark" CommandArgument='' />
                <asp:ImageButton ID="btnNotBookmarked" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="~/Add Members/bookmark.png" Width="30px" Height="30px" alt="" OnClick="btnNotBookmarked_Click" CommandName="ToggleBookmark" CommandArgument='' />

                <%-- <asp:ImageButton ID="ImageButton1" Style="margin-top: 20px;"  Width="30px" Height="30px" runat="server" ImageUrl="..\Add Members\bookmark (1).png" CommandArgument='<%#Eval("UserId")+"|"+("CategoryId") %>' />--%>
            </div>

            <%--<div class="popover__wrapper">
        <a href="#">
          <h2 id="filtering" class="popover__title">
            <img class="filter-icon-top-right"
              src="../Add Members/filter-icon-blue.png" alt="" width="30px"></h2>
        </a>
        <div class="popover__content">
          <table class="popover__message w-100">
            <tbody>
              <tr class="px-3 py-2" style="background-color: #e2e2e2; color: #ffffff;">
                <td>Filter</td>
              </tr>
              <tr class="px-3 py-2" style="background-color: #b8b9f1; color: #ffffff;">
                <td>Mental Health <span>
                  <img style="margin-left: 10px;" src="../assets/select.png" alt=""
                    width="15px"></span></td>
              </tr>
              <tr class="px-3 py-2" style="background-color: #ffb4bb; color: #ffffff;">
                <td>Skin</td>
              </tr>
              <tr class="px-3 py-2" style="background-color: #b9e2fe; color: #ffffff;">
                <td>Dental</td>
              </tr>
              <tr class="px-3 py-2" style="background-color: #97c6a2; color: #ffffff;">
                <td>Nutrition</td>
              </tr>
              <tr class="px-3 py-2" style="background-color: #e5e26d; color: #ffffff;">
                <td>Pet care</td>
              </tr>
            </tbody>
          </table mb-5>
        </div>
     max-height:90vh </div>--%>
        </div>

        <div class="journal-main-div mt-4" style="overflow: auto;">

            <div class="tab-div container px-5 d-flex justify-content-center my-3">
                <div class="tab-div container px-5 d-flex justify-content-center mt-5">
                    <div class="tabs d-flex justify-content-between">

                        <%--<asp:LinkButton ID="lbtn1" runat="server" OnClick="lbtn1_Click" ></asp:LinkButton>--%>

                        <asp:LinkButton ID="LbtnArticle" runat="server" CssClass="journal-tabs" OnClientClick="handleTabs('article')" OnClick="LbtnArticle_Click" CommandArgument="1">Article</asp:LinkButton>
                        <%--<a class="link" href="#" onclick="handleTabs('article')"><span id="ArticleTab">Article</span></a>--%>
                        <span>| </span>
                        <asp:LinkButton ID="LbtnVideo" runat="server" CssClass="journal-tabs" OnClientClick="handleTabs('video')" OnClick="LbtnVideo_Click" CommandArgument="2">Video</asp:LinkButton>
                        <%-- <a class="link active" href="#" onclick="handleTabs('video')"><span id="VideoTab">Video</span></a>--%>
                        <span>| </span>
                        <asp:LinkButton ID="LbtnAudio" runat="server" CssClass="journal-tabs" OnClientClick="handleTabs('audio')" OnClick="LbtnAudio_Click" CommandArgument="3">Audio</asp:LinkButton>
                        <%-- <a class="link " href="#" onclick="handleTabs('audio')"><span id="AudioTab">Audio</span></a>--%>
                    </div>
                </div>

            </div>
            <div class="journal-main-div mb-5">
                <div class="heading-title d-flex align-items-center">
                    <h1>Journal</h1>
                    <div class="hr w-100">
                        <hr class="hr1" />
                        <hr class="hr2" />
                    </div>
                </div>

                <asp:Label ID="Label1" runat="server" Text="Article Data Not Available" Visible="false" />
                <asp:Button ID="Button1" runat="server" Text="Button" Visible="false" />
                <asp:UpdatePanel ID="upl1" runat="server">
                    <ContentTemplate>


                        <div id="videoDiv" class="container blog-div my-5">
                            <div class="row w-100 m-0 border-0">
                                <asp:Repeater ID="RepeaterVideo" runat="server">
                                    <ItemTemplate>

                                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 pb-2 journal-card">
                                            <div class="blog-cards">
                                                <div class="card-image">
                                                    <video width="100%" height="250" controls poster="<%#Eval("AnchorImage") %>">
                                                        <source src='<%#Eval("Url") %>' type="video/mp4">
                                                        </object>
                                                    </video>
                                                </div>
                                                <div class=" row d-flex flex-row card-name d-flex align-items-center my-2 px-3">
                                                    <div class="col-4">
                                                        <asp:ImageButton ID="btnsave" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl='<%#ResolveUrl(Eval("ImgUrl", "~/{0}")) %>' Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" CommandArgument='<%#Eval("Blog_ID")+"|"+ Eval("CategoryId") %>' />
                                                        <asp:ImageButton ID="btnShareWhatsApp" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/whatsapp.jpg" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareWhatsApp_Command" />
                                                        <asp:ImageButton ID="btnShareEmail" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/gmail.png" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareEmail_Command" />&nbsp;
                                                    </div>
                                                    <%-- <img class="mx-2" src="../Add Members/share-active.png" width="20px" alt="">--%>
                                                    <%--<img class="mx-1 d-none" src="../Add Members/save-not-active.png" width="20px" alt="">
                        <img class="mx-1" src="../Add Members/save-active-icon.png" width="20px" alt="">
                        <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                        <img class="mx-2 d-none" src="../Add Members/share-active.png" width="20px" alt="">--%>
                                                    <%--<p class="m-0 col-8 text-left"><strong>Hena Kanakia Gangar</strong></p>--%>
                                                    <p class="m-0 col-8 text-left"><strong><%# Eval("Title") %></strong></p>
                                                </div>
                                            </div>

                                        </div>


                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>

                        <div id="articleDiv" class="article-div blog-div my-5">
                            <div class="row w-100 m-0 d-flex justify-content-center gap-3 p-2">
                                <asp:Repeater ID="RepeaterArticle" runat="server">
                                    <ItemTemplate>
                                        <!-- Adjusting column sizes based on screen size -->
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 pb-2 journal-card">
                                            <div class="blog-cards">
                                                <div class="card-image">
                                                    <asp:LinkButton ID="lbtnblog" OnClick="lbtnblog_Click" runat="server" CommandArgument='<%#Eval("Blog_ID") %>'>
                <img src="<%#Eval("AnchorImage") %>" alt="" width="100%" height="250px">
                                                    </asp:LinkButton>
                                                </div>
                                                <div class="card-name d-flex flex-column align-items-left my-2 px-3 gap-1">
                                                    <asp:LinkButton ID="LinkButton1" OnClick="lbtnblog_Click" runat="server" CssClass="text-black" CommandArgument='<%#Eval("Blog_ID") %>'>
                <p class="m-0 text-wrap"><strong><%#Eval("Title") %></strong></p>
                                                    </asp:LinkButton>
                                                    <div class="text-left align-items-left card-fun">
                                                        <asp:ImageButton ID="btnsave" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl='<%#ResolveUrl(Eval("ImgUrl", "~/{0}")) %>' Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" CommandArgument='<%#Eval("Blog_ID")+"|"+ Eval("CategoryId")%>' />
                                                        <asp:ImageButton ID="btnShareWhatsApp" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/whatsapp.jpg" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareWhatsApp_Command" />
                                                        <asp:ImageButton ID="btnShareEmail" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/gmail.png" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareEmail_Command" />&nbsp;
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>


                        <div id="audioDiv" class="audio-div container blog-div my-5">
                            <div class="row w-100 m-0">
                                <asp:Repeater ID="RepeaterAudio" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                                            <div class="blog-cards ">
                                                <div class="card-image">
                                                    <a href="#" target="_blank">
                                                        <img src="<%#Eval("AnchorImage") %>"
                                                            alt="" width="100%"></a>
                                                    <audio controls>
                                                        <source
                                                            src='<%#ResolveUrl(Eval("Url","~/{0}")) %>'
                                                            type="audio/wav">
                                                        Your browser does not support the audio element.
                                                    </audio>
                                                </div>
                                                <div class="card-name d-flex align-items-center my-2 px-3">
                                                    <asp:ImageButton ID="btnsave" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl='<%#ResolveUrl(Eval("ImgUrl", "~/{0}")) %>' Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" CommandArgument='<%#Eval("Blog_ID") +"|"+ Eval("CategoryId") %>' />
                                                    <asp:ImageButton ID="btnShareWhatsApp" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/whatsapp.jpg" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareWhatsApp_Command" />
                                                    <asp:ImageButton ID="btnShareEmail" runat="server" ViewStateMode="Enabled" class="mx-1" ImageUrl="../assets/gmail.png" Width="20px" alt="" OnClick="btnsave_Click" CommandName="ToggleBookmark" OnCommand="btnShareEmail_Command" />&nbsp;
                         <%-- <img class="mx-2" src="../Add Members/share-active.png" width="20px" alt="">--%>
                                                    <%--<img class="mx-1" src="../Add Members/save-active-icon.png" width="20px" alt="">
                        <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">--%>
                                                    <p class="m-0"><strong><%#Eval("Title") %></strong></p>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                        <div id="toast">
                            <div id="img">Icon</div>
                            <div id="desc">A notification message..</div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger EventName="Click" ControlID="LbtnArticle" />
                        <asp:AsyncPostBackTrigger EventName="Click" ControlID="LbtnVideo" />
                        <asp:AsyncPostBackTrigger EventName="Click" ControlID="LbtnAudio" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


        <script>
            const article = document.getElementById('ContentPlaceHolder1_LbtnArticle')
            const audio = document.getElementById('ContentPlaceHolder1_LbtnAudio')
            const video = document.getElementById('ContentPlaceHolder1_LbtnVideo')


            //const ArticleTab = document.getElementById('ArticleTab')
            //const VideoTab = document.getElementById('VideoTab')
            //const AudioTab = document.getElementById('AudioTab')

            //const shorting = document.getElementById('shorting')
            //const filtering = document.getElementById('filtering')
            article.style.color = '#172ab3'
            function handleTabs(value) {
                if (value === 'article') {
                    article.style.color = '#172ab3'
                    audio.style.color = '#d6d6d6'
                    video.style.color = '#d6d6d6'
                } else if (value === 'video') {
                    video.style.color = '#172ab3'
                    audio.style.color = '#d6d6d6'
                    article.style.color = '#d6d6d6'
                } else if (value === 'audio') {
                    audio.style.color = '#172ab3'
                    article.style.color = '#d6d6d6'
                    video.style.color = '#d6d6d6'
                }
            }
            function launch_toast() {
                var x = document.getElementById("toast")
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
            }
            //launch_toast()

        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
            integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
            integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </div>
</asp:Content>
