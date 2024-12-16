<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AllReports123.aspx.cs" Inherits="hfiles.AllReports123" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridviewscroll {
    max-height: 400px; /* Set the height for scrolling */
    overflow-y: scroll; /* Enable vertical scrolling */
    overflow-x: auto; /* Enable horizontal scrolling if needed */
    border: 1px solid #ccc; /* Optional: Add a border for clarity */



}






    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
         <br />

       <h2 style="text-align: center;">All Reports Details</h2>
         <br />
         
        <%--  <div id="popup" runat="server">  
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 600px; margin: auto;">
        <div class="modal-content" style="padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
            <div class="modal-header" style="border-bottom: 1px solid #ddd;">
                <h1 class="modal-title fs-5" id="exampleModalLabel">User's List</h1>
                
            </div>
            <div class="modal-body" style="padding: 20px;">
                <p class="card-title">
                    <strong>Report Name:</strong> <span id="modalReportName"></span>
                </p>
                <asp:TextBox ID="txtReportName" runat="server" CssClass="form-control mt-1" placeholder="Enter Report Name"></asp:TextBox>
                <br />
                <p class="mt-3">Edit Access</p>
                <asp:CheckBoxList ID="ddlMembers2" CssClass="form-control border-0" runat="server" SelectionMode="Multiple"></asp:CheckBoxList>
                <asp:Label Text="" ID="lblNoMember" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            <div class="modal-footer" style="border-top: 1px solid #ddd; margin-top: 20px;">
                <button type="button" id="btnClose" class="btn btn-secondary mx-3" data-bs-dismiss="modal">Close</button>
                <asp:LinkButton ID="lbtnSave" runat="server" Text="Save" OnClick="lbtnSave_Click" CssClass="btn btn-primary"></asp:LinkButton>
            </div>
        </div>
    </div>
</div>--%>



        <%-- <asp:Button ID="sharewhatsapp" runat="server" Text="Send whatsapp" ForeColor="Blue"  OnClick="sharewhatsapp_Click"/>--%>
          <asp:LinkButton ID="whatsappLinkButton" Text="SendWhatsApp" runat="server"  CommandName="Share" OnClick="sharewhatsapp_Click">
 <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#63E6BE" d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg></asp:LinkButton>

              </asp:LinkButton>
         <asp:Button ID="shareEmail" runat="server" Text="Send Email" ForeColor="Black"  OnClick="shareEmail_Click"/>

         
         <%--<asp:Label ID="lbldeletereport" runat="server" Visible="false"></asp:Label>--%>
         <div  class="gridviewscroll">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="Id" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>

               <asp:TemplateField HeaderText="Select">
            <ItemTemplate>
                <asp:CheckBox ID="chkSelect" runat="server" />
                <asp:HiddenField ID="hfReportUrl" runat="server" Value='<%# Eval("Id") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    
    <asp:BoundField DataField="ReportName" HeaderText="Report Name" />

   
    <asp:BoundField DataField="ReportType" HeaderText="Report Type" />

    
    <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />

    
    <asp:TemplateField HeaderText="Action">
        <ItemTemplate>
               <%--<a  target="_blank" class="btn btn-sm btn-primary" style="align-self: center">View File</a>--%>

             <asp:LinkButton ID="lnkViewFile" runat="server" CommandName="ViewFile" CommandArgument='<%# Eval("Id") %>' Text="View File" CssClass="btn btn-sm btn-primary"  OnClick="lnkViewFile_Click" />
           

           
                     <%--<asp:LinkButton ID="lbtnwhatsapplinkbutton" runat="server" Text="text"  CommandArgument='<%# Eval("Id") %>' >
              <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free 
                  Copyright 2024 Fonticons, Inc.--><path fill="#63E6BE" d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
            </asp:LinkButton>
            
            <!-- Edit Button -->
           <asp:LinkButton ID="GlbtnEdit" runat="server" Text="text" CommandArgument='<%# Eval("Id") %>' CommandName="EditRow">
               <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#FFD43B" d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z" />
                </svg>
            </asp:LinkButton>

            <!-- Delete Button -->
            <asp:LinkButton ID="lbtndelete" runat="server"  OnClientClick="return confirm('Are you sure you want to delete Report')" Text="text" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' >
                <image style="max-width:20px;max-height:20px;" src="../Suppor Group (BG  & Icons)/delete-icon.png"  />
            </asp:LinkButton>--%>

        </ItemTemplate>
    </asp:TemplateField>
</Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
             </div>

    </div>

</asp:Content>












<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
</asp:Content>
