<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master"  CodeBehind="Dashboard.aspx.cs" Inherits="hfiles.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>

    <link rel="stylesheet" href="./style2.css" />
    <style>
        body{
            margin:0 !important;
            padding: 0 0 0 0 !important;
        }
        .footer {
            position: fixed;
            width: 100%;
            margin:0 0 0 0!important; 
        }

        @media(max-width: 540px) {
            .footer {
                bottom: 0;
            }
        }

        @media (max-width: 900px) {
            body {
                min-height: 100vh;
            }
        }

        @media (min-width: 500px) and (max-width: 540px) {
            .footer {
                position: relative;
            }
        }

        .journal {
            background-image: url('../Reception Page/samanta-bg.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            height:100%;
        }

        .comming-soon {
            font-size: 14px;
        }


        @keyframes blink {
            0% {
                color: black;
            }

            50% {
                color: red;
            }

            100% {
                color: darkgreen;
            }
        }

        .blink {
            animation: blink 1s infinite; /* Change the duration as needed */
        }

        @media(max-width: 1024px) {
            .comming-soon {
                font-size: 12px;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .footer {
                position: relative;
            }
        }

        @media (min-height: 1364px) and (max-height: 1366px) {
            .footer {
                position: absolute;
            }
        }
        @media(min-width:750px) and (max-width:950px){
           
            .footer{
                position:relative;
            }
        }
          
    </style>

    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.5/1/MicrosoftAjax.js"></script>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.5/1/WebForms.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      
          <%-- <script type="text/javascript">
               Sys.Application.add_load(function () {
        // Ensure PageMethods is available after the page loads
        var pageMethods = Sys.WebForms.PageRequestManager._getInstance()._pageMethods;

        // Now you can use pageMethods if necessary
        // For example, call a method or perform other operations
    });
</script>--%>
     <script type="text/javascript">
         $(document).ready(function () {

             function checkNotifications() {
                 $.ajax({
                     url: 'ManageMembers.aspx/GetNotifiedRequest', // URL to the WebMethod
                     type: 'POST', // WebMethods require POST
                     contentType: 'application/json; charset=utf-8', // Required for WebMethods
                     dataType: 'json', // Expected response type
                     // Empty data object (required for WebMethods)
                     success: function (result1) {
                         if (result1.d == 1) {
                             //if (result1.d && result1.d.length > 0) { // Check the response
                             //alert("You have received Request.....");
                             toastr.success('You have received Request');
                         }
                         // }
                     },
                     error: function (xhr, status, error) {
                         //console.error("AJAX Error: " + status + " - " + error);
                     },
                     complete: function () {
                         // Poll again after a delay
                         // setTimeout(checkNotifications, 5000); // Poll every 5 seconds
                     }
                 });
             }

             // Start polling 
             $(document).ready(function () {
                 checkNotifications();
             });

         });
     </script>
   <%-- intractive poppu for medical history--%>
<style>
        /* Popup styling */
        .popup {
            display: none; /* Initially hidden */
            position: absolute; /* Positioned near the trigger */
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 250px;
            text-align: left;
            z-index: 1000;
            margin-top: -262px;
            margin-left: 254px;
        }

        /* Arrow pointing to the trigger */
        .popup::before {
            content: "";
            position: absolute;
            top: -10px;
            left: 1px;
            border-width: 10px;
            border-style: solid;
            border-color: transparent transparent white transparent;
        }

        /* Button styling */
        .popup button {
            margin-top: 10px;
            padding: 6px 12px;
          /*  background-color: #007bff;*/
            color: white;
            border: none;
           /* border-radius: 5px;*/
            cursor: pointer;
        }

        .popup button:hover {
            background-color: #0056b3;
        }
    </style>
 <script>
     document.addEventListener("DOMContentLoaded", function () {
         // Get elements
         const popup = document.getElementById("popup");
         const popupAnchor = document.getElementById("popupAnchor"); // The ".col-9" div
         const medicalHistoryLink = document.getElementById("medicalHistoryLink");
         const closeButton = document.getElementById("closePopup");

         if (!popup || !popupAnchor || !medicalHistoryLink || !closeButton) {
             console.error("One or more elements are missing in the HTML.");
             return;
         }

         let isHovered = false;

         // Function to position popup
         function positionPopup() {
             const rect = popupAnchor.getBoundingClientRect();
             popup.style.top = `${rect.bottom + window.scrollY + 5}px`; // Below the element
             popup.style.left = `${rect.left + window.scrollX - 20}px`; // Slightly left
         }

         // Show popup when hovering over the trigger
         popupAnchor.addEventListener("mouseenter", function () {
             isHovered = true;
             positionPopup();
             popup.style.display = "block";
         });

         // Keep popup open if hovering over it
         popup.addEventListener("mouseenter", function () {
             isHovered = true;
         });

         // Hide popup only if the user leaves both the trigger and the popup
         function hidePopup() {
             if (!isHovered) {
                 popup.style.display = "none";
             }
         }

         popupAnchor.addEventListener("mouseleave", function () {
             isHovered = false;
             setTimeout(hidePopup, 200);
         });

         popup.addEventListener("mouseleave", function () {
             isHovered = false;
             setTimeout(hidePopup, 200);
         });

         closeButton.addEventListener("click", hidePopup);

         // Redirect to MedicalHistory.aspx on click
         medicalHistoryLink.addEventListener("click", function (event) {
             window.location.href = "MedicalHistory.aspx";
         });
     });
    </script>

      <%-- intractive poppu for my H-files--%>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const hFilesTrigger = document.getElementById("hFilesTrigger");
        const popupHFiles = document.getElementById("popupHFiles");
        const hFilesCloseButton = document.getElementById("closePopupHFiles");

        function positionPopup(trigger, popup) {
            const rect = trigger.getBoundingClientRect();
            popup.style.top = `${rect.bottom + window.scrollY + 5}px`; // Position below the trigger
            popup.style.left = `${rect.left + window.scrollX - 20}px`; // Adjust left
        }

        function showPopup() {
            positionPopup(hFilesTrigger, popupHFiles);
            popupHFiles.style.display = "block";
        }

        function hidePopup() {
            popupHFiles.style.display = "none";
        }

        hFilesTrigger.addEventListener("mouseenter", function () {
            showPopup();
        });

        popupHFiles.addEventListener("mouseenter", function () {
            showPopup();
        });

        hFilesTrigger.addEventListener("mouseleave", function () {
            setTimeout(() => {
                if (!popupHFiles.matches(":hover")) {
                    hidePopup();
                }
            }, 100);
        });

        popupHFiles.addEventListener("mouseleave", function () {
            hidePopup();
        });

        hFilesCloseButton.addEventListener("click", function () {
            hidePopup();
        });
    });
