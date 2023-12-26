<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="hfiles.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="./style.css" />
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
     .form-element .form-control {
         padding: 10px 5px;
         border-radius:15px;
         border: 1px solid #eec93a;
     }
     .form-element .form-control:focus {
         box-shadow:none;
         outline:0
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager runat="server" EnableCdn="true" />
  <div class="panel_content">
       <a class="back-arrow-btn" href="javascript: history.go(-1)"><img src="../assets/back-arrow.png" alt="">Back</a>
    <div class="inner_panel_content">
      <div class="form_area">
        <div class="add_product_form">
          <div class="group_card container-fluid">

        <div class="row mt-5">
            <div class="col-12 col-lg-6 d-none d-lg-block">
                 <img src="../assets/features-hero-6.png" alt="" style="width:85%">
            </div>
            <div class="col-12 col-lg-6">
                  <div class="row w-100 d-flex justify-content-center align-items-center mt-5">
                  <div class="col-12 col-md-6 ">
                       <div class="form-element my-3">
                         <label for="">Old Password</label>
                         <asp:TextBox ID="txtOldPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                          <%--<img id="showOldPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtOldPassword.ClientID %>')" />--%>
                         <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtOldPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />
                       </div>
                      <div class="form-element my-3">
                        <label for="">New Password</label>
                        <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                         <%--<img id="showNewPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtNewPassword.ClientID %>')" />--%>
                        <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtNewPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />
                      </div>
                        <div class="form-element my-3">
                          <label for="">Confirm Password</label>
                          <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                          <%--<img id="showConfPass" class="showpass" src="./img/eye.png" width="25px" onclick="HideShowPassword('<%= txtConfirmPassword.ClientID %>')" />--%>
                          <asp:RequiredFieldValidator ErrorMessage="*" ControlToValidate="txtConfirmPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" />

                          <asp:CompareValidator ErrorMessage="Password should be same as new password" Display="Dynamic" ForeColor="Red" Font-Size="13px" ValidationGroup="a" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" runat="server" />
                        </div>
                      <div class="d-flex justify-content-center w-100">
                        <asp:LinkButton runat="server" class="btn thm-button mb-2 mt-4" ValidationGroup="a" OnClick="btnSave_Click" ID="btnSave">Change Password</asp:LinkButton>
                        </div>
                  </div>
              </div>
            </div>
        </div>
          
          </div>
          
          <asp:Label ID="msgLabel" runat="server"></asp:Label>
        </div>
      </div>
      <asp:HiddenField runat="server" ID="hfId" />
    </div>
  </div>
     <div id="toast"><div id="img">Icon</div><div id="desc">A notification message..</div></div>
     <script>
         function launch_toast() {
             var x = document.getElementById("toast")
             x.className = "show";
             setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
         }
        // launch_toast()

     </script>
</asp:Content>


 