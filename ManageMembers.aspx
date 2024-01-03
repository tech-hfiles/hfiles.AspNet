<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="hfiles.ManageMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a class="back-arrow-btn" href="javascript: history.go(-1)">
        <img src="../assets/back-arrow.png" alt="">Back</a>
    <div class="manage-members-div">
        <div class="row justify-content-center pt-5 h-100vh m-0">
            <div class="col-12 col-md-10 col-lg-8">
                <h2 class="text-center heading mb-5">Members List
                </h2>
                <div class="" style="overflow-x: auto">
                    <%--<table class="table table-bordered manage-members-table">
                        <thead>
                            <tr>
                                <th scope="col">SR. No</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mobile</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>@mdo</td>
                                <td>1234567890</td>
                                <td>
                                    <a href="addmember.aspx"><i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i></a>&nbsp; &nbsp;
             <a href="#"><i class="fa-solid fa-trash fa-1x color-thm-danger"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Mark</td>
                                <td>@mdo</td>
                                <td>1234567890</td>
                                <td>
                                    <a href="addmember.aspx"><i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i></a>&nbsp; &nbsp;
 <a href="#"><i class="fa-solid fa-trash fa-1x color-thm-danger"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Mark</td>
                                <td>@mdo</td>
                                <td>1234567890</td>
                                <td>
                                    <a href="addmember.aspx"><i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i></a>&nbsp; &nbsp;
 <a href="#"><i class="fa-solid fa-trash fa-1x color-thm-danger"></i></a>
                                </td>
                            </tr>
                        </tbody>


                    </table>--%>

                    <asp:GridView ID="gvMembers" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="gvMembers_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblSerialNumber" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Full Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFullname" Text='<%#Eval("user_firstname") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email ID">
                                <ItemTemplate>

                                    <asp:Label ID="lblEmail" Text='<%#Eval("user_email") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contat No.">
                                <ItemTemplate>

                                    <asp:Label ID="lblContact" Text='<%#Eval("user_contact") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                   <%-- <asp:LinkButton ID="LbtnEdit" runat="server" OnClick="LbtnEdit_Click" CommandArgument='<%#Eval("user_id") %>'>
                                        <i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i>
                                    </asp:LinkButton>--%>
                                    <%--<a href='<%# "addmember.aspx?UserId=" + Eval("user_id") %>'>
                                        <i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i>
                                    </a>--%>
                                    <asp:LinkButton ID="lbtnRemove" runat="server" OnClick="lbtnRemove_Click" CommandArgument='<%#Eval("user_id") %>'>
                                        <i class="fa-solid fa-trash fa-1x color-thm-danger"></i>
                                  <%--  <a href="#" onclick="return confirm('Are you sure you want to delete this user?');">
                                        
                                        <i class="fa-solid fa-trash fa-1x color-thm-danger"></i>
                                    </a>--%>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
