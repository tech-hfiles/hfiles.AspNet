<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="MyAccount.aspx.cs" Inherits="hfiles.MyAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/style.css") %>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    
    <title>My Account</title>
    <style>
        .thm-blue-buttn {
            margin: 8px 0 !important;
            font-size: 15px;
            padding: 10px 45px;
            background: #0512B9;
            border-radius: 20px;
            color: #ffffff;
            font-weight: 700;
            outline: 0;
            border: 1px solid #d6d6d6;
        }

        .thm-back-button {
            font-size: 15px;
            margin: 8px 0 !important;
            padding: 10px 45px;
            background: #d6d6d6;
            border-radius: 20px;
            color: #08138f;
            font-weight: 700;
            outline: 0;
            border: 1px solid #d6d6d6;
        }



        .heading mb-4 h1 {
            font-family: 'Red Hat Display', sans-serif !important;
        }

        .medical-surgery-table {
            padding: 2px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 5px 5px 8px #cecece !important;
        }

        .surgeries-table tr {
            box-shadow: 5px 5px 8px #cecece !important;
        }

        th {
            background-color: #343a40;
            color: #fff;
        }

        .surgeries-table asp:BoundField {
            text-align: center;
        }

        .surgeries-table td, .surgeries-table th {
            padding: 10px;
            text-align: center;
        }

        .surgery-year-label {
            border-radius: 10px;
            background-color: #e9ecef;
            padding: 5px 10px;
            font-weight: bold;
        }

        .delete-report-btn {
            border: none;
            background: none;
        }

            .delete-report-btn img {
                width: 20px;
                height: 20px;
            }

        @media (max-width: 567px) {
            .buttons-container {
                justify-content: center;
                text-align: center;
                display: flex;
                flex-direction: row;
            }

                .buttons-container asp\:button {
                    margin: 10px 0; /* Add some margin to buttons for spacing */
                }
        }

        @media(min-width<1246px) {
            .footer {
                position: absolute;
                /* bottom: 0;*/
                width: 100%;
            }
        }

        @media (min-width: 800px) and (max-width: 1024px) {
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        }

        @media (min-width: 750px) and (max-width: 950px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 40px !important;
            }
        }

        @media (min-width: 1024px) and (max-height: 600px) {
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
        }

        @media (min-width: 700px) and (max-width: 800px) {
            .medical-main-div {
                min-height: 85vh;
            }
        }

        @media(max-width: 540px) {
            .back-arrow-btn-small-dev {
                top: 80px !important;
            }

            .medic-his-btn {
                /*margin: 10px 20px;
                padding:0 20px;*/
                justify-items: center;
                align-items: center;
            }

            .med-nxt {
                margin-bottom: 50px !important;
            }
        }

        @media(max-width: 480px) {
            .outertablepadd {
                padding: 0px;
            }
        }

        @media(max-width: 380px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0 11px !important;
            }

            .SingleCheckbox {
                justify-items: center;
                align-items: center;
            }

            .common-design .blue-trangle-bottom {
                position: relative;
                bottom: 0px;
            }
        }

        @media(max-width: 460px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0 13px;
            }
        }

        @media(max-width: 749px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 20px;
            }

            .medical-history-row {
                padding: 20px 0px !important;
                /*                gap:5% !important;
*/
            }

            .allergy-row {
                padding: 10px 10px !important;
            }

            .SingleCheckbox input[type=radio] + label {
                margin: 1px 25px;
            }
        }

        @media(max-width: 344px) {

            .medical-main-div .inner-main-div {
                overflow-x: hidden;
            }

            .SingleCheckbox input[type=radio] + label {
                margin: 1px 18px !important;
            }
        }

        @media (min-height: 930px) and (max-height: 932px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 20px !important;
            }
        }

        @media (min-height: 598px) and (max-height: 600px) {
            .back-arrow-btn {
                top: 13% !important;
            }
        }

        @media (min-height: 665px) and (max-height: 667px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 14px !important;
            }
        }

        @media (min-height: 718px) and (max-height: 720px) {
            .SingleCheckbox tr td:last-child input[type=checkbox] + label {
                margin: 0px 40px !important;
            }

            /*   .SingleCheckbox tr td:first-child input[type=checkbox] + label {
                margin: 0px 42px !important;
            }

            .SingleCheckbox tr td:nth-child(2) input[type=checkbox] + label {
                margin: 0px 42px !important;
            }*/
        }



        @media (min-height: 912px) and (max-height:914px) {
            .common-design .blue-trangle-bottom {
                position: relative;
            }
        }

        @media (min-width: 320px) and (max-width: 374px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 19px !important;
            }
        }

        @media (min-width: 370px) and (max-width: 375px) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0px 19px !important;
            }

            #type {
                /*                    margin-left:10px !important;
*/
            }
        }

        @media (min-width: 1918px) and (max-width: 1920px) {
            .common-design .blue-trangle-bottom {
                bottom: -5px;
            }
        }

        @media (min-height:1200px) and (max-height:1300px) {
            .footer {
                position: relative;
            }
        }

        @media (max-width: 1024px) and (orientation: landscape) {
            .SingleCheckbox input[type=checkbox] + label {
                margin: 0 55px;
            }

            .footer {
                position: relative;
            }
        }
        /*#surgery-row{
                justify-items:center;
                justify-content:center;
                align-items:center;

            }
            #surgery-row td{
                padding:0px;
                align-content:center;
                text-align:center;
            }*/
        /*.thm-back-button{
              background-color:#FFD101 !important;
              padding:0px 45px !important;
            }
            .thm-back-button:hover{
              background-color:white;
            }*/
        #SaveAllInfor {
    width: 100%; /* Default width */
    /*margin: auto;*/ /* Center the element */
    display: table;
    margin-right:auto;
    margin-left:auto;
}

        @media (min-width: 768px) { /* Bootstrap 'md' breakpoint */
    #SaveAllInfor {
        width: 90%;
    }
}
@media (min-width: 992px) { /* Bootstrap 'lg' breakpoint */
    #SaveAllInfor {
        width: 80%;
    }
}
#prescription thead,
#prescription tbody,
#prescription tfoot,
#prescription tr,
#prescription td,
#prescription th {
  border-width: thin;
}

  
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
    background-color: #0331b5;
    color: #ffd101;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <div id="SaveAllInfor">

               <div style="padding-top:4vh;padding-bottom:10px;display:flex;justify-content:space-evenly;">
                   <h1 style="color: #0331b5;">My Account</h1>
               </div>




            <div class="accordion accordion-flush" id="accordionFlushExample" style="width:100%;max-height:65vh;overflow-y:auto;padding:0 20px" >
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed accordionbutton" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        Membership Card
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
                      
          <div style="text-align: center;margin:auto;max-width:70vh;" class="card-box">
            <asp:Image ID="membershipImageAccount" runat="server"  AlternateText="MembershipCard" class="responsive-image" />
          </div>

      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed accordionbutton" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Subscription Plan
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          
          <h4>Working In Progress</h4>
          
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed accordionbutton"  type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Wellness Kit
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
                      <h4>Working In Progress</h4>
      </div>
    </div>
  </div>
                  
</div>
           
 
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>
   


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        window.onload = function () {
            // Fetch the Master Page image `src`
            var masterImage = document.getElementById('<%= Master.FindControl("membershipImage").ClientID %>');
            var childImage = document.getElementById('membershipImageAccount');

            if (masterImage && childImage) {
                // Set the Master Page image `src` to the Child Page image
                childImage.src = masterImage.src;
            }
        };
    </script>
    
</asp:Content>