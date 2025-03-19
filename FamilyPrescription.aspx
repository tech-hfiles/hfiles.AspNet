<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="FamilyPrescription.aspx.cs" Inherits="hfiles.FamilyPrescription1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- jsPDF Library -->
    <meta name="viewport" content="width=device-height, initial-scale=1, maximum-scale=1, user-scalable=no, orientation=landscape"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!-- AutoTable Plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.31/jspdf.plugin.autotable.min.js"></script>

    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <style>
                #prescription thead,
                #prescription tbody,
                #prescription tfoot,
                #prescription tr,
                #prescription td,
                #prescription th {
                    border-width: thin;
                }

                .select2-container {
                    z-index: 105000;
                }

                .responsive-button {
                    font-size: larger; 
                    color: black;
                    background-color: white;
                    border: none;
                    padding: 10px 20px;
                    cursor: pointer;
                }

                @media (min-width: 768px) {
                    .responsive-button {
                        font-size: x-large; 
                    }
                }
            
                    #prescription th {
                        width: 169.28px;
                    }

                   
                    #prescription td {
                        width: 169.28px;
                        height: 41px;
                        text-align: center;
                    }

                   
                    #prescription th button {
                        width: 100px; 
                        height: 40px;
                        background-color: #8cbcfa;
                        border: none;
                        border-radius: 5px;
                        cursor: text;
                    }

                   
                    #prescription td:last-child {
                        width: 169.28px; 
                    }
                    .form-control{
                        border-radius: 3.375rem;
                        height:52px;
                        text-align: center;
                    }
                  
                    .table-responsive {
                        max-width: 98vw;
                        margin: auto;
                        border: solid 1px #dee2e6;
                        overflow-y: auto;
                    }

                 
                    .table {
                        width: 100%;
                        min-width: 800px; /* Ensures table doesn't shrink too much */
                        border-collapse: collapse;
                    }

                   
                    thead {
                        position: sticky;
                        top: 0;
                        background-color: white;
                        z-index: 1;
                    }

                   
                    .table button {
                        height: 40px;
                        width: 100px;
                        background-color: #8cbcfa;
                        border: none;
                        border-radius: 5px;
                        cursor: default;
                    }

                  
                    @media (max-width: 767px) {
                        .table-responsive {
                            max-height: 400px;
                        }

                        .table {
                            min-width: 600px;
                        }
                    }
                                    .select-user {
                   
                                        width: 151px!important;
                                        margin-right: -19px;
                                    }
                  
                    @media (min-width: 768px) and (max-width: 1180px) {
                        #contentpdf {
    width: 100vw !important;
    overflow: visible !important;
}
                        .table-responsive {
                            max-height: 500px;
                        }
                    }

                   
                    @media (min-width: 1181px) {
                        .table-responsive {
                            max-height: 650px;
                        }
                    }
                             .share-btn {
                       display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 10px 15px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 7px;
                text-decoration: none;
                color: black;
                margin: 10px;
                border: none;
                border: 2px solid dimgray;
                    width: 165px;
                }

   

                .share-btn img {
                    margin-right: 8px;
                }


             
/* Keep button style for headers */
.header-btn {
    height: 40px;
    width: 100px;
    background-color: #8cbcfa;
    border: none;
    border-radius: 5px;
    cursor: text;
    font-weight: bold;
}
/* Ensure headers are visible */
thead {
    display: table-header-group !important;
}

