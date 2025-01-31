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
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
</div>

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