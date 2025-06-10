<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="MedicalHistory.aspx.cs"  Inherits="hfiles.MedicalHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Layout</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    
   



<link rel="stylesheet" href="../css/main.css">

  

<style>
    .modal {
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }
    .modal-content {
        background: white;
        padding: 20px;
        border-radius: 8px;
        width: 300px;
        position: relative;
    }
    .close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 18px;
        cursor: pointer;
    }
    .styled-dropdown {
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 6px 10px;
    font-size: 14px;
}

 .modal {
    display: none;
    justify-content: center;
    align-items: center;
}

.modal-content {
    position: relative;
    max-width: 400px;
    width: 100%;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
}

.close {
    font-size: 24px;
    font-weight: bold;
    position: absolute;
    top: 10px;
    right: 15px;
}

/* For 0px to 350px */
@media (max-width: 350px) {
    .pdleft {
        margin-right: -11px;
    }
}

/* For above 350px */
@media (min-width: 351px) {
    .pdleft {
        margin-right: 0px; /* or any other value */
    }
}
/*mobile*/
 @media (max-width: 768px) {
    #surgeryModal .modal-content {
      height: 566px !important;
        margin-top: -61px;
    }
  }

</style>

    

    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('userDropdown');
            const arrow = document.getElementById('arrowIcon');
            dropdown.classList.toggle('hidden');
            arrow.classList.toggle('rotate-180');
        }
        //Allergy popup
        function showModal() {
            const modal = document.getElementById("allergyModal");
            modal.classList.remove("hidden");
            modal.classList.add("flex");
        }

        function hideModal() {
            const modal = document.getElementById("allergyModal");
            modal.classList.remove("flex");
            modal.classList.add("hidden");
        }

        function showModal1() {
            const modal = document.getElementById("medicalPopup");
            modal.classList.remove("hidden");
            modal.classList.add("flex");
        }

        function hideModal1() {
            const modal = document.getElementById("medicalPopup");
            modal.classList.remove("flex");
            modal.classList.add("hidden");
        }

       
        
    </script>
  

          <!-- JavaScript of laptop arrow -->
          <script>
              function toggleDropdown2() {
                  const dropdown = document.getElementById('userDropdown2');
                  const arrow = document.getElementById('arrowIcon2');
                  dropdown.classList.toggle('hidden');
                  arrow.classList.toggle('rotate-180');
              }
          </script>




    <style>
        
    input.circle-checkbox[type="checkbox"] {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        width: 18px;
        height: 18px;
        border: 2px solid #2563eb; /* Tailwind blue-600 */
        border-radius: 50%;
        background-color: white;
        position: relative;
        cursor: pointer;
        transition: 0.2s;
    }
        .bg-info {
            --bs-bg-opacity: 1;
            /* background-color: rgba(var(--bs-info-rgb), var(--bs-bg-opacity)) !important; */
            background-color: rgb(172 237 255 / var(--tw-bg-opacity)) !important;
           

        }
    input.circle-checkbox[type="checkbox"]:checked::before {
        content: "";
        position: absolute;
        top: 3px;
        left: 3px;
        width: 8px;
        height: 8px;
        background-color: #2563eb;
        border-radius: 50%;
    }

    input.circle-checkbox[type="checkbox"]:hover {
        border-color: #1d4ed8; /* blue-700 */
    }
</style>
<style>
    .circle-checkbox input[type="checkbox"] {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        width: 20px;
        height: 20px;
        border: 2px solid #4B5563; /* gray-700 */
        border-radius: 50%; /* outer circle */
        background-color: white;
        cursor: pointer;
        position: relative;
        transition: all 0.2s ease-in-out;
    }

    .circle-checkbox input[type="checkbox"]:checked {
        background-color: #ffd101; /* green-500 */
        border-color: #ffd101;
    }

    .circle-checkbox input[type="checkbox"]::after {
        content: '✔';
        color: #0331b5;
        font-size: 14px;
        font-weight: bold;
        position: absolute;
        top: 0px;
        left: 3px;
        display: none;
    }

    .circle-checkbox input[type="checkbox"]:checked::after {
        display: block;
    }
     .responsive-dropdown {
     display: block;
     width: auto; 
     border: 2px solid black !important; 
   
 }

     .modal-container{
    display: flex;
    justify-content: center;
}
    /* .popupclass{
         margin-top: -90px;
     }
     .allerypopupcls{
         margin-top: -75px;
     }*/
     @media (max-width: 767px) {
          .col-12 {
                margin-left: 22px;
          }
     }
     .textclass {
  text-align: left;
 
}
     .btnclass{
         background-color: rgb(3 49 181 / var(--tw-bg-opacity, 1));
}
     /* Default styling (for desktop) */
.fixaliclass {
    margin-left: -144px;
}

/* Small devices (phones, less than 768px) */
@media screen and (max-width: 767px) {
    .fixaliclass {
       margin-left: -100px;
    }
}

/* Medium devices (tablets, 768px–1023px) */
@media screen and (min-width: 768px) and (max-width: 1023px) {
    .fixaliclass {
       margin-left: -144px;
    }
}

/* Large devices (desktops, 1024px and up) */
@media screen and (min-width: 1024px) {
    .fixaliclass {
       margin-left: -144px;
    }

    .modal-container{
        max-width: 60%;
        display: flex;
        justify-content: center;
    }

    .modal-subcontainer{
        max-width: 60%;
    }
}
@media (min-width: 650px) {
    .responsive-width {
        width: 332px !important;
    }
}

@media (max-width: 649px) {
    .responsive-width {
        width: 263px !important;
    }
}

.modal-divider{
    height: 1px;
background-color: #0331B5;
width: 55%;
min-width: 50px;
align-self: center;
}

    .modal-content-divider {
        height: 1px;
        background-color: black;
        width: 80%;
        max-width: 200px;
        margin: 0 auto;
    }

</style>
  <%-- <script>
       function startEditMode() {
           document.getElementById('<%= btnUpdateAdditional.ClientID %>').style.display = 'inline-block';
       }
   </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   
     <a class="back-arrow-btn-2" href="Dashboard.aspx">Back to Home
 </a>


  <div class="w-full text-center pt-5 px-4 sm:px-8  md:mt-2 md:px-12">
    <h1 class="text-xl sm:text-2xl  lg:text-[24px] font-semibold text-[#333333] leading-tight">
      Your <span class="text-[#0331b5]"> Health Story,</span> <span class="">All in One Place</span>
    </h1>
    <div class="border-[1px] w-[50%] mt-1 mb-4 border-black mx-auto md:w-[22rem] "></div>

  </div>
  <main class="flex flex-wrap md:mt-3 justify-between px-4 gap-4">

    
    

    <div class="flex w-full flex-col md:flex-row gap-6 p-4 px-0 lg:px-10 xl:px-20">
      <!-- Left Panel: Profile Info Phone screen show only in mobile screen -->
      <div class=" w-full block md:hidden max-w-sm mx-auto bg-white rounded-xl shadow-lg border border-gray-300 p-6 text-center font-sans">
        <!-- Profile Picture -->
        <div class="flex justify-center mb-3">
              <asp:Image ID="ProfileImagem" runat="server" alt="Profile Picture" 
class="w-24 h-24 md:w-28 md:h-28 rounded-full object-cover border-2 border-[#ffd100] shadow" />
         <%-- <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Profile"--%>
           <%-- class="w-24 h-24 rounded-full border-2 border-[#ffd100] shadow-md object-cover" />--%>
        </div>
      
        <!-- Name -->
           <asp:Label runat="server" ID="usernamem" class="text-[#0331b5] poppins text-xl font-bold"></asp:Label>
      <%--  <h2 class="text-[#0331b5] poppins text-xl font-bold">Ankit k.</h2>--%>
     
        <!-- <p class="text-gray-800 text-sm font-semibold mt-1 mb-3">HF010125ANK1312 <span> <i class="fa fa-angle-down" style="font-size:20px"></i></span></p> -->
         <div class="flex justify-center">
          <p class="text-gray-800 text-sm font-semibold mt-1 mb-3 flex items-center gap-1">
            
           <%-- <span class="flex items-center">

            <i class="fa fa-angle-down text-base"></i>
            </span>--%>
          </p>

          
        </div> <!-- Wrapper with relative positioning -->
