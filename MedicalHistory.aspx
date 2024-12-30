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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <%--  <asp:ScriptManager runat="server" />--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <div id="SaveAllInfor" style="margin:auto;display:table">

               <div style="padding-top:4vh;padding-bottom:10px;display:flex;justify-content:space-evenly;">
                   <h1 style="color: #0331b5;">Medical History</h1>
               </div>
            <div class="accordion accordion-flush" id="accordionFlushExample" >
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed text-center" style="display:flow-root;background-color: #0331b5;color: #ffd101;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
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
      <button class="accordion-button collapsed text-blue" style="display:flow-root;background-color: #0331b5;color: #ffd101;text-align-last: center;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Additional Information
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
          
            <div class="additional-information common-design" runat="server" id="AdditionalDiv">

                
                <div class="additionl-main-div container h-90">
               
                    <div class="row" style="overflow:auto;max-height:40vh">
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
      <button class="accordion-button collapsed text-center" style="display:flow-root;background-color: #0331b5;color: #ffd101;border-radius: 9px;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
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
    </script>
</asp:Content>
