<%@ Page Title="Additional Information" Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/user.Master" CodeBehind="additionalinformation.aspx.cs" Inherits="hfiles.additionalinformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/style.css") %>" />

    <title>Additional Information</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="additional-information common-design" runat="server" id="AdditionalDiv">
                <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                <img class="blue-trangle-top-right" src="../Terms & Conditions/blue-trangle6.png" alt="">
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-icon-3.png" alt="">
                <div class="additionl-main-div container pt-5 px-5 h-90">
                    <div class="row pt-5">
                        <div class="col-12">
                            <h1 class="heading">Additional Information</h1>
                            <div class="row py-2">
                                <div class="col-lg-1 col-xl-1 col-md-2 col-sm-4">
                                    <p class="sub-heading">Height</p>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
                                    <div>
                                        <input runat="server" id="heightfeetTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number"><span>ft</span>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
                                    <div>
                                        <input runat="server" id="heightinchTextBox" onkeypress="return isNumberKey(event,this)" required class="hight-input" type="number"><span>inch</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row py-2">
                                <div class="col-lg-1 col-xl-1 col-md-2 col-sm-4">
                                    <p class="sub-heading">Weight</p>
                                </div>
                                <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
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
                                <div class="col-2 text-center">
                                    <p class="fw-bold">Occasionally </p>
                                </div>
                            </div>
                            <div class="row border-bottom pt-5 pb-4">
                                <div class="col-4">
                                    <p class="sub-heading">Do You Smoke?</p>
                                    <asp:HiddenField ID="hfDoyouSmoke" runat="server" />
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="smoke-yes" name="SmokeGroup" class="hidden-radio">
                                        <label for="smoke-yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="smoke-no" name="SmokeGroup" class="hidden-radio">
                                        <label for="smoke-no" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="smoke-occasionally" name="SmokeGroup" class="hidden-radio">
                                        <label for="smoke-occasionally" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row border-bottom pt-5 pb-4">
                                <div class="col-4">
                                    <p class="sub-heading">Do You Consume Alcohol?</p>
                                    <asp:HiddenField ID="hfDoyouConsumeAlcohol" runat="server" />
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="alcohol-yes" name="AlcoholGroup" class="hidden-radio">
                                        <label for="alcohol-yes" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="alcohol-no" name="AlcoholGroup" class="hidden-radio">
                                        <label for="alcohol-no" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
                                    <div class="radio-container">
                                        <input type="radio" id="alcohol-occasionally" name="AlcoholGroup" class="hidden-radio">
                                        <label for="alcohol-occasionally" class="radio-label">
                                            <div class="checkbox-circle">
                                                <div class="checkmark"></div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-4">
                                <div class="col-10">
                                    <p class="sub-heading">Do you have any surgeries? if yes. please specify:</p>
                                </div>
                            </div>
                            <div class="row surgeries-div">
                                <div class="col-4">
                                    <input type="text" runat="server" id="txtSurgeries">
                                </div>
                                <div class="col-lg-1 col-sm-2 text-center">
                                    <div class="add-surgeries">
                                        +
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-2">
                                    <div class="select-years">
                                        <asp:DropDownList runat="server" ID="yearpicker1" name="yearpicker">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-12">
                                    <table class="surgeries-table w-100">
                                        <thead>
                                            <tr>
                                                <td>Surgeries Name</td>
                                                <td>Date</td>
                                                <td>Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>abc</td>
                                                <td>05-08-1997</td>
                                                <td class="text-center"><i class="fa fa-sharp fa-solid fa-trash color-primary fa-2x"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mt-5">
                                <%--<asp:Button Text="Submit" ID="btnSubmit" runat="server" class="thm-blue-button" OnClick="btnSubmit_Click" />--%>
                                <asp:Button Text="Next" ID="btnUpdateAdditional" class="thm-blue-button" OnClick="btnUpdateAdditional_Click" runat="server" />
                                <%--<button onclick="HideAdditionalDiv()" type="submit" class="thm-blue-button">Next</button>--%>
                            </div>
                        </div>
                    </div>
                    <%-- <img class="blue-trangle-bottom" src="<%= ResolveUrl("~/Add Members/blue-trangle-5.png") %>" alt="">--%>
                    <img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt="">
                </div>
                <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
                <%-- <img class="plus-bottom-right" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="">--%>
            </div>
            <div runat="server" id="medicalHistoryDiv" class="medical-history common-design">
                <%--<img class="home-icon-top-right" src="../Add Members/home-icon.png" alt="">--%>
                <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                <img class="blue-trangle-top-right" src="../Terms & Conditions/blue-trangle6.png" alt="">
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-1.png" alt="">

                <div class="medical-main-div container pt-5 px-5 h-90">
                    <div class="row mt-5">
                        <div class="col-12">
                            <h1 class="heading mb-4">Medical History</h1>
                        </div>
                        <div class="row border-bottom p-0">
                            <div class="col-6">
                                <p>Type</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>Myself</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>Mother Side's</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>Father Side's</p>
                            </div>
                        </div>
                        <!-- add repeater -->
                        <div class="row inner-main-div">
                            <asp:Repeater runat="server" ID="rptDisease">
                                <ItemTemplate>
                                    <div class="row py-4 border-bottom medical-history-row">
                                        <div class="col-md-6">
                                            <p><%# Eval("disease_name") %></p>
                                            <asp:HiddenField runat="server" ID="hfdisease_id" Value='<%# Eval("disease_id") %>' />
                                            </p>
                                        
                                        </div>
                                        <%--                                    --%>
                                        <div class="col-md-6 SingleCheckbox">
                                            <asp:CheckBoxList runat="server" ID="cbl" class="" RepeatDirection="Horizontal">
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
                            <%--  <div class="row">
                            <div class="col-6">
                                <p>Diabetes</p>
                            </div>

                            <div class="col- text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p>Cancer</p>
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <p>Thyroid</p>
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p>Blood Pressure</p>
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p>Cholesterol</p>
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p>Cholesterol</p>
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                            <div class="col-2 text-center">
                                <img id="yes-selected-smoke" src="../assets/not-select.png" alt="" srcset="">
                            </div>
                        </div>--%>
                        </div>
                    </div>
                    <div class="medic-his-btn mt-3">
                        <asp:Button Text="Back" class="thm-back-button" OnClick="btnMedicalBack_Click" type="Button" ID="btnMedicalBack" runat="server" />
                        <asp:Button Text="Next" ID="btnMedicalHistory" class="thm-blue-button" OnClick="btnMedicalHistory_Click" runat="server" />
                    </div>
                </div>
                <img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt="">

                <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
            </div>
            <div class="allergy">
                <%--<img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
                <img class="blue-trangle-top-right" src="../Terms & Conditions/blue-trangle6.png" alt="">
                <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
                <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
                <img class="plus-top-left" src="../assets/plus-1.png" alt="">--%>

                <div id="AllergiesDiv" runat="server" class="medical-main-div container pt-5 px-5 h-90 ">
                    <div class="row mt-5">
                        <div class="col-12">
                            <h1 class="heading mb-4">Do You Have Any of These Allergies?</h1>
                        </div>
                        <div class="row border-bottom">
                            <div class="col-6">
                                <p>Type</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>Yes</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>No</p>
                            </div>

                        </div>
                        <div class="row inner-main-div">
                            <div class="col-12">
                                <asp:Repeater runat="server" ID="rptAllergy">
                                    <ItemTemplate>
                                        <div class="row py-4 border-bottom allergy-row">
                                            <div class="col-6 d-flex align-items-center">
                                                <p class="m-0"><%# Eval("allergy_name") %></p>
                                                <asp:HiddenField runat="server" ID="hfallergy_id" Value='<%# Eval("allergy_id") %>' />
                                            </div>
                                            
                                            <div class="col-4 text-center SingleCheckbox">
                                                <asp:RadioButtonList runat="server" ID="rblAllergy" class="col-6" CssClass=""                              RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="1" Text=" " class="CheckBoxLabel"/>
                                                    <asp:ListItem Value="0" Text=" " class="CheckBoxLabel"/>
                                                </asp:RadioButtonList>

                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <%--  <div class="row py-4 border-bottom allergy-row">
                                    <div class="col-6 d-flex align-items-center">
                                        <p class="m-0">Peanuts</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <input class="allergy-radio" type="hidden" name="peanuts" value="">
                                        <img src="../assets/select.png" alt="" srcset="" class="allergy-check-img" data-value="yes">
                                        <!-- <img class="d-none" src="../assets/not-select.png" alt="" srcset=""> -->
                                    </div>
                                    <div class="col-2 text-center">
                                        <img src="../assets/not-select.png" alt="" srcset="" class="allergy-check-img" data-value="no">
                                        <!-- <img class="d-none" src="../assets/select.png" alt="" srcset=""> -->
                                    </div>
                                    <!-- <div class="col-2 text-center">
                            <img src="../assets/not-select.png" alt="" srcset="">
                        </div> -->
                                </div>
                                <div class="row py-4 border-bottom">
                                    <div class="col-6 d-flex align-items-center">
                                        <p class="m-0">Dairy</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <input class="allergy-radio" type="hidden" name="dairy" value="">
                                        <img src="../assets/select.png" alt="" srcset="" class="allergy-check-img" data-value="yes">
                                        <!-- <img class="d-none" src="../assets/not-select.png" alt="" srcset=""> -->
                                    </div>
                                    <div class="col-2 text-center">
                                        <img src="../assets/not-select.png" alt="" srcset="" class="allergy-check-img" data-value="no">
                                        <!-- <img class="d-none" src="../assets/select.png" alt="" srcset=""> -->
                                    </div>
                                    <!-- <div class="col-2 text-center">
                            <img src="../assets/not-select.png" alt="" srcset="">
                        </div> -->
                                </div>
                                <div class="row py-4 border-bottom">
                                    <div class="col-6 d-flex align-items-center">
                                        <p class="m-0">Soya</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <input class="allergy-radio" type="hidden" name="soya" value="">
                                        <img src="../assets/select.png" alt="" srcset="" class="allergy-check-img" data-value="yes">
                                        <!-- <img class="d-none" src="../assets/not-select.png" alt="" srcset=""> -->
                                    </div>
                                    <div class="col-2 text-center">
                                        <img src="../assets/not-select.png" alt="" srcset="" class="allergy-check-img" data-value="no">
                                        <!-- <img class="d-none" src="../assets/select.png" alt="" srcset=""> -->
                                    </div>

                                </div>
                                <div class="row py-4 border-bottom">
                                    <div class="col-6 d-flex align-items-center">
                                        <p class="m-0">Fish</p>
                                    </div>
                                    <div class="col-2 text-center">
                                        <input class="allergy-radio" type="hidden" name="fish" value="">
                                        <img src="../assets/select.png" alt="" srcset="" class="allergy-check-img" data-value="yes">
                                    </div>
                                    <div class="col-2 text-center">
                                        <img src="../assets/not-select.png" alt="" srcset="" class="allergy-check-img" data-value="no">
                                    </div>

                                </div>
                                <div class="row py-4 border-bottom">
                                    <div class="col-6 others-div">
                                        <p class="m-0">Others</p>
                                        <input class="others-input" type="text" placeholder="Specify">
                                    </div>
                                    <div class="col-2 text-center">
                                        <input class="allergy-radio" type="hidden" name="others" value="">
                                        <img src="../assets/select.png" alt="" srcset="" class="allergy-check-img" data-value="yes">
                                    </div>
                                    <div class="col-2 text-center">
                                        <img src="../assets/not-select.png" alt="" srcset="" class="allergy-check-img" data-value="no">
                                    </div>

                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="medic-his-btn mt-3">
                        <asp:Button Text="Back" CssClass="thm-back-button my-2" ID="btnAllergyBack" OnClick="btnAllergyBack_Click" runat="server" />
                        <asp:Button Text="Save" CssClass="thm-blue-button" ID="btnSaveAllergy" OnClick="btnSaveAllergy_Click" runat="server" />
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
    </script>
</asp:Content>