<div class="relative flex justify-center"  style="margin-top: -20px;">
  <p class="text-gray-800 text-sm font-semibold mt-1 mb-3 flex items-center gap-1 cursor-pointer" onclick="toggleDropdown()">
   <%-- HF010125ANK1312--%>
       
      <asp:Label runat="server" ID="iblHidm"></asp:Label> 
  
    <span class="flex items-center transition-transform duration-300"  id="arrowIcon">
      <i class="fa fa-angle-down text-base"></i>
    </span>
  </p>

  <!-- Dropdown (initially hidden) -->
   
  <div id="userDropdown" class="absolute top-full mt-2 left-1/2 -translate-x-1/2 z-[9999] bg-white shadow-xl border border-gray-300 rounded-lg w-72 hidden">
   <%-- <div class="flex items-center gap-3 px-4 py-2 hover:bg-gray-100 cursor-pointer">--%>
      <%--<img src="https://randomuser.me/api/portraits/women/44.jpg" class="w-10 h-10 sm:w-14 sm:h-14 rounded-full object-cover" />
      <div class="leading-tight flex flex-col items-start ">
        <p class="font-semibold text-sm sm:text-[17px]">Priya S.</p>
        <p class="text-xs text-gray-600 sm:text-[13px] mt-1">HF010125PRI4411</p>
      </div>--%>
      <asp:DropDownList ID="DropDownformobile" runat="server" OnSelectedIndexChanged="DropDownformobile_SelectedIndexChanged" AutoPostBack="true" />

        
  <%-- </div>--%>
  </div>
</div>



        
        <!-- Info Box -->
        <div class="border border-gray-400 rounded-lg px-4 py-3 text-sm text-left space-y-3">
          <div class="flex justify-between">
            <span class="font-medium">Blood Group :</span>
           <%-- <span class="bg-gray-100 px-2 py-1 rounded">AB -</span>--%>
              <asp:DropDownList ID="DropDownbloodgrp" runat="server" style="width: 71px;" class="bg-gray-100 px-2 py-1 rounded">
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
      
        <div class="flex justify-between items-center">
     <span class="font-medium">Weight :</span>
     <div class="flex items-center gap-2">
       <input type="number" id="txtweight" runat="server" class="w-14 border rounded px-1 py-0.5 text-center" />
       <span>Kg</span>
     </div>
   </div>
      
   <div class="flex justify-between items-center">
     <span class="font-medium">Height :</span>
     <div class="flex items-center gap-2">
       <input type="number" id="txtheightfeet" runat="server" class="w-10 border rounded px-1 py-0.5 text-center" />
       <span>Feet</span>
       <input type="number" id="txtheightinch" runat="server" class="w-10 border rounded px-1 py-0.5 text-center" />
       <span>Inch</span>
     </div>
   </div>
      
   <hr class="border-gray-300 my-1">
      
  <!-- Smoking -->
<!-- Smoking -->
<div class="flex justify-between items-center">
    <span>Do You Smoke?</span>
    <asp:HiddenField ID="hfDoyouSmokem" runat="server" ClientIDMode="Static" />
    <div class="flex gap-4">
        <label class="flex items-center gap-1 text-xs">
            <asp:RadioButton ID="rdsmoke_yes" runat="server" GroupName="smoke" onclick="handleSelectSmoke(1)"
                CssClass="accent-yellow-400"  />
            Yes
        </label>
        <label class="flex items-center gap-1 text-xs">
            <asp:RadioButton ID="rdsmoke_no" runat="server" GroupName="smoke" onclick="handleSelectSmoke(0)"
                CssClass="accent-blue-700" />
            No
        </label>
    </div>
</div>

<!-- Alcohol -->
<div class="flex justify-between items-center">
    <span>Do You Consume Alcohol?</span>
    <asp:HiddenField ID="hfDoyouConsumeAlcoholm" runat="server"  ClientIDMode="Static"/>
    <div class="flex gap-4">
        <label class="flex items-center gap-1 text-xs">
            <asp:RadioButton ID="rdalcohol_yes" runat="server" GroupName="alcohol"
                CssClass="accent-yellow-400" onclick="handleSelectAlcoholm(1)" />
            Yes
        </label>
        <label class="flex items-center gap-1 text-xs">
            <asp:RadioButton ID="rdalcohol_no" runat="server" GroupName="alcohol"
                CssClass="accent-blue-700" onclick="handleSelectAlcoholm(0)" />
            No
        </label>
    </div>
