<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AllReports.aspx.cs" Inherits="hfiles.AllReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .seleced-option-color {
            color: #0512b9 !important;
        }
        #contentPlaceHolder1_ddlCountry {
            color: #0512b9 !important;
        }
        input::placeholder, input::selection {
            color: #0512b9 !important;
        }
        .signin-form input::placeholder {
            color: #0512b9 !important;
        }
        .Addbasicbtnboth {
            justify-content: space-around;
            gap: 10px;
        }
            .Addbasicbtnboth .button-change {
                padding: 10px 12px;
                border-radius: 50px;
                border: 0;
                outline: 0;
                color: #0512b9;
                cursor: pointer;
                margin-top: 20px;
                font-family: 'Red Hat Display', Sans-serif !important;
                font-weight: 700;
                font-size: 13px;
                background-color: #fdd001;
                width: 200px; /* Set a fixed width for consistent size */
            }

        .hidden {
            visibility: hidden;
        }

        .profile-img img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            object-position: center;
        }

        @media (max-width: 480px) {
            .Addbasicbtnboth button {
                padding: 8px 15px;
                font-size: 9px;
            }
        }

        @media (max-width: 540px) {
            .Addbasicbtnboth {
                flex-direction: column;
            }

                .Addbasicbtnboth button {
                    padding: 8px 10px;
                    font-size: 9px;
                }

            .profile-img img {
                width: 200px;
                height: 200px;
            }           
        }

        @media (max-width: 280px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 9px;
            }
        }

        @media (min-width: 700px) and (max-width: 1022px) {
            .footer {
                position: absolute !important;
                width: 100%;
                bottom: 0;
            }

            .user-info-main .profile-img img {
                width: 200px;
                height: 200px;
            }

            .Addbasicbtnboth button {
                font-size: 10px;
            }

            .Addbasicbtnboth {
                flex-direction: column;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .Addbasicbtnboth button {
                padding: 8px 10px;
                font-size: 10px
            }

            .back-arrow-btn {
                top: 10% !important;
            }
        }

        @media (min-width: 1022px) and (min-height: 1366px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0px !important;
            }
        }

        @media (min-width: 1024px) and (min-height: 600px) {
            .footer {
            }

            .user-info-main {
                height: auto;
            }
        }

        @media (min-width: 1300px) {
            .footer {
                position: absolute !important;
                width: 100%;
                bottom: 0;
            }

            .user-info-main {
                height: auto !important;
            }

            .profile-img img {
                width: 400px;
                height: 400px;
            }
        }

        .oval-button {
            background-color: transparent;
            color: black; 
            border: 2px solid black; 
            padding: 10px 30px; 
            font-size: 16px; 
            text-align: center; 
            cursor: pointer; 
            border-radius: 25px; 
            transition: background-color 0.3s ease, color 0.3s ease; 
            display: inline-flex; 
            align-items: center;
            justify-content: center;
        }


          
            .oval-button i {
                margin-right: 5px; 
                font-size: 18px; 
            }

            .oval-button:hover {
                background-color: #45a049; 
            }


        .custom-gridview {
            border: 3px solid #2196F3; 
            border-radius: 10px; 
            overflow: hidden;
        }

          
            .custom-gridview th {
                border-bottom: 2px solid #0331b5;
                padding: 15px;
                text-align: center;
            }

          
            .custom-gridview td {
                border-right: 1px solid #ddd; 
                border-bottom: 1px solid #ddd; 
                padding: 10px;
                text-align: center;
            }

             
                .custom-gridview td:last-child {
                    border-right: none;
                }

        
            .custom-gridview tr:nth-child(odd) {
                background-color: #f9f9f9; 
            }

         
            .custom-gridview .selected {
                background-color: #4CAF50; 
                color: white;
            }

           
            .custom-gridview tfoot {
                border-top: 2px solid #4CAF50; 
                text-align: center;
                padding: 10px;
            }

            .custom-gridview tr:hover {
                background-color: #ADD8E6 !important; 
            }
             search-file {
    margin-right: 0 !important; 
}

.position-relative {
    width: 20%;
    max-width: 250px; 
}

.search-icon {
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #aaa;
    position: absolute;
    pointer-events: none; 
}

.responsive-dropdown {
    display: block;
    width: auto; 
    margin-bottom: -43px;
}

.dropdown-container {
    display: flex;
    justify-content: flex-end;
    width: 100%;
    padding-right: 10px; 
  
}
@media (max-width: 768px) { 
    .dropdown-container {
        justify-content: flex-end;
        padding-right: 5px;
    }
}

@media (max-width: 480px) {
    .dropdown-container {
        justify-content: flex-end;
        padding-right: 5px;
    }
}


    </style>




    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


    <%--<asp:Content ID="Content3" ContentPlaceHolderID="" runat="server">
    --%>
    <%--  <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>

    <%--            </ContentTemplate>
