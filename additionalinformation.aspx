<%@ Page Title="Additional Information" Language="C#" AutoEventWireup="true" CodeBehind="additionalinformation.aspx.cs" Inherits="hfiles.additionalinformation" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="<%= ResolveUrl("~/css/style.css") %>" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
        integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Additional Information</title>
</head>

<body class="additional-information common-design">

    <img class="home-icon-top-right" src="<%= ResolveUrl("~/Add Members/home-icon.png") %>" alt="">
    <img class="blue-trangle-top-left" src="<%= ResolveUrl("~/assets/blue-trangle.png") %>" alt="">
    <img class="blue-trangle-top-right" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle6.png") %>" alt="">
    <img class="blue-trangle-right" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle3.png") %>" alt="">
    <img class="blue-trangle-left" src="<%= ResolveUrl("~/Terms & Conditions/blue-trangle5.png") %>" alt="">
    <img class="plus-top-left" src="<%= ResolveUrl("~/assets/plus-1.png") %>" alt="">

    <div runat="server" id="AdditionalDiv">

        <div class="additionl-main-div container pt-5 px-5 h-90">
            <div class="row pt-5">
                <div class="col-12">
                    <h1 class="heading">Additional Information</h1>
                    <div class="row py-2">
                        <div class="col-lg-1 col-xl-1 col-md-2 col-sm-4">
                            <p class="sub-heading">Hight</p>
                        </div>
                        <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
                            <div>
                                <input runat="server" id="heightfeetTextBox" class="hight-input" type="number"><span>ft</span>
                            </div>
                        </div>
                        <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
                            <div>
                                <input runat="server" id="heightinchTextBox" class="hight-input" type="number"><span>inch</span>
                            </div>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-lg-1 col-xl-1 col-md-2 col-sm-4">
                            <p class="sub-heading">Weight</p>
                        </div>
                        <div class="col-lg-2 col-xl-2 col-md-3 col-sm-4">
                            <div>
                                <input runat="server" id="weightTextBox" class="hight-input" type="number"><span>kg</span>
                            </div>
                        </div>
                    </div>
                    <div class="row border-bottom">
                        <div class="col-4">
                        </div>
                        <div class="col-2">
                            <p class="fw-bold">Yes</p>
                        </div>
                        <div class="col-2">
                            <p class="fw-bold">No</p>
                        </div>
                        <div class="col-2">
                            <p class="fw-bold">Occasionally </p>
                        </div>
                    </div>
                    <div class="row border-bottom pt-4">
                        <div class="col-4">
                            <p class="sub-heading">Do You Smoke?</p>
                        </div>
                        <div class="col-2">
                            <img id="yes-selected-smoke" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="yes-not-selected-smoke" onclick="handleSelectSmoke('yes')"
                                src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                            <!-- <input class="checkbox" type="checkbox"> -->
                        </div>
                        <div class="col-2">
                            <img id="no-selected-smoke" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="no-not-selected-smoke" onclick="handleSelectSmoke('no')" src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                            <!-- <input class="c-checkbox" type="checkbox" name="yes" id=""> -->
                        </div>
                        <div class="col-2">
                            <img id="Occasionally-selected-smoke" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="Occasionally-not-selected-smoke" onclick="handleSelectSmoke('Occasionally')"
                                src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                        </div>
                    </div>
                    <div class="row border-bottom pt-4">
                        <div class="col-4">
                            <p class="sub-heading">Do You Consume Alcohol?</p>
                        </div>
                        <div class="col-2">
                            <img id="yes-selected-alcohol" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="yes-not-selected-alcohol" onclick="handleSelectAlcohol('yes')"
                                src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                        </div>
                        <div class="col-2">
                            <img id="no-selected-alcohol" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="no-not-selected-alcohol" onclick="handleSelectAlcohol('no')"
                                src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                        </div>
                        <div class="col-2">
                            <img id="occasionally-selected-alcohol" src="<%= ResolveUrl("~/assets/select.png") %>" alt="" srcset="">
                            <img id="occasionally-not-selected-alcohol" onclick="handleSelectAlcohol('Occasionally')"
                                src="<%= ResolveUrl("~/assets/not-select.png") %>" alt="" srcset="">
                        </div>
                    </div>
                    <div class="row pt-4">
                        <div class="col-10">
                            <p class="sub-heading">Do you have any surgeries? if yes. please specify:</p>
                        </div>
                    </div>
                    <div class="row surgeries-div">
                        <div class="col-8">
                            <input type="text">
                        </div>
                        <div  class="col-2 add-surgeries">
                            +
                        </div>
                        <div class="col-2">
                            <div class="select-years">
                                <select>
                                    <option value="">Year</option>
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="mt-5">
                        <button onclick="HideAdditionalDiv()" class="thm-blue-button">Next</button>
                    </div>
                </div>
            </div>
            <img class="blue-trangle-bottom" src="<%= ResolveUrl("~/Add Members/blue-trangle-5.png") %>" alt="">
        </div>

        <img class="plus-bottom-right" src="<%= ResolveUrl("~/assets/plus-2.png") %>" alt="">
    </div>

    <div runat="server" id="medicalHistoryDiv" class="medical-history common-design">
        <img class="home-icon-top-right" src="../Add Members/home-icon.png" alt="">
        <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
        <img class="blue-trangle-top-right" src="../Terms & Conditions/blue-trangle6.png" alt="">
        <img class="blue-trangle-right" src="../Terms & Conditions/blue-trangle3.png" alt="">
        <img class="blue-trangle-left" src="../Terms & Conditions/blue-trangle5.png" alt="">
        <img class="plus-top-left" src="../assets/plus-1.png" alt="">

        <div class="medical-main-div container pt-5 px-5 h-90 ">
            <div class="row mt-5">
                <div class="col-12">
                    <h1 class="heading">Medical History</h1>
                </div>
                <div class="row">
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
                <div class="row inner-main-div">
                    <div class="row">
                        <div class="col-6">
                            <p>Diabetes</p>
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
                    </div>
                </div>
            </div>
            <div class="medic-his-btn">
                <button class="thm-back-button" onclick="HideMedicalHistoryDiv()">Back</button>
                <button onclick="HideMedicalHistoryDiv()" class="thm-blue-button">Next</button>
            </div>
        </div>
        <img class="blue-trangle-bottom" src="../Add Members/blue-trangle-5.png" alt="">

        <img class="plus-bottom-right" src="../assets/plus-2.png" alt="">
    </div>


    <script>
        window.onload = function () {

            document.getElementById('medicalHistoryDiv').style.display = "none";
        };
        
        let isSelectSmoke = '';
        let isSelectAlcohol = '';
        const yesSelectImgSmoke = document.getElementById('yes-selected-smoke');
        const yesNotSelectImgSmoke = document.getElementById('yes-not-selected-smoke');
        const noSelectImgSmoke = document.getElementById('no-selected-smoke');
        const noNotSelectImgSmoke = document.getElementById('no-not-selected-smoke');
        const OccasionallySelectImgSmoke = document.getElementById('Occasionally-selected-smoke');
        const OccasionallyNotSelectImgSmoke = document.getElementById('Occasionally-not-selected-smoke');

        const yesSelectAlcoholImg = document.getElementById('yes-selected-alcohol');
        const yesNotSelectAlcoholImg = document.getElementById('yes-not-selected-alcohol');
        const noSelectAlcoholImg = document.getElementById('no-selected-alcohol');
        const noNotSelectAlcoholImg = document.getElementById('no-not-selected-alcohol');
        const occasionallySelectAlcoholImg = document.getElementById('occasionally-selected-alcohol');
        const occasionallyNotSelectAlcoholImg = document.getElementById('occasionally-not-selected-alcohol');

        yesNotSelectImgSmoke.style.display = 'none'
        noSelectImgSmoke.style.display = 'none'
        OccasionallySelectImgSmoke.style.display = 'none'
        yesNotSelectAlcoholImg.style.display = 'none'
        noSelectAlcoholImg.style.display = 'none'
        occasionallySelectAlcoholImg.style.display = 'none'

        function handleSelectSmoke(e) {
            isSelectSmoke = e;
            if (isSelectSmoke === 'yes') {
                yesSelectImgSmoke.style.display = 'block'
                yesNotSelectImgSmoke.style.display = 'none'
                noSelectImgSmoke.style.display = 'none'
                noNotSelectImgSmoke.style.display = 'block'
                OccasionallySelectImgSmoke.style.display = 'none'
                OccasionallyNotSelectImgSmoke.style.display = 'block'
            } else if (isSelectSmoke === 'no') {
                yesSelectImgSmoke.style.display = 'none'
                yesNotSelectImgSmoke.style.display = 'block'
                noSelectImgSmoke.style.display = 'block'
                noNotSelectImgSmoke.style.display = 'none'
                OccasionallySelectImgSmoke.style.display = 'none'
                OccasionallyNotSelectImgSmoke.style.display = 'block'
            } else if (isSelectSmoke === 'Occasionally') {
                yesSelectImgSmoke.style.display = 'none'
                yesNotSelectImgSmoke.style.display = 'block'
                noSelectImgSmoke.style.display = 'none'
                noNotSelectImgSmoke.style.display = 'block'
                OccasionallySelectImgSmoke.style.display = 'block'
                OccasionallyNotSelectImgSmoke.style.display = 'none'
            }
        }
        function handleSelectAlcohol(e) {
            isSelectAlcohol = e;
            if (isSelectAlcohol === 'yes') {
                yesSelectAlcoholImg.style.display = 'block'
                yesNotSelectAlcoholImg.style.display = 'none'
                noSelectAlcoholImg.style.display = 'none'
                noNotSelectAlcoholImg.style.display = 'block'
                occasionallySelectAlcoholImg.style.display = 'none'
                occasionallyNotSelectAlcoholImg.style.display = 'block'
            } else if (isSelectAlcohol === 'no') {
                yesSelectAlcoholImg.style.display = 'none'
                yesNotSelectAlcoholImg.style.display = 'block'
                noSelectAlcoholImg.style.display = 'block'
                noNotSelectAlcoholImg.style.display = 'none'
                occasionallySelectAlcoholImg.style.display = 'none'
                occasionallyNotSelectAlcoholImg.style.display = 'block'
            } else if (isSelectAlcohol === 'Occasionally') {
                yesSelectAlcoholImg.style.display = 'none'
                yesNotSelectAlcoholImg.style.display = 'block'
                noSelectAlcoholImg.style.display = 'none'
                noNotSelectAlcoholImg.style.display = 'block'
                occasionallySelectAlcoholImg.style.display = 'block'
                occasionallyNotSelectAlcoholImg.style.display = 'none'
            }
        }

        function HideAdditionalDiv() {
            document.getElementById('AdditionalDiv').style.display = "none";
            document.getElementById('medicalHistoryDiv').style.display = "block";
        }
        function HideMedicalHistoryDiv() {
            document.getElementById('AdditionalDiv').style.display = "block";
            document.getElementById('medicalHistoryDiv').style.display = "none";
        }

    </script>
</body>

</html>