</div>


                  
        </div>
      </div>
        <div id="saveWrapperM" runat="server" style="display:none;">
    
        <%--          <asp:Button Text="Save" ID="btnUpdateAdditionalM"  CssClass="bg-[#0331b5] text-white px-6 py-2 rounded shadow hover:bg-blue-800"  OnClick="btnUpdateAdditional_Click" runat="server" />--%>
            <asp:LinkButton ID="btnUpdateAdditionalM" runat="server" CausesValidation="false" OnClick="btnUpdateAdditionalM_Click" CssClass="bg-[#FCE588] poppins hover:bg-[#ffd100] text-[#333333] font-bold py-3 px-4 rounded-md text-sm flex items-center gap-2 w-[80%] sm:w-[11rem] mx-auto justify-center">
              <i class="fa-solid fa-plus"></i> Save Changes
            </asp:LinkButton>
        </div>


         <%--<asp:Button Text="Save" ID="btnUpdateAdditional" class="thm-blue-buttn mx-lg-3 my-2 my-lg-0" OnClick="btnUpdateAdditional_Click" OnClientClick="allergyfooter()" runat="server" />--%>

      <!--             Left Panel: Profile Info leaptop           -->
      <div id="fulcardform" class="px-6 self-start hidden md:block md:px-12  w-full md:w-1/2 bg-secondary-color rounded-xl p-6 shadow-md border border-black relative font-sans">
        <!-- Tag -->
        <div class="absolute top-0 right-0 bg-white text-xs font-semibold text-[17px] rounded-bl-lg rounded-tr-xl p-2">
         <%-- HF010125ANK1312--%>
            <asp:Label runat="server" ID="iblHid"></asp:Label> 
        </div>
      
        <!-- Profile + Info layout -->
        <div class="flex flex-col md:flex-row w-full gap-6 mt-10">
          <!-- Profile -->
          <div class="flex flex-col items-center">
            <!-- Profile Image -->
           <%-- <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Profile"--%>
               <asp:Image ID="ProfileImage" runat="server" alt="Profile Picture" 
              class="w-24 h-24 md:w-28 md:h-28 rounded-full object-cover border-2 border-[#ffd100] shadow" />
          
            <!-- Trigger & Dropdown wrapper -->
            <div class="relative w-full max-w-[300px]">
              <!-- Trigger -->
              <div onclick="toggleDropdown2()" class="text-sm text-gray-700 mt-2 font-semibold cursor-pointer flex items-center gap-1 pl-3">
                Change
                <span id="arrowIcon2" class="transition-transform duration-300">
                  <i class="fa fa-angle-down"></i>
                </span>
              </div>
          
              <!-- Dropdown -->
              <div id="userDropdown2"
                class="absolute left-2 top-full mt-2 z-[9999] bg-white shadow-xl border border-gray-300 rounded-lg w-[17rem] hidden">
             
                   <asp:DropDownList ID="DropDownfordesktop" runat="server" OnSelectedIndexChanged="DropDownfordesktop_SelectedIndexChanged" AutoPostBack="true" class="absolute left-2 top-full mt-2 z-[9999] bg-white shadow-xl border border-gray-300 rounded-lg w-[10rem;]" />

              </div>
            </div>
          </div>
          

          
      
          <!-- Info -->
          <div class="w-full md:w-3/5 space-y-3 text-sm text-gray-900 font-semibold mt-4 md:mt-0">
            <%--<h2 class="text-xl md:text-2xl font-bold text-[#0331b5] poppins mb-1">Ankit k.</h2>--%>
               <asp:Label runat="server" ID="username" Style="margin-left: 4px;" class="text-[#0331b5] poppins text-xl font-bold"></asp:Label>
      
            <div class="flex items-center gap-2">
              <span class="p-1 text-[14px] whitespace-nowrap" >Blood Group :</span>
              <%--<div class="bg-white border rounded px-2 py-1"><span class="font-medium">AB -</span></div>--%>
                <asp:DropDownList ID="DropDownList1" runat="server" style="width: 71px;" class="bg-gray-100 px-2 py-1 rounded">
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
      
            <div class="flex items-center gap-2">
              <span class="p-1 text-[14px] whitespace-nowrap">Weight :</span>
              <input type="number" id="weightTextBox" runat="server" class="w-14 border font-medium rounded px-2 py-1" />
              <span class="ml-2 font-semibold text-[#333333]">Kg</span>
            </div>
      
            <div class="flex items-center flex-wrap gap-y-2  gap-2 w-[119%]">
              <span class="p-1 text-[14px] whitespace-nowrap">Height :</span>
              <input type="number" id="heightfeetTextBox" runat="server" class="w-12 border rounded font-medium px-2 py-1" />
              <span class="mx-2 font-semibold text-[#333333]">Feet</span>
              <input type="number" id="heightinchTextBox" runat="server" class="w-12 border rounded font-medium px-2 py-1" />
              <span class="ml-2 font-semibold text-[#333333]">Inch</span>
            </div>
          </div>
        </div>
      
        <!-- Do You Smoke? -->
        <div class="mt-6 flex flex-col sm:flex-row sm:items-center sm:justify-between xl:w-[80%] text-sm font-semibold text-gray-900 gap-2 smokeclass">
          <p class="w-full sm:w-52">Do You Smoke?</p>
            <asp:HiddenField ID="hfDoyouSmoke" runat="server" ClientIDMode="Static"/>
          <div class="flex gap-6 justify-center sm:justify-start">
            <label class="flex flex-col items-center gap-1">
              <span class="text-xs">Yes</span>
              <input type="radio" name="smoke" runat="server" onclick="handleSelectSmoke(1)" id="smoke_yes"  class="w-4 h-4 accent-yellow-400" />
                 
            </label>
            <label class="flex flex-col items-center gap-1">
              <span class="text-xs">No</span>
              <input type="radio" name="smoke" runat="server" onclick="handleSelectSmoke(0)" id="smoke_no"  class="w-4 h-4 accent-blue-700" checked />
                 
            </label>
               
          </div>
        </div>
      
        <!-- Do You Consume Alcohol? -->
        <div class="mt-6 flex flex-col sm:flex-row sm:items-center sm:justify-between xl:w-[80%] text-sm font-semibold text-gray-900 gap-2 alcoholclass">
          <p class="w-full sm:w-52">Do You Consume Alcohol?</p>
              <asp:HiddenField ID="hfDoyouConsumeAlcohol" runat="server" ClientIDMode="Static"/>
          <div class="flex gap-6 justify-center sm:justify-start">
            <label class="flex flex-col items-center gap-1">
              <span class="text-xs">Yes</span>
              <input type="radio" name="alcohol"  runat="server"  onclick='handleSelectAlcohol(1)' id="alcohol_yes"  class="w-4 h-4 accent-yellow-400" checked />
                 
            </label>
            <label class="flex flex-col items-center gap-1">
              <span class="text-xs">No</span>
              <input type="radio" name="alcohol" runat="server" id="alcohol_no" onclick='handleSelectAlcohol(0)'  class="w-4 h-4 accent-blue-700" />
                 
            </label>
          </div>
        </div>
     
                  
        
      </div>
      
    
      <!-- Right Panel: Surgical History -->
   
       
      <section id="surgeryMessageSection" runat="server" class="md:p-6 md:w-1/2 rounded-xl w-full">
        <div class="px-6 py-6 text-center w-full">
          <h2 class="text-[#0331b5] font-bold sm:text-[20px] lg:text-2xl mb-2">
            No Surgeries? No Problem!
          </h2>
          <p class="font-medium mb-4 leading-[26px] sm:text-[17px] md:text-[17px] text-gray-800">
            Even if you haven’t had surgery yet, keeping track of past procedures can be crucial for
            <a href="#" class="text-[#0331b5]">future care</a>. If you've had one, Add it now to keep a complete track of 
            <a href="#" class="text-[#0331b5]">your medical history!</a>
          </p>
      
          <!-- Button -->
          <button  type="button" onclick="toggleSurgeryInput()" class="bg-[#FCE588] w-[90%] mt-2 font-semibold px-5 py-2 rounded-md hover:bg-yellow-400 shadow-md">
            Add Surgery
          </button>
           

             
          <!-- Hidden Input Container -->
     

           <div id="input-container" class="mt-4 hidden transition-all duration-300 ease-in-out">
  <%--<div class="flex flex-col sm:flex-row gap-2">
    <asp:TextBox id="txtSurgeryName" runat="server" placeholder="Surgery Name"
      class="w-full sm:w-[60%] border border-gray-400 rounded-md px-3 py-2 text-sm" />
      <asp:TextBox ID="txthostname" runat="server" placeholder="Enter hospital Name"
      class="w-full sm:w-[40%] border border-gray-400 rounded-md px-3 py-2 text-sm"/>
      </div><br />
    <div class="flex flex-col sm:flex-row gap-2">
        <asp:TextBox ID="txtdrname" runat="server" placeholder="Enter Dr. Name"
      class="w-full sm:w-[60%] border border-gray-400 rounded-md px-3 py-2 text-sm"/>
    <asp:TextBox id="txtSurgeryDate" runat="server" placeholder="DD-MM-YYYY"
      class="w-full sm:w-[40%] border border-gray-400 rounded-md px-3 py-2 text-sm" />
      <ajaxToolkit:CalendarExtender ID="dateajax" runat="server" Format="dd-MM-yyyy"
                                   Enabled="true" TargetControlID="txtSurgeryDate" />
  </div>--%>
               <!-- First Row: Surgery Name & Hospital Name -->
<div class="flex flex-col sm:flex-row gap-2">
  <!-- Surgery Name -->
  <div class="flex flex-col w-full sm:w-[60%]">
    <asp:TextBox ID="txtSurgeryName" runat="server" placeholder="Surgery Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="rfvSurgeryName" runat="server"
      ControlToValidate="txtSurgeryName"
      ErrorMessage="Please enter surgery name."
      Display="Dynamic"
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>

  <!-- Hospital Name -->
  <div class="flex flex-col w-full sm:w-[40%]">
    <asp:TextBox ID="txthostname" runat="server" placeholder="Enter hospital Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="rfvHospitalName" runat="server"
      ControlToValidate="txthostname"
      ErrorMessage="Please enter hospital name."
      Display="Dynamic"
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>
</div>
<br />

<!-- Second Row: Doctor Name & Surgery Date -->
<div class="flex flex-col sm:flex-row gap-2">
  <!-- Doctor Name -->
  <div class="flex flex-col w-full sm:w-[60%]">
    <asp:TextBox ID="txtdrname" runat="server" placeholder="Enter Dr. Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="rfvDrName" runat="server"
      ControlToValidate="txtdrname"
      ErrorMessage="Please enter Dr. name."
      Display="Dynamic"
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>

  <!-- Surgery Date -->
  <div class="flex flex-col w-full sm:w-[40%]">
    <asp:TextBox ID="txtSurgeryDate" runat="server" placeholder="DD-MM-YYYY"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <ajaxToolkit:CalendarExtender ID="dateajax" runat="server"
      Format="dd-MM-yyyy"
      Enabled="true"
      TargetControlID="txtSurgeryDate" />
    <asp:RequiredFieldValidator ID="rfvSurgeryDate" runat="server"
      ControlToValidate="txtSurgeryDate"
      ErrorMessage="Please enter Date in dd-mm-yyyy format."
      Display="Dynamic"
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>
</div>



  <%--<button type="button"
    onclick="submitSurgeryData()"
    class="bg-yellow-200 w-full mt-4 poppins text-[#333333] font-semibold px-6 py-3 rounded-lg shadow-sm hover:bg-[#ffd100] transition text-center">
    Add
  </button>--%>
                <asp:Button ID="btnSaveSurgery" runat="server" Text="Add"
    OnClick="btnSaveSurgery_Click"
    CssClass="bg-yellow-200 w-full mt-4 poppins text-[#333333] font-semibold px-6 py-3 rounded-lg shadow-sm hover:bg-[#ffd100] transition text-center" />

</div>
                  


        </div>
      </section>
             
       <div  id="SurgeryHistory" runat="server" class="md:p-6 md:w-1/2 rounded-xl surgeryclass">
                        <%--  <asp:Panel ID="pnlSurgeryHistory" runat="server" Visible="false">--%>
              <h2 class="text-xl font-semibold text-[#0331b5] poppins mb-4">Surgical History :</h2>
     

      <asp:GridView ID="gvSurgeryHistory" runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered w-full text-sm border-collapse"
    DataKeyNames="user_surgery_id"
    OnRowDeleting="gvSurgeryHistory_RowDeleting1"
    ShowHeader="true">

    <HeaderStyle BackColor="#ACEDFF" Font-Bold="True" ForeColor="black" />
    <RowStyle CssClass="hover:bg-gray-100" />
    <AlternatingRowStyle CssClass="bg-blue-50 hover:bg-blue-100" />

    <Columns>
       <asp:TemplateField HeaderText="Surgery Details">
    <ItemTemplate>
         <div class="flex justify-between items-center px-2 py-1 hover:bg-blue-50 transition-all duration-200 rounded-md cursor-pointer"
       onclick='showModal("<%# Eval("user_surgery_id") %>","<%# Eval("user_surgery_details") %>", "<%# Eval("user_surgery_year") %>", "<%# Eval("hostname") %>", "<%# Eval("drname") %>")'>

    <span class="text-sm text-gray-800"><%# Eval("user_surgery_details") %></span>
    </ItemTemplate>
