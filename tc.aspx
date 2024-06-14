<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tc.aspx.cs" Inherits="hfiles.tc" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Healthcare Network</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
        }
        .left-panel {
            background-color: #f8f9fa;
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .left-panel img {
            max-width: 100%;
        }
        .right-panel {
            background-color: #007bff;
            color: white;
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .right-panel input {
            margin-bottom: 10px;
        }
        .right-panel a {
            color: white;
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #f8f9fa;
        }
        .footer a {
            color: #007bff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="left-panel">
                <h2>Get Smart With Your Health</h2>
                <p>Join India's Pioneering Social Healthcare Network</p>
                <img src="https://via.placeholder.com/150" alt="Healthcare Image" />
            </div>
            <div class="right-panel">
                <h2>Welcome Back!</h2>
                <asp:TextBox ID="txtEmailOrContact" runat="server" CssClass="form-control" Placeholder="Email Id / Contact No."></asp:TextBox>
                <asp:Button ID="btnGetOtp" runat="server" CssClass="btn btn-warning btn-block" Text="Get OTP" />
                <p class="text-center">Or</p>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                <asp:Button ID="btnLoginWithPassword" runat="server" CssClass="btn btn-warning btn-block" Text="Login with Password" />
                <p class="text-center mt-3">New User? <a href="#">Click here to Sign Up</a></p>
            </div>
        </div>
        <div class="footer">
            <a href="#">Terms & Conditions</a> | 
            <a href="#">Privacy & Policy</a> | 
            <a href="#">FAQ's</a> | 
            <span>Copyright@2024</span> | 
            <a href="tel:9978043453">9978043453</a> | 
            <a href="mailto:contact@hfiles.in">contact@hfiles.in</a>
        </div>
    </form>
</body>
</html>