</script>

 <style>
             /* Background blur effect */
       

        /* Popup styling */
        .popup {
            display: none;
            position: absolute;
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 250px;
            text-align: left;
            z-index: 1000;
            transition: opacity 0.2s ease-in-out;
        }

        /* Arrow pointing to the trigger */
        .popup::before {
            content: "";
            position: absolute;
            top: -10px;
            left: 20px;
            border-width: 10px;
            border-style: solid;
            border-color: transparent transparent white transparent;
        }

        /* Button styling */
        /*.popup button {
            margin-top: 10px;
            padding: 6px 12px;*/
            /*background-color: #007bff;*/
            /*color: white;*/
          /*  border: none;*/
            /*border-radius: 5px;*/
            /*cursor: pointer;
        }*/

      

        /* Apply blur effect when popup is active */
       

 </style>

     <%-- intractive poppu for Journal--%>

 <script>
     document.addEventListener("DOMContentLoaded", function () {
         const journalContainer = document.querySelector(".popup-container");
         const popupJournal = document.getElementById("popupJournal");

         function showPopup() {
             popupJournal.style.display = "block";
         }

         function hidePopup() {
             popupJournal.style.display = "none";
         }

         journalContainer.addEventListener("mouseenter", function () {
             showPopup();
         });

         journalContainer.addEventListener("mouseleave", function () {
             setTimeout(() => {
                 if (!popupJournal.matches(":hover")) {
                     hidePopup();
                 }
             }, 100);
         });

         popupJournal.addEventListener("mouseleave", function () {
             hidePopup();
         });
     });
 </script>

   <style>
  

