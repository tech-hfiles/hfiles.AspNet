<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="Dashboard.aspx.cs" Inherits="hfiles.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>

    <%--<link rel="stylesheet" href="./style2.css" />--%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

        body {
            margin: 0 !important;
            padding: 0 0 0 0 !important;
            height: 100%;
        }
        body{

        }

        .footer {
            position: fixed;
            width: 100%;
            margin: 0 0 0 0 !important;
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
            display: flex;
            justify-content: center;
            align-items: center;
        }



        .comming-soon {
            font-size: 14px;
        }

        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background: white;
            color: black;
            font-size: 14px;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 300px;
            position: relative;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Close Button */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
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

        @media(min-width:750px) and (max-width:950px) {

            .footer {
                position: relative;
            }
        }

        .dashboard {
            height: 100vh;
        }

        .journal_container {
            position: relative; /* Required to position child absolutely */
            width: 100%;

        }


        .journal .journal_main {
            display: flex;
            justify-content: center;
            align-items: center;
/*            padding: 30px 20px;*/
            /*height:89vh !important;*/
        }

            .journal .journal_main .inner_div {
                /* width: 40%; */
                /* margin: 10px 0 0 0; */
            }

        .journal .inner_center_div {
            display: flex;
            justify-content: space-between;
        }

            .journal .inner_center_div .center_img img {
                width: 100%;
            }

        .journal .journal_main .my_profile {
            /*    width: 90%;*/
            height: 65px;
            border-radius: 17.5px;
            margin: 0 0 1.5rem 0;
            background-color: white;
            /* display: flex;
    justify-content: center;
    align-items: center;*/
            box-shadow: 0px 5px 10px #393838;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            padding: 65px 25px;
            gap: 10px;
        }

            .journal .journal_main .my_profile:hover {
                /*        box-shadow: 2px 2px 20px #0331b5;*/
                background-color: #F9E380;
            }

            .journal .journal_main .my_profile img {
                border-radius: 50%;
                width: 75px;
            }

            .journal .journal_main .my_profile .tab-icon-div {
                margin-top: 3px;
                /*        padding-left: 30px;*/
            }

        .journal .journal_main .inner_div .heading {
            display: flex;
            justify-content: center;
            align-items: center;
            color: #0331b5;
        }

            .journal .journal_main .inner_div .heading a {
                color: #0331b5 !important;
            }

            .journal .journal_main .inner_div .heading h3 {
                background-color: #ffd101;
                height: 60px;
                width: 90%;
                border-radius: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 30px;
                font-weight: 600;
            }

        .my_profile .dropdown-toggle {
            text-decoration: none;
            color: #0331b5 !important;
            font-weight: 800;
            font-size: 26px;
            font-family: 'Red Hat Display' !important;
        }

        .my_profile .support-group {
            text-decoration: none;
        }


        .background-wrapper-desktop {
            position: absolute;
            top: 0;
            left: 7.5%;
            width: 45vw;
            max-width: 685px;
            height: 100%;
            background-image: url('../Reception Page/samanta-bg.png');
            background-size: contain;
            background-position: top left;
            background-repeat: no-repeat;
            z-index: -1;
        }

        /*        .image_container {
            background-image: url('../Reception Page/samanta-bg.png');
            background-size: contain;
            background-position: top left;
            background-repeat: no-repeat;
            width: fit-content;
            height: fit-content;
        }*/

        .image_wrapper {
            width: 100px;
            height: 100px;
            overflow: hidden;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #3333;
            border-radius: 12px;
        }

            .image_wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 0;
            }



        .card-container {
            width: 100%;
            margin: 0 30px 75px 30px;
            padding: 30px;
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(180deg, #FFFFFF 7%, #CAE5FF 85%);
            position: relative;
            z-index: 1;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(0, 0, 0, 0.3);
        }




        .journal_main {
            display: grid;
            grid-template-columns: 1fr auto 1fr; /* Image | Divider | Content */
            align-items: center;
            justify-content: space-evenly;
            margin: 0 20px;
            gap: 80px;
            width: 100%;
/*            padding: 20px;*/
        }


        .my_profile h3 {
            color: black;
            font-weight: 600;
            font-size: 25px;
            margin: 0;
        }

        .my_profile_content {
            display: flex;
            flex-direction: column;
            gap: 5px;
            max-width: 75%;
        }


        .image_container img {
            max-width: 100%;
            width: 550px;
            height: auto;
            object-fit: contain;
        }


        .content_container {
            grid-column: 2;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }



        .divider {
            width: 1px;
            background-color: #333333;
            height: 100%;
            min-height: 300px;
            align-self: center;
        }

        .welcome_divider {
            height: 1px;
            background-color: #333333;
            width: 80%;
            max-width: 200px;
            margin: 10px auto;
        }

        .content_divider {
            height: 1px;
            background-color: #333333;
            width: 80%;
            max-width: 125px;
            margin: 10px auto;
            font-weight: normal;
        }


        .welcome-section {
            text-align: center;
            margin: 30px 70px;
            padding: 0 50px;
        }

            .welcome-section p {
                font-size: 24px;
                font-weight: 500;
                color: black;
                text-align: center;
                line-height: 34px;
                letter-spacing: 1px;
            }

            .welcome-section span {
                color: #0331B5;
                font-weight: 600;
            }

        .card-description {
            color: black;
            font-size: 19px;
            font-weight: 300;
        }

        .card_icon {
            color: #333333;
        }

        .content_header {
            margin-bottom: 10px;
        }

            .content_header p {
                text-align: center;
                font-size: 22px;
                font-weight: 600;
                margin: 0;
            }

            .content_header span {
                color: #0331B5;
            }

        .image_content {
            text-align: center;
            color: black;
            font-size: 23px;
            letter-spacing: 2px;
        }

        .image_container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .image_content span {
            display: inline-block;
            text-align: center;
        }

        .default_profile {
            background-color: #F9E380 !important;
        }

        .mobile-view {
            display: none;
        }

        .poppins-text {
            font-family: 'Poppins', sans-serif !important;
        }



        @media (min-width: 1201px) and (max-width: 1300px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 450px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }
            .image_container img{
                width: 425px;
            }
        }

        @media (min-width: 1301px) and (max-width: 1400px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 500px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }


        }
            .image_container img{
    width: 450px;
}
        @media (min-width: 1401px) and (max-width: 1500px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 550px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }

                        .image_container img{
    width: 475px;
}
        }

        @media (min-width: 1501px) and (max-width: 1600px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 590px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }
        }

        @media (min-width: 1601px) and (max-width: 1700px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 635px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }
        }


        @media (min-width: 1701px) and (max-width: 1800px) {
            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 5%;
                width: 45vw;
                max-width: 660px;
                max-height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }
        }




        /* Laptop Responsiveness */
        @media (min-width: 1024px) and (max-width: 1200px) {

            .welcome-section p {
                font-size: 22px;
            }

            .image_content{
                font-size: 19px;
            }

            .content_header p {
                font-size: 17px;
            }

            .image_container img{
/*                max-width: 100%;*/
                width: 325px;
            }

            .background-wrapper-desktop {
                position: absolute;
                top: 0;
                left: 0;
                width: 45vw;
                max-width: 650px;
                height: 100%;
                background-image: url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top left;
                background-repeat: no-repeat;
                z-index: -1;
            }

            .image_wrapper {
                width: 75px;
                height: 75px;
                overflow: hidden;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #3333;
                border-radius: 12px;
            }

                .image_wrapper img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    border-radius: 0;
                }

            .my_profile h3 {
                font-size: 19px;
                margin: 0;
                font-weight: 600;
                color: black;
            }

            .my_profile{
                padding:50px 25px !important;
            }

            .card-description {
                font-size: 13px;
            }
        }


        /* Tablet Responsiveness */
        @media (min-width: 769px) and (max-width: 1023px) {
            .mobile-view {
                display: block;
            }

            .desktop-view {
                display: none;
            }

            .background-wrapper {
                background: none;
            }

            .journal_main {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                box-shadow: -5px 7.5px 10px #5f5959a6;
                border-radius: 12px;
                padding: 15px 20px 25px 20px;
                background: linear-gradient(transparent 50%, #CAE5FF 85%), url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top;
                background-repeat: no-repeat;
                margin: 0 30px;
            }

            .image_container {
                background: none;
                order: -1;
            }

            .content_container {
                order: 1;
                width: 100%;
            }

            .welcome-section {
                display: none;
            }

            .image_content {
                font-size: 24px;
                letter-spacing: 2px;
                font-weight: 500;
            }

            .my_profile {
                height: 65px;
                border-radius: 17.5px;
                background-color: white;
                box-shadow: 0px 5px 10px #393838c2;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                padding: 70px 25px 70px 35px;
                gap: 10px;
            }

            .card-container {
                margin: 20px 0 0 0;
                padding: 0;
                background: none;
                border: none;
                box-shadow: none;
            }

            .card-description {
                font-size: 21px;
            }

            .my_profile img {
                width: 60px;
            }

            .my_profile h3 {
                font-size: 25px;
                margin: 0;
                font-weight: 600;
                color: black;
            }

            .outside-card {
                margin: 30px 50px 120px 50px;
                padding-bottom: 100px;
                display: flex;
                flex-direction: column;
                gap: 25px;
            }

            .content_header {
                margin-bottom: unset;
            }

                .content_header p {
                    margin: 0;
                    font-size: 23px;
                    font-weight: 500;
                }

            .my_profile_section {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .divider {
                display: none;
            }
        }


        /* Small Mobile Responsiveness */
        @media (max-width:480px) {

            .mobile-view {
                display: block;
            }

            .desktop-view {
                display: none;
            }

            .background-wrapper {
                background: none;
            }

            .journal_main {
                width: inherit;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                box-shadow: -5px 7.5px 10px #5f595987;
                border-radius: 12px;
                padding: 15px 15px 20px 15px;
                /*                border: 1px solid black;*/
                background: linear-gradient(transparent 50%, #CAE5FF 85%), url('../Reception Page/samanta-bg.png');
                border-radius: 12px;
                background-size: contain;
                background-position: top;
                background-repeat: no-repeat;
            }


            .image_container {
                background: none;
                order: -1;
            }

            .image_wrapper {
                width: 55px;
                height: 55px;
                overflow: hidden;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #3333;
                border-radius: 12px;
            }

                .image_wrapper img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    border-radius: 0;
                }

            .content_container {
                order: 1;
                width: 100%;
            }

            .welcome-section {
                display: none;
            }

            .image_content {
                font-size: 14px;
                letter-spacing: 1px;
                font-weight: 500;
            }

            .my_profile {
                height: 65px;
                border-radius: 17.5px;
                background-color: white;
                box-shadow: 0px 5px 10px #3938388c;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                padding: 45px 20px 45px 30px;
                gap: 10px;
            }

            .journal_container {
                /*                border: 1px solid yellow;*/
                /*                padding: 0 20px;*/
            }

            .card-container {
                margin: 20px 0 0 0;
                padding: 0;
                background: none;
                border: none;
                box-shadow: none;
                /*                border: 1px solid red;*/
            }

            .my_profile img {
                width: 50px;
            }

            .my_profile h3 {
                font-size: 14px;
                color: black;
                font-weight: 600;
                margin: 0;
            }

            .card-description {
                font-size: 11px;
            }

            .outside-card {
                margin: 20px 35px 90px 35px;
                padding-bottom: 100px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .flex-nowrap{
                display: flex;
                flex-wrap: nowrap;
            }

            .content_divider {
                max-width: 100px;
            }

            .content_header {
                margin-bottom: unset;
            }

                .content_header p {
                    margin: 0;
                    font-size: 15px;
                    font-weight: 500;
                }

            .my_profile_section {
                display: flex;
                flex-direction: column;
                gap: 5px;
            }

            .divider {
                display: none;
            }
        }



        /* Mobile Responsiveness */
        @media (min-width: 480px) and (max-width: 768px) {

            .mobile-view {
                display: block;
            }

            .desktop-view {
                display: none;
            }

            .background-wrapper {
                background: none;
            }

            .journal_main {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                box-shadow: -5px 7.5px 10px #5f5959;
                border-radius: 12px;
                padding: 15px 15px 22.5px 15px;
                background: linear-gradient(transparent 50%, #CAE5FF 85%), url('../Reception Page/samanta-bg.png');
                background-size: contain;
                background-position: top;
                background-repeat: no-repeat;
            }


            .image_container {
                background: none;
                order: -1;
            }

            .content_container {
                order: 1;
                width: 100%;
            }

            .welcome-section {
                display: none;
            }

            .image_content {
                font-size: 20px;
                letter-spacing: 1px;
            }

            .image_wrapper {
                width: 77.5px;
                height: 77.5px;
                overflow: hidden;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #3333;
                border-radius: 12px;
            }

                .image_wrapper img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    border-radius: 0;
                }

            .my_profile {
                height: 65px;
                border-radius: 17.5px;
                background-color: white;
                box-shadow: 0px 5px 10px #393838;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                padding: 55px 20px 55px 30px;
                gap: 10px;
            }

            .card-container {
                margin: 20px 0 0 0;
                padding: 0;
                background: none;
                border: none;
                box-shadow: none;
            }

            .my_profile img {
                width: 60px;
            }

            .my_profile h3 {
                font-size: 20px;
                color: black;
                font-weight: 600;
                margin: 0;
            }

            .card-description {
                font-size: 16px;
            }

            .outside-card {
                margin: 20px 35px 120px 35px;
                padding-bottom: 100px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .content_header {
                margin-bottom: unset;
            }



                .content_header p {
                    font-size: 18px;
                    margin: 0;
                }

            .my_profile_section {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .divider {
                display: none;
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
    <%--<style>
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
    </style>--%>
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

        //function adjustFontSizes() {
        //    const elements = document.querySelectorAll('.desktop-card-text');
        //    let shouldShrink = false;

        //    elements.forEach(el => {
        //        const style = getComputedStyle(el);
        //        const lineHeight = parseFloat(style.lineHeight);
        //        const lines = Math.round(el.offsetHeight / lineHeight);
        //        if (lines >= 3) {
        //            shouldShrink = true;
        //        }
        //    });

        //    elements.forEach(el => {
        //        el.style.fontSize = shouldShrink ? '13px' : '20px';
        //    });
        //}

        //// Wait for full page load including fonts
        //window.addEventListener('load', () => {
        //    if (document.fonts) {
        //        document.fonts.ready.then(adjustFontSizes);
        //    } else {
        //        adjustFontSizes();
        //    }
        //});

        //window.addEventListener('resize', adjustFontSizes);


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

    <%-- <script>
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
 </script>--%>

    <%-- <style>
  

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


   </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard desktop-view">
        <div class="welcome-section">
            <p style="font-family: 'Montserrat'">Welcome back! Your <span>healthiest self</span> is just a click away. Let’s take that next step together!</p>
            <div class="welcome_divider"></div>
        </div>


        <div class="journal_container">
            <div class="journal">
                <div class="card-container">
                    <div class="background-wrapper-desktop"></div>
                    <div class="journal_main">

                        <div class="image_container">
                            <asp:Label runat="server" CssClass="user-info poppins-text" ID="usernamem" Style="margin-left: 89px;"></asp:Label>

                            <img src="../Reception Page/SamantaGIF.gif" alt="Personal Health Manager">
                            <div class="image_content">
                                <span style="font-family: 'Montserrat'">I Am Samantha, Your Personal
                                

                                Health Manager</span>
                            </div>
                        </div>

                        <div class="divider"></div>
                        <div class="content_container">
                            <div class="content_header">
                                <p style="font-family: 'Poppins';">Your <span>health records</span> are just a click away.</p>
                                <div class="content_divider"></div>
                            </div>


                            <a class="support-group" href="MyHFiles.aspx">
                                <div class="my_profile default_profile">
                                    <div class="row align-items-center">
                                        <div class="col-3 tab-icon-div image_wrapper">
                                            <img src="../Reception Page/h-files-icon.png" />
                                        </div>
                                        <div class="col-9 popup-trigger my_profile_content">
                                            <h3 style="font-family: 'Poppins';">My H-Files</h3>
                                            <span class="card-description desktop-card-text" style="font-family: 'Montserrat'">We’ve organized all your family’s health reports, right here for you.</span>
                                        </div>
                                    </div>
                                    <div class="card_icon">
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </div>
                                </div>
                            </a>


                            <a class="support-group" href="MedicalHistory.aspx">
                                <div class="my_profile">
                                    <div class="row align-items-center">
                                        <div class="col-3 tab-icon-div image_wrapper">
                                            <img src="../Reception Page/health-report-icon.png" />
                                        </div>
                                        <div class="col-9 my_profile_content">
                                            <h3 style="font-family: 'Poppins';">My Medical History</h3>
                                            <span class="card-description desktop-card-text" style="font-family: 'Montserrat'">Access your family’s complete medical history anytime.</span>
                                        </div>
                                    </div>
                                    <div class="card_icon">
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </div>
                                </div>

                            </a>


                            <a class="support-group" href="../Support Group (BG & Icons)/ComingSoon.png">
                                <div class="my_profile">
                                    <div class="row align-items-center">
                                        <div class="col-3 tab-icon-div image_wrapper">
                                            <img src="../Reception Page/journal.png" />
                                        </div>
                                        <div class="col-9 my_profile_content">
                                            <h3 style="font-family: 'Poppins';">Journal</h3>
                                            <span class="card-description desktop-card-text" style="font-family: 'Montserrat'">Stay informed with doctor-written health articles.</span>
                                        </div>
                                    </div>
                                    <div class="card_icon">
                                        <i class="fa-solid fa-chevron-right"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


    <div class="dashboard mobile-view">
        <div class="welcome-section">
            <p style="font-family: 'Montserrat'">Welcome back! Your <span>healthiest self</span> is just a click away. Let’s take that next step together!</p>
        </div>

        <div class="journal_container">

            <div class="card-container">
                <div class="journal_main">

                    <div class="background-wrapper">
                        <div class="image_container">
                            <asp:Label runat="server" ID="usernamemobile" Style="margin-left: 31px;"></asp:Label>
                            <img src="../Reception Page/SamantaGIF.gif" alt="Personal Health Manager">
                            <div class="image_content">
                                <span style="font-family: 'Montserrat'">I Am Samantha, Your Personal Health Manager</span>
                            </div>
                        </div>
                    </div>

                    <div class="divider"></div>
                    <div class="content_container">

                        <a class="support-group" href="MyHFiles.aspx">
                            <div class="my_profile default_profile">
                                <div class="row align-items-center flex-nowrap">
                                    <div class="col-3 tab-icon-div image_wrapper">
                                        <img src="../Reception Page/h-files-icon.png" />
                                    </div>
                                    <div class="col-9 popup-trigger my_profile_section">
                                        <h3 style="font-family: 'Poppins';">My H-Files</h3>
                                        <span class="card-description" style="font-family: 'Montserrat'">We’ve organized all your family’s health reports, right here for you.</span>
                                    </div>
                                </div>
                                <div class="card_icon">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="outside-card">
            <div class="content_header">
                <p style="font-family: 'Poppins';">Your <span>health records</span> are just a click away.</p>
                <div class="content_divider"></div>
            </div>
            <a class="support-group" href="MedicalHistory.aspx">
                <div class="my_profile">
                    <div class="row align-items-center flex-nowrap">
                        <div class="col-3 tab-icon-div image_wrapper">
                            <img src="../Reception Page/health-report-icon.png" />
                        </div>
                        <div class="col-9 my_profile_section">
                            <h3 style="font-family: 'Poppins';">My Medical History</h3>
                            <span class="card-description" style="font-family: 'Montserrat'">Access your family’s complete medical history anytime.</span>
                        </div>
                    </div>
                    <div class="card_icon">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </div>
            </a>

            <a class="support-group" href="../Support Group (BG & Icons)/ComingSoon.png">
                <div class="my_profile">
                    <div class="row align-items-center flex-nowrap">
                        <div class="col-3 tab-icon-div image_wrapper">
                            <img src="../Reception Page/journal.png" />
                        </div>
                        <div class="col-9 my_profile_section">
                            <h3 style="font-family: 'Poppins';">Journal</h3>
                            <span class="card-description" style="font-family: 'Montserrat'">Stay informed with doctor-written health articles.</span>
                        </div>
                    </div>
                    <div class="card_icon">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </div>
            </a>
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
