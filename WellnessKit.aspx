<%@ Page Title="Clinics" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="WellnessKit.aspx.cs" Inherits="hfiles.Clinics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .page-title {
            font-size: 2rem;
            color: #3a3a3a;
            text-align: center;
            padding: 20px;
            margin-top: 30px;
        }

        .btn {
            margin-bottom: 10px;
        }

        .table-container {
            position: relative;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 90%;
            max-width: 1200px;
        }

        .add-new-clinic {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

            .add-new-clinic:hover {
                background-color: #0056b3;
            }


        .table-container .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 1rem;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table td, .table th {
            padding: 12px;
            vertical-align: middle;
        }

        .table input[type="text"], .table select, .table input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }

        .table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

            .pagination .page-link {
                margin: 0 5px;
                padding: 10px 15px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
            }

                .pagination .page-link:hover {
                    background-color: #0056b3;
                }

            .pagination .active .page-link {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .pagination .disabled .page-link {
                background-color: #e0e0e0;
                border-color: #e0e0e0;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Clinic Listings</h2>

    <div class="table-container">
        <a href="AddClinics.aspx" class="btn btn-primary add-new-clinic">Add New Clinic</a><br />
        <br />

        <asp:GridView ID="gvClinics" runat="server" AutoGenerateColumns="False" CssClass="table" AllowPaging="True" AllowSorting="True" PageSize="5"
            OnPageIndexChanging="gvClinics_PageIndexChanging" OnSorting="gvClinics_Sorting" OnRowEditing="gvClinics_RowEditing" OnRowUpdating="gvClinics_RowUpdating"
            OnRowCancelingEdit="gvClinics_RowCancelingEdit" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" Visible="False" />

                <asp:TemplateField HeaderText="Clinic Name">
                    <ItemTemplate>
                        <%# Eval("clinic") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtClinic" runat="server" Text='<%# Eval("clinic") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Clinic Logo">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("image").ToString()) %>' alt="Clinic Logo" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="fuLogo" runat="server" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%# Eval("address") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("address") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Offer">
                    <ItemTemplate>
                        <%# Eval("offer") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOffer" runat="server" Text='<%# Eval("offer") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%# Eval("Category") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Dental" Value="Dental" />
                            <asp:ListItem Text="Medical" Value="Medical" />
                            <asp:ListItem Text="Cosmetic" Value="Cosmetic" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ButtonType="Button" />
            </Columns>
        </asp:GridView>

        <div class="pagination">
            <asp:Label ID="lblPager" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.js"></script>
</asp:Content>