/* Popup styling */
            .popup-box {
                display: none;
                position: absolute;
                background-color: white;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                width: 280px;
                text-align: left;
                z-index: 1000;
                top: 100%; /* Position below the element */
                left: 50%;
                transform: translateX(-50%);
                transition: opacity 0.2s ease-in-out;
               margin-left: -409px;
                margin-top: -301px;
            }

            /* Arrow pointing to the trigger */
            .popup-box::before {
                content: "";
                position: absolute;
                top: -10px;
                left: 50%;
                transform: translateX(-50%);
                border-width: 10px;
                border-style: solid;
                border-color: transparent transparent white transparent;
            }
            .popup-box button {
                margin-top: 10px;
                padding: 6px 12px;
                color: white;
                border: none;
                cursor: pointer;
            }

            .popup-box button:hover {
                background-color: #0056b3;
            }


   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	
    <div class="journal">
        <div class="journal_main">
            <div class="jur-width-div" style="width: 85%;">
                <%-- <div class="row inner_div mt-5 w-1000
                    <div class="col-12 heading">
                        <a href="<%= ResolveUrl("~/journal.aspx") %>">
                            <h3>Journal</h3>
                        </a>
                    </div>
                </div>--%>
                <div class="row w-100 mt-5">
                    <div class="col-lg-6 col-12 col-xl-4 col-md-5  dropdown ">
                        <%--<div class="inner_div mb-lg-5 w-100">
                                <div class="heading w-100">
                                    <a class="w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                                        <h3>Journal</h3>
                                    </a>
                                </div>
                            </div>--%>

                       <%-- <a class="support-group my-5" href="MedicalHistory.aspx">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/health-report-icon.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>My Medical History</h3>
                                    </div>
                                </div>
                            </div>
                        </a>--%>

                                    <div id="medicalHistoryTrigger">
                                <a class="support-group my-5" href="MedicalHistory.aspx" id="medicalHistoryLink">
                                    <div class="my_profile">
                                        <div class="row align-items-center">
                                            <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                                <img src="../Reception Page/health-report-icon.png" />
                                            </div>
                                            <div class="col-9" id="popupAnchor">
                                                <h3>My Medical History</h3>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <!-- Popup -->
                            <div id="popup" class="popup">
                                <h3>Quick Look of:</h3>
                                <ul>
                                    <li>Your medical history</li>
                                    <li>Allergies</li>
                                    <li>Prescriptions</li>
                                </ul>
                                <button id="closePopup">🌹</button>
                            </div>





                       

                                    <!-- H-Files Section -->
                                    <div id="hFilesContainer">
                                        <a class="support-group mb-lg-5 w-100" href="MyHFiles.aspx">
                                            <div class="my_profile">
                                                <div class="row align-items-center">
                                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                                        <img src="../Reception Page/h-files-icon.png" />
                                                    </div>
                                                    <div class="col-9 popup-trigger" id="hFilesTrigger">
                                                        <h3>My H-Files</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                    <!-- H-Files Popup -->
                                    <div id="popupHFiles" class="popup">
                                        <h3>H-Files Overview:</h3>
                                        <ul>
                                            <li>Add members</li>
                                            <li>Keep track of your and your family's medical records</li>
                                        </ul>
                                        <button id="closePopupHFiles">🌹</button>
                                    </div>


                        <%--<a class="support-group mb-lg-5 w-100" href="MyHFiles.aspx">
                            <div class="my_profile">
                                <div class="row align-items-center">

                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/h-files-icon.png" />
                                    </div>
                                    <div class="col-9" >
                                        <h3>My H-Files</h3>
                                    </div>--%>

                                    <%--<a class="dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                    aria-expanded="false">My H-Files
                                <span class="caret"></span>
                                </a>--%>
                                    <%--<ul class="dropdown-menu p-0 pt-2 px-4">
                                    <div>
                                         <li><img class="dropdown-icon" src="../Reception Page/lock-icon.png" alt=""><a
                                            tabindex="-1" href="#">UNIQUE ID</a></li> 
                                        <a class="color-white" tabindex="-1" href="MedicalHistory">
                                            <li class="color-white">
                                                <img class="dropdown-icon" src="../Reception Page/user-icon.png" alt="">My Personal Data
                                            </li>
                                        </a>
                                         <li><img class="dropdown-icon" src="../Reception Page/add-icon.png" alt=""><a
                                        tabindex="-1" href="#">ADD MY REPORTS</a></li> 
                                        <a href="<%= ResolveUrl("~/avatar.aspx") %>">
                                            <li class="color-white">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">My Medical History
                                            </li>
                                        </a>
                                        <a href="<%= ResolveUrl("~/AddMembers.aspx") %>">
                                            <li class="color-white" style="border: 0;">
                                                <img class="dropdown-icon" src="../Reception Page/add-icon.png" alt="">Add Member
                                            </li>
                                        </a>
                                    </div>
                                </ul>--%>
                               <%-- </div>
                            </div>
                        </a>--%>



                    </div>
                    <div class="col-4 col-md-2 col-lg-1 col-xl-4">
                    </div>
                    <div class="col-lg-5 col-xl-4 col-md-5 col-12 dropdown ">

                        <%--<div class="inner_div mb-lg-5 w-100">
                            <div class="heading w-100">
                                <a class="w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                                    <h3>Journal</h3>
                                </a>
                            </div>
                        </div>--%>

                                                  <!-- Journal Section with Hover Popup -->
                            <div class="popup-container">
                                <a class="support-group mb-5 w-100 popup-trigger" href="<%= ResolveUrl("~/journal.aspx") %>">
                                    <div class="my_profile">
                                        <div class="row align-items-center">
                                            <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                                <img src="../Reception Page/journal.png" />
                                            </div>
                                            <div class="col-9">
                                                <h3>Journal</h3>
                                            </div>
                                        </div>
                                    </div>
                                </a>



                                <div id="popupJournal" class="popup-box">
                                <h3>Journal Overview:</h3>
                                <ul>
                                    <li>Health Journal</li>
                                    <li>Explore expert-written articles covering a variety of health topics.</li>
                                </ul>
                                <button id="closePopupHFiless">🌹</button>
                            </div>
  
    
                            </div>







                       <%-- <a class="support-group mb-5 w-100" href="<%= ResolveUrl("~/journal.aspx") %>">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/journal.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>Journal</h3>
                                    </div>
                                </div>

                            </div>
                        </a>--%>

                        <a class="support-group mb-5 w-100" href="<%= ResolveUrl("~/supportgroup.aspx") %>">
                            <div class="my_profile">
                                <div class="row align-items-center">
                                    <div class="col-3 tab-icon-div" style="margin-left:-15px;">
                                        <img src="../Reception Page/chat-icon.png" />
                                    </div>
                                    <div class="col-9">
                                        <h3>Chat Room  <%--<small id="typingEffect" class="comming-soon"><span id="comingSoon"  class="blink"></span>--%><%--( Comming Soon ! )--%><%--</small>--%></h3>
                                        <%--<img src="Reception Page/coming-soon.png" />--%>
                                    </div>
                                    <%--   <div class="col-4">
                                        <h5>Comming Soon</h5>
                                        <%--  <img src="Reception Page/coming-soon.png" />--%>
                                    <%--  <span class="badge bg-warning rounded-circle">Comming Soon !</span>
                                    </div>--%>
                                </div>
                            </div>
                        </a>

                        <%--<a class="support-group my-5" href="MedicalHistory">
                            <div class="my_profile">
                                <div>
                                    <h3>My Medical History</h3>
                                </div>
                            </div>
                        </a>--%>
                    </div>
                </div>
                <div class="row w-100">
                    <div class="col-12 d-flex justify-content-center ">
                        <img class="samanta-image" src="../Reception Page/SamantaGIF.gif" alt="">
                        <%--  <img class="samanta-image" src="../Reception Page/Samanta1.jpeg" alt="">--%>
                    </div>
                </div>
                <%--<div class="progress_div">
                    <p for="">30% Completed</p>
                    <progress class="progress progress1" max="100" value="30"></progress>
                    <div class="span">
                        <span>Complete Your Profile</span>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <div class="backdrop" id="backdrop"></div>
    <div class="modal-popup">
        <div id="myModal" class="modal">
            <div class="modal-header">
                <h1 class="modal-title">Steps</h1>
                <span class="modal-close" onclick="closeModal()">&times;</span>
            </div>
            <div class="modal-body">
                <p>This is your modal content.</p>
            </div>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <script>

        //var text = "Coming Soon !"; // Text to be typed
        //var speed = 100; // Typing speed in milliseconds
        //var index = 0; // Index of the current character being typed

        //function typeWriter() {
        //    if (index < text.length) {
        //        document.getElementById("comingSoon").innerHTML += text.charAt(index);
        //        index++;
        //        setTimeout(typeWriter, speed);
        //    }
        //}

        //typeWriter(); // Start typing when the page loads


        // Function to open the modal and backdrop when the page renders
        //window.onload = function () {
        //    openModal();
        //};

        // Function to open the modal and backdrop
        function openModal() {
            document.getElementById("myModal").style.display = "block";
            document.getElementById("backdrop").style.display = "block";
        }

        // Function to close the modal and backdrop
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
            document.getElementById("backdrop").style.display = "none";
        }



    </script>
</asp:Content>
