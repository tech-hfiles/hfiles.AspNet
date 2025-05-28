<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="hfiles.ManageMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="./style.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />


    <script type="text/javascript">

        function confirmDelete(userReference) {

            // Convert userReference to a number if needed

            userReference = parseInt(userReference);



            // Check if userReference is 0 (Independent Member)

            if (userReference === 0) {

                // Show a confirmation dialog for Independent Member

                var result = confirm("This will permanently delete the Independent Member and all associated Dependent Members. Do you want to proceed?");

            } else {

                // Default confirmation for Members

                var result = confirm("This will permanently delete Members.");

            }



            // Return true if the user clicks "OK", false if "Cancel"

            return result;

        }



    </script>






    <script>
        var isToastrCalled = false;

        function showToastr(type, message) {
            if (isToastrCalled) return;  // Prevent showing toastr multiple times
            isToastrCalled = true;  // Set the flag to true once toastr is shown

            if (type === 'success') {
                toastr.success(message);
            } else if (type === 'error') {
                toastr.error(message);
            }

            // Optional: Reload page after toastr message

        }
    </script>



    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

        .manage-members-div {
            max-width: 100% !important;
            max-height: 100% !important;
        }

        .container-search {
            width: 100%;
        }

        .list-unstyled {
            color: #000;
        }

        .back-arrow-btn-managem {
            padding: 5px 10px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: #0512b9;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 600;
            font-size: 16px;
            background-color: #fdd001;
            margin: 1px 10px;
            /*top:10% !important;
        left:1% !important;
        margin-top: 0 !important;*/
        }

        .search-file {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

            .search-file i {
                margin-right: 10px;
            }

        .container-fluid {
            min-height: 90vh;
            /*            border-right:1px solid #000;
*/
        }

        .profile-card .btn-delete, .profile-card .btn-accept, .profile-card .btn-reject {
            border: none;
            border-radius: 10px;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
        }

        .back-arrow-btn-2 {
            display: none;
        }

        .member-container {
            display: flex;
            flex-direction: column;
            gap: 30px;
            margin: 0 20px;
            padding-bottom: 12vh;
        }

        .member-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

            .member-header span {
                display: none;
            }

            .member-header h1 {
                margin: 0;
                font-family: 'Poppins', sans-serif;
                font-size: 23px;
                color: #0331B5;
                font-weight: 600;
                text-align: center;
            }

        .member-header-divider {
            height: 1px;
            background-color: #0331B5;
            width: 80%;
            max-width: 90px;
            margin: -5px 0 5px 0;
        }

        .member-list {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

            .member-list p {
                cursor: pointer;
                font-family: 'Montserrat', sans-serif;
                font-size: 13px;
                font-weight: 600;
                color: #333333;
                background: linear-gradient(270deg, #FFFFFF 0%, #00d7ff4f 100%);
                margin: 0;
                padding: 5px 10px;
                border-radius: 3px;
            }


        .member-request-btn {
            position: relative;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 12.5px;
            font-family: 'Montserrat', sans-serif;
            font-size: 13px;
            font-weight: 500;
            border: 1px solid black;
            padding: 0 10px;
            border-radius: 3px;
        }

            .member-request-btn:hover {
                background-color: #F9E380;
            }

        .request-count {
            position: absolute;
            top: 0;
            right: 0;
            transform: translate(50%, -50%);
            background-color: #0331B5;
            color: white;
            padding: 2.5px 8px;
            border-radius: 50%;
            font-size: 12px;
        }

        .members {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 100%;
        }

        .members-list-container {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 30px;
            align-items: center;
            justify-content: center;
        }

        .request-list-container {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            gap: 30px;
            align-items: center;
            justify-content: center;
        }

        .profile-card {
            position: relative;
            border-radius: 20px;
            color: #172ab3;
            border: 1px solid black;
            width: 320px;
            max-width: 350px;
            max-height: fit-content;
            margin: 0px !important;
            background-color: #fff;
            text-align: center;
            max-width: 100%;
            width: 400px;
            padding: 0 !important;
            background: linear-gradient(45deg, #FFFFFF 50%, #CAE5FF 100%);
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

            .profile-card img {
                margin: 0;
                width: 80px;
                height: 80px;
            }

        .profile-header {
            display: flex;
            gap: 15px;
            /*            justify-content: center;*/
            align-items: center;
            /*            padding-top: 20px;*/
            padding: 20px 25px 0 25px;
        }

        .profile-headerContent {
            display: flex;
            flex-direction: column;
            /*            gap: 5px;*/
            align-items: flex-start;
        }

            .profile-headerContent p {
                margin: 0;
                font-family: 'Poppins', sans-serif;
                font-size: 18px;
                font-weight: 600;
                color: #0331B5;
            }

            .profile-headerContent span {
                margin: 0;
                font-family: 'Montserrat', sans-serif;
                font-size: 15px;
                font-weight: 500;
                color: #333333;
            }

        .profile-details {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 7.5px;
            padding: 0 25px;
        }

            .profile-details p {
                display: flex;
                gap: 5px;
                margin: 0;
                font-family: 'Montserrat', sans-serif;
                font-size: 15px;
                color: #333333;
            }

        .profile-card-buttons {
            position: relative;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 25px;
            gap: 10px;
        }

            .profile-card-buttons:hover .delete-btn {
                display: block;
            }

        .delete-btn {
            position: absolute;
            right: 25px;
            display: block;
            color: #323232;
            cursor: pointer;
        }

        .member-add-btn {
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 16px;
            color: #000000;
            background-color: #F9E380;
            padding: 15px 0;
            border-radius: 4px;
            border: 1px solid black;
            max-width: 100%;
            width: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
        }

            .member-add-btn:hover {
                color: #000000;
            }

        .btn-reject {
            font-family: 'Montserrat', sans-serif !important;
            font-size: 17px;
            margin: 0 !important;
            background-color: unset !important;
            border-radius: 0 !important;
            color: #0331B5 !important;
            font-weight: 600 !important;
        }

        .btn-accept {
            font-family: 'Montserrat', sans-serif !important;
            font-size: 17px;
            background-color: #0331B5 !important;
            margin: 0 !important;
            border-radius: 0 !important;
            font-weight: 600 !important;
        }

        .edit-btn {
            color: #0331B5 !important;
            font-family: 'Montserrat', sans-serif;
            font-size: 17px;
            font-weight: 600;
        }

        .btn-divider {
            height: 1px;
            background-color: #000000;
            width: 100%;
        }

        .dependent-user {
            font-family: 'Poppins', sans-serif;
            position: absolute;
            right: 0;
            background-color: #238B02;
            color: #FFFFFF;
            padding: 2.5px 20px;
            font-weight: 500;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 5px;
            font-size: 15px;
            border: 1px solid #333333;
        }

        .independent-user {
            font-family: 'Poppins', sans-serif;
            position: absolute;
            right: 0;
            background-color: #F9E380;
            color: #333333;
            padding: 2.5px 20px;
            font-weight: 500;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 5px;
            font-size: 15px;
            border: 1px solid #333333;
        }

        .independent-user-message {
            font-family: 'Montserrat', sans-serif;
            color: #6B6A6A;
            font-size: 11px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .member-header-divider2 {
            display: none;
        }

        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left-content {
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }



        @media (min-width: 400px) {
            .independent-user-message {
                font-size: 14px;
            }
        }

        /*Large Mobiles*/
        @media (min-width: 425px) {
            .profile-card img {
                margin: 0;
                width: 100px;
                height: 100px;
            }

            .profile-header {
                padding: 20px 30px 0 30px;
                gap: 25px;
            }

                .profile-header p {
                    font-size: 20px;
                }

            .profile-headerContent span {
                font-size: 17px;
            }

            .profile-details {
                padding: 0 30px;
            }

                .profile-details p {
                    font-size: 17px;
                }

            .profile-card-buttons {
                padding: 10px 30px;
            }

            .member-list p {
                font-size: 15px;
            }

            .member-request-btn {
                font-size: 15px;
            }

            .independent-user {
                font-size: 16px;
                padding: 4px 22.5px;
            }

            .dependent-user {
                font-size: 16px;
                padding: 4px 22.5px;
            }

            .independent-user-message {
                font-size: 14px;
                gap: 10px;
            }
        }

        /*Tablet*/
        @media (min-width: 768px) {

            body.show-background {
                background-image: url('Add Members/addmember-avatar.png');
                background-position: right 30px bottom 70px;
                background-repeat: no-repeat;
                background-size: 450px;
            }

            .member-container {
                margin: 0 50px;
            }

            .back-arrow-btn-2 {
                position: absolute;
                /*color: #333333;*/
                display: inline-block;
                padding: 20px 20px 5px 20px;
                border-radius: 50px;
                border: 0;
                outline: 0;
                display: flex;
                align-items: center;
                gap: 10px;
                cursor: pointer;
                margin-top: 3px !important;
                font-family: 'Red Hat Display', Sans-serif !important;
                font-weight: 700;
                font-size: 15px;
            }

            .member-header {
                margin-top: 15px;
            }

            .member-header-divider2 {
                display: block;
                margin-top: 10px;
                height: 1px;
                background-color: #333333;
                width: 100%;
            }

            .member-header span {
                display: inline-flex;
                text-align: center;
                font-family: 'Montserrat', sans-serif;
                color: #000000;
                font-size: 16px;
            }

            .member-header h1 {
                font-size: 25px;
            }

            .member-list p {
                font-size: 16px;
            }

            .member-request-btn {
                font-size: 16px;
            }

            .profile-header {
                padding: 20px 35px 0 35px;
            }

                .profile-header p {
                    font-size: 22px;
                }

            .profile-details {
                padding: 0 35px;
            }

                .profile-details p {
                    font-size: 18px;
                }

            .profile-card img {
                width: 125px;
                height: 125px;
            }

            .edit-btn {
                font-size: 18px;
            }

            .member-add-btn {
                font-size: 18px;
                width: 440px;
            }

            .profile-card {
                width: 440px;
            }

            .profile-card-buttons {
                padding: 10px 35px;
            }

            .btn-accept {
                font-size: 18px;
            }

            .btn-reject {
                font-size: 18px;
            }

            .profile-header {
                gap: 30px;
            }

            .independent-user {
                font-size: 17px;
                padding: 4.5px 25px;
            }

            .dependent-user {
                font-size: 17px;
                padding: 4.5px 25px;
            }

            .independent-user-message {
                font-size: 16px;
            }
        }

        /*Laptop command desktop*/
        @media (min-width: 1024px) {
            .profile-card {
                width: 450px;
            }



                .profile-card img {
                    width: 150px;
                    height: 150px;
                }

            .profile-header {
                padding: 25px 40px 0 40px;
            }

                .profile-header p {
                    font-size: 24px;
                }

            .profile-header {
                gap: 35px;
            }

            .profile-headerContent span {
                font-size: 18px;
            }

            .profile-details {
                padding: 0 40px;
            }

                .profile-details p {
                    font-size: 20px;
                }

            .edit-btn {
                font-size: 20px;
            }

            .profile-card-buttons {
                padding: 10px 40px;
            }

            .member-header-divider2 {
                margin-top: 20px;
            }

            .member-list p {
                font-size: 18px;
            }

            .member-header span {
                font-size: 18px;
            }

            .member-request-btn {
                font-size: 18px;
                padding: 0 15px;
            }

            .back-arrow-btn-2 {
                font-size: 16px;
            }

            .member-header h1 {
                font-size: 27px;
            }

            .member-header-divider {
                max-width: 100px;
            }

            .member-add-btn {
                font-size: 20px;
                width: 450px;
                margin-top: 1rem;
            }

            .btn-accept {
                font-size: 20px;
            }

            .btn-reject {
                font-size: 20px;
            }

            .members-list-container {
                gap: 40px;
            }

            .independent-user {
                font-size: 18px;
                padding: 5px 30px;
            }

            .dependent-user {
                font-size: 18px;
                padding: 5px 30px;
            }

            .independent-user-message {
                font-size: 17px;
            }

            .delete-btn {
                display: none;
                right: 40px;
            }
        }

        @media(min-width: 1200px) {
            body.show-background {
                background-position: right 30px bottom 50px;
            }
        }

        /*@media(max-width:540px) {
            .container-fluid {
                width: 100% !important;
                min-height: 50vh;*/
        /*  margin-top: -84px !important;*/
        /*}

            .search-file {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                margin: 10px 10px;
            }

            .manage-members-div {
                margin-top: 0 !important;
                margin-bottom: 0 !important;
            }*/
        /*.back-arrow-btn {
                top: 8% !important;
            }*/


        /*}*/

        /*  @media(width>540px) {*/

        /*.search-file input{
            justify-self:center !important;
            width:100% !important;
        }*/
        /*}*/

        /*@media (min-width:980px) and (max-width:1100px) {
            .back-arrow-btn {
                top: 7% !important;
            }

            .manage-members-div {
            }
        }

        .access {
            color: blue;
        }

        .custom-margin {
            margin-top: 100px;*/ /* Default for desktop & tablet */
        /*margin-bottom: 300px;
        }*/

        /*@media (max-width: 540px) {
            .search-file {
                margin-top: 29px;
                padding-left: 136px;*/
        /* margin-top: -8px;*/
        /*}
        }

        @media (max-width: 576px) {
            .hide-mobile {
                display: none !important;
            }
        }

        @media (min-width: 577px) {
            .hide-mobile {
                display: block !important;
            }
        }

        @media (max-width: 575.98px) {*/ /* Targets screens smaller than 576px */
        /*.custom-margin {
                margin-top: 30px !important;*/ /* Removes margin-top only on mobile */
        /*}
        }*/
    </style>
    <script>
       <%-- document.addEventListener("DOMContentLoaded", function () {
            let searchInput = document.getElementById('<%= SearchInput.ClientID %>');

           if (searchInput) {
               searchInput.addEventListener("keyup", function () {
                   let searchTerm = searchInput.value.toLowerCase();
                   let profiles = document.querySelectorAll(".profile-card");

                   profiles.forEach(function (profile) {
                       let name = profile.querySelector(".u-name").textContent.toLowerCase();
                       if (name.includes(searchTerm)) {
                           profile.style.display = "block"; // Show the matching item
                       } else {
                           profile.style.display = "none"; // Hide non-matching item
                       }
                   });
               });
           }
       });--%>
    </script>


    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.5/1/MicrosoftAjax.js"></script>

    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/4.5/1/WebForms.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    <!-- jQuery for Mobile Toggle -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



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
    <script>
        $(document).ready(function () {
            // Check if screen is mobile size
            function isMobile() {
                return $(window).width() < 576; // Bootstrap 'sm' breakpoint
            }

            // Show Request List and Hide Members List (Only in Mobile View)
            $("#toggleRequestList").click(function (e) {
                e.preventDefault();
                if (isMobile()) {
                    $("#membersListContainer").hide();
                    $("#requestListContainer").fadeIn();
                }
            });

            // Show Members List and Hide Request List (Only in Mobile View)
            $("#toggleMembersList").click(function (e) {
                e.preventDefault();
                if (isMobile()) {
                    $("#requestListContainer").hide();
                    $("#membersListContainer").fadeIn();
                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:ScriptManager ID="scm1" runat="server"></asp:Scri ptManager>--%>
    <div class="container-search mt-3 w-100">
        <div class="row d-flex align-items-center w-100">
            <%--<div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">--%>
            <a class="back-arrow-btn-2" href="Dashboard.aspx">Back to Home
            </a>

        </div>
        <%-- <div class="col-12 col-md-8 col-xl-6 search-file">
                <i class="fa-solid fa-magnifying-glass" style="position: absolute;"></i>
                <asp:TextBox ID="SearchInput" runat="server" placeholder="Search" class="form-control" />
            </div>--%>
        <%--</div>--%>
    </div>


    <div class="member-container">

        <%--Header--%>
        <div class="member-header">
            <h1>Your Health Circle</h1>
            <div class="member-header-divider"></div>
            <span>Let your loved ones be a part of your health journey and build a healthier future together.</span>
            <div class="member-header-divider2"></div>
        </div>


        <%--Family members list--%>
        <div class="member-list">
            <p onclick="toggleMemberViews()" id="familyMembersLabel">Family Members List</p>
            <div class="member-request-btn" onclick="toggleRepeaterViews()">
                <span>Request</span>
                <i class="fa-solid fa-bell"></i>
                <span id="requestCountBadge" class="request-count"></span>
                <!-- Request Count Badge -->
            </div>
        </div>



        <%--Member's--%>
        <div class="members">
            <div class="members-list-container" id="membersListContainer">

                <asp:Repeater ID="gvMemberslist" runat="server">
                    <ItemTemplate>
                        <div class="profile-card">
                            <!-- Profile Image -->
                            <asp:Label ID="lblUserType" runat="server"
                                Text='<%# Convert.ToInt32(Eval("User_Reference")) != 0 ? "Dependent" : "Independent" %>'
                                CssClass='<%# Convert.ToInt32(Eval("User_Reference")) != 0 ? "dependent-user" : "independent-user" %>'>
                            </asp:Label>

                            <div class="profile-header">
                                <img class="members-image img-fluid" src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>'
                                    alt="<%# Eval("user_firstname") %>" />
                                <div class="profile-headerContent">
                                    <p class="font-weight-bold u-name">
                                        <%# Eval("user_firstname") + " " + Eval("user_lastname") %>
                                    </p>
                                    <span><%# Eval("user_membernumber") %></span>
                                </div>
                            </div>

                            <div class="profile-details">
                                <p><strong>Email:</strong> <%# Eval("user_email") %></p>
                                <p><strong>Number:</strong> <%# Eval("user_contact") %></p>
                            </div>
                            <div>
                                <div class="btn-divider"></div>
                                <div class="profile-card-buttons <%# Convert.ToInt32(Eval("User_Reference")) != 0 ? "center-content" : "left-content" %>">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>

                                            <div class='<%# Convert.ToInt32(Eval("User_Reference")) != 0 ? "center-content" : "left-content" %>'>
                                                <%-- Edit Button (Visible only for Dependent Users) --%>
                                                <asp:LinkButton ID="LinkButtonEdit" class="edit-btn" runat="server"
                                                    Text="Edit" OnClick="editBtn_Click" CommandArgument='<%# Eval("user_id") %>'
                                                    Visible='<%# Convert.ToInt32(Eval("User_Reference")) != 0 %>'>
                                                </asp:LinkButton>

                                                <!-- Independent User Message (Visible only if User_Reference = 0) -->
                                                <asp:Label ID="lblIndependentUser" runat="server"
                                                    Text='<%# "<i class=\"fa-solid fa-circle-exclamation\"></i> Independent Users are not editable" %>'
                                                    Visible='<%# Convert.ToInt32(Eval("User_Reference")) == 0 %>'
                                                    CssClass="independent-user-message">
                                                </asp:Label>
                                            </div>

                                            <%--</asp:Label>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <asp:LinkButton ID="lbtnRemove" class="delete-btn" runat="server"
                                        OnClick="lbtnRemove_Click"
                                        OnClientClick='<%# "return confirmDelete(" + Eval("User_Reference") + ");" %>'
                                        CommandArgument='<%# Eval("user_id") + "|" + Eval("user_relation") + "|" + Eval("DependentUserId") + "|" + Eval("User_Reference") %>'>
                                     <i class="fa-solid fa-trash"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="request-list-container" id="requestsListContainer" style="display: none;">
                <asp:Repeater ID="rptRequests" runat="server">
                    <ItemTemplate>
                        <div class="profile-card" style="padding: 0;">
                            <div class="profile-header" style="padding-top: 20px;">
                                <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" class="img-fluid">
                                <div class="profile-headerContent">
                                    <p class="font-weight-bold text-primary u-name"><%#Eval("user_firstname") + " " + Eval("user_lastname") %></p>
                                    <span><%# Eval("user_membernumber") %></span>
                                </div>
                            </div>

                            <div class="profile-details" style="padding: 0 25px;">
                                <p><strong>Email:</strong> <%# Eval("user_email") %></p>
                                <p><strong>Number:</strong> <%# Eval("user_contact") %></p>
                            </div>
                            <div class="profile-buttons">
                                <asp:HiddenField ID="hfDependentUserId" runat="server" Value='<%# Eval("DependentUserId") %>' />
                                <asp:LinkButton class="btn btn-accept" ID="LinkButton1" runat="server" Text="Accept" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" class="btn btn-reject" runat="server" Text="Reject" OnClick="rejectBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>



        <%--Add Member Button--%>
        <a class="member-add-btn" id="addFamilyBtn" href="AddMembers.aspx">Add Family Member</a>


    </div>














    <%-- <div class="custom-margin" style="margin-top: 100px; margin-bottom: 300px;">
        <div class="manage-members-div" style="display: flex; flex-direction: row-reverse;">--%>
    <%--<div class="row justify-content-center pt-5 m-0" style="min-height: 100vh">
             <div class="col-12 col-md-10 col-lg-10">--%>
    <%-- <div class="container-fluid w-50 justify-content-center">
                <h2 class="text-center heading my-3 hide-mobile">Request List
                </h2>

                <div class="container-fluid member-cards hide-mobile">
                    <div class="row justify-content-center">--%>
    <%--<asp:Repeater ID="rptRequests" runat="server">
                            <ItemTemplate>
                                <div class="profile-card">
                                    <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" class="img-fluid">
                                    <h5 class="font-weight-bold text-primary u-name"><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                    <ul class="list-unstyled text-left mx-auto" style="max-width: 280px;">
                                        <li><strong>HF - ID :</strong> <%# Eval("user_membernumber")%></li>
                                        <li><strong>Email:</strong> <%# Eval("user_email")%></li>
                                        <li><strong>Mobile No :</strong> <%# Eval("user_contact")%></li>
                                        <li runat="server" visible='<%# hfiles.DAL.validateInt(Eval("IsDependent")) == 1 ? true : false %>'><strong>Get access of: </strong><%# Eval("dependent_info")%></li>
                                        <asp:HiddenField ID="hfDependentUserId" runat="server" Value='<%# Eval("DependentUserId") %>' />
                                    </ul>
                                    <asp:LinkButton class="btn btn-accept" ID="LinkButton1" runat="server" Text="Accept" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" class="btn btn-reject" runat="server" Text="Reject" OnClick="rejectBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>

                                </div>

                            </ItemTemplate>
                        </asp:Repeater>--%>
    <%--   </div>
                </div>
            </div>--%>
    <%-- <div class="col-12 col-md-4 col-xl-6 text-center py-3 search-file">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                </div>--%>
    <%--<asp:GridView ID="friendrequests" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="friendrequests_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                    <Columns>
                        <asp:TemplateField HeaderText="HFiles Number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerialNumber" runat="server" Text='<%#Eval("user_membernumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblHFilesNumber" Text='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="acceptBtn" runat="server" Text="Accept" OnClick="acceptBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="rejectBtn" runat="server" Text="Reject" OnClick="rejectBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
       <asp:UpdatePanel ID="uplManageMembers" runat="server">
                <ContentTemplate>
               <%--     <div class="row">--%>
    <%-- <div class="col-md-4 col-lg-3 my-2">--%>

    <%--  <h2 class="text-center heading mb-5">Requests </h2>--%>
    <%-- <div class="col-md-4 my-2">
                                        <div class="card text-start px-3" style="height: 100%;">
                                            <a href='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' class="btn btn-sm btn-primary" style="align-self: center; height: 100px; object-fit: cover;">
                                            </a>
                                            <div class="card-body" style="align-self: center;">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
                                            </div>
                                        </div>
                                    </div>--%>
    <%--<div class="card text-start px-3">
                                           
                                            <a href="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' target="_blank" class="btn btn-sm btn-primary" style="align-self: center">
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>


                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
</div>
                                        </div>--%>

    <%--  <div>
                            <div class="">
                            </div>
                        </div>
                    </div>--%>

    <%--   mobile view--%>


    <!-- Mobile View Toggle Buttons -->
    <%--   <div class="row justify-content-center gap-3 d-sm-none">
                        <div class="d-flex justify-content-between w-100">
                            <h2 class="heading my-2">
                                <a href="#" id="toggleMembersList" class="text-decoration-none">Members List</a>
                            </h2>
                            <h2 class="heading my-2">
                                <a href="#" id="toggleRequestList" class="text-decoration-none">Request List</a>
                            </h2>
                        </div>
                    </div>--%>

    <!-- Members List (Default Visible on Mobile) -->
    <%--<div id="membersListContainer" class="container-fluid member-cards d-sm-none">
                        <h2 class="text-center heading my-3 hide-mobile d-none d-sm-block">Members List</h2>
                        <div class="row justify-content-center gap-3">
                            <asp:Repeater ID="gvMemberslist" runat="server">
                                <ItemTemplate>
                                    <div class="profile-card">
                                        <!-- Profile Image -->
                                        <img class="members-image" src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>'
                                            alt="<%# Eval("user_firstname") %>" class="img-fluid" />

                                        <h5 class="font-weight-bold u-name">
                                            <%# Eval("user_firstname") + " " + Eval("user_lastname") %>
                                        </h5>
                                        <ul class="list-unstyled text-left mx-auto">
                                            <li><strong>HF - ID :</strong> <%# Eval("user_membernumber") %></li>
                                            <li><strong>Email:</strong> <%# Eval("user_email") %></li>
                                            <li><strong>Mobile No :</strong> <%# Eval("user_contact") %></li>
                                        </ul>

                                       

                                        <asp:LinkButton ID="LinkButtonEdit" class="btn btn-primary" runat="server" Text="Edit" OnClick="editBtn_Click" CommandArgument='<%# Eval("user_id") %>' Visible='<%# Convert.ToInt32(Eval("User_Reference")) != 0 %>'>
                                        </asp:LinkButton>




                                        <asp:LinkButton ID="lbtnRemove" class="btn btn-delete" runat="server" OnClick="lbtnRemove_Click"
                                            OnClientClick='<%# "return confirmDelete(" + Eval("User_Reference") + ");" %>' Text="Delete"
                                            CommandArgument='<%# Eval("user_id") + "|" + Eval("user_relation") + "|" + Eval("DependentUserId") + "|" + Eval("User_Reference") %>'>
                                        </asp:LinkButton>

                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>--%>

    <!-- Request List (Initially Hidden on Mobile) -->
    <%-- <div id="requestListContainer" class="container-fluid member-cards d-sm-none" style="display: none;">
                        <h2 class="text-center heading my-3 hide-mobile d-none d-sm-block">Request List</h2>
                        <div class="row justify-content-center">
                            <asp:Repeater ID="gvRequestlist" runat="server">
                                <ItemTemplate>
                                    <div class="profile-card">
                                        <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" class="img-fluid">
                                        <h5 class="font-weight-bold text-primary u-name"><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                        <ul class="list-unstyled text-left mx-auto" style="max-width: 280px;">
                                            <li><strong>HF - ID :</strong> <%# Eval("user_membernumber")%></li>
                                            <li><strong>Email:</strong> <%# Eval("user_email")%></li>
                                            <li><strong>Mobile No :</strong> <%# Eval("user_contact")%></li>
                                            <li runat="server" visible='<%# hfiles.DAL.validateInt(Eval("IsDependent")) == 1 ? true : false %>'><strong>Get access of: </strong><%# Eval("dependent_info")%></li>
                                            <asp:HiddenField ID="hfDependentUserId" runat="server" Value='<%# Eval("DependentUserId") %>' />
                                        </ul>
                                        <asp:LinkButton class="btn btn-accept" ID="LinkButton1" runat="server" Text="Accept" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" class="btn btn-reject" runat="server" Text="Reject" OnClick="rejectBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>

                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>--%>












  
    <div id="toast">
        <div id="img">
            <img src="assets/h-file-logo-white.png" />
        </div>
        <div id="desc"></div>
    </div>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center">
        <div id="editUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        </div>
                        <br />
                        <div class="form-group">
                            <label for="txtMobile">Mobile Number</label>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter your mobile number"></asp:TextBox>
                        </div>
                        <asp:HiddenField ID="hfUserId" runat="server" />

                        <!-- Profile Image Upload Section -->
                        <div class="Addbasicbtnboth mt-3">
                            <%--  <asp:Button ID="showInputButton" CssClass="btn btn-info" runat="server" Text="Change Profile Image" OnClientClick="showFileUpload(); return false;" />--%>



                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Change Profile Image" OnClientClick="showFileUpload(); return false;" />
                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" OnClick="lbtnSave_Click" CssClass="btn btn-primary">Save</asp:LinkButton>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="lbtnSave" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:FileUpload ID="Profileupload" runat="server" CssClass="form-control hidden" accept=".png,.jpg,.jpeg" />
                        </div>

                    </div>
                    <div class="modal-footer mt-3">
                        <button type="button" id="btnClose" class="btn btn-secondary mx-3" data-bs-dismiss="modal">Close</button>
                        <asp:LinkButton ID="lbtnSave" runat="server" OnClick="lbtnSave_Click" Text="Save" CssClass="btn btn-primary"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>







    </ContentTemplate>
                <triggers>
                </triggers>
    </asp:UpdatePanel>

            <%--<div>
                    <h2 class="text-center heading mb-5">My Members </h2>
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID : </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No :</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID: </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No:</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
      <%--  </div>

    </div>--%>
    <script>
        function launch_toast(message, icon) {
            var x = document.getElementById("toast")
            x.className = "show";
            document.getElementById("img").innerHTML = "<img src='" + icon + "' />"; // Set the message
            document.getElementById("desc").innerHTML = message; // Set the message
            setTimeout(function () { x.className = x.className.replace("show", ""); });
        }
        //launch_toast()
    </script>

    <%--<script type="text/javascript">
       //document.getElementById("change-profile-img").addEventListener("click", function () {
       //    var inputBox = document.getElementById("Profileupload");
       //    inputBox.classList.remove("hidden");
       //});
       function showFileUpload() {
           var fileUpload = document.getElementById('<%= Profileupload.ClientID %>');
           fileUpload.classList.remove("hidden");
       }
       function previewImage() {
           var fileInput = document.getElementById('Profileupload');
           var preview = document.getElementById('imagePreview');

           // Check if file input and preview elements exist
           if (!fileInput || !preview) {
               console.error("File input or preview element not found.");
               return;
           }

           var file = fileInput.files[0];

           // Check if a file is selected
           if (file) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   // Create an image element
                   var img = document.createElement('img');
                   img.src = e.target.result;

                   img.width = 100;
                   img.height = 100;

                   // Clear any previous preview
                   preview.innerHTML = '';

                   // Append the image to the preview div
                   preview.appendChild(img);
               };

               // Read the file as a data URL
               reader.readAsDataURL(file);
           } else {
               // Clear the preview if no file is selected
               preview.innerHTML = '';
           }
       }


       //function uploadImage() {
       //    var fileUpload = document.getElementById("Profileupload");
       //    var imagePreview = document.getElementById("imagePreview");

       //    if (fileUpload.files.length > 0) {
       //        var file = fileUpload.files[0];
       //        var reader = new FileReader();

       //        reader.onloadend = function () {
       //            var base64String = reader.result;
       //            PageMethods.UploadImage(base64String, onSuccess, onError);
       //        };

       //        reader.readAsDataURL(file);
       //    }
       //}

       function onSuccess(response) {
           // Update the image preview source
           document.getElementById("imagePreview").src = response;
       }

       function onError(error) {
           // Handle error (display error message, log, etc.)
           console.error(error);
       }
       function launch_toast() {
           var x = document.getElementById("toast")
           x.className = "show";
           setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
       }
       //launch_toast()

   </script>--%>
    <script>
        function showFileUpload() {
            console.log("Working")
            var fileUpload = document.getElementById('<%= Profileupload.ClientID %>');
            fileUpload.classList.remove('hidden');
            return false; // prevent the page from reloading
        }



        //function updateUserType(userReference) {
        //    userReference = parseInt(userReference);


        //    var userTypeText = (userReference === 0) ? "Independent User" : "Dependent User";


        //    var userTypeElement = document.getElementById("userType");
        //    if (userTypeElement) {
        //        userTypeElement.innerHTML = `<p>${userTypeText}</p>`;
        //    } else {
        //        console.error("Element with ID 'userType' not found.");
        //    }

        //    console.log(userReference, userTypeText);

        //}

        //setInterval(updateUserType, 500);

        function toggleRepeaterViews() {

            document.getElementById('membersListContainer').style.display = 'none';

            document.getElementById('requestsListContainer').style.display = 'flex';
            document.getElementById('requestsListContainer').style.padding = ' 0 7.5px';

            document.querySelector('.member-request-btn').style.backgroundColor = '#F9E380';

            document.getElementById('addFamilyBtn').style.display = 'none';

            const familyLabel = document.getElementById('familyMembersLabel');
            familyLabel.style.background = 'none';
            familyLabel.style.border = '1px solid black';

            document.body.classList.add("show-background");
        }


        function toggleMemberViews() {
            document.getElementById('membersListContainer').style.display = 'flex';

            document.getElementById('requestsListContainer').style.display = 'none';

            document.querySelector('.member-request-btn').style.backgroundColor = 'unset';

            document.getElementById('addFamilyBtn').style.display = 'flex';

            const familyLabel = document.getElementById('familyMembersLabel');
            familyLabel.style.background = 'linear-gradient(270deg, #FFFFFF 0%, #00d7ff4f 100%)';
            familyLabel.style.border = 'none';

            document.body.classList.remove("show-background");
        }

    </script>


    <style>
        .hidden {
            display: none;
        }
    </style>

    <%--<style>
    .hidden {
        display: none;
    }
    .file-upload-container {
        margin-top: 10px;
    }
</style>--%>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</asp:Content>