</asp:TemplateField>

      

        <asp:TemplateField HeaderText="Surgery Year">
        
            <ItemTemplate>
  <div class="flex justify-between items-center px-2 py-1 hover:bg-blue-50 transition-all duration-200 rounded-md cursor-pointer"
       onclick='showModal("<%# Eval("user_surgery_details") %>", "<%# Eval("user_surgery_year") %>", "<%# Eval("hostname") %>", "<%# Eval("drname") %>")'>

    <span class="text-sm text-gray-800"><%# Eval("user_surgery_year") %></span>

    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CausesValidation="false"
        OnClientClick="return confirm('Are you sure you want to delete this record?');"
        CssClass="ml-2">
        <i class="fa-solid fa-trash-can text-black-600 hover:text-black-800 text-lg"></i>
    </asp:LinkButton>
  </div>
</ItemTemplate>



        </asp:TemplateField>
    </Columns>
</asp:GridView>

<!-- Button to Open Add Surgery Modal -->

           <div class="mt-4 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
  <a href="#" class="text-[#0331b5] font-semibold hover:underline text-sm">Have another surgery to add?</a>
  <button type="button" id="add-btn" onclick="toggleSurgeryInput1()" class="bg-[#FCE588] poppins hover:bg-[#ffd100] text-[#333333] font-bold py-2 px-4 rounded-md text-sm flex items-center gap-2 w-full sm:w-auto justify-center">
    <i class="fa-solid fa-plus"></i> Add more
  </button>
</div>
 <%--<button  type="button" onclick="toggleSurgeryInput1()" class="bg-[#FCE588] w-[90%] mt-2 font-semibold px-5 py-2 rounded-md hover:bg-yellow-400 shadow-md">
   Add More
 </button>--%>
         <div id="input-container1" class="mt-4 hidden transition-all duration-300 ease-in-out">
<%--<div class="flex flex-col sm:flex-row gap-2">
  <asp:TextBox id="txtSurgeryName1" runat="server" placeholder="Surgery Name"
    class="w-full sm:w-[60%] border border-gray-400 rounded-md px-3 py-2 text-sm"/>
    <br/>
    <asp:RequiredFieldValidator ID="RequiredFieldsurgeryname" runat="server"  ControlToValidate="txtSurgeryName1" ErrorMessage="Please enter surgery name." Display="Dynamic"   ForeColor="Red"></asp:RequiredFieldValidator>
  <asp:TextBox ID="txthostname1" runat="server" placeholder="Enter hospital Name"
      class="w-full sm:w-[40%] border border-gray-400 rounded-md px-3 py-2 text-sm"/>
    <br/>
     <asp:RequiredFieldValidator ID="RequiredFieldhostname" runat="server"  ControlToValidate="txthostname1" ErrorMessage="Please enter Hostpital name." Display="Dynamic"   ForeColor="Red"></asp:RequiredFieldValidator>
    </div><br />
    <div class="flex flex-col sm:flex-row gap-2">
    <asp:TextBox ID="txtdrname1" runat="server" placeholder="Enter Dr. Name"
      class="w-full sm:w-[60%] border border-gray-400 rounded-md px-3 py-2 text-sm"/>
         <asp:RequiredFieldValidator ID="RequiredFielddrname" runat="server"  ControlToValidate="txtdrname1" ErrorMessage="Please enter Dr. name." Display="Dynamic"   ForeColor="Red"></asp:RequiredFieldValidator>
  <asp:TextBox id="txtSurgeryDate1" runat="server" placeholder="DD-MM-YYYY"
    class="w-full sm:w-[40%] border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy"
                                   Enabled="true" TargetControlID="txtSurgeryDate1" />
    <span id="dobError" style="color:red; display:none;">Please enter Date in dd-mm-yyyy format</span>
</div>--%>
             <div class="flex flex-col sm:flex-row gap-4">
  <!-- Surgery Name -->
  <div class="flex flex-col w-full sm:w-[60%]">
    <asp:TextBox ID="txtSurgeryName1" runat="server" placeholder="Surgery Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="RequiredFieldsurgeryname" runat="server" 
      ControlToValidate="txtSurgeryName1"
      ErrorMessage="Please enter surgery name." 
      Display="Dynamic" 
      ForeColor="Red" 
      CssClass="text-red-500 text-sm mt-1" />
  </div>

  <!-- Hospital Name -->
  <div class="flex flex-col w-full sm:w-[40%]">
    <asp:TextBox ID="txthostname1" runat="server" placeholder="Enter hospital Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="RequiredFieldhostname" runat="server" 
      ControlToValidate="txthostname1"
      ErrorMessage="Please enter Hospital name." 
      Display="Dynamic" 
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>
</div>

<br />

<div class="flex flex-col sm:flex-row gap-4">
  <!-- Doctor Name -->
  <div class="flex flex-col w-full sm:w-[60%]">
    <asp:TextBox ID="txtdrname1" runat="server" placeholder="Enter Dr. Name" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm" />
    <asp:RequiredFieldValidator ID="RequiredFielddrname" runat="server" 
      ControlToValidate="txtdrname1"
      ErrorMessage="Please enter Dr. name." 
      Display="Dynamic" 
      ForeColor="Red"
      CssClass="text-red-500 text-sm mt-1" />
  </div>

  <!-- Surgery Date -->
  <div class="flex flex-col w-full sm:w-[40%]">
    <asp:TextBox ID="txtSurgeryDate1" runat="server" placeholder="DD-MM-YYYY"
      CssClass="border border-gray-400 rounded-md px-3 py-2 text-sm"  onkeyup="validateDOBOnSubmit();" />
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
      Format="dd-MM-yyyy" Enabled="true" TargetControlID="txtSurgeryDate1"/>
      <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" 
  ControlToValidate="txtSurgeryDate1"
  ErrorMessage="Please select Date." 
  Display="Dynamic" 
  ForeColor="Red"
  CssClass="text-red-500 text-sm mt-1" />
    <span id="dobError" style="color:red; display:none;" class="text-red-500 text-sm mt-1">
      Please enter Date in dd-mm-yyyy format
    </span>
  </div>
</div>

                         <asp:Button ID="btnSaveSurgerygrid" runat="server" Text="Save" OnClick="btnSaveSurgerygrid_Click" 
CssClass="bg-yellow-200 w-full mt-4 poppins text-[#333333] font-semibold px-6 py-3 rounded-lg shadow-sm hover:bg-[#ffd100] transition text-center" />
</div>


        </div>
      
      <!-- Script -->
      <script>
          function toggleSurgeryInput() {
              const inputContainer = document.getElementById('input-container');
              inputContainer.classList.toggle('hidden');
          }
          function toggleSurgeryInput1() {
              const inputContainer = document.getElementById('input-container1');
              inputContainer.classList.toggle('hidden');
          }





      </script>
      
    </div>
    
      <div id="saveWrapper" runat="server" style="display:none;margin-top: -29px !important;">
        <%--  <asp:Button Text="Save" ID="btnUpdateAdditional"  CssClass="bg-[#FCE588]  poppins hover:bg-[#ffd100] text-[#333333] font-bold py-3 px-4 rounded-md text-sm flex items-center gap-2 w-[80%] sm:w-[21rem] mx-auto justify-center"  OnClick="btnUpdateAdditional_Click" runat="server" />--%>
    <asp:LinkButton ID="btnUpdateAdditional" runat="server" CausesValidation="false" OnClick="btnUpdateAdditional_Click" CssClass="bg-[#FCE588] poppins hover:bg-[#ffd100] text-[#333333] font-bold py-3 px-4 rounded-md text-sm flex items-center gap-2 w-[80%] sm:w-[11rem] mx-auto justify-center">
  <i class="fa-solid fa-plus"></i> Save Changes
