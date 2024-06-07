<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="reports.aspx.cs" Inherits="hfiles.reports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
        integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/solid.min.css"
        integrity="sha512-P9pgMgcSNlLb4Z2WAB2sH5KBKGnBfyJnq+bhcfLCFusrRc4XdXrhfDluBl/usq75NF5gTDIMcwI1GaG5gju+Mw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<%= ResolveUrl("style.css") %>" />
    <title>Document</title>

    <style>
         .report-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .back-arrow-btn-2 {
            margin-right: 10px;
        }
        .search-file {
            display: flex;
            align-items: center;
        }
        .search-file i {
            margin-right: 5px;
        }
        .body {
            margin: 0;
            height: auto;
            /*            overflow:hidden;
*/
        }

        .container-fluid {
            max-width: 100%;
            margin: 0;
        }

        .card-title {
            font-family: Red Hat Display, sans-serif !important;
            font-size: 18px;
            font-weight: 500;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .Report_heading-title {
            padding-top: 4px;
        }

        .modalPopup {
            background-color: #f4f4f4;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 20px;
            width: 35%;
            /*height: 48%;*/
            height: auto;
            position: fixed;
            z-index: 100001;
            left: 20%;
            /*top: 20%;*/
            top: 10%;
            user-select: auto;
            border-radius: 10px;
        }

        .footer {
            position: relative;
            bottom: 0;
            width: 100%;
        }

        @media (max-width: 912px) {
            .modalPopup {
                width: 90%;
                left: 30px !important;
            }
        }

        @media (max-width: 540px) {
            .modalPopup {
                width: 90%;
                left: 20px !important;
            }
        }

        @media (min-width: 1020px) {
            .footer {
                position: absolute;
                bottom: 0;
            }
        }

        @media only screen and (min-device-width: 375px) and (max-device-width: 812px) and (-webkit-device-pixel-ratio: 3) {
            .report-page-title {
                font-family: 'Red Hat Display', Sans-serif !important;
                font-size: 18px !important;
                font-weight: 600;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<body class="download-documents">--%>
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%--   <asp:ScriptManager runat="server" />--%>
            <div class="container-fluid download-doc-inner my-3">
                <div class="heading-title Report_heading-title mb-3 px-3">
                    <div class="row report-page-header">
                        <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
                            <a class="back-arrow-btn-2" href="avatar2.aspx">Back
                                </a>
                        </div>
                        <div class="col-md-4 d-flex justify-content-center py-3 font-size-1em">
                            <asp:Label ID="lblReportType" runat="server" CssClass="report-page-title" Text="INVOICES/MEDICLAIM INSURANCE" />
                        </div>
                        <div class="col-md-4 d-flex justify-content-md-end justify-content-center align-items-center py-2 search-file">
                            <i class="fas fa-magnifying-glass"></i>
                            <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                        </div>
                    </div>
                </div>
                <%--<asp:UpdatePanel ID="uplReports" runat="server">
                    <ContentTemplate>--%>

                <div class="doc-pdf py-5 h-100">
                    <div class="container">
                        <div id="divUpload_Doc" style="display: block" runat="server">
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <a href="avatar2.aspx">
                                        <img src="../Avatar/file-not-found-new.jpg" class="card-img-top" alt="pdf-thumbnail" width="90%"></a>
                                    <h2 class="text-center">No File Found</h2>
                                </div>

                            </div>
                        </div>
                        <div class="row mb-5">
                            <asp:Repeater ID="rptReports" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4 col-lg-4 my-2">

                                        <div class="card text-start px-3 h-100">

                                            <img src="../assets/pdf-doc.png" class="card-img-top" alt="pdf-thumbnail">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>Name: </strong><%# Eval("ReportName") %></h5>
                                                <p class="card-text"><strong>Date: </strong><%# Eval("CreatedDate") %> </p>

                                                <div class="Whatappicon d-flex align-items-center justify-content-between">
                                                    <a href="<%# ResolveUrl( string.Format("~/upload/report/{0}", Eval("ReportUrl"))) %>" target="_blank" class="btn btn-sm btn-primary" style="align-self: center">View File</a>
                                                    <%-- <i class="fa-brands fa-whatsapp"></i>--%>
                                                    <asp:LinkButton ID="whatsappLinkButton" CommandArgument='<%# ResolveUrl( string.Format("~/upload/report/{0}", Eval("ReportUrl"))) %>' Text="" runat="server" OnClick="whatsappLinkButton_Click"><svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#63E6BE" d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandArgument='<%# Eval("Id")%>' OnClick="lbtnEdit_Click">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512">
                                                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                            <path fill="#FFD43B" d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z" />
                                                        </svg>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton Text="text" ID="lbtnremove" OnClick="lbtnremove_Click" runat="server" CommandArgument='<%# Eval("Id")%>'>
                                                       <image style="max-width:20px;max-height:20px;" src="../Suppor Group (BG  & Icons)/delete-icon.png"  />

                                                    </asp:LinkButton><%--lbtnremove_Click--%>
                                                </div>
                                                <asp:LinkButton ID="lbtnShare" runat="server" OnClick="lbtnShare_Click" CommandArgument='<%# Eval("Id")%>'></asp:LinkButton>
                                                <%--  <asp:LinkButton ID="lbtnShareMail" runat="server" OnCommand="btnShareEmail_Command" OnClick="lbtnShareMail_Click1" CommandArgument='<%# Eval("Id")%>'>
                                                    <img class="report-share-icon" src="../assets/gmail.png" />
                                                </asp:LinkButton>--%>
                                            </div>

                                            <%-- <div id="deletereport" class="report-delete-btn" runat="server" visible='<%#((Convert.ToInt32(Session["memberId"].ToString()) > 0))?false:true %>'>--%>
                                            <div id="deletereport" class="report-delete-btn" runat="server" visible='<%# Session["memberId"] != null && Convert.ToInt32(Session["memberId"]) > 0 ? false : true %>'>


                                                <a href="#" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" style="display: none"></a>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none" />
                            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
                                CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                            </cc1:ModalPopupExtender>
                            <asp:CheckBoxList ID="CheckBoxList1" CssClass="form-control border-0" runat="server" SelectionMode="Multiple"></asp:CheckBoxList>
                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center">
                                <%-- modal fade--%><div class="" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <%----%>
                                    <div class="modal-dialog modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">User's List</h1>
                                                <%--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                                            </div>
                                            <div class="modal-body">
                                                <p>Edit Access <%--Give user right to access this report--%></p>
                                                <%--   <form>--%>
                                                <%--  <div class="form-check form-switch my-1">--%>
                                                <asp:CheckBoxList ID="ddlMembers2" CssClass="form-control border-0" runat="server" SelectionMode="Multiple"></asp:CheckBoxList>
                                                <%--  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                    <label class="form-check-label" for="flexSwitchCheckDefault">User 1</label>--%>
                                                <%-- </div>--%>
                                                <%--   <div class="form-check form-switch my-1">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                                                    <label class="form-check-label" for="flexSwitchCheckChecked">User 2</label>
                                                </div>
                                                <div class="form-check form-switch my-1">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                    <label class="form-check-label" for="flexSwitchCheckDefault">User 1</label>
                                                </div>
                                                <div class="form-check form-switch my-1">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                                                    <label class="form-check-label" for="flexSwitchCheckChecked">User 2</label>
                                                </div>
                                                <div class="form-check form-switch my-1">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                                    <label class="form-check-label" for="flexSwitchCheckDefault">User 1</label>
                                                </div>
                                                <div class="form-check form-switch my-1">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                                                    <label class="form-check-label" for="flexSwitchCheckChecked">User 2</label>
                                                </div>--%>
                                                <%-- </form>--%>
                                            </div>
                                            <div class="modal-footer mt-3">
                                                <button type="button" id="btnClose" class="btn btn-secondary mx-3" data-bs-dismiss="modal">Close</button>
                                                <asp:LinkButton ID="lbtnSave" runat="server" OnClick="lbtnSave_Click" Text="Save" class="btn btn-primary"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                </div>

                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                <!-- row -->
            </div>
            <div id="toast">
                <div id="img">
                    <img src="assets/h-file-logo-white.png" />
                </div>
                <div id="desc"></div>
            </div>
        </ContentTemplate>
        <Triggers>
            <%-- <asp:AsyncPostBackTrigger ControlID="lbtnEdit" EventName="OnClick" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <%--  </div>--%>
    <%-- <div class="footer d-flex justify-content-around">
        <div class="t-c">
            <a href="#">Terms & Conditions</a>
        </div>
        <div class="copy-right">
            <span>Copyright@2023</span>
        </div>
        <div class="p-p">
            <a href="#">Privacy & Policy</a>
        </div>
    </div>--%>

    <%--</body>--%>
    <script>
        function launch_toast(message, icon) {
            var x = document.getElementById("toast")
            x.className = "show";
            document.getElementById("img").innerHTML = "<img src='" + icon + "' />"; // Set the message
            document.getElementById("desc").innerHTML = message; // Set the message
            setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
        }
        //launch_toast()
    </script>
</asp:Content>
