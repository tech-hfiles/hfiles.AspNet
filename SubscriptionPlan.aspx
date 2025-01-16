<%@ Page Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="SubscriptionPlan.aspx.cs" Inherits="hfiles.SubscriptionPlan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div style="text-align: center;margin:auto;max-width:70vh;margin-top:15vh;" class="card-box">
                <div style="display:flex;justify-content:center">
                    <h1 style="font-weight:bold;color:#0331b5">Subscription Plans</h1>
                </div>
                <div style="display:flex;justify-content:center">
    <h4 style="font-weight:bold;color:#0331b5">Get started with your health journey today</h4>
</div>
            </div>
            
        </ContentTemplate>
        
    </asp:UpdatePanel>
    
</asp:Content>