/* Responsive table design */
@media screen and (max-width: 768px) {
    thead {
        display: none; /* Hides headers in small screens */
    }

    tbody, tr {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        padding: 10px;
        background: #fff;
    }

    td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px;
        border-bottom: 1px solid #ccc;
    }

    /* Add custom labels before each data row */
    td::before {
        content: attr(data-label);
        font-weight: bold;
        color: #333;
    }
  
    .table-responsive {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    tbody, tr {
        display: flex;
        flex-direction: column;
        width: 100%;
        border: 1px solid #dee2e6;
        margin-bottom: 10px;
        padding: 10px;
        background: #fff;
    }

    th, td {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        padding: 8px;
    }

    /* Hide actual table headers for mobile */
    thead {
        display: none;
    }

    td::before {
        content: attr(data-label);
        font-weight: bold;
        color: #333;
    }

    td:first-child {
        border-top: none;
    }

    td:last-child {
        border-bottom: none;
    }

}

            </style>
                <script type="text/javascript">
                    document.addEventListener("DOMContentLoaded", function () {
                        var conditionSelect = document.getElementById("ConditionSelect");
                        var otherConditionRow = document.getElementById("otherConditionRow");

                        if (conditionSelect) {
                            // Run only when the dropdown value changes
                            conditionSelect.addEventListener("change", function () {
                                debugger
                                if (this.options[this.selectedIndex].text === "Others") {
                                    otherConditionRow.style.display = "flex"; // Show the textbox row
                                } else {
                                    otherConditionRow.style.display = "none"; // Hide the textbox row
                                }
                            });
                        }
                    });
                </script>

            <div id="contentpdf">
                <div class="row">
                    <div style="display: flex; margin: auto; justify-content: center">
                        <div style="display: flex; margin-left: auto;">
                            <img src="journal-page-images/article/familyprescriptionlogo.jpeg" style="width: 60px;" />
                         
                            <h1 style="color: #0331b5; margin-top: auto; margin-bottom: auto;">Family Prescription</h1>
                        </div>
                        <div style="display: flex; margin-left: auto; margin-right: 25px; margin-bottom: 10px; margin-top: 10px;">
                            <select class="form-select select-user" id="UserSelect" name="user[]">
                                <option value="" selected>All User</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row" style="max-width: 98vw; margin: auto">
                    <div class="table-responsive"  style="overflow-x: auto;">
                        <table id="prescription" class="table" style="border: solid; border-color: #dee2e6; border-width: thin;">
                            <thead>
                                <tr>
                                    <th hidden>Id</th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Member</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Condition</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Medication</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Dosage</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Schedule</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Timing</button>
                                    </th>
                                    <th style="background-color: white; text-align: center;">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text">Action</button>
                                    </th>
                                </tr>
                            </thead>
                          <tbody id="prescriptionTableBody">
                           
                        </tbody>

                        </table>
                        <%--</thead>
                            <tbody id="prescriptionTableBody">
                                <!-- Default rows will be inserted here -->
                            </tbody>
                        </table>--%>
                       <%-- <button id="addRowButton">Add Row</button>
                        <button id="submitPrescriptionButton">Submit Prescription</button>--%>
                    </div>
                </div>
            </div>




            <div style="display: flex; justify-content: end;">
                <div style="padding: 10px; bottom: 0;">
                    <button type="button" class="responsive-button" id="addprescription" onclick="addPrescription()">Add <i class="fa fa-add" style="color: #ffd101"></i></button>
                    <button type="button" class="responsive-button" id="accessprescription" data-bs-toggle="modal" data-bs-target="#AccessModal">Access <i class="fa fa-check-circle-o" style="color: #ffd101"></i></button>
                    <button type="button" class="responsive-button" id="shareprescription" data-bs-toggle="modal" data-bs-target="#ShareModal">Share <i class="fa fa-share" style="color: #ffd101"></i></button>
                </div>


            </div>


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
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text; pointer-events: none;" class="skip-tab" tabindex="-1">Member</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <input type="hidden" id="PrescriptionId" name="Id[]">
                                        <select class="form-select member-select" id="MemberSelect" name="member[]">
                                            <option value="" disabled selected>Select Member</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                 <div class="col-4" style="text-align: center; padding-top: 12px">
                                     <button style="pointer-events: none; height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Condition</button>
                                 </div>
                                 <div class="col col-8" style="padding: 10px">
                                     <select class="form-select condition-select" id="ConditionSelect" name="condition[]" style="width: 100%">
                                         <option value="" disabled selected>Select Condition</option>
                                     </select>

                                 </div>
                             </div>
                             <div class="row" id="otherConditionRow" style="display:none;">
                                 <div>

                                 </div>
                                 <div>
                                       <input type="text" class="form-control" style="width: 291px; margin-left: 154px;" id="othercondition" placeholder="Type Other Condition" name="othercondition[]" />
                                 </div>

                             </div>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Medication</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <input type="text" class="form-control" id="Medication" placeholder="Type Medication" name="medication[]" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Dosage</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <input type="text" class="form-control" id="Dosage" placeholder="Type Dosage" name="dosage[]" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Schedule</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <%--<input type="text" class="form-control" id="Power" placeholder="Power" name="power[]" />--%>
                                        <select class="form-select" id="Power" name="power[]">
                                            <option value="" disabled selected>Select Schedule</option>
                                            <option>All Days</option>
                                            <option>Sunday</option>
                                            <option>Monday</option>
                                            <option>Tuesday</option>
                                            <option>Wednesday</option>
                                            <option>Thursday</option>
                                            <option>Friday</option>
                                            <option>Saturday</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #8cbcfa; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Timings</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <%--<input type="text" class="form-control" id="Timings" placeholder="Timings" name="timings[]" />--%>
                                        <select class="form-select" id="Timings" name="timings[]">
                                            <option value="" disabled selected>Select Timings</option>
                                            <option>12 AM</option>
                                            <option>1 AM</option>
                                            <option>2 AM</option>
                                            <option>3 AM</option>
                                            <option>4 AM</option>
                                            <option>5 AM</option>
                                            <option>6 AM</option>
                                            <option>7 AM</option>
                                            <option>8 AM</option>
                                            <option>9 AM</option>
                                            <option>10 AM</option>
                                            <option>11 AM</option>
                                            <option>12 PM</option>
                                            <option>1 PM</option>
                                            <option>2 PM</option>
                                            <option>3 PM</option>
                                            <option>4 PM</option>
                                            <option>5 PM</option>
                                            <option>6 PM</option>
                                            <option>7 PM</option>
                                            <option>8 PM</option>
                                            <option>9 PM</option>
                                            <option>10 PM</option>
                                            <option>11 PM</option>
                                        </select>
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


            <div class="modal fade" id="AccessModal" tabindex="-1" aria-labelledby="AccessModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title" id="AccessModalLabel">Give Access</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">
                            <div id="checkboxContainer" style="display: flex; justify-content: space-evenly; width: 40%;"></div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="SetAccess">Save changes</button>
                        </div>

                    </div>
                </div>
            </div>
     
                       <div class="modal fade" id="ShareModal" tabindex="-1" aria-labelledby="ShareModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="ShareModalLabel">Share as File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body text-center">
                <!-- WhatsApp Button -->
                <button class="share-btn whatsapp-btn" onclick="sendWhatsApp(event)">
                           <img src="journal-page-images/article/whatsapp.png" />   WhatsApp
                 </button>
                 <!-- Email Button -->
                 <button class="share-btn gmail-btn" onclick="sendEmail(event)">
                     <img src="journal-page-images/article/gmail.png" />Gmail
                 </button>
            </div>
        </div>
    </div>
