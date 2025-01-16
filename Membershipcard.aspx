<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="Membershipcard.aspx.cs" Inherits="hfiles.Membershipcard" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div style="text-align: center;margin:auto;max-width:70vh;margin-top:15vh;" class="card-box">
                <div style="display:flex;justify-content:center">
                    <h1 style="font-weight:bold;color:#0331b5">Membership Card</h1>
                </div>
                <asp:Image ID="membershipImageAccount" runat="server"  AlternateText="MembershipCard" class="responsive-image" />
            </div>
            <script>
    $(document).ready(function () {
        setTimeout(() => {
            var masterImage = document.getElementById('<%= Master.FindControl("membershipImage").ClientID %>');
            var childImage = document.getElementById('ContentPlaceHolder1_membershipImageAccount');

            if (masterImage && childImage) {
                // Set the Master Page image `src` to the Child Page image
                childImage.src = masterImage.src;
            }
        }, 500);
    });
    
            </script>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Content>