</asp:LinkButton>
      </div>

    <section class="w-full px-6 py-10" style="margin-bottom: 72px !important;">
      <div class="flex flex-wrap justify-center gap-6">
        
        <!-- Card 1 -->
      <div class="w-full sm:w-[48%] justbox md:w-[30%] rounded-2xl border border-black p-4 text-center shadow-md">
      <%--<img src="../assats/allergi.png"
           alt="Allergic" 
           class="mx-auto  rounded-xl h-48 object-cover" />--%>
         <img src="/journal-page-images/article/allergy.png" alt="Allergy"/>
           <div class="border-t mb-4 border-black w-full mt-0"></div>

      <h3 class="text-[#FF0000] poppins font-semibold text-lg">Allergic?</h3>
      <p class="text-gray-700 text-sm md:text-[15px] my-2">
        Allergies can strike anytime - know what affects you and take control of your health. Add your allergies now and ensure you're always ready!
      </p>
     <%--<button id="openAllergyModal" runat="server" onclick="openAllergyModal_Click" class=" bg-[#0331b5] poppins text-white text-sm px-4 w-[80%] mt-4 py-3  sm:py-3 rounded-md">Your Allergies</button>--%>
<asp:Button 
ID="openAllergy1Modal" 
runat="server" 
OnClick="openAllergy1Modal_Click" CausesValidation="false"
CssClass="bg-[#0331b5] poppins text-white text-sm px-4 w-[80%] mt-4 py-3 sm:py-3 rounded-md" 
Text="Your Allergies" />

          <%--<asp:Button ID="openAllergy1Modal" runat="server" Text="Your Allergies" OnClick="openAllergy1Modal_Click"
    CssClass="bg-[#0331b5] poppins text-white text-sm px-4 w-[80%] mt-4 py-3 sm:py-3 rounded-md"  />--%>
        </div>
    
        <!-- Card 2 -->
        <div class="w-full sm:w-[48%] justbox md:w-[30%] rounded-2xl border border-black p-4 text-center shadow-md">
          <h3 class="font-semibold text-lg xl:text-[17px]">
            Know Your Health <span class="text-[#FF0000] font-[700]">Risks</span>
          </h3>
          <p class="text-gray-700 text-sm md:text-[15px] my-2">
            Knowing your family health history helps you stay ahead. Keep your medical background updated for better care and prevention.
          </p>
        <%--  <img src="../assats/risk.png"
               alt="Update History" 
               class="mx-auto  rounded-xl h-48 object-cover" />--%>
             <img src="/journal-page-images/article/medical-history.png" alt="Health Risk"/>
               <div class="border-t mb-4 border-black w-full mt-[-1px]"></div>

        <asp:Button ID="btnmedical" runat="server" CausesValidation="false" OnClick="btnmedical_Click" class="bg-[#0331b5] poppins text-white text-sm px-4  w-[80%] mt-4 py-3  sm:py-3 rounded-md whitespace-normal" Text="Update Medical History"/>
           
           <%-- <asp:Button ID="btnmedical" runat="server" Text="Update Medical History" OnClick="btnmedical_Click" 
 class="bg-[#0331b5] poppins text-white text-sm px-4  w-[80%] mt-4 py-3  sm:py-3 rounded-md whitespace-normal" />--%>
        </div>

        <!-- Tablet-only message card with fully centered text -->
<div class=" sm:flex   w-full sm:w-[48%] md:w-[30%] push-to-bottom justbox rounded-2xl    items-center justify-center text-center md:min-h-[200px]">
  <p class=" sm:text-[21px] md:text-[25px] font-medium">
    Your complete medical history, always at your fingertips with
    <span class="text-blue-700 font-semibold">HFiles.</span>
  </p>
</div>


        <!-- Card 3 -->
        <div class="w-full sm:w-[48%] justbox md:w-[30%] rounded-2xl border border-black p-4 text-center shadow-md">
          <h3 class="font-semibold text-lg xl:text-[17px]">
            Your Digital Health <span class="text-[#FF0000] font-[700]">Companion</span>
          </h3>
          <p class="text-gray-700 text-sm md:text-[15px] my-2">
            Your prescriptions are more than just paper - they're the key to your health journey. Keep them within reach, always.
          </p>
       <%--   <img src="../assats/compain.png" alt="Prescriptions" class="mx-auto  rounded-xl h-48 object-cover" />--%>
              <img src="/journal-page-images/article/Medical-prescription.png" alt="Prescriptions"/>
          <div class="border-t mb-4 border-black w-full mt-[-1px]"></div>
           
         <%-- <button type="submit"  class="bg-[#0331b5] poppins text-white text-sm px-4  w-[80%] mt-4 py-3  sm:py-3 rounded-md">View Medical Prescriptions</button>--%>
            <button type="button" 
        onclick="window.location.href='FamilyPrescription.aspx';"
        class="bg-[#0331b5] poppins text-white text-sm px-4 w-[80%] mt-4 py-3 sm:py-3 rounded-md">
  View Medical Prescriptions
</button>
         
           
        </div>
    
      </div>
    </section>
    
    





  </main>

   <%-- gridview Popup for surgery--%>
  
    <!-- Bootstrap Modal -->

<%--<div class="modal fade" id="surgeryModal" tabindex="-1" aria-labelledby="surgeryModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-container">
    <div class="modal-content rounded-4 overflow-hidden modal-subcontainer" style="border: 1px solid black;">
      <div style="padding-bottom: 5px;" class="modal-header bg-white border-0 justify-content-center position-relative">
       <%-- <span class="position-absolute top-0 end-0 m-3 fs-4 text-black cursor-pointer" onclick="closeModal()" style="z-index: 1056;">&times;</span>
          
        <h5 style="font-size:22px; color: #0331B5" class="modal-title fw-bold" id="surgeryModalLabel">Surgical History</h5>
      </div>
        <div class="modal-divider"></div>
      <div class="modal-body" style="padding: 0px;">
        <button class="btn w-100 mb-3 text-dark fw-semibold" style=" background-color: #c5f2fd; border: 1px solid black;">
          Surgery Details
        </button>

        <div class="mb-3 rounded-2 p-2 " style="border: 1px solid black">
          <textarea id="modalSurgeryDetail" class="form-control border-0" runat="server" rows="4"></textarea>
        </div>

          <div class="mb-3">
  <label class="form-label fw-bold">Doctor’s Name :</label>
  <input type="text" class="form-control" id="modalCreatedBy" runat="server" style="border: 1px solid black;"/>
</div>

        <div class="mb-3">
          <label class="form-label fw-bold">Hospital Name :</label>
          <input type="text" class="form-control" id="modalHospitalName" runat="server" style="border: 1px solid black;"/>
        </div>

        <div class="modal-content-divider"></div>

        <div class="mb-5 mt-3">
          <label class="form-label fw-bold" style="color: #0331B5;">Surgery Date</label><br />
          <span id="modalSurgeryYear"></span>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <%--  <button type="button" class="btn btn-primary" runat="server" onclick="surpopsave_Click">Save</button>
         <asp:Button ID="btnsurgerysave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnsurgerysave_Click" CausesValidation="false" />

        </div>
      </div>
    </div>
  </div>
</div>--%>

    <div class="modal fade" id="surgeryModal" tabindex="-1" aria-labelledby="surgeryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-container">
    <div class="modal-content rounded-4 overflow-hidden modal-subcontainer" style="border: 1px solid black;">
      <div class="modal-header bg-white border-0 justify-content-center position-relative" style="padding-bottom: 5px;">
        <h5 style="font-size:22px; color: #0331B5" class="modal-title fw-bold" id="surgeryModalLabel">Surgical History</h5>
      </div>
      <div class="modal-divider"></div>

      <div class="modal-body" style="padding: 0px;">
        <button class="btn w-100 mb-3 text-dark fw-semibold" style="background-color: #c5f2fd; border: 1px solid black;">
          Surgery Details
        </button>
            <asp:HiddenField ID="hiddenSurgeryId" runat="server" ClientIDMode="Static" />
        <div class="mb-3 rounded-2 p-2" style="border: 1px solid black">
          <asp:TextBox ID="modalSurgeryDetail" runat="server" CssClass="form-control border-0" TextMode="MultiLine" ClientIDMode="Static" Rows="4" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')" />
        </div>

        <div class="mb-3">
          <label class="form-label fw-bold">Doctor’s Name :</label>
          <asp:TextBox ID="modalCreatedBy" runat="server" CssClass="form-control" ClientIDMode="Static" Style="border: 1px solid black;" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')" />
        </div>

        <div class="mb-3">
          <label class="form-label fw-bold">Hospital Name :</label>
          <asp:TextBox ID="modalHospitalName" runat="server" CssClass="form-control" ClientIDMode="Static" Style="border: 1px solid black;" oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')" />
        </div>

        <div class="modal-content-divider"></div>

        <div class="mb-5 mt-3">
          <label class="form-label fw-bold" style="color: #0331B5;">Surgery Date</label><br />
          <asp:TextBox ID="modalSurgeryYear" runat="server" ClientIDMode="Static" CssClass="form-control" Style="border: 1px solid black;" ReadOnly="true" />
        </div>
        
        <div class="d-flex justify-content-end gap-2">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <asp:Button ID="btnsurgerysave" runat="server" Text="Save" CssClass="btn btn-primary"
                      OnClick="btnsurgerysave_Click" CausesValidation="false" />
        </div>
      </div>
    </div>
  </div>
