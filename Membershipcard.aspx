<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="Membershipcard.aspx.cs" Inherits="hfiles.Membershipcard" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <style>
      .accordion-button.collapsed::after {
      background-image: url(
  "data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='white'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>"
);
    }
    .accordion-button:not(.collapsed)::after {
      background-image: url(
  "data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='white'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>"
);
    }
        .accordion-button::after {
            margin-left:10px;
        }
        .accordionbutton{
            background-color: #0331b5 !important;
            color: #ffd101 !important;
            border-radius: 9px !important;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            height: 50px;
            /* width: auto; */
            padding: 10px 15px;
        }
        accordion-button:not(.collapsed) {
            background-color: #0331b5 !important;
            color: #ffd101 !important;
        }
                .right-align {
            display: block;
            text-align: right;
           
             font-weight: bold;
        }
        
</style>
            <div style="text-align: center;margin:auto;max-width:70vh;margin-top:5vh;padding-bottom:10vh;" class="card-box">
                <div style="display:flex;justify-content:center">
                    <h1 style="font-weight:bold;color:#0331b5">Membership Card</h1>
                </div>
                <div class="accordion accordion-flush" id="accordionFlushExample" style="width:100%; max-height:65vh; overflow-y:auto; padding:0 20px;">
    <!-- Static Accordion Item -->
    <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed accordionbutton" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                My Card
            </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">
                <asp:Image ID="membershipImageAccount" runat="server" AlternateText="MembershipCard" class="responsive-image" />
            </div>
        </div>
    </div>

    <!-- Dynamic Accordion Items -->
    <asp:Panel ID="Panel1" runat="server" CssClass="accordion accordion-flush" align="center">
        <asp:Repeater ID="rptUsers" runat="server">
            <ItemTemplate>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading<%# Eval("user_id") %>">
                        <button class="accordion-button accordionbutton collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse<%# Eval("user_id") %>" aria-expanded="false"
                                aria-controls="collapse<%# Eval("user_id") %>">
                            <%# Eval("user_firstname") %> 
                        </button>
                    </h2>
                    <div id="collapse<%# Eval("user_id") %>" class="accordion-collapse collapse" 
                         aria-labelledby="heading<%# Eval("user_id") %>" 
                         data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <img id='membershipImageAccount<%# Eval("user_id") %>' src='<%# Eval("user_image") %>' class="responsive-image" />

                           
                                 <asp:LinkButton ID="LinkButtonEdit" runat="server" Text="Edit" OnClick="LinkButtonEdit_Click" CommandArgument='<%# Eval("user_id") %>' CssClass="right-align">
                                   </asp:LinkButton>
                             
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>

 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="MemberSelect" class="form-label">Select Blood Group</label>
                   <asp:DropDownList ID="DropDownbloodgrp" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Blood Group" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="A+" Value="1"></asp:ListItem>
                        <asp:ListItem Text="A-" Value="2"></asp:ListItem>
                        <asp:ListItem Text="B+" Value="3"></asp:ListItem>
                        <asp:ListItem Text="B-" Value="4"></asp:ListItem>
                        <asp:ListItem Text="AB+" Value="5"></asp:ListItem>
                        <asp:ListItem Text="AB-" Value="6"></asp:ListItem>
                        <asp:ListItem Text="O+" Value="7"></asp:ListItem>
                        <asp:ListItem Text="O-" Value="8"></asp:ListItem>
                    </asp:DropDownList>
                    
                </div>

                <div class="mb-3" style="border-radius: 14px">
                    <label for="Emergency" class="form-label">Emergency Contact</label>
                  <asp:TextBox ID="txtEmerContact" runat="server" CssClass="form-control" placeholder="Enter Contact No." style="border-radius: 15px;" ></asp:TextBox>
                    <asp:CustomValidator ID="cvEmerContact" runat="server" ControlToValidate="txtEmerContact"
                        ClientValidationFunction="validatePhoneNumber" 
                        ForeColor="Red" ErrorMessage="Please enter a valid 10-digit phone number."
                        ValidationGroup="phoneValidation" />
                </div>
            </div>
            <div class="modal-footer">
                 <asp:LinkButton ID="lbtnSave" runat="server" OnClick="lbtnSave_Click" Text="Save" CssClass="btn btn-primary" ValidationGroup="phoneValidation"></asp:LinkButton>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

     <script>
         var isToastrCalled = false;

         function showToastr(type, message) {
             if (isToastrCalled) return;  // Prevent showing toastr multiple times
             isToastrCalled = true;  // Set the flag to true once toastr is shown

             if (type === 'success') {
                 toastr.success(message);
             } else if (type === 'error') {
                 toastr.error(message);
             }

             // Optional: Reload page after toastr message

         }
     </script>           
<script type="text/javascript">
    // Client-side validation function
    function validatePhoneNumber(sender, args) {
        var phoneNumber = args.Value;

        // Check if the phone number is exactly 10 digits
        var phonePattern = /^[0-9]{10}$/;

        // Validate phone number using regex pattern
        if (phonePattern.test(phoneNumber)) {
            args.IsValid = true; // Validation passed
        } else {
            args.IsValid = false; // Validation failed
        }
    }
</script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        var accordions = document.querySelectorAll(".accordion-collapse");
        accordions.forEach(function (accordion) {
            new bootstrap.Collapse(accordion, { toggle: false });
        });
    });
</script>

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