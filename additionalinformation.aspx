<%@ Page Title="Additional Information" Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/user.Master" CodeBehind="additionalinformation.aspx.cs" Inherits="hfiles.additionalinformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/style.css") %>" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <title>Additional Information</title>
    <style>

        .thm-blue-buttn{
    margin:8px 0 !important;
    font-size:15px;
    padding: 10px 45px;
    background: #0512B9;
    border-radius: 20px;
    color: #ffffff;
    font-weight: 700;
    outline: 0;
    border: 1px solid #d6d6d6;
        }

        .thm-back-button {
    font-size:15px;
    margin:8px 0 !important;
    padding: 10px 45px;
    background: #d6d6d6;
    border-radius: 20px;
    color: #08138f;
    font-weight: 700;
    outline: 0;
    border: 1px solid #d6d6d6;
}
        
       .heading mb-4 h1{
            font-family:'Red Hat Display', sans-serif !important;
        }
        @media(min-width: <1246px) {
            .footer {
                position: absolute;
                /* bottom: 0;*/
                width: 100%;
            }
        }

        @media (min-width: 800px) and (max-width: 1024px) {
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
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
        }

        @media(max-width: 480px) {
            .outertablepadd {
                padding:0px;
            }
        }

            @media(max-width: 380px) {
                .SingleCheckbox input[type=checkbox] + label {
                    margin: 0 11px !important;
                }
                .SingleCheckbox{
                  justify-items:center;
                  align-items:center;
                }

                .common-design .blue-trangle-bottom {
                    position: relative;
                    bottom: 0px;
                }
            }

            @media(max-width: 460px) {
                .SingleCheckbox input[type=checkbox] + label {
                    margin: 0 13px !important;
                }
            }

            @media(max-width: 768px) {
                .SingleCheckbox input[type=checkbox] + label {
                    margin: 0px 38px;
                }
            }

            @media(max-width: 344px) {

                .medical-main-div .inner-main-div {
                    overflow-x: hidden;
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

            @media (min-width: 370px) and (max-width: 375px) {
                .SingleCheckbox input[type=checkbox] + label {
                    margin: 0px 19px !important;
                }
                #type{
/*                    margin-left:10px !important;
*/                }
            }

            @media (min-width: 1918px) and (max-width: 1920px) {
                .common-design .blue-trangle-bottom {
                    bottom: -5px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <asp:ScriptManager runat="server" />--%>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="additional-information common-design" runat="server" id="AdditionalDiv">
          
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-icon-3.png" alt="">
                <div class="additionl-main-div container pt-5 px-5 h-90">
                   <%-- <a class="back-arrow-btn" href="javascript: history.go(-1)">
<%--                        <img src="../assets/back-arrow.png" alt="">--%>
                       <%-- Back</a>--%>
                    <div class="row <%--pt-5 px-5--%> pb-1">
                        <div class="col-12" style="font-family: 'Red Hat Display', sans-serif !important;">
                            <h1 class="heading text-blue">Additional Information</h1>
                            <div class="row py-2">
                                <div class="col-lg-1 col-xl-1 col-md-2 col-3">
                                    <p class="sub-heading">Height</p>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-4">
                                    <div>
                                        <input runat="server" id="heightfeetTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>ft</span>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-5">
                                    <div>
                                        <input runat="server" id="heightinchTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>inch</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row py-2">
                                <div class="col-lg-1 col-xl-1 col-md-2 col-3">
                                    <p class="sub-heading">Weight</p>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-5">
                                    <div>
                                        <input runat="server" id="weightTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number" /><span>kg</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-bottom">
                                <div class="col-4">
                                </div>
                                <div class="col-2 text-center">
                                    <p class="fw-bold">Yes</p>
                                </div>
                                <div class="col-2 text-center">
                                    <p class="fw-bold">No</p>
                                </div>
                                <%--<div class="col-2 text-center">
                                    <p class="fw-bold">Occasionally </p>
                                </div>--%>
                            </div>
                            <div class="row border-bottom pt-5 pb-4">
                                <div class="col-4">
                                    <p class="sub-heading">Do You Smoke?</p>
                                    <asp:HiddenField ID="hfDoyouSmoke" runat="server" />
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">

                                        <input type="radio" runat="server" id="smoke_yes" onclick="handleSelectSmoke(1)" name="SmokeGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_smoke_yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
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
                            <div class="row border-bottom pt-5 pb-4">
                                <div class="col-4">
                                    <p class="sub-heading">Do You Consume Alcohol?</p>
                                    <asp:HiddenField ID="hfDoyouConsumeAlcohol" runat="server" />
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" runat="server" id="alcohol_yes" onclick="handleSelectAlcohol(1)" value="1" name="AlcoholGroup" class="hidden-radio" />
                                        <label for="ContentPlaceHolder1_alcohol_yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
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
                            <div class="row pt-4">
                                <div class="col-10">
                                    <p class="sub-heading">Have you had any surgeries? if yes. please specify:</p>
                                </div>
                            </div>
                            <div class="row surgeries-div">
                                <div class="col-6 col-md-4">
                                    <input type="text" runat="server" id="txtSurgeries" placeholder="Enter the surgery details" />
                                </div>

                                <div class="col-lg-2 col-6">
                                    <div class="select-years">
                                        <asp:DropDownList runat="server" ID="yearpicker" name="yearpicker">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-1 col-12 mt-3 mt-lg-0">
                                    <div class="">
                                        <asp:Button Text="Add" ID="addsurgeryButton" class="thm-blue-button" OnClick="addsurgeryButton_Click" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-5 col-12 mt-lg-0 mt-5 outertablepadd">
                                    <div class="madical-surgery-table" style="max-height: 230px; overflow: auto;border-radius:10px;">
                                        <asp:GridView ID="surgeryGridView" AutoGenerateColumns="false" CssClass="surgeries-table w-100 text-center table table-striped table-hover" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="user_surgery_details" HeaderText="Surgery Details"
                                                    SortExpression="user_surgery_details" />
                                                <%--<asp:BoundField DataField="user_surgery_year" HeaderText="Surgery Date"
                                                    SortExpression="user_surgery_year" />--%>
                                                <%--<asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="../assets/not-select-red.png" HeaderText="Action" />--%>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>Surgery Date</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <asp:Label ID="lblSurgeryYear" runat="server" style="border-radius:10px !important;" Text='<%#Eval("user_surgery_year") %>'></asp:Label>
                                                           
                                                            <%--                                                             <asp:ImageButton CssClass="delete-report-btn" ID="lRemoveBtn" runat="server" OnClick="lRemoveBtn_Click1" CommandArgument='<%#Eval("user_surgery_id") %>' Text="Delete" ImageUrl="../Suppor Group (BG  & Icons)/delete-icon.png"></asp:ImageButton>--%>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>Delete Item</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <%--                                                            <asp:Label ID="lblSurgeryYear" runat="server" Text='<%#Eval("user_surgery_year") %>'></asp:Label>--%>
                                                              <asp:ImageButton CssClass="delete-report-btn" ID="lRemoveBtn" runat="server" OnClick="lRemoveBtn_Click1" CommandArgument='<%#Eval("user_surgery_id") %>' Text="Delete" ImageUrl="../Suppor Group (BG  & Icons)/delete-icon.png"></asp:ImageButton>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:ButtonField ButtonType="Button" Text="Delete"/>--%>

                                                <%-- <asp:BoundField HeaderText="Action" >
                                                
                                               <%--<asp:ImageButton ID="button1" Text="text" CssClass="log-out-btn" ImageUrl="../assets/not-select-red.png" runat="server"></asp:ImageButton>
                                            </asp:BoundField>--%>
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
                            <div class="mt-2 mt-lg-5 d-lg-flex d-flex">
                                <%--<asp:Button Text="Back" class="thm-back-button" OnClick="btnMedicalBack_Click" type="Button" ID="Button1" runat="server" />--%>

                                <asp:Button Text="Back" class="thm-back-button" style="background-color:#FFD101;margin-right:10px !important;" OnClick="btnAdditionalBack_Click" type="Button" ID="btnMedicalBack" runat="server" />
                                <asp:Button Text="Next" ID="btnUpdateAdditional" class="thm-blue-buttn mx-lg-3 my-2 my-lg-0" OnClick="btnUpdateAdditional_Click" runat="server" />
                                <%--<button onclick="HideAdditionalDiv()" type="submit" class="thm-blue-button">Next</button>--%>
                            </div>
                        </div>
                    </div>
                    <%-- <img class="blue-trangle-bottom" src="<%= ResolveUrl("~/Add Members/blue-trangle-5.png") %>" alt="">--%>
                    <%--<img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt="">--%>
                </div>
                <%--<img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
                <%-- <img class="plus-bottom-right" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="">--%>
            </div>
            <div class="container">
            <div runat="server" id="medicalHistoryDiv" class="medical-history common-design">
                
               
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-1.png" alt="">

                <div class="medical-main-div container <%--pt-5 px-5--%> h-90vh h-ssm-100vh mb-5 mb-lg-0">
                    <div class="row mt-5 m-0">
                        <div class="col-12">
                            <h1 class="heading mb-4 text-center">Medical History</h1>
                        </div>
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
                        <!-- add repeater -->
                        <div class="row inner-main-div">
                            <asp:Repeater runat="server" ID="rptDisease">
                                <ItemTemplate>
                                    <div class="row py-4 border-bottom medical-history-row">
                                        <div class="col-md-6 col-3">
                                            <p><%# Eval("disease_name") %></p>
                                            <asp:HiddenField runat="server" ID="hfdisease_id" Value='<%# Eval("disease_id") %>' />
                                            </p>
                                        
                                        </div>
                                        <%--                                    --%>
                                        <div class="col-md-6 col-5 SingleCheckbox justify-content-center align-items-center">
                                            <asp:CheckBoxList runat="server" ID="cbl" style="padding:20px;" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="1" Text=" " class="CheckBoxLabel" />
                                                <asp:ListItem Value="2" Text=" " />
                                                <asp:ListItem Value="3" Text=" " />
                                            </asp:CheckBoxList>
                                        </div>
                                        <%--  <div class="col-2 text-center">
                                        <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                                    </div>
                                    <div class="col-2 text-center">
                                        <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                                    </div>
                                    <div class="col-2 text-center">
                                        <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                                    </div>--%>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                    <div class="medic-his-btn mt-3">
                        <asp:Button Text="Next" ID="btnMedicalHistory" class="thm-blue-buttn" OnClick="btnMedicalHistory_Click" runat="server" />
                    </div>
                </div>
                <%--<img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt=""> --%>

                <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
            </div>
            <div class="allergy">
             <%--   <a class="back-arrow-btn" href="javascript: history.go(-1)">
                    <img src="../assets/back-arrow.png" alt="">Back</a>--%>
                <%--<img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                <img class="blue-trangle-top-right" src="../Terms & Conditions/blue-trangle6.png" alt="">
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-1.png" alt="">--%>

                <div id="AllergiesDiv" runat="server" class="medical-main-div container <%--pt-5 px-5--%> h-90 ">
                    <div class="row mt-5">
                        <div class="col-12">
                            <h1 class="heading mb-4">Do You Have Any of These Allergies?</h1>
                        </div>
                        <div class="row border-bottom">
                            <div class="col-md-6 col-4">
                                <p>Type</p>
                            </div>
                            <div class="col-md-2 col-3 text-center">
                                <p>Yes</p>
                            </div>
                            <div class="col-md-2 col-3 text-center">
                                <p>No</p>
                            </div>

                        </div>
                        <div class="row inner-main-div">
                            <div class="col-12">
                                <asp:Repeater runat="server" ID="rptAllergy">
                                    <ItemTemplate>
                                        <div class="row py-4 border-bottom allergy-row">
                                            <div class="col-md-6 col-4 d-flex align-items-center">
                                                <p class="m-0"><%# Eval("allergy_name") %></p>
                                                <asp:HiddenField runat="server" ID="hfallergy_id" Value='<%# Eval("allergy_id") %>' />
                                            </div>

                                            <div class="col-4 text-center SingleCheckbox">
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
                    <div class="medic-his-btn mt-3">
                        <asp:Button Text="Back" CssClass="thm-back-button my-2" ID="btnAllergyBack" style="background-color:#FFD101;" OnClick="btnAllergyBack_Click" runat="server" />
                        <asp:Button Text="Save" CssClass="thm-blue-buttn" ID="btnSaveAllergy" OnClick="btnSaveAllergy_Click" runat="server" />
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

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


    </script>
</asp:Content>