</asp:UpdatePanel> 
    </asp:Content>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
                 <div class="modal fade" id="ShareModal" tabindex="-1" aria-labelledby="ShareModalLabel" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
               
                 <div class="modal-header">
                     <h5 class="modal-title" id="ShareModalLabel">Share as File</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                 </div>

               
                 <div class="modal-body">


                           
                    <asp:LinkButton ID="whatsappLinkButton" Text="WhatsApp" runat="server" CommandName="Share"
                        OnClick="sharewhatsapp_Click">
                        <img src="../assets/whatsapp.jpg" alt="Whatsapp Icon" style="width: 20px; height: 20px;" />
                        <span style="color: #63E6BE; font-weight: bold;">WhatsApp</span>

                    </asp:LinkButton>
                   
                                     <asp:LinkButton ID="lbtnshareEmail" Text="Email" runat="server" CommandName="Share"
                    OnClick="shareEmail_Click" >
    <img src="../assets/gmail.png" alt="Email Icon" style="width: 20px; height: 20px;" />
    <span style="color: #D44638; font-weight: bold;"> Email</span>

                </asp:LinkButton>
                   
                 </div>

             </div>
         </div>
     </div>
            <div style="overflow: auto; max-height: 90vh; max-width: 100%; border: 1px solid #ddd; padding-bottom: 10vh;">

                <br />
                <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
                    <%--   <asp:Button ID="btnShare" runat="server" CssClass="oval-button" OnClick="btnShare_Click" Text="&nbsp;&nbsp;<i class='fas fa-share'></i>&nbsp;&nbsp;Share" />    --%>

                    <a class="back-arrow-btn-2" href="MyHFiles.aspx" style="margin-left: 20px;">Back
                    </a>
                </div>
                
                <%-- <div class="col-md-4 d-flex justify-content-md-end justify-content-center align-items-center py-2 search-file" style="margin-right: 20px;">
                     <i class="fas fa-magnifying-glass"></i>
                     <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                 </div>--%>
                                <div class="dropdown-container">
                    <div class="position-relative w-100">
                        <asp:TextBox ID="SearchInput" CssClass="form-control pr-5" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                        <i class="fas fa-magnifying-glass position-absolute" style="right: 10px; top: 50%; transform: translateY(-50%); color: #aaa;"></i>
                    </div>
                </div>


                <h2 style="text-align: center; color: #0331b5;">All Reports Details</h2>
                                <br />
                          <div class="dropdown-container">
                        <asp:DropDownList ID="Dropmembers" AutoPostBack="true" OnSelectedIndexChanged="Dropmembers_SelectedIndexChanged" runat="server" CssClass="responsive-dropdown"></asp:DropDownList>
                    </div>
                <br />


                <div class="row mb-5">
                    <asp:Repeater ID="rptReports" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 col-lg-4 my-2">

                                <div class="card text-start px-3 h-100">
                            
                        </ItemTemplate>
                    </asp:Repeater>

                </div>


               



                <%--<div class="share1" >
           <asp:LinkButton ID="lnkShare" class="oval-button" OnClick="btnshare_Click" runat="server" CommandName="Share" CommandArgument='<%# Eval("Id") %>' 
                 Text="Share"  style="margin-left: 20px;" />
             </div>--%>
                <div class="share" id="wgshare" style="display: none;">

            

               

                    
                </div>
                <br />
                <br />
                <div class="sharebtn" id="shareb">
                    <asp:LinkButton ID="lnkShare" class="oval-button" data-bs-toggle="modal" data-bs-target="#ShareModal"  runat="server"  CommandName="Share"
                        Text="Share" Style="margin-left: 20px;margin-bottom: 10px;margin-top: -46px;"> &nbsp;&nbsp;<i class='fas fa-share'></i>&nbsp;Share</asp:LinkButton>
                </div>

              
                <div class="gridviewscroll">



                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" Width="90%" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting"
                        BorderStyle="Solid" BorderWidth="2px"
                        CellPadding="10" GridLines="None" CssClass="custom-gridview">
                        <AlternatingRowStyle BackColor="#f9f9f9" />
                        <Columns>

                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                    <asp:HiddenField ID="hfReportUrl" runat="server" Value='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ReportName" HeaderText="Report Name" SortExpression="ReportName" />
                          
                            <asp:BoundField DataField="ReportType" HeaderText="Report Type" SortExpression="ReportType" />
                            <asp:BoundField DataField="user_firstname" HeaderText="First Name" SortExpression="user_firstname" />
                        
                            <asp:BoundField DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate"
                                DataFormatString="{0:yyyy-MM-dd}" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkViewFile" runat="server" CommandName="ViewFile" CommandArgument='<%# Eval("Id") %>'
                                        Text="View File" CssClass="oval-button" OnClick="lnkViewFile_Click" />
                                     &nbsp;
                                        <asp:LinkButton Text="text" ID="lbtnremove" OnClick="lbtnremove_Click" OnClientClick="return confirm('This will permanently delete Reports')" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id")%>'>
                                           <image style="max-width:20px;max-height:20px;" src="../Suppor Group (BG  & Icons)/delete-icon.png"  />

                                        </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#f9f9f9" ForeColor="Black" />
                        <HeaderStyle BackColor="#0331b5" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#f9f9f9" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#ffffff" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#45a049" Font-Bold="True" ForeColor="Red" />
                    </asp:GridView>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>





