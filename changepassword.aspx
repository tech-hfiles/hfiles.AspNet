<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="hfiles.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="./style2.css" />
 <style>
     .footer {
         position: absolute;
         width: 100%;
         bottom: 0;
     }
     @media (min-width: 500px) and (max-width: 540px) {
         .footer {
             position:relative;
         }
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager runat="server" EnableCdn="true" />
  <div class="panel_content">
    <div class="inner_panel_content">
      <div class="panel_breadcrumb">
        <h3 class="title">Change Password</h3>
        <p class="breadcrumb_link">
          <span><a href='<%# ResolveUrl("~/admin") %>'>Home</a></span>
          <span class="iconify" data-icon="uil:angle-right"></span>
          <span>Change Password</span>
        </p>
      </div>
      <div class="form_area">
        <div class="add_product_form">
          <div class="group_card">

          <div class="row w-100">
          <div class="col-12 d-flex justify-content-center">
          <div class="form-element">
              <label for="">Old Password</label>
              <asp:TextBox ID="txtOldPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
               <img id="showOldPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtOldPassword.ClientID %>')" />
               <%--<img id="hideOldPass" class="showpass" src="./img/hide.png" width="25px" onclick="HideShowPassword('<%= txtOldPassword.ClientID %>')" />--%>
              <%--<input type="checkbox" onclick="HideShowPassword('<%= txtOldPassword.ClientID %>')">--%>
              <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtOldPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />
            </div>
          </div>
          <div class="col-12 d-flex justify-content-center">
          <div class="form-element">
              <label for="">New Password</label>
              <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
               <img id="showNewPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtNewPassword.ClientID %>')" />
               <%--<img id="hideNewPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtNewPassword.ClientID %>')" />--%>
              <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtNewPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />
              <%--<input type="checkbox" onclick="HideShowPassword('<%= txtNewPassword.ClientID %>')">--%>
            </div>
          </div>
          <div class="col-12 d-flex justify-content-center">
          <div class="form-element">
              <label for="">Confirm Password</label>
              <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
              <img id="showConfPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtConfirmPassword.ClientID %>')" />
              <%--<img id="hideConfPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtConfirmPassword.ClientID %>')" />--%>
              <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtConfirmPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />
              <%--<input type="checkbox" onclick="HideShowPassword('<%= txtConfirmPassword.ClientID %>')">--%>
              <asp:CompareValidator ErrorMessage="Password should be same as new password" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" runat="server" />
            </div>
          </div>
          </div>
          <div class="d-flex justify-content-center w-100">
          <asp:LinkButton runat="server" CssClass="btn thm-button mb-2 mt-4" ValidationGroup="a" OnClick="btnSave_Click" ID="btnSave">Change Password</asp:LinkButton>
          </div>
          </div>
          
          <asp:Label ID="msgLabel" runat="server"></asp:Label>
        </div>
      </div>
      <asp:HiddenField runat="server" ID="hfId" />
    </div>
  </div>

    <%-- <script>
         var show = document.getElementById('showpass');
         var hide = document.getElementById('hidepass');

         show.style.display = 'block'
         hide.style.display = 'none'

         function hideShowImage(id) {
             var image = document.getElementById(id)
         }

         function HideShowPassword(id) {
             var x = document.getElementById(id);
             if (x.type === "password") {
                 x.type = "text";
             } else {
                 x.type = "password";
             }
         }

     </script>--%>
</asp:Content>


 