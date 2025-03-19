<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ShareReports.aspx.cs" Inherits="hfiles.ShareReports" %>
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
              border: 2px solid black !important; 
 
          }
        
             @media (max-width: 768px) {
    .gridviewscroll {
        overflow: scroll;  /* Enables horizontal scrolling */
        /*display: block; */
        white-space: nowrap; /* Prevents text from wrapping */
    }
}

  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h2 style="text-align:center;color: #0331b5;margin-top: 15px;">Shared Reports</h2>
          <div class="gridviewscroll">
              <br />
              
              <br />
              <br />

          <asp:GridView ID="GridViewReports" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" Width="90%" HorizontalAlign="Center" 
              BorderStyle="Solid" BorderWidth="2px"
              CellPadding="10" GridLines="None" CssClass="custom-gridview">
              <AlternatingRowStyle BackColor="#f9f9f9" />
              <Columns>

                    <asp:BoundField DataField="ReportName" HeaderText="Report Name" SortExpression="ReportName" />

                  <asp:BoundField DataField="ReportType" HeaderText="Report Type" SortExpression="ReportType" />
                  <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="user_firstname" />
              
                  <asp:TemplateField HeaderText="Open Report">
                 <ItemTemplate>
                     <asp:LinkButton ID="lnkDownload" runat="server" 
                         CommandArgument='<%# Eval("ReportUrl") + "|" + Eval("ReportName") + "|" + Eval("ReportType") + "|" + Eval("Id") %>' 
                         OnClick="lnkDownload_Click" Text="open link" />
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





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
</asp:Content>
