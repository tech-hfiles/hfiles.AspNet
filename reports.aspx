<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="hfiles.reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>Reports</h2>
        <div>
            Select Report Type
            <asp:DropDownList runat="server" ID="ddlReports" OnSelectedIndexChanged="ddlReports_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList><br />

            <br />
            <asp:Repeater runat="server" ID="rptReports">
                <ItemTemplate>
                    <div>
                        Report Type :<%# Eval("ReportType") %>  
                        <br />
                        Report Name :<%# Eval("ReportName") %>
                        <br />
                        Report : <a class="thm-btn" target="_blank" href="<%# ResolveUrl( string.Format("~/upload/report/{0}", Eval("ReportUrl"))) %>">View Report </a>
                   
                    </div><br /><br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
