<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AllReports123.aspx.cs" Inherits="hfiles.AllReports123" %>
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
         /*display: flex;*/
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

         . /*back-arrow-btn {
             top: 10% !important;
         }*/
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
             /*position: relative;*/
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
 </style>





  <%--  <style>
        /* General styles for responsiveness */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Container for scrolling div */
div[style*="overflow: auto"] {
    max-width: 100%;
    margin: 0 auto;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Center the header */
h2 {
    font-size: 1.5rem;
    text-align: center;
    margin: 10px 0;
}

/* Link button styling */
asp\:LinkButton img {
    vertical-align: middle;
}

.report-share-icon {
    display: inline-block;
    margin-right: 5px;
    vertical-align: middle;
}

/* GridView responsiveness */
.gridviewscroll {
    overflow-x: auto;
    margin: 10px 0;
}

asp\:GridView {
    width: 100%;
    border-collapse: collapse;
    table-layout: auto;
}

asp\:GridView th,
asp\:GridView td {
    text-align: left;
    padding: 8px;
    border: 1px solid #ddd;
    word-wrap: break-word;
}

/* Adjust the font size for smaller devices */
@media (max-width: 768px) {
    h2 {
        font-size: 1.25rem;
    }

    .gridviewscroll {
        margin: 5px 0;
    }

    asp\:GridView th,
    asp\:GridView td {
        font-size: 0.9rem;
        padding: 6px;
    }

    asp\:GridView th {
        text-align: center;
    }
}

/* Adjust the layout for very small devices */
@media (max-width: 480px) {
    h2 {
        font-size: 1rem;
    }

    asp\:LinkButton {
        display: block;
        margin: 5px 0;
    }

    asp\:GridView th,
    asp\:GridView td {
        font-size: 0.8rem;
    }
}

    </style>--%>



  





  
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:UpdatePanel runat="server">
    <ContentTemplate>
     <div style="overflow: auto; max-height: 90vh; max-width: 100%; border: 1px solid #ddd;">
         <br />
                  <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
    <a class="back-arrow-btn-2" href="avatar2.aspx" style="margin-left: 20px;">Back
    </a>
</div>

       <h2 style="text-align: center;">All Reports Details</h2>
         <br />
       

        <%-- <asp:Button ID="sharewhatsapp" runat="server" Text="Send whatsapp" ForeColor="Blue"  OnClick="sharewhatsapp_Click"/>--%>
          <asp:LinkButton ID="whatsappLinkButton" Text="" runat="server"  CommandName="Share" OnClick="sharewhatsapp_Click" style="margin-left: 20px;">
 <svg xmlns="http://www.w3.org/2000/svg" height="40" width="30" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#63E6BE" d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg></asp:LinkButton>

              </asp:LinkButton>
       <%--  <asp:Button ID="shareEmail" runat="server" Text="Send Email" ForeColor="Black"  OnClick="shareEmail_Click"/>--%>

         <asp:LinkButton ID="lbtnshareEmail" Text="SendEmail" runat="server"  CommandName="Share" OnClick="shareEmail_Click" style="margin-left: 20px;">
              <img class="report-share-icon" src="../assets/gmail.png" style="width: 30px; height: 40px;"  />
         </asp:LinkButton>

         
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
             

             <asp:LinkButton ID="lnkViewFile" runat="server" CommandName="ViewFile" CommandArgument='<%# Eval("Id") %>' Text="View File" CssClass="btn btn-sm btn-primary"  OnClick="lnkViewFile_Click" />
           

           

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
         </ContentTemplate>
             </asp:UpdatePanel>



</asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">


</asp:Content>