</div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
             <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.31/jspdf.plugin.autotable.min.js"></script>

            <script>
                var FetchedData = [];
                var AccessMember = [];
                var memberOptionsFetched = false;
                var conditionOptionsFetched = false;
                var currentUser = [];
                var dataList = [];
                GetAccessData();
                function fetchData() {
                    FetchedData = [];
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "MedicalHistory.aspx/GetFamilyPrescriptions",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Data fetched successfully:", response.d);
                             dataList = JSON.parse(response.d);
                            FetchedData = dataList;

                            // Fetch the member options and condition options only once
                            if (memberOptionsFetched && conditionOptionsFetched) {
                                console.log("Data already fetched, not calling fetch again.");
                                populateTableWithData(FetchedData);
                            } else {
                                Promise.all([fetchMemberOptions(), fetchConditionOptions()])
                                    .then(() => {
                                        memberOptionsFetched = true;
                                        conditionOptionsFetched = true;
                                        populateTableWithData(FetchedData);
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
               
                document.addEventListener("DOMContentLoaded", () => {
                    
                    if (typeof dataList !== "undefined" && dataList.length > 0) {
                        populateMobileView(dataList);
                    } else {
                        console.log("No data found");
                    }
                });
                
                
                //window.addEventListener("resize", () => {
                //    if (window.innerWidth <= 768) {
                //        document.querySelector(".table-responsive").style.overflowX = "auto";
                //    } else {
                //        document.querySelector(".table-responsive").style.overflowX = "unset";
                //    }
                //});
                function populateTableWithData(dataList) {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    tableBody.innerHTML = ""; // Clear previous data

                    const isMobile = window.innerWidth <= 768; // Detect mobile
                    let filledRows = 0;
                    if (isMobile) {
                        

                        for (let i = 0; i < 6; i++) {
                            const rowData = dataList[i] || {};
                            populateMobileView(rowData);
                            filledRows++;
                        }


                        for (let i = filledRows; i < dataList.length; i++) {
                            populateMobileView(dataList[i]);
                        }// Switch to horizontal mobile layout
                    } else {
                        for (let i = 0; i < 6; i++) {
                            const rowData = dataList[i] || {};
                            addRecordTable(rowData);
                            filledRows++;
                        }


                        for (let i = filledRows; i < dataList.length; i++) {
                            addRecordTable(dataList);
                        }// Switch to horizontal mobile layout
                        // Default table layout
                    }
                }

                // 🟢 Desktop Layout - Normal Table Format
                function populateDesktopView(dataList) {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    debugger
                    let conditionName = "";
                   
                    dataList.forEach(rowData => {

                        if (rowData.Conditions) {
                            const conditionId = parseInt(rowData.Conditions); // Convert to number
                            const condition = conditionMaster.find(opt => opt.Id === conditionId);

                            if (condition.ConditionName == "Others") {
                                conditionName = rowData.otherConditions;
                            }
                            else {
                                conditionName = condition ? condition.ConditionName : "";
                            }// Assign name if found
                        }
                        const newRow = document.createElement("tr");
                        newRow.innerHTML = `
            <td>${rowData.user_firstname || '—'}</td>
            <td>${conditionName || '—'}</td>
            <td>${rowData.Medication || '—'}</td>
            <td>${rowData.Dosage || '—'}</td>
            <td>${rowData.Power || '—'}</td>
            <td>${rowData.Timings || '—'}</td>
            <td>
                <i class="fas fa-edit action-icons" title="Edit" style="cursor:pointer" onclick="editPrescription(${rowData.Id})"></i>
                &nbsp;
                <i class="fas fa-trash action-icons" title="Remove" style="cursor:pointer" onclick="removeRow(${rowData.Id})"></i>
            </td>
        `;
                        tableBody.appendChild(newRow);
                    });
                }

                // 🔵 Mobile Layout - Horizontal Format
                function populateMobileView(dataList) {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    tableBody.innerHTML = ""; // Clear previous data

                    dataList.forEach(rowData => {
                        const newRow = document.createElement("tr");

                        newRow.innerHTML = `
            <td>
                <button class="header-btn">Member</button>
            </td>
            <td>${rowData.user_firstname || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Condition</button>
            </td>
            <td>${rowData.ConditionNames || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Medication</button>
            </td>
            <td>${rowData.Medication || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Dosage</button>
            </td>
            <td>${rowData.Dosage || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Schedule</button>
            </td>
            <td>${rowData.Power || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Timing</button>
            </td>
            <td>${rowData.Timings || '—'}</td>
        </tr>
        <tr>
            <td>
                <button class="header-btn">Action</button>
            </td>
            <td>
                <button class="btn btn-primary" onclick="editPrescription(${rowData.Id})">Edit</button>
                <button class="btn btn-danger" onclick="removeRow(${rowData.Id})">Delete</button>
            </td>
        </tr>
        `;

                        tableBody.appendChild(newRow);
                    });
                }

                    

                    // Run the function when the page loads
              

                // 🟡 Refresh Data on Screen Resize
               
                function loadEmptyRows() {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    // Ensure that we load 6 empty rows initially
                    for (let i = 0; i < 14; i++) {
                        const newRow = document.createElement("tr");

                        // Set the height of the row to 41px
                        newRow.style.height = '41px';

                                        newRow.innerHTML = `
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                              <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                         `;

                        tableBody.appendChild(newRow);
                    }
                }



                function GetAccessData() {
                    FetchedData = [];
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "FamilyPrescription.aspx/GetAccessFamilyPrescription",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Data fetched successfully:", response.d);
                            //const dataList = JSON.parse(response.d);
                            AccessMember = response.d;
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

              


                function addPrescription(data = {}) {

                    modal.show();


                    $("#PrescriptionId").val(data.Id || '');
                    $("#MemberSelect").val(data.MemberId || '');
                    //const conditions = data.Conditions ? data.Conditions.split(',') : [];
                    //$("#ConditionSelect").val(conditions).trigger('change');
                    $("#ConditionSelect").val(data.Conditions || '');

                    $("#Medication").val(data.Medication || '');
                    $("#Power").val(data.Power || '');
                    $("#Dosage").val(data.Dosage || '');
                    $("#Timings").val(data.Timings || '');
                }
                function editPrescription(id) {
                    const data = FetchedData.filter(opt => opt.Id == parseInt(id));
                    addPrescription(data[0]);
                }

                $(document).ready(function () {
                   

                    $("#UserSelect").on("change", function () {
                        const selectedValue = $(this).val(); 
                        const tableBody = document.querySelector("#prescriptionTableBody");
                        tableBody.innerHTML = ''; 

                        if (selectedValue != "") {
                          
                            const FilteredData = FetchedData.filter(opt => opt.UserId == parseInt(selectedValue));
                            populateRows(FilteredData); 
                        } else {
                           
                            populateRows(FetchedData);
                        }
                    });
                });

               

               
                function populateRows(dataList) {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    let filledRows = 0;

                   
                    for (let i = 0; i < 14; i++) {
                        const rowData = dataList[i] || {}; 
                        addRecordTable(rowData);
                        filledRows++;
                    }

                  
                    for (let i = filledRows; i < dataList.length; i++) {
                        addRecordTable(dataList[i]);
                    }
                }

              
                function addRecordTable(rowData) {
                   
                    
                    var hiddenData = "";
                    if (currentUser[0].user_id != rowData.UserId) {
                        hiddenData = "display:none;";
                    }
                    const tableBody = document.querySelector("#prescriptionTableBody");

                   
                    const newRow = document.createElement("tr");
                    const memberName = memberMaster.find(opt => opt.user_id == parseInt(rowData.MemberId));
                    let conditionName = "";
                    if (rowData.Conditions) {
                        const conditionId = parseInt(rowData.Conditions); // Convert to number
                        const condition = conditionMaster.find(opt => opt.Id === conditionId);

                        if (condition.ConditionName == "Others") {
                            conditionName = rowData.otherConditions;
                        }
                        else {
                            conditionName = condition ? condition.ConditionName : "";
                        }// Assign name if found
                    }
                    newRow.setAttribute('data-id', rowData.Id || '');
                    newRow.innerHTML = `
                        <td hidden>${rowData.Id || ''}</td>
                        <td style="text-align:center">${rowData.user_firstname || ''}</td>
                        <td style="text-align:center">${conditionName || ''}</td>
                        <td style="text-align:center">${rowData.Medication || ''}</td>
                        <td style="text-align:center">${rowData.Dosage || ''}</td>
                        <td style="text-align:center">${rowData.Power || ''}</td>
                        <td style="text-align:center">${rowData.Timings || ''}</td>
                        <td style="text-align:center;${hiddenData}">
                            <i class="fas fa-edit action-icons" title="Edit" style="cursor:pointer" onclick="editPrescription(${rowData.Id || ''})"></i>
                            &nbsp;
                            <i class="fas fa-trash action-icons" title="Remove" style="cursor:pointer" onclick="removeRow(${rowData.Id || ''})"></i>
                        </td>
                        `;

                   
                    tableBody.appendChild(newRow);
                }
                               

                function fetchMemberOptions() {
                    return new Promise((resolve, reject) => {

                      
                        setTimeout(() => {
                            $.ajax({
                                type: "POST", 
                                url: "FamilyPrescription.aspx/UserData",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    const userData = JSON.parse(response.d);
                                    currentUser = userData;
                                    console.log(userData);
                                    $.ajax({
                                        type: "POST", 
                                        url: "MedicalHistory.aspx/GetUserMembers",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (response) {
                                            const Data = JSON.parse(response.d);
                                            memberMaster = Data;
                                            const dependentMember = Data.filter(opt => opt.IsDependent == 1);
                                            const IndependentMember = Data.filter(opt => opt.IsDependent == 0);

                                            console.log("Members", Data);
                                            const select = document.getElementById('MemberSelect');
                                            const userselect = document.getElementById('UserSelect');
                                            const opt = document.createElement('option');
                                            opt.value = currentUser[0].user_id; 
                                            opt.textContent = currentUser[0].user_firstname;
                                            select.appendChild(opt); 

                                            const myopt = document.createElement('option');
                                            myopt.value = currentUser[0].user_id; 
                                            myopt.textContent = currentUser[0].user_firstname; 
                                            myopt.selected = true; 
                                            userselect.appendChild(myopt);
                                           

                                            dependentMember.forEach(option => {
                                                const opt = document.createElement('option');
                                                opt.value = option.user_id;
                                                opt.textContent = option.user_FirstName; 
                                                select.appendChild(opt); 
                                            });

                                            console.log('Member Options Fetched');
                                            const container = document.getElementById("checkboxContainer");

                                            IndependentMember.forEach(pair => {
                                               
                                                const checkbox = document.createElement("input");
                                                checkbox.type = "checkbox";
                                                checkbox.id = pair.user_id; 
                                                checkbox.name = "options";
                                                checkbox.value = pair.user_id;
                                                if (AccessMember.includes(pair.user_id)) {
                                                    checkbox.checked = true;
                                                }
                                                
                                                const label = document.createElement("label");
                                                label.htmlFor = pair.user_id;
                                                label.textContent = pair.user_FirstName; 

                                             
                                                container.appendChild(checkbox);
                                                container.appendChild(label);


                                                const opt = document.createElement('option');
                                                opt.value = pair.user_id; 
                                                opt.textContent = pair.user_FirstName; 
                                                userselect.appendChild(opt); 



                                                
                                                container.appendChild(document.createElement("br"));
                                            });




                                            resolve(); 
                                        },
                                        error: function () {
                                            console.error('Error fetching members data');
                                           
                                            resolve();
                                        }
                                    });
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
                                    //$('#exampleModal').on('shown.bs.modal', function () {
                                    //    $('#ConditionSelect').select2({
                                    //        dropdownParent: $('#exampleModal')
                                    //    });
                                    //});

                                    //// Prevent modal close on select2 search click
                                    //$('#ConditionSelect').on('select2:opening select2:closing', function (e) {
                                    //    e.stopPropagation();
                                    //});
                                    //$('#ConditionSelect').select2();

                                    //// Trigger dropdown opening to show all options on click
                                    //$('#ConditionSelect').on('select2:open', function () {
                                    //    $('.select2-results__option').css('display', 'block');
                                    //});

                                    // Ensure dropdown shows all options initially

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

                    const row = document.querySelector(`tr[data-id='${rowId}']`); 
                    if (row) {

                        console.log(`Row with ID ${rowId} removed`); 
                        $.ajax({
                            type: "POST",
                            url: "MedicalHistory.aspx/RemoveFamilyPrescription",  
                            data: JSON.stringify({ recordId: rowId }),  
                            contentType: "application/json; charset=utf-8",  // Set content type as JSON
                            dataType: "json",  // Expect JSON response
                            success: function (response) {
                                row.remove();  // Remove the row from the table/grid
                                toastr.success('User Prescription Removed Successfully!');

                                setTimeout(function () {
                                    location.reload();
                                }, 500);
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
                        var row = $(this); 
                        var memberId = row.find('select[name="member[]"]').val(); 
                        if (!memberId) { 
                            isValid = false;  
                          
                            toastr.error('Member is required.');
                            return false; 
                        }
                        var conditions = row.find('select[name="condition[]"]').val(); 

                       
                        data.push({
                            id: row.find('input[name="Id[]"]').val(),  
                            memberId: memberId || '',  
                            condition: conditions || '',  
                            otherCondition: row.find('input[name="othercondition[]"]').val(),
                            medication: row.find('input[name="medication[]"]').val(),
                            power: row.find('select[name="power[]"]').val(),
                            dosage: row.find('input[name="dosage[]"]').val(),
                            timings: row.find('select[name="timings[]"]').val(),
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
                               

                                modal.hide();
                                if (parseInt(data[0].id) > 0) {
                                    toastr.success('User Prescription Updated Successfully!');
                                    setTimeout(function () {
                                        location.reload();
                                    }, 200);
                                }
                                else {
                                    toastr.success('User Prescription Added Successfully!');
                                    setTimeout(function () {
                                        location.reload();
                                    }, 200);
                                }

                            }
                        });

                    }


                    // Here you can send the form data to the server (e.g., through Ajax)

                }



                //Access
                // Select the button and container for displaying the result
                const fetchCheckedButton = document.getElementById("SetAccess");


                // Add a click event to fetch all checked checkboxes
                fetchCheckedButton.addEventListener("click", () => {
                    // Get all checked checkboxes with the name "options"
                    const checkedCheckboxes = document.querySelectorAll('input[name="options"]:checked');

                    // Map through the NodeList to get their values
                    const checkedValues = String(Array.from(checkedCheckboxes).map(checkbox => checkbox.value));
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/SetAccessFamilyPrescription", // Update with your page name
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Access: checkedValues }),
                        success: function (response) {

                            toastr.success('Access Updated!');
                        }
                    });

                });



           
                
                function getBase64Image(url) {
                    return new Promise((resolve, reject) => {
                        let img = new Image();
                        img.crossOrigin = "Anonymous"; // To prevent CORS issues
                        img.src = url;
                        img.onload = function () {
                            let canvas = document.createElement("canvas");
                            canvas.width = img.width;
                            canvas.height = img.height;
                            let ctx = canvas.getContext("2d");
                            ctx.drawImage(img, 0, 0);
                            let dataURL = canvas.toDataURL("image/png"); // Convert to Base64
                            resolve(dataURL);
                        };
                        img.onerror = function () {
                            reject("Error loading image: " + url);
                        };
                    });
                }

                async function generatePDF() {
                    const { jsPDF } = window.jspdf;
                    const doc = new jsPDF("landscape");

                    const table = document.getElementById("prescription");
                    if (!table) {
                        console.error("Error: Table element not found!");
                        return null;
                    }

                    try {
                        const base64Image = await getBase64Image("/journal-page-images/article/familyprescriptionlogo.jpeg");

                        const pageWidth = doc.internal.pageSize.getWidth(); // Get page width
                        const imageWidth = 30; // Image width
                        const xImage = (pageWidth - imageWidth) / 2; // Center image horizontally

                        // Add centered image
                        doc.addImage(base64Image, "JPEG", xImage, 5, imageWidth, 20);

                        // Center text
                        const text = "Family Prescription";
                        const textWidth = doc.getTextWidth(text);
                        const xText = (pageWidth - textWidth) / 2;

                        doc.setFontSize(16);
                        doc.setTextColor(0, 0, 255);
                        doc.setFont("helvetica", "bold");
                        doc.text(text, xText, 30); // Text below the image

                        // Generate Table
                        doc.autoTable({
                            html: table,
                            startY: 40, // Adjust position to avoid overlapping with the image and text
                            theme: "grid",
                            headStyles: { fillColor: [0, 150, 136], textColor: 255 },
                            styles: { fontSize: 10, cellPadding: 2 },
                            margin: { top: 10, left: 10, right: 10 }
                        });

                        return doc.output("datauristring");

                    } catch (error) {
                        console.error("Error generating PDF:", error);
                        return null;
                    }
                }




                async function sendWhatsApp(event) {
                    // Prevent the default action that might close the modal
                    event.stopPropagation();
                    event.preventDefault();

                    const pdfData = await generatePDF();
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/ShareFileAsLink",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ base64PDF: pdfData.split(',')[1]?.trim(), shareTo: 'WhatsApp' }), // Remove "data:application/pdf;base64,"
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            window.open(response.d, '_blank');
                        },
                        error: function (error) {
                            console.log("Error Share File As Link:", error);
                        }
                    });
                }



                async function sendEmail(event) {
                    // Prevent the default action that might close the modal
                    event.stopPropagation();
                    event.preventDefault();
                    const pdfData = await generatePDF();
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/ShareFileAsLink",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ base64PDF: pdfData.split(",")[1], shareTo: 'Email' }), // Remove "data:application/pdf;base64,"
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            window.open(response.d, '_blank');
                        },
                        error: function (error) {
                               console.log("Error Share File As Link:", error);
                        }
                    });
                }
                      

            </script>

           



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