</div>


     <!--disease Popup Overlay -->
    <div id="myModal" class="modal hidden fixed top-0 left-0 w-full h-full bg-gray-800 bg-opacity-50 flex justify-center items-center">
    <div class="modal-content bg-white p-6 rounded">
        <span class="close text-black cursor-pointer text-xl absolute top-2 right-2" onclick="closeModal()">&times;</span>
        <h2>Add Your Disease</h2>
       
          <asp:TextBox ID="txtdiseaseName" runat="server"  class="p-2 border border-gray-300 rounded mt-4 w-full" placeholder="Enter disease name"></asp:TextBox>
      <span id="errorDisease" style="color: red; display: none;"></span>
         <asp:Button ID="btndisease" runat="server" Text="Save" class="mt-4 bg-blue-600 text-white p-2 rounded" CausesValidation="false"  OnClick="btndisease_Click"  OnClientClick='<%# "return validateInput(" + txtdiseaseName.ClientID + ");" %>' />
    </div>
</div>

            <!--Medication Popup Overlay -->

   <div id="medicationPopup" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <h3>Enter Medication Name</h3>
        <br />
        
       <%-- <input type="text" id="txtMedicationName" class="form-control" placeholder="Medication Name" />--%>
        <asp:TextBox ID="txtMedicationName" runat="server" class="form-control"  placeholder="Medication Name"></asp:TextBox>
      <span id="errorMedication" style="color: red; display: none;"></span>
        <br />
      <%--  <button type="button" onclick="saveMedication()" class="btn btn-success">Save</button>--%>
        <asp:Button ID="btnmedication" runat="server" Text="Save" class="btn btn-success btnclass" OnClick="btnmedication_Click" OnClientClick='<%# "return validateInput(" + txtMedicationName.ClientID + ");" %>'/>
      
    </div>
</div>
   
     <!--Allergy other Popup Overlay -->
     <div id="OtherallergyModal" class="modal hidden fixed top-0 left-0 w-full h-full bg-gray-800 bg-opacity-50 flex justify-center items-center">
  <div class="modal-content bg-white p-6 rounded relative">
    <span class="close text-black cursor-pointer text-xl absolute top-2 right-2" onclick="closeModal1()">&times;</span>
    <h2>Add Your Allergy</h2>

    <asp:TextBox ID="txtAllergyName" runat="server" class="p-2 border border-gray-300 rounded mt-4 w-full" placeholder="Enter allergy name"></asp:TextBox>
    <span id="errorAllergy" style="color: red; display: none;"></span>

    <asp:Button ID="btnAddAllergy" runat="server" Text="Save" class="mt-4 bg-blue-600 text-white p-2 rounded" OnClick="btnAddAllergy_Click"  OnClientClick='<%# "return validateInput(" + txtAllergyName.ClientID + ");" %>' />
  </div>
</div>



<!-- Popup Overlay -->


    <div id="medicalPopup" class="fixed inset-0 bg-black/40 backdrop-blur-sm flex items-center justify-center z-50 hidden popupclass">
    <div class="bg-white w-[90%] max-w-2xl rounded-xl shadow-xl p-6 relative animate-fadeIn">

        <!-- Close Button -->
        <button onclick="togglePopup(false)" class="absolute top-4 right-4 text-2xl font-bold text-gray-600 hover:text-black">&times;</button>

        <!-- Title -->
        <h2 class="sm:text-lg poppins font-bold text-blue-800 border-b border-blue-300 pb-2 text-center">Medical Background</h2>

        <!-- Table -->
              <div class="overflow-x-auto mt-4 max-h-[300px]">
            <table class="w-full text-sm text-center font-medium text-gray-700">
                <thead class="bg-[#acedff] text-[#000000]">
                    <tr class="border-b border-black">
                        <th class="w-1/4 py-2  text-center sm:text-[15px]">Type</th>
                        <th class="w-1/4 py-2  text-center text-[10px] sm:text-[13px]">My Self</th>
                        <th class="w-1/4 py-2  text-center text-[10px] sm:text-[13px]">Mother’s Side</th>
                        <th class="w-1/4 py-2  text-center text-[10px] sm:text-[13px]">Father’s Side</th>
                    </tr>
                </thead>
               <tbody>
 <asp:Repeater runat="server" ID="rptDisease">
    <ItemTemplate>
        <tr class="border-b border-gray-300 ">
            <td class="py-2  text-[13px] sm:text-[15px] ">
                <%# Eval("disease_name") %>
                <asp:HiddenField runat="server" ID="hfdisease_id" Value='<%# Eval("disease_id") %>' />
            </td>
            <td class="py-2 ">
             

                
                <label class="inline-flex items-center justify-center w-full ">
                    <asp:CheckBox runat="server" ID="chkSelf" CssClass="circle-checkbox"/>
                </label>
              
            </td>
         
            <td class="py-2 ">
                <label class="inline-flex items-center justify-center w-full">
                    <asp:CheckBox runat="server" ID="chkMother" CssClass="circle-checkbox" />
                </label>
            </td>
            <td class="py-2">
                <label class="inline-flex items-center justify-center w-full">
                    <asp:CheckBox runat="server" ID="chkFather" CssClass="circle-checkbox"/>
                </label>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>



</tbody>

            </table>
        </div>

        <!-- Save Button -->
        <div class="flex justify-between items-center mt-6">
<a href="#"
   class="text-[#0331b5] font-semibold sm:text-[15px] hover:underline poppins text-[13px] text-sm textclass line-clamp-2"
   onclick="openModal()">
  <span> Your disease isn’t here? Add your own . . . </span>
</a>
     <asp:Button 
        ID="btnMedicalHistory" 
        Text="Save" 
        CssClass="bg-[#0331b5] text-white px-6 py-2 rounded shadow hover:bg-blue-800" 
         OnClick="btnMedicalHistory_Click"
        runat="server" OnClientClick="togglePopup(false); return true;"
        CausesValidation="false"/>
</div>
    </div>
</div>


<div class="fixed hidden inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center p-4 allerypopupcls" id="allergyModal">
    <div class="bg-white rounded-xl shadow-lg w-full max-w-md relative overflow-hidden">
        <!-- Close Button -->
        <button type="button" class="absolute top-2 right-3 text-xl font-semibold text-gray-500 hover:text-red-500" onclick="hideModal()">×</button>

        <!-- Header -->
        <div class="text-center px-4 pt-4">
            <h2 class="text-blue-800 font-bold sm:text-lg border-b-2 border-blue-400 pb-2">
                Are You Allergic to any of These?
            </h2>
            <br />
            <div class="">
        <div class="row justify-around font-weight-bold bg-info text-dark py-2 border">
            <div class="col-md-5 col-5 text-center">Type</div>
            <div class="col-4 text-center">Yes</div>
            <div class="col-3 text-center">No</div>
        </div>
                 
    </div>
        </div>

        <!-- Repeater Section -->
 <div class="overflow-y-auto max-h-[300px] p-4">
  
 <asp:Repeater runat="server" ID="rptAllergy" OnItemDataBound="rptAllergy_ItemDataBound">
    <ItemTemplate>
        <div class="flex items-center justify-between border-b border-black py-2 allergy-row">
            <!-- Allergy Name + Hidden Field -->
            <div class="w-1/2 font-bold text-[13px] sm:text-[15px] text-center flex items-center justify-between">
                <%# Eval("allergy_name") %>
                <asp:HiddenField runat="server" ID="hfallergy_id" Value='<%# Eval("allergy_id") %>' />
                <asp:HiddenField runat="server" ID="hfAllergyName" Value='<%# Eval("allergy_name") %>' />
            </div>

            <!-- Dropdown Wrapper (hidden by default) -->
            <asp:Panel ID="pnlMedications" runat="server" Visible="false" CssClass="relative  max-w-[300px] mt-2">
                <div onclick="toggleDropdownAllergy(this)" class="absolute  right-0 cursor-pointer text-sm font-semibold flex items-center justify-end top-[-9px] !important">
                    <i class="fa fa-angle-down"></i>
                </div>
                <div class="allergyDropdownWrapper hidden absolute  top-full mt-2 z-[9999] rounded-lg ">
                   <%-- <asp:DropDownList ID="AlleryMedications" runat="server" Width="498%"
                                      CssClass="w-full p-2 rounded-md border border-gray-300">
                    </asp:DropDownList>--%>
                      <asp:TextBox ID="txtMedication"  runat="server" TextMode="MultiLine" Rows="3" CssClass="w-full p-2 border border-gray-300 rounded fixaliclass responsive-width" Style="margin-top: 10px;" />
                    <asp:Button ID="btnEdit" runat="server" Text="Save Changes"  CausesValidation="false" OnClick="btnEdit_Click" CssClass="bg-[#FCE588] poppins hover:bg-[#ffd100] text-[#333333] font-bold py-3 rounded-md text-sm flex items-center gap-2 w-[80%] sm:w-[11rem] mx-auto justify-center"/>
                </div>
           
            </asp:Panel>

            <!-- Yes Option -->
            <div class="w-[63%] text-center flex items-center justify-center">
                <label class="custom-radio yellow">
                    <asp:RadioButton ID="rdoYes" runat="server" GroupName='<%# "allergy_" + Eval("allergy_id") %>' Value="1" />
                    <span></span>
                </label>
            </div>

            <!-- No Option -->
            <div class="w-1/4 text-center flex items-center justify-center">
                <label class="custom-radio blue">
                    <asp:RadioButton ID="rdoNo" runat="server" GroupName='<%# "allergy_" + Eval("allergy_id") %>' Value="0" />
                    <span></span>
                </label>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>





 </div>
         
        <!-- Save Button -->
       <div class="flex justify-between items-center px-4 py-3">
           <a href="#"
   class="text-[#0331b5] font-semibold sm:text-[15px] hover:underline poppins text-[13px] text-sm textclass line-clamp-2"
   onclick="openModal1()">
  <span> Your Allergy isn’t here? Add your own . . . </span>
