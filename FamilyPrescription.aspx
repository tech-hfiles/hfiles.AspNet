<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="FamilyPrescription.aspx.cs" Inherits="hfiles.FamilyPrescription1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    z-index: 105000; /* Same as Bootstrap's modal z-index or higher */
}
                .responsive-button {
            font-size: larger; /* Default for mobile */
            color: black;
            background-color: white;
            border: none;
            padding: 10px 20px;
            cursor:pointer;
        }

        @media (min-width: 768px) {
            .responsive-button {
                font-size: x-large; /* Larger font size for desktop */
            }
        }
            </style>
            <div id="contentpdf">
            <div class="row">
                <div style="display:flex;margin:auto;justify-content:center">
                    <div style="display:flex;margin-left:auto;">
                        <img src="/assets2/family-prescription-logo.jpeg" style="width:60px;" />
<h1 style="color:#0331b5;margin-top:auto;margin-bottom:auto;">Family Prescription</h1>
                    </div>
                    <div style="display:flex;margin-left:auto;margin-right: 25px;margin-bottom: 10px;margin-top: 10px;">
                        <select class="form-select select-user" id="UserSelect" name="user[]">
    <option value="" selected>All User</option>
</select>
                    </div>
                    
                </div>
                
            </div>
                      <div class="row" style="max-width:98vw;margin:auto">
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
    <button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text">Schedule</button>
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
                </div>



       
          <div style="display:flex;justify-content:end">
              <div style="padding:10px">
                  <button type="button" class="responsive-button" id="addprescription" onclick="addPrescription()">Add <i class="fa fa-add" style="color:#ffd101"></i></button>
                  <button type="button" class="responsive-button" id="accessprescription" data-bs-toggle="modal" data-bs-target="#AccessModal">Access <i class="fa fa-check-circle-o" style="color:#ffd101"></i></button>
                  <button type="button" class="responsive-button" id="shareprescription" data-bs-toggle="modal" data-bs-target="#ShareModal">Share <i class="fa fa-share" style="color:#ffd101"></i></button>
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
                <div class="col-4" style="text-align:center;padding-top:12px">
                    <Button style="height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text;pointer-events: none;" class="skip-tab"  tabindex="-1">Member</Button>
                </div>
                <div class="col col-8" style="padding:10px">
                    <input type="hidden" id="PrescriptionId" name="Id[]">
                    <select class="form-select member-select" id="MemberSelect" name="member[]">
                        <option value="" disabled selected>Select Member</option>
                    </select>
                </div>
            </div>
            <div class="row">
               <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="pointer-events: none;height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text"  class="skip-tab" tabindex="-1">Condition</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <select class="form-select condition-select" id="ConditionSelect" name="condition[]" style="width:100%">
                        <option value="" disabled selected>Select Condition</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="pointer-events: none;height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text"  class="skip-tab" tabindex="-1">Medication</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Medication" placeholder="Type Medication" name="medication[]" />
                </div>
            </div>
            
            <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="pointer-events: none;height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text"  class="skip-tab" tabindex="-1">Dosage</Button>
</div>
                <div class="col col-8" style="padding:10px">
                    <input type="text" class="form-control" id="Dosage" placeholder="Type Dosage" name="dosage[]" />
                </div>
            </div>
                        <div class="row">
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="pointer-events: none;height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text"  class="skip-tab" tabindex="-1">Schedule</Button>
</div>
                <div class="col col-8" style="padding:10px">
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
                <div class="col-4" style="text-align:center;padding-top:12px">
    <Button style="pointer-events: none;height:40px;width:100px;background-color:#8cbcfa;border:none;border-radius:5px;cursor:text"  class="skip-tab" tabindex="-1">Timings</Button>
</div>
                <div class="col col-8" style="padding:10px">
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
                    <div id="checkboxContainer" style="display:flex;justify-content:space-evenly;width:40%;"></div>
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
        <div class="modal-body">
            

                <button class="btn whatsapp" style="background-color:#5FFC7B" onclick="sendWhatsApp(event)">
        <i class="fab fa-whatsapp"></i> WhatsApp
    </button>
