<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="avatar.aspx.cs" Inherits="hfiles.avatar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Avatar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style3.css" />
    <style>
        .avatar {
            background-image: url(../Avatar/avatar-background.png);
            background-size: 50%;
            background-repeat: no-repeat;
            /* background-position: center; */
            background-position-x: 40%;
            background-position-y: 50%;
        }


        @media only screen and (max-width: 414px) {
            .avatar {
                background-position-x: 75%;
                background-position-y: 25%;
                background-size: 100%;
            }
        }

        .main-div {
            background-image: url('../Avatar/lamp-light.png');
            background-repeat: no-repeat;
            background-position-x: 44%;
        }
    </style>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
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

        .select-report-dropdown, .filename-txtbox {
            width: 100%;
            border-radius: 10px;
            border: none;
            padding: 15px;
            outline: 0;
            box-shadow: none;
        }

        .modalPopup .lbl {
            text-align: left !important;
        }

        /* .filename-txtbox {
                width: 100%;
                padding: 5px;
                border-radius: 10px;
                border: 1px solid #0512B9;
            }
    */
        .submit-btn {
            padding: 15px 20px;
            background: linear-gradient(to right, #0512B9 0%, #081466 100%);
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 14px;
            width: 100px;
            cursor: pointer;
        }

        .close-btn {
            padding: 15px 20px;
            background: linear-gradient(to right, #f57272 0%, #fa5656 100%);
            color: #fff;
            border: none;
            border-radius: 10px;
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
        /*   * {
            border:1px solid #000;
        }*/
        body {
            overflow-x: hidden;
        }

        .file-input {
            display: inline-block;
            text-align: left;
            background: #fff;
            padding: 16px;
            width: 100%;
            position: relative;
            border-radius: 3px;
        }

            .file-input > [type='file'] {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
                z-index: 10;
                cursor: pointer;
            }

            .file-input > .button {
                display: inline-block;
                cursor: pointer;
                background: #eee;
                padding: 8px 16px;
                border-radius: 2px;
                margin-right: 8px;
            }

            .file-input:hover > .button {
                background: dodgerblue;
                color: white;
            }

            .file-input > .label {
                color: #333;
                white-space: nowrap;
                opacity: .3;
            }

            .file-input.-chosen > .label {
                opacity: 1;
            }

        @media (max-width: 2000px) and (min-width: 1000px) {
            .footer {
                position: relative;
            }
        }

        @media (max-width: 1200px) {
            .all-member-avatar-img {
                position: relative;
            }

                .all-member-avatar-img img {
                    position: absolute;
                    top: 200px;
                    left: 0px;
                }

            .avatar {
                background-position-y: 20%;
            }
        }
    </style>

    <%--below script for sweetalert --%>
    <script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel runat="server" ID="uplavatar">
        <ContentTemplate>
            <div class="avatar">
                <img class="plus-top-left" src="<%= ResolveUrl("~/Add Members/plus-1.png") %>" alt="" />
                <div class="main-div">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-12 p-0 h-50 d-flex justify-content-between align-items-center">
                            <div class="row">
                                <div class="col-6 p-0">
                                    <div class="avatar-left-sec">
                                        <ul class="m-0">
                                            <li class="border-bottom w-100px text-center pb-2 pb-lg-2 pb-xxl-4">
                                                <span class="plus-value">
                                                    <asp:Label Text="" ID="lblUserName" runat="server" Style="font-family: 'Red Hat Display', sans-serif" /></span></li>


                                            <%--<br />--%>
                                            <div id="repeaterdiv" runat="server">
                                                <li class="border-bottom w-100px text-center mb-2 mb-lg-3 mb-xxl-4">
                                                    <asp:Repeater ID="rptMember" runat="server" OnItemDataBound="rptMember_ItemDataBound">
                                                        <ItemTemplate>
                                                            <div id="divWrapper" runat="server">
                                                                <%-- <a href="#">--%>
                                                                <%--<a href="addmember.aspx">--%>
                                                                <%--  <img src="../Avatar/add-icon.png" alt=""
                                                                width="30px" />  --%>
                                                                <a>
                                                                    <img src="../My Data/default-user-profile.png" alt=""
                                                                        width="30px" />

                                                                    <div>
                                                                        <small class="add-member-name">
                                                                            <asp:LinkButton ID="member1" runat="server" Text='<%#Eval("user_FirstName") %>' OnClick="member1_Click" CommandArgument='<%#Eval("user_Id")+"|"+Eval("user_relation") %>'></asp:LinkButton>
                                                                            <asp:HiddenField ID="hfmemberid" runat="server" Value='<%#Eval("user_Id") %>' />
                                                                        </small>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </li>
                                            </div>
                                            <div id="listmembers" runat="server">
                                            </div>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col-6 d-flex align-items-end justify-content-end all-member-avatar-img">
                                    <asp:Image class="avatar-img" ID="imgAvatar" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-12 p-0 pt-5 d-flex align-items-center justify-content-end h-50">
                            <div class="menu-div">
                                <div class="inner-menu-div">
                                    <div class="popover__wrapper text-center">

                                        <asp:LinkButton Text="text" runat="server" ID="LinkButton1" OnClick="lbtnAddReport_Click">
                                <img class="plus-icon" src="<%= ResolveUrl("~/Avatar/add-report.png") %>" alt="" />
                                        </asp:LinkButton><br />
                                        <%-- <br />
                                        <span style="color: #0236b4; font-weight: 600; padding-block-end: 100px">ADD REPORT</span>--%>
                                        <%-- <div class="popover__content">
                                            <p class="popover__message">Upload Report</p>
                                        </div>--%>
                                    </div>
                                    <img class="circle-line" src="../Avatar/circle-line.png" alt="" />
                                    <div class="lab-report w-60 h-75px menu-circle-txt-color">
                                        <div class="d-flex align-items-center h-75px">
                                            <span>lab report</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=3">
                                                    <img src="../Avatar/lab-report.png" alt="" /></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="immunization h-75px w-70 menu-circle-txt-color">
                                        <div class="d-flex align-items-center h-75px">
                                            <span>Immunization</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=5">
                                                    <img src="../Avatar/immunization.png" alt="" /></a>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="medication-prescription h-75px d-flex align-items-center menu-circle-txt-color w-300">
                                        <div class="d-flex align-items-center">
                                            <span>medications/prescription</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=6">
                                                    <img src="../Avatar/medications.png" alt="" /></a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="radiology h-75px d-flex align-items-center menu-circle-txt-color">
                                        <div class="d-flex align-items-center h-75px">
                                            <span>radiology</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=7">
                                                    <img src="../Avatar/rediology.png" alt="" /></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="opthalmology-icon h-75px d-flex align-items-center menu-circle-txt-color">
                                        <div class="d-flex align-items-center">
                                            <span>Opthalmology</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=8">
                                                    <img src="../Avatar/Opthalmologyicon.png" alt="" />
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dentel-report h-75px d-flex align-items-center menu-circle-txt-color">
                                        <div class="d-flex align-items-center">
                                            <span>dental report</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=4">
                                                    <img src="../Avatar/dental.png" alt=""></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="special-report h-75px d-flex align-items-center menu-circle-txt-color">
                                        <div class="d-flex align-items-center">
                                            <span>special report</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=9">
                                                    <img src="../Avatar/spacial-report.png" alt="" /></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mediclaim-insurance h-75px d-flex align-items-center menu-circle-txt-color">
                                        <div class="d-flex align-items-end">
                                            <span>mediclaim/insurance</span>
                                            <div class="menu-circle">
                                                <a href="reports.aspx?rid=10">
                                                    <img src="../Avatar/mediclaim.png" alt="" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                    <div class="row w-100 my-1" style="width: 100%">
                        <div class="col-12">
                            <div class="row">
                                <%-- <div class="col-5 lbl">
                                </div>--%>
                                <div class="col-12 text-start">
                                    <label><strong>Select Report Type :</strong></label>
                                    <asp:DropDownList CssClass="select-report-dropdown" runat="server" ID="ddlReports">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Report Type" ControlToValidate="ddlReports" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-1" style="width: 100%">
                        <%-- <div class="col-5 lbl">
                        </div>--%>
                        <div class="col-12 text-start">
                            <label><strong>File Name : </strong></label>
                            <asp:TextBox runat="server" ID="txtReportName" CssClass="filename-txtbox" required />
                        </div>
                    </div>

                    <div class="row my-2" style="width: 100%">
                        <%-- <div class="col-5 lbl">
                        </div>--%>
                        <div class="col-12 text-start">
                            <%--  <asp:FileUpload ID="FileUpload1" runat="server" required/>--%>

                            <label><strong>Select File :</strong></label>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class='file-input'>
                                        <asp:FileUpload ID="imageFileUpload1" CssClass="l" runat="server" required />
                                        <span class='button'>Choose</span>
                                        <span class='label' data-js-label>No file selected</label>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSubmit" />

                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="row w-100 my-3" style="width: 100%">
                        <div class="col-12">
                            <div class="row">
                                <%-- <div class="col-5 lbl">
                                </div>--%>
                                <div class="col-12 text-start">
                                    <label><strong>Give View Access To :</strong></label><br />
                                    <asp:CheckBoxList ID="chklist" runat="server"></asp:CheckBoxList>
                                    <asp:CheckBoxList ID="ddlMembers2" CssClass="form-control border-0" runat="server" SelectionMode="Multiple"></asp:CheckBoxList>
                                    <p>(If none selected then the document will be private)</p>
                                    <%--<asp:ListBox ID="ddlMembers1" CssClass="select-report-dropdown" runat="server" SelectionMode="Multiple"></asp:ListBox>--%>

                                    <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" InitialValue="0" runat="server" SetFocusOnError="true" ControlToValidate="ddlMembers2" ErrorMessage="Select Members" Display="Dynamic" ValidationGroup="a"></asp:RequiredFieldValidator>--%>
                                    <%--      <asp:DropDownList CssClass="select-report-dropdown" runat="server" ID="ddlMembers">
                                        <%--   <asp:ListItem Text="Member1"></asp:ListItem>
                                        <asp:ListItem Text="Member2"></asp:ListItem>
                                        <asp:ListItem Text="Member3"></asp:ListItem>
                                    </asp:DropDownList>--%>
                                    <%-- <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select Member" ControlToValidate="ddlMembers2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    --%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br />
                    <br />
                    <asp:Button Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" CssClass="submit-btn" />
                    <%--<asp:Label Text="" ID="lblMsg" runat="server" />--%>
                    <asp:Button ID="btnClose" runat="server" OnClick="okLinkButton_Click" Text="Close" CssClass="close-btn" />
                </asp:Panel>
            </div>
            <div id="toast" runat="server" style="display: none">
                <div id="img">Icon</div>
                <div id="desc">A notification message..</div>
            </div>

        </ContentTemplate>
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="btnSubmit" />--%>
            <%-- <asp:AsyncPostBackTrigger ControlID="repeaterdiv" EventName="Click"/>--%>
            <%--    <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />--%>
            <asp:AsyncPostBackTrigger ControlID="btnClose" EventName="Click" />
            <%--            <asp:AsyncPostBackTrigger ControlID="LinkButton1" />--%>
            <%--            <asp:PostBackTrigger ControlID="imageFileUpload1" />--%>
        </Triggers>
    </asp:UpdatePanel>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        function Confirm(ctl, event) {
            event.preventDefault();
            swal({
                title: "Confirm Logout?",
                text: "Do you really want to log this Account out?",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: true,
                closeOnCancel: true
            },
                function (isConfirm) {
                    if (isConfirm) {
                        return true;
                    } else {
                        return false;
                    }
                });
        }
        function launch_toast() {
            var x = document.getElementById("toast")
            x.className = "show";
            setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
        }
        //launch_toast()
        // Also see: https://www.quirksmode.org/dom/inputfile.html

        //var inputs = document.querySelectorAll('.file-input')

        //for (var i = 0, len = inputs.length; i < len; i++) {
        //    customInput(inputs[i])
        //}

        //function customInput(el) {
        //    const fileInput = el.querySelector('[type="file"]')
        //    const label = el.querySelector('[data-js-label]')

        //    fileInput.onchange =
        //        fileInput.onmouseout = function () {
        //            if (!fileInput.value) return

        //            var value = fileInput.value.replace(/^.*[\\\/]/, '')
        //            el.className += ' -chosen'
        //            label.innerText = value
        //        }
        //}
    </script>

</asp:Content>