</a>

            <asp:Button runat="server" ID="btnSaveAllergy" Text="Save" CssClass="bg-[#033ab5] text-white px-4 py-2 rounded-lg hover:bg-blue-800" OnClick="btnSaveAllergy_Click" />
        </div>

    </div>
</div>  


  



       



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <script src="../js/main.js"></script>
    

    <script>
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
            debugger
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
        function handleSelectSmokem(e) {
            debugger
            isSelectSmoke = e;

            let hfSmoke = document.getElementById('<%= hfDoyouSmokem.ClientID %>');

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
        function handleSelectAlcoholm(e) {
            isSelectAlcohol = e;

            let hfAlcohol = document.getElementById('<%= hfDoyouConsumeAlcoholm.ClientID %>');

            if (isSelectAlcohol === 1) {
                hfAlcohol.value = "1";
            } else if (isSelectAlcohol === 0) {
                hfAlcohol.value = "0";
            } else if (isSelectAlcohol === 2) {
                hfAlcohol.value = "2";
            }
        }





        function showSaveButton() {
            debugger
            const btnDiv = document.getElementById("<%= saveWrapper.ClientID %>");   // Desktop/Tablet
            const btnDiv1 = document.getElementById("<%= saveWrapperM.ClientID %>"); // Mobile

            const isMobile = window.innerWidth <= 768; // Adjust this breakpoint as needed

            if (isMobile) {
                if (btnDiv1) btnDiv1.style.display = "block";
                if (btnDiv) btnDiv.style.display = "none";
            } else {
                if (btnDiv) btnDiv.style.display = "block";
                if (btnDiv1) btnDiv1.style.display = "none";
            }
        }


        window.addEventListener('load', function () {
            const ids = [
        '<%= weightTextBox.ClientID %>',
        '<%= heightfeetTextBox.ClientID %>',
        '<%= heightinchTextBox.ClientID %>',
        '<%= DropDownList1.ClientID %>',
        '<%= smoke_yes.ClientID %>',
        '<%= smoke_no.ClientID %>',
        '<%= alcohol_yes.ClientID %>',
        '<%= alcohol_no.ClientID %>'
    ];

    const ids1 = [
        '<%= txtweight.ClientID %>',
        '<%= txtheightfeet.ClientID %>',
        '<%= txtheightinch.ClientID %>',
        '<%= DropDownbloodgrp.ClientID %>',
        '<%= rdsmoke_yes.ClientID %>',
        '<%= rdsmoke_no.ClientID %>',
        '<%= rdalcohol_yes.ClientID %>',
        '<%= rdalcohol_no.ClientID %>'
    ];

    [...ids, ...ids1].forEach(function (id) {
        const element = document.getElementById(id);
        if (element) {
            element.addEventListener('change', showSaveButton);
            element.addEventListener('input', showSaveButton);
            element.addEventListener('click', showSaveButton);
        } else {
            console.warn("Missing element:", id);
        }
    });
});

        // Second onload functionality
        window.addEventListener('load', function () {
            setControlIds();
            setTimeout(applyRadioSelections, 100); // Delay ensures DOM is ready
        });


        // These IDs are injected from server-side
        var txtMedicationNameClientID = '<%= txtMedicationName.ClientID %>';
        var medicationPopupID = 'medicationPopup';

        function handleYesClick(radio, allergyName) {
            if (allergyName.trim().toLowerCase() === "medications") {
                setTimeout(() => {
                    const txtBox = document.getElementById(txtMedicationNameClientID);
                    const popup = document.getElementById(medicationPopupID);

                    if (txtBox && popup) {
                        txtBox.value = '';
                        popup.style.display = 'flex';
                    } else {
                        console.warn("Textbox or popup not found");
                    }
                });
            }
        }

        function closePopup() {
            document.getElementById(medicationPopupID).style.display = 'none';
        }


        function toggleDropdownAllergy(el) {
            const wrapper = el.nextElementSibling;
            if (wrapper.classList.contains("hidden")) {
                wrapper.classList.remove("hidden");
                el.querySelector("i").classList.add("rotate-180");
            } else {
                wrapper.classList.add("hidden");
                el.querySelector("i").classList.remove("rotate-180");
            }
        }


        //function showModal(surgeryDetails, surgeryYear, hospitalName, doctorName) {
        //    // Safely insert values into modal inputs
        //    document.getElementById("modalSurgeryDetail").value = surgeryDetails;
        //    document.getElementById("modalSurgeryYear").innerText = surgeryYear;
        //    document.getElementById("modalHospitalName").value = hospitalName;
        //    document.getElementById("modalCreatedBy").value = doctorName;


        //    // Show the modal using Bootstrap 5 API
        //    var myModal = new bootstrap.Modal(document.getElementById("surgeryModal"));
        //    myModal.show();
        //}

        function showModal(surgeryId, surgeryDetails, surgeryYear, hospitalName, doctorName) {
            const detail = document.getElementById("modalSurgeryDetail");
            const year = document.getElementById("modalSurgeryYear");
            const hospital = document.getElementById("modalHospitalName");
            const doctor = document.getElementById("modalCreatedBy");
            const surgeryIdField = document.getElementById("hiddenSurgeryId");

            if (surgeryIdField) surgeryIdField.value = surgeryId;
            if (detail) detail.value = surgeryDetails;
            if (year) year.value = surgeryYear;
            if (hospital) hospital.value = hospitalName;
            if (doctor) doctor.value = doctorName;


            var myModal = new bootstrap.Modal(document.getElementById("surgeryModal"));
            myModal.show();
        }
        function submitDisease() {
            const disease = document.getElementById('diseaseName').value;
            if (disease) {
                alert('Disease added: ' + disease);
                // You can send the disease to the backend or do other actions here.
                closeModal();  // Close the modal after submitting.
            } else {
                alert('Please enter a disease name.');
            }
        }
       

        function validateInput(inputId, errorSpanId) {
            var input = document.getElementById(inputId);
            var errorSpan = document.getElementById(errorSpanId);

            if (!input || !errorSpan) return false;

            var value = input.value.trim();
            errorSpan.style.display = "none";

            if (value === '') {
                errorSpan.innerText = "This field is required.";
                errorSpan.style.display = "block";
                input.focus();
                return false;
            }

            if (value.length > 15) {
                errorSpan.innerText = "Maximum 15 characters allowed.";
                errorSpan.style.display = "block";
                input.focus();
                return false;
            }

            return true; // All good
        }


        function closeDiseaseModal() {
            document.getElementById("myModal").classList.add("hidden");
            // Keep #medicalPopup open — do NOT hide it
        }
        function validateDOB(input) {
            const dobValue = input.value.trim();
            const errorSpan = document.getElementById("dobError");

            // Regex for dd-mm-yyyy format (day: 01-31, month: 01-12, year: 1900-2099)
            const dobRegex = /^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(19|20)\d{2}$/;

            if (!dobRegex.test(dobValue)) {
                errorSpan.style.display = "inline";
                input.classList.add("is-invalid");
            } else {
                errorSpan.style.display = "none";
                input.classList.remove("is-invalid");
            }
        }


        let rdsmokeYesId, rdsmokeNoId, rdalcoholYesId, rdalcoholNoId;

        function setControlIds() {
            // Cache server-generated ClientIDs
            rdsmokeYesId = "<%= rdsmoke_yes.ClientID %>";
            rdsmokeNoId = "<%= rdsmoke_no.ClientID %>";
            rdalcoholYesId = "<%= rdalcohol_yes.ClientID %>";
            rdalcoholNoId = "<%= rdalcohol_no.ClientID %>";
            rdsmokeYesId1 = "<%= smoke_yes.ClientID %>";
            rdsmokeNoId1 = "<%= smoke_no.ClientID %>";
            rdalcoholYesId1 = "<%= alcohol_yes.ClientID %>";
            rdalcoholNoId1 = "<%= alcohol_no.ClientID %>";
        }
        function applyRadioSelections() {
            const isMobile = window.innerWidth <= 768;

            if (isMobile) {
                const smokeVal = document.getElementById("hfDoyouSmokem")?.value;
                if (smokeVal === "1") {
                    const rdsmokeYes = document.getElementById(rdsmokeYesId);
                    if (rdsmokeYes) rdsmokeYes.checked = true;
                } else if (smokeVal === "0") {
                    const rdsmokeNo = document.getElementById(rdsmokeNoId);
                    if (rdsmokeNo) rdsmokeNo.checked = true;
                }

                const alcoholVal = document.getElementById("hfDoyouConsumeAlcoholm")?.value;
                if (alcoholVal === "1") {
                    const rdalcoholYes = document.getElementById(rdalcoholYesId);
                    if (rdalcoholYes) rdalcoholYes.checked = true;
                } else if (alcoholVal === "0") {
                    const rdalcoholNo = document.getElementById(rdalcoholNoId);
                    if (rdalcoholNo) rdalcoholNo.checked = true;
                }

            } else {
                const smokeVal1 = document.getElementById("hfDoyouSmoke")?.value;
                if (smokeVal1 === "1") {
                    const smokeYes = document.getElementById(rdsmokeYesId1);
                    if (smokeYes) smokeYes.checked = true;
                } else if (smokeVal1 === "0") {
                    const smokeNo = document.getElementById(rdsmokeNoId1);
                    if (smokeNo) smokeNo.checked = true;
                }

                const alcoholVal1 = document.getElementById("hfDoyouConsumeAlcohol")?.value;
                if (alcoholVal1 === "1") {
                    const alcoholYes = document.getElementById(rdalcoholYesId1);
                    if (alcoholYes) alcoholYes.checked = true;
                } else if (alcoholVal1 === "0") {
                    const alcoholNo = document.getElementById(rdalcoholNoId1);
                    if (alcoholNo) alcoholNo.checked = true;
                }
            }
        }

        window.onload = function () {
            setControlIds();
            setTimeout(applyRadioSelections, 100); // Delay ensures DOM is ready
        };

        window.onresize = function () {
            setTimeout(applyRadioSelections, 100); // Triggers on resize (mobile ↔ desktop)
        };

     
        // These IDs are injected from server-side
        var txtMedicationNameClientID = '<%= txtMedicationName.ClientID %>';
        var medicationPopupID = 'medicationPopup';

        function handleYesClick(radio, allergyName) {
            if (allergyName.trim().toLowerCase() === "medications") {
                setTimeout(() => {
                    const txtBox = document.getElementById(txtMedicationNameClientID);
                    const popup = document.getElementById(medicationPopupID);

                    if (txtBox && popup) {
                        txtBox.value = '';
                        popup.style.display = 'flex';
                    } else {
                        console.warn("Textbox or popup not found");
                    }
                });
            }
        }

        function closePopup() {
            document.getElementById(medicationPopupID).style.display = 'none';
        }


        function toggleDropdownAllergy(el) {
            const wrapper = el.nextElementSibling;
            if (wrapper.classList.contains("hidden")) {
                wrapper.classList.remove("hidden");
                el.querySelector("i").classList.add("rotate-180");
            } else {
                wrapper.classList.add("hidden");
                el.querySelector("i").classList.remove("rotate-180");
            }
        }


        function openModal() {
            document.getElementById('myModal').classList.remove('hidden');
        }

        //function closeModal() {
        //    document.getElementById('myModal').classList.add('hidden');
        //}

        function submitDisease() {
            const disease = document.getElementById('diseaseName').value;
            if (disease) {
                alert('Disease added: ' + disease);
                // You can send the disease to the backend or do other actions here.
                closeModal();  // Close the modal after submitting.
            } else {
                alert('Please enter a disease name.');
            }
        }
        // Allergy popup
        function openModal1() {
            document.getElementById("OtherallergyModal").classList.remove("hidden");
        }

        function closeModal1() {
            document.getElementById("OtherallergyModal").classList.add("hidden");
        }

        function closeModal() {
            var modal = document.getElementById("myModal");
            if (modal) {
                modal.classList.add("hidden");
            }
        }


        
            document.addEventListener("DOMContentLoaded", function () {
            const txtDate = document.getElementById("<%= txtSurgeryDate1.ClientID %>");
            let prevValue = "";

            txtDate.addEventListener("input", function () {
                let value = txtDate.value.replace(/[^0-9]/g, '');
            let formatted = "";
            const isDeleting = txtDate.value.length < prevValue.length;

           if (value.length >= 1) {
                formatted += value.substring(0, 2);
               if (value.length >= 2) {
                formatted += '-';
               }
           }
           if (value.length >= 3) {
                formatted += value.substring(2, 4);
               if (value.length >= 4) {
                formatted += '-';
               }
           }
           if (value.length >= 5) {
                formatted += value.substring(4, 8);
           }

            if (isDeleting && prevValue.length === 6 && txtDate.value.length === 5) {
                formatted = formatted.slice(0, 5);
           } else if (isDeleting && prevValue.length === 3 && txtDate.value.length === 2) {
                formatted = formatted.slice(0, 2);
           }

            txtDate.value = formatted.slice(0, 10);
            prevValue = txtDate.value;
       });
            });


        document.addEventListener("DOMContentLoaded", function () {
            const txtDate = document.getElementById("<%= txtSurgeryDate.ClientID %>");
             let prevValue = "";

             txtDate.addEventListener("input", function () {
                 let value = txtDate.value.replace(/[^0-9]/g, '');
                 let formatted = "";
                 const isDeleting = txtDate.value.length < prevValue.length;

                 if (value.length >= 1) {
                     formatted += value.substring(0, 2);
                     if (value.length >= 2) {
                         formatted += '-';
                     }
                 }
                 if (value.length >= 3) {
                     formatted += value.substring(2, 4);
                     if (value.length >= 4) {
                         formatted += '-';
                     }
                 }
                 if (value.length >= 5) {
                     formatted += value.substring(4, 8);
                 }

                 if (isDeleting && prevValue.length === 6 && txtDate.value.length === 5) {
                     formatted = formatted.slice(0, 5);
                 } else if (isDeleting && prevValue.length === 3 && txtDate.value.length === 2) {
                     formatted = formatted.slice(0, 2);
                 }

                 txtDate.value = formatted.slice(0, 10);
                 prevValue = txtDate.value;
             });
         });



        
        function validateDOBOnSubmit() {
            var input = document.getElementById('<%= txtSurgeryDate1.ClientID %>');
                var dobValue = input.value.trim();
                var errorSpan = document.getElementById("dobError");

                // Regex check for format DD-MM-YYYY
                var dobRegex = /^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[0-2])[-](19|20)\d{2}$/;

                if (!dobRegex.test(dobValue)) {
                    showError();
                    return;
                }

                // Logical check
                var parts = dobValue.split("-");
                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);
                var date = new Date(year, month - 1, day);

                if (
                    date.getFullYear() !== year ||
                    date.getMonth() !== month - 1 ||
                    date.getDate() !== day
                ) {
                    showError();
                    return;
                }

                hideError();

                function showError() {
                    errorSpan.style.display = "inline";
                    input.classList.add("is-invalid");
                }

                function hideError() {
                    errorSpan.style.display = "none";
                    input.classList.remove("is-invalid");
                }
            }
    




    </script>




</asp:Content>