<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ManageMembers.aspx.cs" Inherits="hfiles.ManageMembers" %>

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
<%--    <asp:ScriptManager ID="scm1" runat="server"></asp:ScriptManager>--%>
    <a class="back-arrow-btn" href="javascript: history.go(-1)">
        <img src="../assets/back-arrow.png" alt="">Back</a>
    <div class="manage-members-div">
        <div class="row justify-content-center pt-5 m-0" style="min-height: 100vh">
            <div class="col-12 col-md-10 col-lg-10">
                        <h2 class="text-center heading mb-5">Request List
                        </h2>
                <div class="row">
                  
                    <div class="col-12 col-md-4 col-xl-6 py-3 search-file">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" placeholder="Search by Name" />
                    </div>
                </div>

                <%-- <div class="col-12 col-md-4 col-xl-6 text-center py-3 search-file">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                </div>--%>
                <%--<asp:GridView ID="friendrequests" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="friendrequests_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                    <Columns>
                        <asp:TemplateField HeaderText="HFiles Number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerialNumber" runat="server" Text='<%#Eval("user_membernumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblHFilesNumber" Text='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="acceptBtn" runat="server" Text="Accept" OnClick="acceptBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="rejectBtn" runat="server" Text="Reject" OnClick="rejectBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
                <asp:UpdatePanel ID="uplManageMembers" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <%-- <div class="col-md-4 col-lg-3 my-2">--%>

                            <%--  <h2 class="text-center heading mb-5">Requests </h2>--%>
                            <%-- <div class="col-md-4 my-2">
                                        <div class="card text-start px-3" style="height: 100%;">
                                            <a href='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' class="btn btn-sm btn-primary" style="align-self: center; height: 100px; object-fit: cover;">
                                            </a>
                                            <div class="card-body" style="align-self: center;">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
                                            </div>
                                        </div>
                                    </div>--%>
                            <%--<div class="card text-start px-3">
                                           
                                            <a href="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' target="_blank" class="btn btn-sm btn-primary" style="align-self: center">
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>


                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
</div>
                                        </div>--%>

                            <div>
                                <div class="row justify-content-center border-bottom pb-2">

                                    <asp:Repeater ID="rptRequests" runat="server">
                                        <ItemTemplate>
                                            <div class="col-12 col-md-12 col-xl-6 my-3">
                                                <div class="member-list-cards p-3">
                                                    <div class="row">
                                                        <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                                            <div class="text-center">
                                                                <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" />
                                                                <%-- <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />--%>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-5">
                                                            <div class="members-details py-2">
                                                                <div class="px-3 tex">
                                                                    <h4><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h4>
                                                                </div>
                                                                <ul>
                                                                    <li>
                                                                        <strong>HF - ID : </strong><%# Eval("user_membernumber")%>
                                                                    </li>
                                                                    <li>
                                                                        <strong>Email: </strong><%# Eval("user_email")%>
                                                                    </li>
                                                                    <li>
                                                                        <strong>Mobile No :</strong><%# Eval("user_contact")%>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                                            <div class="d-flex d-md-block">
                                                                <div class="my-4 mx-1">
                                                                    <asp:LinkButton class="member-accept-btn member-action-btn" ID="LinkButton1" runat="server" Text="Accept" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                                    <%--  <a class="member-accept-btn member-action-btn" href="#">Accept</a>--%>
                                                                </div>
                                                                <div class="my-4 mx-1">
                                                                    <asp:LinkButton ID="LinkButton2" class="member-rejects-btn member-action-btn" runat="server" Text="Reject" OnClick="rejectBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                                    <%-- <a class="member-rejects-btn member-action-btn" href="#">Reject</a>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>

                            <%--</div>--%>
                        </div>
                        <div>
                            <div class="row justify-content-center">
                                <h2 class="text-center heading my-3">Members List</h2>
                                <asp:Repeater ID="gvMembers1" runat="server">
                                    <ItemTemplate>
                                        <div class="col-12 col-md-12 col-xl-6 my-3">
                                            <div class="member-list-cards p-3">
                                                <div class="row">
                                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                                        <div class="text-center">
                                                            <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" />
                                                            <%-- <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-5">
                                                        <div class="members-details py-2">
                                                            <div class="px-3 tex">
                                                                <h4><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h4>
                                                            </div>
                                                            <ul>
                                                                <li>
                                                                    <strong>HF - ID : </strong><%# Eval("user_membernumber")%>
                                                                </li>
                                                                <li>
                                                                    <strong>Email: </strong><%# Eval("user_email")%>
                                                                </li>
                                                                <li>
                                                                    <strong>Mobile No :</strong><%# Eval("user_contact")%>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                                        <div class="d-flex d-md-block">
                                                            <div class="my-4 mx-1">
                                                                <asp:LinkButton ID="lbtnRemove" class="member-rejects-btn member-action-btn" runat="server" OnClick="lbtnRemove_Click" Text="Delete" CommandArgument='<%#Eval("user_id") %>'>

                                                                </asp:LinkButton>

                                                                <%--  <a class="member-accept-btn member-action-btn" href="#">Accept</a>--%>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>


                        <%--<asp:GridView ID="gvMembers" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="gvMembers_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                                <Columns>
                                    <asp:TemplateField HeaderText="Serial Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSerialNumber" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HFiles Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHFilesNumber" Text='<%#Eval("user_membernumber") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="profileImage" runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : "~/upload/" + Eval("user_image") %>' Height="50px" Width="50px"></asp:Image>
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

                        <%--  <a href="#" onclick="return confirm('Are you sure you want to delete this user?');">
                                        
                                        <i class="fa-solid fa-trash fa-1x color-thm-danger"></i>
                                    </a>--%>

                        <%--   </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>--%>

                        <div id="toast">
                            <div id="img">
                                <img src="assets/h-file-logo-white.png" />
                            </div>
                            <div id="desc"></div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <%--<div>
                    <h2 class="text-center heading mb-5">My Members </h2>
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID : </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No :</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID: </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No:</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
            </div>
        </div>
        <%----%>
    </div>

    <%-- </div>
    </div>--%>
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
