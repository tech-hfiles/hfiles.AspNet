<%@ Page Title="Additional Information" Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/user.Master" CodeBehind="MedicalHistory.aspx.cs" Inherits="hfiles.MedicalHistory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/style.css") %>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    
    <title>Additional Information</title>
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
.responsive-padding-btn {
    padding: 10px 80px;
  }

  /* Media query for larger screens */
  @media (min-width: 768px) {
    .responsive-padding-btn {
      padding: 10px 500px;
    }
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <%--  <asp:ScriptManager runat="server" />--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <div id="SaveAllInfor">

               <div style="padding-top:4vh;padding-bottom:10px;display:flex;justify-content:space-evenly;">
                   <h1 style="color: #0331b5;">Medical History</h1>
               </div>




            <div class="accordion accordion-flush" id="accordionFlushExample" style="width:100%;max-height:65vh;overflow-y:auto;padding:0 20px" >
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed text-center responsive-padding-btn" style="background-color: #0331b5;color: #ffd101;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        My Medical History
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
                         <div runat="server" id="medicalHistoryDiv" class="medical-history common-design">


    <div class="medical-main-div container">
        <div class="row">
            
            <div class="row border-bottom p-1">
                <div class="col-lg-6 col-md-6 col-4 pl-4">
                    <p id="type">Type</p>
                </div>
                <div class="col-md-2 col-2 text-center">
                    <p>Myself</p>
                </div>
                <div class="col-md-2 col-3 text-center">
                    <p>Mother Side's</p>
                </div>
                <div class="col-md-2 col-3 text-center">
                    <p>Father Side's</p>
                </div>
            </div>
            
            <div class="row inner-main-div" style="overflow-y:auto;max-height:30vh;overflow-x:hidden">
                <asp:Repeater runat="server" ID="rptDisease">
                    <ItemTemplate>
                        <div class="row border-bottom mt-1">
                            <div class="col-md-6 col-4 pt-2">
                                <p><%# Eval("disease_name") %></p>
                                <asp:HiddenField runat="server" ID="hfdisease_id" Value='<%# Eval("disease_id") %>' />



                            </div>
                            <div class="col-md-6 col-5 pt-1 SingleCheckbox justify-content-center align-items-center">
                                <asp:CheckBoxList runat="server" ID="cbl" Style="padding: 20px;" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Text=" " class="CheckBoxLabel" />
                                    <asp:ListItem Value="2" Text=" " />
                                    <asp:ListItem Value="3" Text=" " />
                                </asp:CheckBoxList>
                            </div>
                            
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
        <div style="display:flex;justify-content:space-evenly">
            <asp:Button Text="Save" ID="btnMedicalHistory" class="thm-blue-buttn" OnClick="btnMedicalHistory_Click" runat="server" />
        </div>
    </div>

    <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
</div>
          


      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed text-blue responsive-padding-btn" style="background-color: #0331b5;color: #ffd101;text-align-last: center;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Additional Information
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          
            <div class="additional-information common-design" runat="server" id="AdditionalDiv">

                
                <div class="additionl-main-div container h-90">
               
                    <div class="row" style="overflow:auto;max-height:35vh">
                        <div class="col-12" style="font-family: 'Red Hat Display', sans-serif !important;">
                            <div class="row py-2">
                                <div class="col-lg-3 col-xl-3 col-md-3 col-3">
                                    <p class="sub-heading">Height</p>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-md-3 col-4">
                                    <div style="display:flex;justify-content:space-evenly">
                                        <input runat="server" id="heightfeetTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>ft</span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-md-3 col-5">
                                    <div style="display:flex;justify-content:space-evenly">
                                        <input runat="server" id="heightinchTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>inch</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row py-2">
                                <div class="col-lg-3 col-xl-3 col-md-3 col-3">
                                    <p class="sub-heading">Weight</p>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-md-3 col-4">
                                    <div style="display:flex;justify-content:space-evenly">
                                        <input runat="server" id="weightTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>kg</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-lg-4 col-6">
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <p class="fw-bold">Yes</p>
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <p class="fw-bold">No</p>
                                </div>
                                <%--<div class="col-2 text-center">
                                    <p class="fw-bold">Occasionally </p>
                                </div>--%>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-lg-4 col-6 pt-2">
                                    <p class="sub-heading">Do You Smoke?</p>
                                    <asp:HiddenField ID="hfDoyouSmoke" runat="server" />
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <div class="radio-container">

                                        <input type="radio" runat="server" id="smoke_yes" onclick="handleSelectSmoke(1)" name="SmokeGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_smoke_yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <div class="radio-container">
                                        <input type="radio" runat="server" id="smoke_no" onclick="handleSelectSmoke(0)" name="SmokeGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_smoke_no" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <%--<div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="smoke_occasionally" runat="server"  onclick="handleSelectSmoke(2)"  name="SmokeGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_smoke_occasionally" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-lg-4 col-6 pt-2">
                                    <p class="sub-heading">Do You Consume Alcohol?</p>
                                    <asp:HiddenField ID="hfDoyouConsumeAlcohol" runat="server" />
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <div class="radio-container">
                                        <input type="radio" runat="server" id="alcohol_yes" onclick="handleSelectAlcohol(1)" value="1" name="AlcoholGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_alcohol_yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-3 text-center">
                                    <div class="radio-container">
                                        <input type="radio" runat="server" id="alcohol_no" onclick='handleSelectAlcohol(0)' name="AlcoholGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_alcohol_no" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <%--<div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" runat="server"  id="alcohol_occasionally" onclick="handleSelectAlcohol(2)" name="AlcoholGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_alcohol_occasionally" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="row">
                                <div class="col-12 pt-2">
                                    <p class="sub-heading">Have you had any surgeries? if yes. please specify:</p>
                                </div>
                            </div>
                            <div class="row surgeries-div">
                                <div class="col-lg-6 col-8 col-md-6">
                                    <input type="text" runat="server" id="txtSurgeries" placeholder="Surgery details" />
                                </div>

                                <div class="col-lg-4 col-4 col-md-4 mt-1">
                                    <div class="select-years">
                                        <asp:DropDownList runat="server" ID="yearpicker" name="yearpicker">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-3 col-md-2 mt-1 mt-lg-0 mt-md-0">
                                    <div class="">
                                        <asp:Button Text="Add" ID="addsurgeryButton" class="thm-blue-button" OnClick="addsurgeryButton_Click" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-12 mt-3 outertablepadd">
                                    <div class="medical-surgery-table" style="overflow: auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
                                        <asp:GridView ID="surgeryGridView" AutoGenerateColumns="false" CssClass="surgeries-table w-100 text-center table table-striped table-hover" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="user_surgery_details" HeaderText="Surgery Details" SortExpression="user_surgery_details" />
                                                <asp:TemplateField>
                                                    <HeaderTemplate>Surgery Date</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <asp:Label ID="lblSurgeryYear" runat="server" CssClass="surgery-year-label" Text='<%#Eval("user_surgery_year") %>'></asp:Label>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>Delete Item</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <asp:ImageButton CssClass="delete-report-btn" ID="lRemoveBtn" runat="server" OnClick="lRemoveBtn_Click1" CommandArgument='<%#Eval("user_surgery_id") %>' ImageUrl="../Suppor Group (BG  & Icons)/delete-icon.png"></asp:ImageButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <%--<table class="surgeries-table w-100">
                                        <thead>
                                            <tr>
                                                <td>Surgeries Name</td>
                                                <td>Date</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="surgery-row">
                                                <td></td>
                                                <td>1997</td>
                                                <td><i class="fa fa-sharp fa-solid fa-trash color-primary"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>--%>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div style="display:flex;justify-content:space-evenly">
    <%--<asp:Button Text="Back" class="thm-back-button" OnClick="btnMedicalBack_Click" type="Button" ID="Button1" runat="server" />--%>

    <%--<asp:Button Text="Back" class="thm-back-button" Style="background-color: #FFD101; margin-right: 10px !important;" OnClick="btnAdditionalBack_Click" type="Button" ID="btnMedicalBack" runat="server" />--%>
    <asp:Button Text="Save" ID="btnUpdateAdditional" class="thm-blue-buttn mx-lg-3 my-2 my-lg-0" OnClick="btnUpdateAdditional_Click" OnClientClick="allergyfooter()" runat="server" />
    <%--<button onclick="HideAdditionalDiv()" type="submit" class="thm-blue-button">Next</button>--%>
</div>
                    <%-- <img class="blue-trangle-bottom" src="<%= ResolveUrl("~/Add Members/blue-trangle-5.png") %>" alt="">--%>
                    <%--<img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt="">--%>
                </div>
                <%--<img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
                <%-- <img class="plus-bottom-right" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="">--%>
            </div>

      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed text-center responsive-padding-btn" style="background-color: #0331b5;color: #ffd101;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Allergies
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
                      <div class="allergy">
   

    <div id="AllergiesDiv" runat="server" class="medical-main-div container <%--pt-5 px-5--%> h-90 "   >
        <div class="row">
            <div class="col-12">
                <h4 class="heading mb-2">Do You Have Any of These Allergies?</h4>
            </div>
            <div class="row border-bottom">
                <div class="col-md-6 col-4 m-0">
                    <p>Type</p>
                </div>
                <div class="col-md-2 col-3 text-center">
                    <p>Yes</p>
                </div>
                <div class="col-md-2 col-3 text-center">
                    <p>No</p>
                </div>

            </div>
            <div class="row inner-main-div" style="overflow:auto;max-height:30vh">
                <div class="col-12">
                    <asp:Repeater runat="server" ID="rptAllergy">
                        <ItemTemplate>
                            <div class="row py-1 border-bottom allergy-row">
                                <div class="col-md-6 col-4 d-flex align-items-center">
                                    <p class="m-0"><%# Eval("allergy_name") %></p>
                                    <asp:HiddenField runat="server" ID="hfallergy_id" Value='<%# Eval("allergy_id") %>' />
                                </div>

                                <div class="col-4 text-center align-items-center SingleCheckbox">
                                    <asp:RadioButtonList runat="server" ID="rblAllergy" class="col-6" CssClass="" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Text=" " class="CheckBoxLabel" />
                                        <asp:ListItem Value="0" Text=" " class="CheckBoxLabel" />
                                    </asp:RadioButtonList>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
        <div style="display:flex;justify-content:space-evenly">
            <%--<asp:Button Text="Back" CssClass="thm-back-button my-2" ID="btnAllergyBack" Style="background-color: #FFD101;" OnClick="btnAllergyBack_Click" runat="server" />--%>
            <asp:Button Text="Save" CssClass="thm-blue-buttn" ID="btnSaveAllergy" OnClick="btnSaveAllergy_Click" runat="server" />
        </div>
    </div>

</div>
      </div>
    </div>
  </div>
                  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFour">
      <button class="accordion-button collapsed text-center responsive-padding-btn" 
        style="background-color: #0331b5; color: #ffd101; border-radius: 9px;" 
        type="button" 
        data-bs-toggle="collapse" 
        data-bs-target="#flush-collapseFour" 
        aria-expanded="false" 
        aria-controls="flush-collapseFour">
  Family Prescription
</button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          
          <div class="row">
            <div class="table-responsive">
                <table id="prescription" class="table" style="border: solid;border-color: #dee2e6;border-width: thin;">
                    <thead>
                        <tr>
                            <th hidden>Id</th>
                            <th style="background-color: white;text-align: center;">
                                <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Member</button>
                            </th>
                            <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Condition</button>
</th>
                            <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Medication</button>
</th>
                            <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Dosage</button>
</th>
                            <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Power</button>
</th>
                            <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Timing</button>
</th>
                                                        <th style="background-color: white;text-align: center;">
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Action</button>
</th>
                            
                            
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
              </div>
          </div>




        <%--<form id="medicationForm" runat="server">--%>
            <div id="gridContainer">
                
            </div>
          <div style="display:flex;justify-content:center">
              <div style="padding:10px">
                  <button type="button" class="btn btn-success" id="addprescription" onclick="addPrescription()">Add Prescription</button>
              </div>
             

          </div>
            
        <%--</form>--%>

          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Prescription Form</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row grid-row familyprescription-row">
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
                    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Member</Button>
                </div>
                <div class="col col-6" style="padding:10px">
                    <input type="hidden" id="PrescriptionId" name="Id[]">
                    <select class="form-select member-select" id="MemberSelect" name="member[]">
                        <option value="" disabled selected>Member</option>
                    </select>
                </div>
            </div>
            <div class="row">
               <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Condition</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <select class="form-select condition-select" id="ConditionSelect" name="condition[]" multiple>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Medication</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Medication" placeholder="Medication" name="medication[]" />
                </div>
            </div>
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Power</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Power" placeholder="Power" name="power[]" />
                </div>
            </div>
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Dosage</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Dosage" placeholder="Dosage" name="dosage[]" />
                </div>
            </div>
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Timing</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Timings" placeholder="Timings" name="timings[]" />
                </div>
            </div>
        </div>
          
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="saveprescription" onclick="submitForm(event)">Save</button>  
        <button type="button" class="btn btn-secondary" id="closeModalBtn" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



      </div>
    </div>
  </div>
</div>
           
 <div class="medic-his-btn mt-3 buttons-container" style="display:flex;justify-content:space-evenly">
    <%--<asp:Button Text="Save" CssClass="thm-blue-buttn" ID="Button9" OnClick="btnSaveAllInfo_Click" runat="server" />--%>
</div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
    crossorigin="anonymous"></script>
   


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>

        function HideAdditionalDiv() {
            document.getElementById('AdditionalDiv').style.display = "none";
            document.getElementById('medicalHistoryDiv').style.display = "block";
        }
        function HideMedicalHistoryDiv() {
            document.getElementById('AdditionalDiv').style.display = "block";
            document.getElementById('medicalHistoryDiv').style.display = "none";
        }

        let startYear = 1800;
        let endYear = new Date().getFullYear();
        let yearList = $('#ContentPlaceHolder1_yearpicker1')
        $(function () {
            for (var i = endYear; i > startYear; i--) {
                var option = $("<option />");
                option.html(i);
                option.val(i);
                yearList.append(option);
                //$('#yearpicker1').append(`<option value="${i}"> 
                //                           ${i} 
                //                      </option>`);
            }
        });

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 45 || charCode > 57) && charCode != 47)
                return false;
            return true;
        }

        function handleSelectSmoke(e) {
            isSelectSmoke = e;

            let hfSmoke = document.getElementById('<%= hfDoyouSmoke.ClientID %>');

            if (isSelectSmoke === 1) {
                hfSmoke.value = "1";
            } else if (isSelectSmoke === 0) {

                hfSmoke.value = "0";
            } else if (isSelectSmoke === 2) {

                hfSmoke.value = "2";
            }
        }
        function handleSelectAlcohol(e) {
            isSelectAlcohol = e;

            let hfAlcohol = document.getElementById('<%= hfDoyouConsumeAlcohol.ClientID %>');
            if (isSelectAlcohol === 1) {
                hfAlcohol.value = "1";
            } else if (isSelectAlcohol === 0) {

                hfAlcohol.value = "0";
            } else if (isSelectAlcohol === 2) {

                hfAlcohol.value = "2";
            }
        }

        function allergyfooter() {
            setTimeout(function () {
                var allergyDiv = document.getElementById('<%= AllergiesDiv.ClientID %>');

                if (allergyDiv) {
                    // If the element is found, make the footer's position relative
                    var footer = document.querySelectorAll('.footer');
                    if (footer) {
                        footers.forEach(function (footer) {
                            footer.style.setProperty('position', 'relative', 'important');
                        });
                    }
                    alert('LUL');
                } else {
                    var footers = document.querySelectorAll('.footer');
                    footers.forEach(function (footer) {
                        footer.style.removeProperty('position', 'absolute', 'important');
                    });
                    // Change the position to 'fixed' for each footer element
                    footers.forEach(function (footer) {
                        footer.style.setProperty('position', 'relative', 'important');
                    });
                }
            }, 2000);
        }

        var FetchedData = [];
        var memberOptionsFetched = false;
        var conditionOptionsFetched = false;
        function fetchData() {
            FetchedData = [];
            $.ajax({
                type: "POST", // Use POST instead of GET
                url: "MedicalHistory.aspx/GetFamilyPrescriptions",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Data fetched successfully:", response.d);
                    // Handle success, e.g., bind the data to a grid
                    const dataList = JSON.parse(response.d);
                    FetchedData = dataList;
                    const tableBody = document.querySelector("#prescription tbody");
                    tableBody.innerHTML = '';
                    // Iterate over the parsed data and bind to your grid or add rows
                    if (memberOptionsFetched && conditionOptionsFetched) {
                        console.log("Data already fetched, not calling fetch again.");
                        dataList.forEach((data) => {
                            addRecordTable(data);
                        });
                        
                    } else {
                        // Promise.all to fetch both options only once
                        Promise.all([fetchMemberOptions(), fetchConditionOptions()])
                            .then(() => {
                                memberOptionsFetched = true;
                                conditionOptionsFetched = true;
                                dataList.forEach((data) => {
                                    addRecordTable(data);
                                });
                            })
                            .catch(err => {
                                console.error("Error fetching data:", err);
                            });
                    }
                    $("#addprescription").prop('disabled', false);
                    $("#saveprescription").prop('disabled', false);
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }
        var memberMaster = [];
        var conditionMaster = [];
        var isAllMasterFetched = false;

        let modalElement = document.getElementById('exampleModal');
        let modal = new bootstrap.Modal(modalElement);

        function addRecordTable(rowData) {



            const tableBody = document.querySelector("#prescription tbody");

            // Create a new row
            const newRow = document.createElement("tr");
            const memberName = memberMaster.find(opt => opt.user_id == parseInt(rowData.MemberId));
            const conditions = conditionMaster.filter(opt => rowData.Conditions.includes(opt.Id));
            const conditionNames = conditions.map(condition => condition.ConditionName).join(', ');
            console.log(conditionNames);
            // Populate the row with data
            newRow.setAttribute('data-id', rowData.Id);
            newRow.innerHTML = `
                <td hidden>${rowData.Id}</td>
                <td style="text-align:center">${memberName.user_FirstName}</td>
                <td style="text-align:center">${conditionNames}</td>
                <td style="text-align:center">${rowData.Medication}</td>
                <td style="text-align:center">${rowData.Power}</td>
                <td style="text-align:center">${rowData.Dosage}</td>
                <td style="text-align:center">${rowData.Timings}</td>
                <td style="text-align:center;">
                    <i class="fas fa-edit action-icons" title="Edit" style="cursor:pointer" onclick="editPrescription(${rowData.Id})"></i>
                    &nbsp;
                    <i class="fas fa-trash action-icons" title="Remove" style="cursor:pointer" onclick="removeRow(${rowData.Id})"></i>
                </td>
            `;

            // Append the new row to the table body
            tableBody.appendChild(newRow);
        }

        function addPrescription(data = {}) {

            modal.show();


            $("#PrescriptionId").val(data.Id || '');
            $("#MemberSelect").val(data.MemberId || '');
            const conditions = data.Conditions ? data.Conditions.split(',') : [];
            $("#ConditionSelect").val(conditions).trigger('change');
            $("#Medication").val(data.Medication || '');
            $("#Power").val(data.Power || '');
            $("#Dosage").val(data.Dosage || '');
            $("#Timings").val(data.Timings || '');
        }
        function editPrescription(id) {
            const data = FetchedData.filter(opt => opt.Id == parseInt(id));
            addPrescription(data[0]);
        }
        
        
        function fetchMemberOptions() {
            return new Promise((resolve, reject) => {
                // Simulate async operation
                setTimeout(() => {
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "MedicalHistory.aspx/GetUserMembers",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            const Data = JSON.parse(response.d);
                            memberMaster = Data;
                            console.log("Members", Data);
                            const select = document.getElementById('MemberSelect');
                            memberMaster.forEach(option => {
                                const opt = document.createElement('option');
                                opt.value = option.user_id; // Set the option value
                                opt.textContent = option.user_FirstName; // Set the option text
                                select.appendChild(opt); // Append the option
                            });
                            console.log('Member Options Fetched');
                            resolve(); // Resolve the promise when done
                        },
                        error: function () {
                            console.error('Error fetching members data');
                            //return []; // Return empty array in case of an error
                            resolve();
                        }
                    });
                    
                }, 500);
            });
        }

        function fetchConditionOptions() {
            return new Promise((resolve, reject) => {
                // Simulate async operation
                setTimeout(() => {
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "MedicalHistory.aspx/GetCondionList",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            const Data = JSON.parse(response.d);
                            conditionMaster = Data;
                            console.log("Conditions", Data);
                            const select = document.getElementById('ConditionSelect');
                            conditionMaster.forEach(option => {
                                const opt = document.createElement('option');
                                opt.value = option.Id; // Set the option value
                                opt.textContent = option.ConditionName; // Set the option text
                                select.appendChild(opt); // Append the option
                            });
                            console.log('Condition Options Fetched');
                            resolve(); // Resolve the promise when done
                        },
                        error: function () {
                            console.error('Error fetching conditions data');
                            resolve();
                        }
                    });
                    
                }, 500);
            });
        }
        
        $("#addprescription").prop('disabled', true);
        $("#saveprescription").prop('disabled', true);
        fetchData();
        
        function removeRow(rowId) {

            const row = document.querySelector(`tr[data-id='${rowId}']`); // Select the row based on its Id
            if (row) {
                
                console.log(`Row with ID ${rowId} removed`); // Log or handle the ID of the removed row'
                $.ajax({
                    type: "POST",
                    url: "MedicalHistory.aspx/RemoveFamilyPrescription",  // Your web service method URL
                    data: JSON.stringify({ recordId: rowId }),  // Send recordId to server
                    contentType: "application/json; charset=utf-8",  // Set content type as JSON
                    dataType: "json",  // Expect JSON response
                    success: function (response) {
                        row.remove();  // Remove the row from the table/grid
                        toastr.success('Record Removed Successfully!');
                    },
                    error: function (error) {
                        // Handle error (e.g., show an error message)
                        console.error("Error removing record:", error);
                    }
                });
            }
        }


        function submitForm(event) {
            event.preventDefault();
            var data = [];
            var isValid = true;
            $('.familyprescription-row').each(function () {
                var row = $(this); // Store the current row
                var memberId = row.find('select[name="member[]"]').val(); // Get selected member (single select dropdown)
                if (!memberId) { // If memberId is empty (not selected)
                    isValid = false;  // Set form as invalid
                    //alert("Member is required for all rows."); // Display an alert for missing member
                    toastr.error('Member is required.');
                    return false; // Stop processing and exit the loop
                }
                var conditions = row.find('select[name="condition[]"]').val(); // Get selected conditions (multiple select dropdown)

                // For multiple selections, `conditions` will return an array, while `memberId` will be a single value.
                data.push({
                    id: row.find('input[name="Id[]"]').val(),  // Keep the original ID if applicable
                    memberId: memberId || '',  // Use selected member ID or empty string if none
                    condition: conditions ? conditions.join(',') : '',  // Convert conditions array to comma-separated string
                    medication: row.find('input[name="medication[]"]').val(),
                    power: row.find('input[name="power[]"]').val(),
                    dosage: row.find('input[name="dosage[]"]').val(),
                    timings: row.find('input[name="timings[]"]').val(),
                });
            });
            console.log(data);
            if (data.length == 0 && isValid) {
                isValid = false;  // Set form as invalid
                toastr.error('Add atleast one prescription.');
            }
            if (isValid) {
                $.ajax({
                    type: "POST",
                    url: "MedicalHistory.aspx/SaveFamilyPrescription",
                    data: JSON.stringify({ data: data }),
                    contentType: "application/json; charset=utf-8",  // Send JSON
                    dataType: "json",
                    success: function (response) {
                        $('#gridContainer').html('');
                        fetchData();

                        modal.hide();
                        
                        toastr.success('Data Saved Successfully!');
                    }
                });

            }
            
            
            // Here you can send the form data to the server (e.g., through Ajax)
            
        }

    </script>
</asp:Content>
