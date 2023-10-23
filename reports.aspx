<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="reports.aspx.cs" Inherits="hfiles.reports" %>



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
        .footer {
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<body class="download-documents">--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:ScriptManager runat="server" />
    <div class="container-fluid download-doc-inner my-5" style="min-height: 84vh;">
        <div class="heading-title mb-3 py-1 px-5">
            <div class="row">
                <div class="col-md-6 py-3">
                    <h1 class="heading">Documents</h1>
                </div>
                <div class="col-md-6 text-center py-3 search-file">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                </div>
            </div>
        </div>
        <div class="doc-pdf py-5 h-100">
            <div class="container">
                <div class="row mb-5">
                    <asp:Repeater ID="rptReports" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3 my-2">
                                <div class="card text-center">
                                    <img src="../assets/pdf-doc.png" class="card-img-top" alt="pdf-thumbnail">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("ReportName") %></h5>
                                        <p class="card-text"><strong>Date: </strong><%# Eval("CreatedDate") %> </p>

                                        <a href="<%# ResolveUrl( string.Format("~/upload/report/{0}", Eval("ReportUrl"))) %>" target="_blank" class="btn btn-sm btn-primary">Download File</a>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>
        <!-- row -->
    </div>
</ContentTemplate>
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
</asp:Content>
