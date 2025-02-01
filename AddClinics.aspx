<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AddClinics.aspx.cs" Inherits="hfiles.AddClinics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f7fc;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 10px;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            padding: 10px 20px;
        }

            .btn-primary:hover {
                background-color: #45a049;
            }

        .error-message {
            color: red;
            font-size: 14px;
        }

        .success-message {
            color: green;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="text-center">Add New Clinic</h2>
        <div>
            <div class="form-group">
                <label for="txtClinicName">Clinic Name:</label>
                <asp:TextBox ID="txtClinicName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtClinicOffer">Clinic Offer:</label>
                <asp:TextBox ID="txtClinicOffer" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtClinicAddress">Clinic Address:</label>
                <asp:TextBox ID="txtClinicAddress" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="ddlClinicCategory">Clinic Category:</label>
                <asp:DropDownList ID="ddlClinicCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                    <asp:ListItem Text="Dental" Value="Dental"></asp:ListItem>
                    <asp:ListItem Text="Medical" Value="Medical"></asp:ListItem>
                    <asp:ListItem Text="Cosmetic" Value="Cosmetic"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="fileClinicLogo">Clinic Logo:</label>
                <asp:FileUpload ID="fileClinicLogo" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group text-center">
                <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            </div>
            <div class="text-center">
                <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</asp:Content>
