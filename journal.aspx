<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" Inherits="hfiles.journal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Journal</title>
    <style>
        .top-icon {
            position: absolute;
            right: 20px;
            top: 25px;
        }

            .top-icon img {
                cursor: pointer;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<body class="journal common-design">
 <form id="form1" runat="server">--%>
    <div class="top-icon">
        <img id="" class="" src="../Add Members/save-icon.png" alt="" width="35px">
        <img id="" class="" src="../Add Members/home-icon-gray.png" alt="" width="25px">
    </div>

    <div class="filter-shorting-icon">
        <div class="popover__wrapper">
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
        </div>
        <div class="popover__wrapper">
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
                </table>
            </div>
        </div>
    </div>
    <div class="journal-main-div mt-5">
        <div class="heading-title d-flex align-items-center">
            <h1>Journal</h1>
            <div class="hr w-100">
                <hr class="hr1">
                <hr class="hr2">
            </div>
        </div>
        <div class="tab-div container px-5 d-flex justify-content-center my-3">
            <div class="tabs d-flex justify-content-between">

                <asp:LinkButton ID="LbtnArticle" runat="server" OnClick="LbtnArticle_Click" CommandArgument="1">Article</asp:LinkButton>
                <%--<a class="link" href="#" onclick="handleTabs('article')"><span id="ArticleTab">Article</span></a>--%>
                <span>| </span>
                <asp:LinkButton ID="LbtnVideo" runat="server" OnClick="LbtnVideo_Click">Video</asp:LinkButton>
                <%-- <a class="link active" href="#" onclick="handleTabs('video')"><span id="VideoTab">Video</span></a>--%>
                <span>| </span>
                <asp:LinkButton ID="LbtnAudio" runat="server" OnClick="LbtnAudio_Click">Audio</asp:LinkButton>
                <%-- <a class="link " href="#" onclick="handleTabs('audio')"><span id="AudioTab">Audio</span></a>--%>
            </div>
        </div>
        <asp:Repeater ID="RepeaterVideo" runat="server">
            <ItemTemplate>
                <div id="videoDiv" class="container blog-div my-5">
                    <div class="row w-100">
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards">
                                <div class="card-image">
                                    <video width="100%" height="250" controls poster="../journal-page-images/Youtube Thumbnail  (2)_page-0001.jpg">
                                        <source src="../journal-page-images/video-blog.mp4" type="video/mp4">
                                        </object>
                                    </video>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1 d-none" src="../Add Members/save-not-active.png" width="20px" alt="">
                                    <img class="mx-1" src="../Add Members/save-active-icon.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                                    <img class="mx-2 d-none" src="../Add Members/share-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Shobhika Jaju</strong></p>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                    <div class="blog-cards">
                        <div class="card-image">
                            <video width="100%" height="250" controls poster="../journal-page-images/Youtube Thumbnail  (2)_page-0001.jpg">
                                <source src="../journal-page-images/video-blog.mp4" type="video/mp4">
                                </object>
                            </video>
                        </div>
                        <div class="card-name d-flex align-items-center my-2 px-3">
                            <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                            <img class="mx-1 d-none" src="../Add Members/save-active-icon.png" width="20px" alt="">
                            <img class="mx-2" src="../Add Members/share-active.png" width="20px" alt="">
                            <img class="mx-2 d-none" src="../Add Members/share-not-active.png" width="20px" alt="">
                            <p class="m-0"><strong>Shobhika Jaju</strong></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                    <div class="blog-cards">
                        <div class="card-image">
                            <video width="100%" height="250" controls poster="../journal-page-images/Youtube Thumbnail  (2)_page-0001.jpg">
                                <source src="../journal-page-images/video-blog.mp4" type="video/mp4">
                                </object>
                            </video>
                        </div>
                        <div class="card-name d-flex align-items-center my-2 px-3">
                            <img class="mx-1 d-none" src="../Add Members/save-active-icon.png" width="20px" alt="">
                            <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                            <img class="mx-2 d-none" src="../Add Members/share-active.png" width="20px" alt="">
                            <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                            <p class="m-0"><strong>Shobhika Jaju</strong></p>
                        </div>
                    </div>
                </div> -->
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="RepeaterArticle" runat="server">
            <ItemTemplate>
                <div id="articleDiv" class="article-div container blog-div my-5">
                    <div class="row w-100">
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards ">
                                <div class="card-image">
                                    <a href="blogdetails.aspx"
                                        target="_blank">
                                        <img src="../journal-page-images/Article.jpg" alt="" width="100%"
                                            height="250px"></a>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1" src="../Add Members/save-active-icon.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Mental Health = Wealth</strong></p>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                    <div class="blog-cards ">
                        <div class="card-image">
                            <a href="../journal-page-images/hfiles article 2- Dr. Shubhangini Sharma.pdf"
                                target="_blank"><img src="../journal-page-images/Article.jpg" alt="" width="100%"
                                    height="250px"></a>
                        </div>
                        <div class="card-name d-flex align-items-center my-2 px-3">
                            <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                            <img class="mx-2" src="../Add Members/share-active.png" width="20px" alt="">
                            <p class="m-0"><strong>Article 2</strong></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                    <div class="blog-cards ">
                        <div class="card-image">
                            <a href="../journal-page-images/hfiles article 2- Dr. Shubhangini Sharma.pdf"
                                target="_blank"><img src="../journal-page-images/Article.jpg" alt="" width="100%"
                                    height="250px"></a>
                        </div>
                        <div class="card-name d-flex align-items-center my-2 px-3">
                            <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                            <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                            <p class="m-0"><strong>Article 3</strong></p>
                        </div>
                    </div>
                </div> -->
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="RepeaterAudio" runat="server">
            <ItemTemplate>
                <div id="audioDiv" class="audio-div container blog-div my-5">
                    <div class="row w-100">
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards ">
                                <div class="card-image">
                                    <a href="#" target="_blank">
                                        <img src="../journal-page-images/Dental H files .jpeg"
                                            alt="" width="100%"></a>
                                    <audio controls>
                                        <source
                                            src="../journal-page-images/961B8877-6322-4557-9520-5D0C9F5D9506 (enhanced).wav"
                                            type="audio/wav">
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1" src="../Add Members/save-active-icon.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Audio 1</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards ">
                                <div class="card-image">
                                    <a href="#" target="_blank">
                                        <img src="../journal-page-images/Mental Health H files .jpeg"
                                            alt="" width="100%"></a>
                                    <audio controls>
                                        <source
                                            src="../journal-page-images/961B8877-6322-4557-9520-5D0C9F5D9506 (enhanced).wav"
                                            type="audio/wav">
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Audio 2</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards ">
                                <div class="card-image">
                                    <a href="#" target="_blank">
                                        <img src="../journal-page-images/Doctor H files .jpeg"
                                            alt="" width="100%"></a>
                                    <audio controls>
                                        <source
                                            src="../journal-page-images/961B8877-6322-4557-9520-5D0C9F5D9506 (enhanced).wav"
                                            type="audio/wav">
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Audio 3</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xl-4 col-md-6 col-sm-12 py-2">
                            <div class="blog-cards ">
                                <div class="card-image">
                                    <a href="#" target="_blank">
                                        <img src="../journal-page-images/Pets H files .jpeg"
                                            alt="" width="100%"></a>
                                    <audio controls>
                                        <source
                                            src="../journal-page-images/961B8877-6322-4557-9520-5D0C9F5D9506 (enhanced).wav"
                                            type="audio/wav">
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                                <div class="card-name d-flex align-items-center my-2 px-3">
                                    <img class="mx-1" src="../Add Members/save-not-active.png" width="20px" alt="">
                                    <img class="mx-2" src="../Add Members/share-not-active.png" width="20px" alt="">
                                    <p class="m-0"><strong>Audio 3</strong></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <script>
        const article = document.getElementById('articleDiv')
        const audio = document.getElementById('audioDiv')
        const video = document.getElementById('videoDiv')

        const ArticleTab = document.getElementById('ArticleTab')
        const VideoTab = document.getElementById('VideoTab')
        const AudioTab = document.getElementById('AudioTab')

        const shorting = document.getElementById('shorting')
        const filtering = document.getElementById('filtering')


        article.style.display = 'none'
        audio.style.display = 'none'
        video.style.display = 'block'


        function handleTabs(tab) {
            if (tab === 'article') {
                article.style.display = 'block'
                audio.style.display = 'none'
                video.style.display = 'none'

                ArticleTab.style.color = '#08138f'
                VideoTab.style.color = '#d6d6d6'
                AudioTab.style.color = '#d6d6d6'

            } else if (tab === 'video') {
                article.style.display = 'none'
                audio.style.display = 'none'
                video.style.display = 'block'

                ArticleTab.style.color = '#d6d6d6'
                VideoTab.style.color = '#172ab3'
                AudioTab.style.color = '#d6d6d6'
            } else if (tab === 'audio') {
                article.style.display = 'none'
                audio.style.display = 'block'
                video.style.display = 'none'

                ArticleTab.style.color = '#d6d6d6'
                VideoTab.style.color = '#d6d6d6'
                AudioTab.style.color = '#172ab3'
            }
        }

        function colorChange() {

        }
    </script>

</asp:Content>
