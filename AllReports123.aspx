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

        /*back-arrow-btn {
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

    .oval-button {


   
    background-color: transparent; /* Transparent background */
    color: black;                  /* Black text */
    border: 2px solid black;       /* Black border with 2px thickness */
    padding: 10px 30px;            /* Padding to control button size */
    font-size: 16px;               /* Font size */
    text-align: center;            /* Center the text */
    cursor: pointer;              /* Pointer cursor on hover */
    border-radius: 25px;           /* Make the button oval */
    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition */
    display: inline-flex;          /* Flexbox for icon and text alignment */
    align-items: center;           /* Align items in the center */
    justify-content: center;       /* Center content */
}

/* Hover effect */

/* Styling for the icon */
.oval-button i {
    margin-right: 5px;          /* Space between icon and text */
    font-size: 18px;            /* Icon size */
}

.oval-button:hover {
    background-color: #45a049;  /*Darker green when hovered */
}


    .custom-gridview {
        border: 3px solid #2196F3;  /* Blue border for the entire GridView */
        border-radius: 10px;         /* Rounded corners for the GridView */
        overflow: hidden;            /* Ensure that rounded corners work well */
    }

    /* Header Row Border */
    .custom-gridview th {
        border-bottom: 2px solid #0331b5; /* Green border for header */
        padding: 15px;
        text-align: center;
    }

    /* Row Borders */
    .custom-gridview td {
        border-right: 1px solid #ddd;  /* Light gray right borders for cells */
        border-bottom: 1px solid #ddd; /* Light gray bottom borders for cells */
        padding: 10px;
        text-align: center;
    }

    /* Remove the right border from the last column */
    .custom-gridview td:last-child {
        border-right: none;
    }

    /* Styling for alternating rows */
    .custom-gridview tr:nth-child(odd) {
        background-color: #f9f9f9;  /* Light gray for odd rows */
    }

    /* Selected Row Styling */
    .custom-gridview .selected {
        background-color: #4CAF50;  /* Green background for selected row */
        color: white;
    }

    /* Footer Styling */
    .custom-gridview tfoot {
        border-top: 2px solid #4CAF50; /* Green border for footer */
        text-align: center;
        padding: 10px;
    }

    .custom-gridview tr:hover {
    background-color: #ADD8E6 !important; /* Darker green when hovered */
}
 </style>
    <script type="text/javascript">
        function hideButton() {

            var share = document.getElementById('shareb');
            var sharebtn = document.getElementById('wgshare');
           
        

            if (sharebtn.style.display === 'none') {
                sharebtn.style.display = 'inline-block';
                document.getElementById('<%= whatsappLinkButton.ClientID %>').style.display = 'inline-block';
                document.getElementById('<%= lbtnshareEmail.ClientID %>').style.display = 'inline-block';// Show the div
            } else {
                share.style.display = 'none'; // Hide the div
            }
        // Hide the button by setting its display style to 'none'
       <%-- document.getElementById('<%= lnkShare.ClientID %>').style.display = 'none';
        document.getElementById('<%= whatsappLinkButton.ClientID %>').style.display = 'inline-block';
        document.getElementById('<%= lbtnshareEmail.ClientID %>').style.display = 'inline-block';--%>
    }
</script>




 



  





  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

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
    
    <%-- <div style="overflow: auto; max-height: 90vh; max-width: 100%; border: 1px solid #dddd;">--%>
         <br />
                                <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
            <%--   <asp:Button ID="btnShare" runat="server" CssClass="oval-button" OnClick="btnShare_Click" Text="&nbsp;&nbsp;<i class='fas fa-share'></i>&nbsp;&nbsp;Share" />    --%>    
     
    <a class="back-arrow-btn-2" href="avatar2.aspx" style="margin-left: 20px;">Back
    </a>
</div>
            

 <h2 style="text-align: center;"><u>All Reports Details</u></h2>
         <br />
         <%--<div class="share1" >
           <asp:LinkButton ID="lnkShare" class="oval-button" OnClick="btnshare_Click" runat="server" CommandName="Share" CommandArgument='<%# Eval("Id") %>' 
                 Text="Share"  style="margin-left: 20px;" />
             </div>--%>
       <div class="share" id="wgshare" style="display: none;">

        <%-- <asp:Button ID="sharewhatsapp" runat="server" Text="Send whatsapp" ForeColor="Blue"  OnClick="sharewhatsapp_Click"/>--%>
        <asp:LinkButton ID="whatsappLinkButton" Text="WhatsApp" runat="server" CommandName="Share" 
    OnClick="sharewhatsapp_Click" style="display: inline-block; padding: 10px; margin-left: 20px; 
    border: 1px solid #63E6BE; border-radius: 8px; background-color: #f0f0f0; text-align: center; 
    text-decoration: none; color: #000; font-family: Arial, sans-serif; font-size: 14px; display:none;" >
    <div style="display: flex; align-items: center; gap: 8px;">
        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 448 512">
            <path fill="#63E6BE" 
                d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7 .9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/>
        </svg>
        <span style="color: #63E6BE; font-weight: bold;">WhatsApp</span>
    </div>
</asp:LinkButton>

       <%--  <asp:Button ID="shareEmail" runat="server" Text="Send Email" ForeColor="Black"  OnClick="shareEmail_Click"/>--%>

        <asp:LinkButton ID="lbtnshareEmail" Text="Email" runat="server" CommandName="Share" 
    OnClick="shareEmail_Click" style="display: inline-block; padding: 10px; margin-left: 20px; 
    border: 1px solid #D44638; border-radius: 8px; background-color: #f0f0f0; text-align: center; 
    text-decoration: none; color: #000; font-family: Arial, sans-serif; font-size: 14px; display:none;"  >
    <div style="display: flex; align-items: center; gap: 8px;">
        <img src="../assets/gmail.png" alt="Email Icon" style="width: 20px; height: 20px;" />
        <span style="color: #D44638; font-weight: bold;">Email</span>
    </div>
</asp:LinkButton>
           </div>
        <br />
         <br />
           <div class="sharebtn" id="shareb">
                    <asp:LinkButton ID="lnkShare" class="oval-button" OnClick="lnkShare_Click" runat="server" OnClientClick="hideButton();" CommandName="Share" 
       Text="Share"  style="margin-left: 20px;" > &nbsp;&nbsp;<i class='fas fa-share'></i>&nbsp;Share</asp:LinkButton>
</div>
         
         <%--<asp:Label ID="lbldeletereport" runat="server" Visible="false"></asp:Label>--%>
         <div  class="gridviewscroll">
   


          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" Width="70%" HorizontalAlign="Center" 
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
        <asp:BoundField DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" 
                       DataFormatString="{0:yyyy-MM-dd}" />
        
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="lnkViewFile" runat="server" CommandName="ViewFile" CommandArgument='<%# Eval("Id") %>' 
                               Text="View File" CssClass="oval-button" onClick="lnkViewFile_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#f9f9f9" ForeColor="Black" />
    <HeaderStyle BackColor="#0331b5" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#f9f9f9" ForeColor="Black" HorizontalAlign="Center" />
    <RowStyle BackColor="#ffffff" ForeColor="Black" />
    <SelectedRowStyle BackColor="#45a049" Font-Bold="True" ForeColor="Red" />
</asp:GridView>

<!-- Add some custom CSS to control the borders -->
<style>
    /* Style the grid border */
   
</style>



             </div>

    </div>
         </ContentTemplate>
             </asp:UpdatePanel>



</asp:Content>





<%--<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">


</asp:Content>--%>