<!-- Email Button -->
    <button class="btn email" style="background-color:#F72a27" onclick="sendEmail(event)">
        <i class="fas fa-envelope"></i> Gmail
    </button>
        </div>

    </div>
</div>
        </div>


            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>


            <script>
                var FetchedData = [];
                var AccessMember = [];
                var memberOptionsFetched = false;
                var conditionOptionsFetched = false;
                var currentUser = [];
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
                            // Handle success, e.g., bind the data to a grid
                            const dataList = JSON.parse(response.d);
                            FetchedData = dataList;
                            
                            //const tableBody = document.querySelector("#prescription tbody");
                            //tableBody.innerHTML = '';
                            //// Iterate over the parsed data and bind to your grid or add rows
                            if (memberOptionsFetched && conditionOptionsFetched) {
                                console.log("Data already fetched, not calling fetch again.");
                                //dataList.forEach((data) => {
                                //    addRecordTable(data);
                                //});
                                const userselect = document.getElementById('UserSelect');
                                userselect.dispatchEvent(new Event('change'));

                            } else {
                                // Promise.all to fetch both options only once
                                Promise.all([fetchMemberOptions(), fetchConditionOptions()])
                                    .then(() => {
                                        memberOptionsFetched = true;
                                        conditionOptionsFetched = true;
                                        //dataList.forEach((data) => {
                                        //    addRecordTable(data);
                                        //});
                                        //$("#UserSelect").trigger("change");
                                        const userselect = document.getElementById('UserSelect');
                                        userselect.dispatchEvent(new Event('change'));
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

                function addRecordTable(rowData) {
                    var hiddenData = "";
                    if (currentUser[0].user_id != rowData.UserId) {
                        hiddenData = "display:none;";
                    }


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
          <td style="text-align:center">${rowData.user_firstname}</td>
          <td style="text-align:center">${conditionNames}</td>
          <td style="text-align:center">${rowData.Medication}</td>
          <td style="text-align:center">${rowData.Dosage}</td>
          <td style="text-align:center">${rowData.Power}</td>
          <td style="text-align:center">${rowData.Timings}</td>
          <td style="text-align:center;${hiddenData}">
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

                $("#UserSelect").on("change", function () {
                    const selectedValue = $(this).val(); // Get the selected value
                    const selectedText = $(this).find('option:selected').text(); // Get the selected text

                    console.log(`Selected Value: ${selectedValue}`);
                    console.log(`Selected Text: ${selectedText}`);
                    const tableBody = document.querySelector("#prescription tbody");
                    tableBody.innerHTML = '';
                    if (selectedValue != "") {
                        const FilteredData = FetchedData.filter(opt => opt.UserId == parseInt(selectedValue));
                        FilteredData.forEach((data) => {
                            addRecordTable(data);
                        });
                    }
                    else {
                        FetchedData.forEach((data) => {
                            addRecordTable(data);
                        });
                    }
                    


                });


                function fetchMemberOptions() {
                    return new Promise((resolve, reject) => {
                        
                        // Simulate async operation
                        setTimeout(() => {
                            $.ajax({
                                type: "POST", // Use POST instead of GET
                                url: "FamilyPrescription.aspx/UserData",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    const userData = JSON.parse(response.d);
                                    currentUser = userData;
                                    console.log(userData);
                                    $.ajax({
                                        type: "POST", // Use POST instead of GET
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
                                            opt.value = currentUser[0].user_id; // Set the option value
                                            opt.textContent = currentUser[0].user_firstname; // Set the option text
                                            select.appendChild(opt); // Append the option
                                            
                                            const myopt = document.createElement('option');
                                            myopt.value = currentUser[0].user_id; // Set the option value
                                            myopt.textContent = currentUser[0].user_firstname; // Set the option text
                                            myopt.selected = true; // Make this option selected
                                            userselect.appendChild(myopt); // Append the option
                                            //userselect.dispatchEvent(new Event('change'));
                                            
                                            dependentMember.forEach(option => {
                                                const opt = document.createElement('option');
                                                opt.value = option.user_id; // Set the option value
                                                opt.textContent = option.user_FirstName; // Set the option text
                                                select.appendChild(opt); // Append the option
                                            });
                                            
                                            console.log('Member Options Fetched');
                                            const container = document.getElementById("checkboxContainer");
                                            
                                            IndependentMember.forEach(pair => {
                                                // Create a checkbox input
                                                const checkbox = document.createElement("input");
                                                checkbox.type = "checkbox";
                                                checkbox.id = pair.user_id;  // Use the key as the ID
                                                checkbox.name = "options";
                                                checkbox.value = pair.user_id; // Use the key as the value
                                                if (AccessMember.includes(pair.user_id)) {
                                                    checkbox.checked = true;
                                                }
                                                // Create a label
                                                const label = document.createElement("label");
                                                label.htmlFor = pair.user_id; // Associate the label with the checkbox
                                                label.textContent = pair.user_FirstName; // Display the value as the label text

                                                // Append checkbox and label to the container
                                                container.appendChild(checkbox);
                                                container.appendChild(label);


                                                const opt = document.createElement('option');
                                                opt.value = pair.user_id; // Set the option value
                                                opt.textContent = pair.user_FirstName; // Set the option text
                                                userselect.appendChild(opt); // Append the option



                                                // Add a line break for spacing
                                                container.appendChild(document.createElement("br"));
                                            });




                                            resolve(); // Resolve the promise when done
                                        },
                                        error: function () {
                                            console.error('Error fetching members data');
                                            //return []; // Return empty array in case of an error
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
                                toastr.success('User Prescription Removed Successfully!');
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
                            condition: conditions || '',  // Convert conditions array to comma-separated string
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
                                fetchData();

                                modal.hide();
                                if(parseInt(data[0].id) > 0){
                                    toastr.success('User Prescription Updated Successfully!');
                                }
                                else{
                                    toastr.success('User Prescription Added Successfully!');
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



                async function generatePDF() {
                    const { jsPDF } = window.jspdf;
                    const content = document.getElementById("contentpdf");

                    // Clone the original content to avoid modifying the displayed table
                    const contentClone = content.cloneNode(true);



                    const originalDropdowns = content.querySelectorAll("select");
                    const clonedDropdowns = contentClone.querySelectorAll("select");

                    originalDropdowns.forEach((original, index) => {
                        const cloned = clonedDropdowns[index];
                        cloned.value = original.value; // Copy the selected value
                    });



                    // Hide the last column of all rows in the table
                    const tables = contentClone.getElementsByTagName("table");
                    for (let table of tables) {
                        for (let row of table.rows) {
                            if (row.cells.length > 0) {
                                row.cells[row.cells.length - 1].style.display = "none";
                            }
                        }
                    }

                    // Create a temporary wrapper to render the modified content
                    const wrapper = document.createElement("div");
                    wrapper.style.position = "absolute";
                    wrapper.style.left = "-9999px";
                    wrapper.appendChild(contentClone);
                    document.body.appendChild(wrapper);

                    // Capture the div content as a canvas
                    const canvas = await html2canvas(contentClone, { scale: 2 });
                    const imgData = canvas.toDataURL("image/png");

                    // Remove the temporary wrapper
                    document.body.removeChild(wrapper);

                    // Create a jsPDF instance
                    const pdf = new jsPDF();

                    // Add the image to the PDF
                    const imgWidth = 190; // Width in mm
                    const pageHeight = pdf.internal.pageSize.height; // Page height in mm
                    const imgHeight = (canvas.height * imgWidth) / canvas.width;

                    let position = 0;

                    pdf.addImage(imgData, "PNG", 10, position, imgWidth, imgHeight);

                    return pdf.output("datauristring");
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
                        data: JSON.stringify({ base64PDF: pdfData.split(",")[1], shareTo : 'WhatsApp' }), // Remove "data:application/pdf;base64,"
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

            <script>

            </script>
            


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

