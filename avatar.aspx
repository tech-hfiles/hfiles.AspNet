<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="avatar.aspx.cs" Inherits="hfiles.avatar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href=" <%= ResolveUrl("~/css/style3.css") %>" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap-grid.min.css"
        integrity="sha512-EAgFb1TGFSRh1CCsDotrqJMqB2D+FLCOXAJTE16Ajphi73gQmfJS/LNl6AsjDqDht6Ls7Qr1KWsrJxyttEkxIA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet' />
    <title>Avatar</title>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #fffae4;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding: 20px;
            width: 25%;
            height: 48%;
            position: fixed;
            z-index: 100001;
            left: 20%;
            top: 20%;
            user-select: auto;
            border-radius: 10px;
        }

        .select-report-dropdown {
            width: 100%;
            padding: 5px;
            border-radius: 10px;
        }

        .modalPopup .lbl {
            text-align: left !important;
        }

        .filename-txtbox {
            width: 95%;
            padding: 5px;
            border-radius: 10px;
        }

        .submit-btn {
            padding: 15px 20px;
            background: linear-gradient(to right, #0512B9 0%, #081466 100%);
            color: #fff;
            border: none;
            border-radius: 50px;
            font-size: 14px;
            width: 100px;
            cursor: pointer;
        }

        .close-btn {
            padding: 15px 20px;
            background: linear-gradient(to right, #f57272 0%, #fa5656 100%);
            color: #fff;
            border: none;
            border-radius: 50px;
            font-size: 14px;
            width: 100px;
            margin-left: 10px;
            cursor: pointer;
        }

        td, th {
            border: none;
        }

            td label {
                margin-left: 8px;
            }

        @media only screen and (max-width: 414px) {
            .modalPopup {
                width: 90%;
            }
        }

        @media only screen and (max-width: 300px) {
            .modalPopup {
                width: 90%;
                height: 50%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--  <img class="blue-t-top-left" src="<%= ResolveUrl("~/Avatar/blue-trangle-1.png") %>" alt="" />
        <img class="blue-t-top-right" src="<%= ResolveUrl("~/Avatar/blue-trangle-2.png") %>" alt="" />--%>
        <img class="plus-top-left" src="<%= ResolveUrl("~/Add Members/plus-1.png") %>" alt="" />
        <div class="top-home-icons d-flex">
            <img class="" src="<%= ResolveUrl("~/Avatar/01.png") %>" alt="" />
            <img class="" src="<%= ResolveUrl("~/Avatar/04.png") %>" alt="" />
            <img class="" src="<%= ResolveUrl("~/Avatar/03.png") %>" alt="" />
            <img class="" src="<%= ResolveUrl("~/Avatar/02.png") %>" alt="" />
        </div>
        <div class="main-div pt-5">
            <div class="row">
                <div class="col-lg-7 col-md-7 col-sm-12 h-50 d-flex justify-content-between align-items-center">
                    <div class="row">
                        <div class="col-6">
                            <ul class="m-0">
                                <li class="border-bottom w-100px text-center pb-2"><span class="plus-value">
                                    <asp:Label Text="" ID="lblUserName" runat="server" /></span></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                                <br>
                                <li class="border-bottom w-100px text-center pb-2"><a href="addmember.aspx">
                                    <img src="../Avatar/add-icon.png" alt=""
                                        width="25px"></a></li>
                            </ul>
                        </div>
                        <div class="col-6 d-flex align-items-end justify-content-end">
                            <asp:Image class="avatar-img" ID="imgAvatar" runat="server" />
                            <%--<img class="avatar-img" src="<%= ResolveUrl("~/Avatar/avatar-shadow.png") %>" alt="" />--%>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-lg-4 col-md-4 col-sm-12 d-flex justify-content-center align-items-end h-50">
            </div> -->
                <div class="col-lg-5 col-md-5 col-sm-12 p-0 d-flex align-items-center justify-content-end h-50">
                    <div class="menu-div">
                        <div class="inner-menu-div">
                            <a href="#">
                                <%--<img class="plus-icon" style="" src="../Avatar/add-report.png" alt="" width="65px"></a>--%>
                                <div class="popover__wrapper">
                                    <asp:LinkButton Text="text" runat="server" ID="LinkButton1" OnClick="lbtnAddReport_Click">
                                <img class="plus-icon" src="<%= ResolveUrl("~/Avatar/add-report.png") %>" alt="" />
                                    </asp:LinkButton>
                                    <%--<span style="color: #0236b4; font-weight: 600;">ADD REPORT</span>--%>
                                    <!-- <a href="#">
                            </a> -->
                                    <div class="popover__content">
                                        <p class="popover__message">Upload Report</p>

                                    </div>
                                </div>

                                <img class="circle-line" src="../Avatar/circle-line.png" alt="">
                                <div class="lab-report w-60 h-75 menu-circle-txt-color">
                                    <div class="d-flex align-items-center h-75">
                                        <span>lab report</span>
                                        <div class="menu-circle">
                                        <a href="reports.aspx?rid=3"> <img src="../Avatar/lab-report.png" alt=""></a>
                                           
                                        </div>
                                    </div>

                                </div>
                                <div class="medication-prescription h-75 d-flex align-items-center menu-circle-txt-color w-300">
                                    <div class="d-flex align-items-center">
                                        <span>medications/prescription</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/medications.png" alt="">
                                        </div>

                                    </div>
                                </div>
                                <div class="radiology h-75 d-flex align-items-center menu-circle-txt-color">
                                    <div class="d-flex align-items-center h-75">
                                        <span>radiology</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/rediology.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="dentel-report h-75 d-flex align-items-center menu-circle-txt-color">
                                    <div class="d-flex align-items-center">
                                        <span>dental report</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/dental.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="special-report h-75 d-flex align-items-center menu-circle-txt-color">
                                    <div class="d-flex align-items-center">
                                        <span>special report</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/spacial-report.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="mediclaim-insurance h-75 d-flex align-items-center menu-circle-txt-color">
                                    <div class="d-flex align-items-center">
                                        <span>mediclaim/insurance</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/mediclaim.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="opthalmology-icon h-75 d-flex align-items-center menu-circle-txt-color">
                                    <div class="d-flex align-items-center">
                                        <span>Opthalmology icon</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/Opthalmologyicon.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="immunization h-75 w-70 menu-circle-txt-color">
                                    <div class="d-flex align-items-center h-75">
                                        <span>Immunization</span>
                                        <div class="menu-circle">
                                            <img src="../Avatar/immunization.png" alt="">
                                        </div>
                                    </div>

                                </div>
                        </div>
                    </div>
                </div>
                <%--<div class="col-lg-5 col-md-5 col-sm-12 p-0 d-flex align-items-center justify-content-end h-50">
                    <div class="menu-div">
                        <div class="inner-menu-div">
                            <div class="popover__wrapper">
                                <asp:LinkButton Text="text" runat="server" ID="lbtnAddReport" OnClick="lbtnAddReport_Click">
                                <img class="plus-icon" src="<%= ResolveUrl("~/Avatar/add-report.png") %>" alt="" />
                                </asp:LinkButton>
                                <!-- <a href="#">
                            </a> -->
                                <div class="popover__content">
                                    <p class="popover__message">Upload Report</p>

                                </div>
                            </div>

                            <img class="circle-line" src="<%= ResolveUrl("~/Avatar/circle-line.png") %>" alt="">
                            <a href="#" target="_blank">
                                <div class="lab-report w-70 d-flex align-items-center menu-circle-txt-color">
                                    <span>lab report</span>
                                    <div class="menu-circle">
                                        <img src="<%= ResolveUrl("~/Avatar/lab-report.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="#" target="_blank">
                                <div class="medication-prescription d-flex align-items-center menu-circle-txt-color">
                                    <span>medications/prescription</span>
                                    <div class="menu-circle">
                                        <img src="<%= ResolveUrl("~/Avatar/medications.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="#" target="_blank">
                                <div class="radiology d-flex align-items-center menu-circle-txt-color">
                                    <span>radiology</span>
                                    <div class="menu-circle">
                                        <img src="<%= ResolveUrl("~/Avatar/rediology.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="<%= ResolveUrl("~/reports.aspx") %>" target="_blank">
                                <div class="dentel-report d-flex align-items-center menu-circle-txt-color">
                                    <span>dental report</span>
                                    <div class="menu-circle">

                                        <img src="<%= ResolveUrl("~/Avatar/dental.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="#" target="_blank">
                                <div class="special-report d-flex align-items-center menu-circle-txt-color">
                                    <span>special report</span>
                                    <div class="menu-circle">
                                        <img src="<%= ResolveUrl("~/Avatar/spacial-report.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                            <a href="#" target="_blank">
                                <div class="mediclaim-insurance d-flex align-items-center menu-circle-txt-color">
                                    <span>mediclam/insurance</span>
                                    <div class="menu-circle">
                                        <img src="<%= ResolveUrl("~/Avatar/mediclaim.png") %>" alt="">
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
        <img class="plus-bottom-right" src="<%= ResolveUrl("~/Add Members/plus-2.png") %>" alt="" />
        <img class="blue-t-bottom-right" src="<%= ResolveUrl("~/Add Members/blue-trangle-5.png") %>" alt="" />
        <img class="blue-t-bottom-left" src="<%= ResolveUrl("~/Avatar/blue-trangle-3.png") %>" alt="" />
        <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none" />
        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
            CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
            <div class="row my-2">
                <div class="col-12">
                    <h2>Upload Report</h2>
                </div>
            </div>
            <div class="row w-100 my-3" style="width: 100%">
                <div class="col-12">
                    <div class="row">
                        <div class="col-5 lbl">
                            <label><strong>Select Report Type :</strong></label>
                        </div>
                        <div class="col-7">
                            <asp:DropDownList runat="server" ID="ddlReports" CssClass="select-report-dropdown">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-3" style="width: 100%">
                <div class="col-5 lbl">
                    <label><strong>File Name : </strong></label>
                </div>
                <div class="col-7">
                    <asp:TextBox runat="server" ID="txtReportName" CssClass="filename-txtbox" />
                </div>
            </div>
            <div class="row my-3" style="width: 100%">
                <div class="col-5 lbl">
                    <label><strong>Select File :</strong></label>
                </div>
                <div class="col-7">
                    <asp:FileUpload ID="imageFileUpload1" runat="server" />
                </div>
            </div>
            <br />
            <br />
            <asp:Button Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" CssClass="submit-btn" />
            <asp:Label Text="" ID="lblMsg" runat="server" />
            <asp:Button ID="btnClose" runat="server" OnClick="okLinkButton_Click" Text="Close" CssClass="close-btn" />
        </asp:Panel>
    
</asp:Content>

