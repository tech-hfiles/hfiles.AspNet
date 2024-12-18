<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllReports.aspx.cs" Inherits="hfiles.AllReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            max-width:1100px;
            margin:40px auto;
            /*padding:20px;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h2 style="text-align: center;">All Reports Details</h2>
            <div class="container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
    
    <asp:BoundField DataField="ReportName" HeaderText="Report Name" />

   
    <asp:BoundField DataField="ReportType" HeaderText="Report Type" />

    
    <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />

    
    <asp:TemplateField HeaderText="Action">
        <ItemTemplate>
           <asp:Button ID="btnView" runat="server" Text="View" CommandName="View" />

            <!-- Edit Button -->
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit"  />

            <!-- Delete Button -->
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete"  />

            <!-- Download Button -->
            <asp:Button ID="btnDownload" runat="server" Text="Download" CommandName="Download"  />
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
    </form>
</body>
</html>
