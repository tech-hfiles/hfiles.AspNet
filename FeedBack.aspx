<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="FeedBack.aspx.cs" Inherits="hfiles.FeedBack" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div style="margin:auto;padding-top:100px;width:100%" runat="server">
                <a class="back-arrow-btn" href="javascript: history.go(-1)">Back</a>
                <div class="row text-center">
                    <h1 style="color: #0331b5;">Your Feedback Matters</h1>
    
                </div>
                <div class="row text-center">
                    <h4 style="color: #0331b5;">Enter your feedback here</h4>
                </div>
                <div class="row" style="display: flex;justify-content: space-evenly;">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-10">
                        <%--<textarea style="width: 100%;"></textarea>--%>
                        <textarea style="width: 100%;" id="feedbackarea" runat="server" class="form-control" rows="5" required></textarea>
                    </div>
                </div>
                <div class="row" style="display:flex;justify-content: space-evenly;">
                    <div class="col-xl-2 col-lg-2 col-md-3 col-4" style="display: flex;justify-content: space-evenly;">
                        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" class="btn thm-button mb-2  mt-4"></asp:Button>

                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>