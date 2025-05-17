<%@ Page Language="C#"  AutoEventWireup="true" Async="true" CodeBehind="CreateAbhaCard.aspx.cs" Inherits="hfiles.CreateAbhaCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard Layout</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" defer></script>
<link rel="stylesheet" href="../css/main.css" />
     <link rel="apple-touch-icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link href="css/index4.css" rel="stylesheet" />

    <style>
        .header {
    font-family: "Poppins";
    background-color: #0331B5;
    color: white;
    padding: 5px 20px 5px 0px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    height: 80px;
}

    .header img {
        width: 9rem;
        height: max-content;
    }

.hamburger {
    background: none;
    border: none;
    font-size: 28px;
    color: white;
    cursor: pointer;
    text-align: right;
}

.nav {
    display: none;
}

.active {
    display: flex !important;
    position: absolute;
    overflow: hidden;
    top: 100%;
    left: 0;
    width: 100%;
    height: 75vh;
    background-color: white;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 0 0 10px 10px;
    padding: 10px 0;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    animation: slideFadeIn 0.4s ease-in-out;
}

@keyframes slideFadeIn {
    from {
        opacity: 0;
        transform: translateX(-100%); /* Start from the left */
    }

    to {
        opacity: 1;
        transform: translateX(0); /* Slide into position */
    }
}

.closing {
    display: flex;
    position: absolute;
    overflow: hidden;
    top: 100%;
    left: 0;
    width: 100%;
    height: 75vh;
    background-color: white;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 0 0 10px 10px;
    padding: 10px 0;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    animation: slideOut 0.4s ease-in-out forwards;
}

@keyframes slideOut {
    from {
        opacity: 1;
        transform: translateX(0);
    }

    to {
        opacity: 0;
        transform: translateX(-100%);
    }
}

.active .signup {
    display: flex;
    justify-content: center;
    background-color: #FFD100; /* Yellow color */
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: bold;
    color: #0331B5; /* Blue text */
    transition: all 0.3s ease;
}

.nav-links a {
    text-decoration: none;
    color: #0331B5;
    font-size: 18px;
    font-weight: bold;
    display: flex;
    justify-content: center;
    padding: 10px;
    transition: background 0.3s ease-in-out;
}

@media(min-width: 425px) {
    .signup {
        display: flex !important; /* Force visibility */
        background-color: #FFD100;
        width: 7rem;
        font-family: Montserrat;
        font-weight: 600;
        font-size: 17px;
        text-align: center;
        color: #0331B5 !important;
        padding: 10px;
        border-radius: 10px;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        cursor: pointer;
    }
}
/* Header */
@media(min-width:768px) {


    .header img {
        width: 12rem;
        margin-left: 1rem;
    }

    .hamburger {
        display: none;
    }

    /* Navigation Menu */
    .nav {
        display: flex !important;
        margin-right: 54px;
    }

    .nav-links {
        align-items: center;
        list-style: none;
        display: flex;
        gap: 47px;
        font-weight: 400;
        text-align: left;
        margin-left: 86px;
    }

        .nav-links li {
            margin: 0;
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            padding: 0px;
            font-weight: 400;
            width: 100%;
            font-family: Poppins;
            font-size: 18px;
        }

    /* Signup Button */
    .signup {
        background-color: #FFD100;
        width: 7rem;
        font-family: Montserrat;
        font-weight: 600;
        font-size: 17px;
        text-align: center;
        color: #0331B5 !important;
        padding: 10px;
        border-radius: 10px;
    }
}



.footer_section{
    margin-top: 5rem;
    background-color: #0331b5;
    color: #fff;
}

.main_footer{
    display:flex;
    flex-direction: column;
    text-align: center;
    padding-bottom: 2rem;
}

.logo_section{
    margin-top: 2rem;
}

.logo_section img {
    width: 11rem;
}

.logo_section p{
    margin-top: 3px;
}

.footer_icons{
    margin-top: 20px;
}

.footer_icons h3 {
    font-size: 20px;
    font-weight: 500;
    margin-bottom: 4px;
}

.footer_icons hr {
    border: none; 
    border-top: 2px solid white; 
}

.social-icons{
    display: flex;
    justify-content:center;
    gap: 10px;
    margin-top: 10px;
}

.social-icons a {
    background: white;
    display: flex;
    width: 45px;
    height: 45px;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    text-decoration: none;
    font-size: 27px !important;
}

.social-icons i {
    font-size: 25px;
}

.address_section hr {
    border: none;
    border-top: 2px solid white;
    margin: 2px 0;
}
.footer_links {
    margin-top: 3rem;
    display: flex;
    flex-direction: column;
    gap: 2.5rem;
}

.footer_links h3 u {
    text-decoration: none;
    font-weight: 600;
    font-size: 19px;
}

.footer_links a{
    text-decoration: none;
}

.footer_links p {
    font-family: Montserrat;
    color: #fff;
    margin-top: 5px;
    line-height: 21px;
}

.help_section {
    display: flex;
    flex-direction: column;
    gap: 11px;
}

.policies_section {
    display: flex;
    flex-direction: column;
    gap: 11px;
}

.addresses {
    display: flex;
    flex-direction: column;
    gap: 30px
}

.addresses h1 {
    font-size: 17px;
    font-weight: 500;
}

.first_address{
    margin-top: 1rem;
}

@media(min-width: 425px){

    .logo_section p{
        font-size: 18px
    }

    .footer_icons h3 {
        font-size: 21px;
    }

    .footer_links h3 u {
        font-size: 21px;
    }

    .footer_links p {
        font-size:17px;
    }

    .addresses h1 {
        font-size: 18px;
    }
}

@media(min-width: 768px){

    .footer_section {
        display: flex;
        justify-content: center;
    }

    .address_section hr{
        display:none;
    }
    .footer_icons hr{
        display:none;
    }
    .main_footer {
        flex-direction: row;
        text-align: left;
        width: 95%;
    }

    .logo_section{
        width: 19rem;
    }

    .logo_section img {
        margin-left: -21px;
        width: 10rem;
    }

    .logo_section p {
        font-size: 16px
    }

    .footer_icons h3 {
        font-size: 20px;
    }

    .social-icons{
        justify-content:left;
    }

    .social-icons a {
        background: white;
        display: flex;
        width: 38px;
        height: 38px;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        text-decoration: none;
        font-size: 20px;
    }

    .social-icons i {
        font-size: 21px;
    }

    .footer_links{
        width: 100%;
        flex-direction:row;
        justify-content: space-between;
        margin-left: 1rem;
    }

    .footer_links p{
        font-size:14px;
    }

    .footer_links h3 u {
        text-decoration: underline;
        font-size: 15px;
        text-underline-offset: 4px;
    }

    .help_section,.policies_section {
        min-width: fit-content;
    }

    .addresses h1 {
        font-size: 14px;
    }
}

@media(min-width: 890px) {
    .footer_links {
        width: 77%;
    }

    .footer_links h3 u {
        font-size: 17px;
    }
    .footer_links p{
        font-size:15px;
        line-height: 25px;
    }
    .addresses h1 {
        font-size: 16px;
    }
}

@media(min-width: 1024px) {
    .main_footer {
        justify-content: space-around;
    }
    .footer_links {
        width: 65%;
    }
    .logo_section img{
        width: 12rem;
        margin-left: -25px;
    }
    .logo_section p{
        font-size: 19px;
        margin-top: 19px;
    }
    .social-icons a {
        background: white;
        display: flex;
        width: 45px;
        height: 45px;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        text-decoration: none;
        font-size: 20px;
    }

    .social-icons i {
        font-size: 24px;
    }

    .footer_icons{
        margin-top: 40px;
    }

    .footer_links h3 u {
        font-size: 21px;
    }
    .footer_links p{
        font-size:16.5px;
    }
    .addresses h1 {
        font-size: 17px;
    }
}

@media(min-width: 1182px) {
    .social-icons a {
        background: white;
        display: flex;
        width: 50px;
        height: 50px;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        text-decoration: none;
        font-size: 20px;
    }

    .social-icons i {
        font-size: 28px;
    }
    .logo_section img {
        width: 13rem;
    }
    .logo_section p {
        margin-top: 22px;
    }
    .footer_links h3 u {
        font-size: 22px;
    }

    .footer_links p {
        font-size: 18.5px;
    }

    .addresses h1 {
        font-size: 19px;
    }
}

@media(min-width: 1325px) {
    .footer_links h3 u {
        font-size: 23.5px;
    }

    .footer_links p {
        font-size: 20.5px;
    }

    .addresses h1 {
        font-size: 20px;
    }
}


/*------------ footer line ------------*/

.footer {
    background-color: #ffd100;
    display: flex;
    justify-content: center;
    font-weight: 500;
    color: rgb(53, 57, 53);
    font-size: 17px;
    text-align: center;
    padding: 10px
}

.popup-overlay {
    display: none; /* Initially hidden */
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

    </style>
      <script>
      document.addEventListener("DOMContentLoaded", function () {
          const accountLink = document.getElementById("accountLink");
          const popup = document.getElementById("helpPopup");
          const closeBtn = document.querySelector(".close-btn");

          // Open popup when clicking "Your Account"
          accountLink.addEventListener("click", function (event) {
              event.preventDefault();
              popup.style.display = "flex";
          });

          // Close popup when clicking close button
          closeBtn.addEventListener("click", function () {
              popup.style.display = "none";
          });

          // Close popup when clicking outside of it
          window.addEventListener("click", function (event) {
              if (event.target === popup) {
                  popup.style.display = "none";
              }
          });
      });
      </script>

    </head>
<body>
     <form id="form1" runat="server">
        
            <div>
                <header class="header">
                    <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" />
                    <%--<button class="hamburger" id="menu-toggle" type="button">☰</button>--%>
                                    <button class="hamburger" id="menu-toggle" type="button">&#9776;</button>


                    <nav id="nav-menu" class="nav" >
                        <ul class="nav-links">
                            <li><a href="/index4.aspx#about_us_section" class="aboutus">About us</a></li>
                            <li><a href="https://articles.hfiles.in/">Article</a></li>
                            <li>
                                <a href="/login.aspx" >
                                  <div class="signup">
                                      <p>Sign In</p>
                                  </div>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </header>
            </div>

    <section class="p-5 lg:p-12  flex items-center justify-center">
        <div class="flex flex-col md:flex-row w-full max-w-7xl gap-4 px-4 md:px-6">
          
          <!-- Left: Image Section -->
          <div class="w-full md:w-[35%] flex items-center justify-center mt-20 md:mt-0">
            <div class="bg-white rounded-xl  overflow-hidden h-full max-h-[400px] max-w-[400px] w-full flex items-center justify-center">
              <img src="journal-page-images/article/abha_header_imag.png" alt="ABHA Card"
                class="object-contain h-full max-h-[500px] lg:p-1 w-auto py-12 md:py-18" />
            </div>
          </div>
      
          <!-- Right: Form Section -->
          <div class="w-full md:w-[65%]">
            <div class="w-full bg-white rounded-xl shadow-lg overflow-hidden border border-gray-200">
      
              <!-- Header -->
              <div class="bg-[#496BCA] poppins text-white text-center text-lg md:text-xl font-semibold py-3 tracking-wide">
                ABHA Card Registration
              </div>
      
              <!-- Form Body -->
              <div class="p-6 md:p-8 space-y-6">
      
                <!-- Aadhaar & OTP -->
                <div class="flex flex-col sm:flex-row gap-4">
                      <asp:TextBox ID="TxtAadhaar"  runat="server" placeholder="Enter Adhar Number"  class="flex-[7] border border-gray-400 px-4 py-2.5 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 shadow-sm" ></asp:TextBox>
         
                <asp:TextBox ID="TxtOtp" runat="server" placeholder="Enter OTP" class="flex-[3] border border-gray-400 px-4 py-2.5 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 shadow-sm"  ></asp:TextBox>
                  
                </div>
      
                <!-- Get OTP Button -->
              <%--  <button
                  class="w-full poppins  border border-gray-400 text-gray-800 font-bold bg-gray-200 py-2.5 rounded-md text-sm hover:bg-gray-200 transition">
                  Get OTP
                </button>--%>
                   <asp:Button ID="BtnGenerateOtp" runat="server" class="w-full poppins  border border-gray-400 text-gray-800 font-bold bg-gray-200 py-2.5 rounded-md text-sm hover:bg-gray-200 transition" Text ="Get OTP" OnClick="BtnGenerateOtp_Click" /><br/>
      
                <hr class="border-gray-300" />
      
                <!-- Mobile Number & Verify Button -->
                <div class="flex flex-col sm:flex-row gap-4">
                     <asp:TextBox ID="TxtMobile" class="flex-[7] border border-gray-400 px-4 py-2.5 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 shadow-sm" runat="server" placeholder="Enter Mobile Number" ></asp:TextBox>
                  
              <%--    <button
                    class="flex-[3] poppins bg-[#ACEDFF] text-[#353935] font-bold py-2.5 px-4 rounded-md text-sm hover:bg-blue-200 transition">
                    Verify OTP & Generate ABHA
                  </button>--%> 
                    <asp:Button ID="BtnVerifyOtp" class="flex-[3] poppins bg-[#ACEDFF] text-[#353935] font-bold py-2.5 px-4 rounded-md text-sm hover:bg-blue-200 transition" runat="server" Text="Verify OTP & Generate ABHA" OnClick="BtnVerifyOtp_Click"  />
                </div>
      
                <!-- Success Message -->
                <div class="flex justify-center">
                 <%-- <p class="text-[#238B02] poppins font-medium text-sm flex items-center gap-2 px-4 py-2 font-semibold rounded shadow-sm">--%>
                    <i class="fas fa-check-circle text-green-600 text-lg"></i>
                     <asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>
                  <%--</p>--%>
                </div>
      
              </div>
            </div>
          </div>
          
        </div>

        
      </section>
      
     <div id="abhaCard" style="display:none;border: 2px solid #007bff; padding: 15px; margin-top: 20px;text-align:left;">
     <h3>ABHA Card</h3>
     <p><strong>ABHA Number:</strong>
         <asp:Label ID="LblAbhaNumber" runat="server"></asp:Label></p>
     <p><strong>Name:</strong>
         <asp:Label ID="LblName" runat="server"></asp:Label></p>
     <p><strong>Gender:</strong>
         <asp:Label ID="LblGender" runat="server"></asp:Label></p>
     <p><strong>DOB:</strong>
         <asp:Label ID="LblDOB" runat="server"></asp:Label></p>
     <p><strong>Mobile:</strong>
         <asp:Label ID="LblMobile" runat="server"></asp:Label></p>
     <p><strong>Address:</strong>
         <asp:Label ID="LblAddress" runat="server"></asp:Label></p>
     <p><strong>Status:</strong>
         <asp:Label ID="LblStatus" runat="server"></asp:Label></p>
     <p><strong>Photo:</strong>
     <asp:Image ID="imgPhoto" runat="server" /></p>
 </div>

<section class="w-full bg-white border-b border-gray-300">
    <div class="max-w-7xl mx-auto px-4 py-6 flex flex-col pl-5 lg:pl-20 pr-7  md:flex-row items-center justify-between gap-4">
      
      <!-- Left Text -->
      <p class=" sm:text-lg text-[#353935] text-base lg:text-xl text-center md:text-left font-bold" >
        Stay ready with your digital health ID - one click to access your healthcare journey.
      </p>
      <asp:Button ID="btndownload" class="bg-yellow-200 w-52 poppins text-[#333333] font-semibold px-6 py-3 rounded-lg shadow-sm hover:bg-[#ffd100] transition text-center" OnClick="BtnDownloadCard_Click" runat="server" Text="Download ABHA Card"   />
      <!-- Right Button -->
    
    </div>
  </section>
  

<!-- ABHA Card Section -->
<section class="w-full border-t border-black bg-white py-8">
    <div class="max-w-7xl pl-5 lg:pl-20 mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-8">
      
      <!-- Left Text -->
      <div class="md:w-1/2">
        <h2 class="text-2xl poppins font-bold text-[#0331b5] mb-4">What is ABHA Card?</h2>
        <p class="text-xl leading-8 mb-4">
          The Ayushman Bharat Health Account (ABHA) Card is a part of India’s Ayushman Bharat Digital Mission (ABDM). It serves as a digital health identity that enables individuals to securely store, manage, and share their medical records with healthcare providers.
        </p>
        <p class="text-xl leading-8">
          With an ABHA Card, you can access your health records anytime, anywhere and share them with doctors, hospitals, and labs with your consent—ensuring seamless and efficient healthcare services.
        </p>
      </div>
  
      <!-- Right Card Image -->
      <div class="md:w-1/2 flex justify-center">
        <img src="journal-page-images/article/Group 28.png" alt="ABHA Card" class="max-w-full rounded-md shadow-sm" />
      </div>
  
    </div>
  </section>
  
  <!-- ABHA Number Section -->
  <section class="w-full border-t border-black bg-white py-8">
    <div class="max-w-7xl pl-5 lg:pl-20 mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-8">
      
      <!-- Left Card Image -->
      <div class="md:w-1/2 flex justify-center">
        <img src="journal-page-images/article/Group 18.png" alt="ABHA Card" class="max-w-full rounded-md shadow-sm" />
      </div>
      
      <!-- Right Text -->
      <div class="md:w-1/2">
        <h2 class="text-2xl poppins font-bold text-[#0331b5] mb-4">What is an ABHA Number?</h2>
        <p class="text-xl leading-8 mb-4">
          An ABHA Number is a 14-digit unique health ID assigned to every individual under the Ayushman Bharat Digital Mission. It acts as a personal health identity that links all your medical records and ensures a paperless, hassle-free healthcare experience.
        </p>
        <p class="text-xl leading-8">
          With this number, you can securely share your health records with hospitals, clinics, and labs, eliminating the need to carry physical documents.
        </p>
      </div>
  
    </div>
  </section>
  
<!-- Benefits of ABHA Card Section -->
<section class="w-full bg-white py-12">
    <div class="max-w-7xl pl-5 lg:pl-20 pr-4 mx-auto text-center">
  
      <!-- Section Title -->
      <h2 class="text-3xl poppins font-bold text-[#0331b5] mb-2">Benefits of ABHA Card</h2>
      <div class="mx-auto w-1/5 border-b-4 border-blue-700 mb-12"></div>
  
      <!-- Benefit List (Vertical Flex) -->
      <div class="flex flex-col items-start gap-8 text-left">
  
        <!-- Benefit 1 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Unique & Trustable Identity:</span> Establish your presence in India's digital healthcare system.
          </p>
        </div>
  
        <!-- Benefit 2 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Seamless Access to Medical Records:</span> Store and manage all your health records digitally in one place.
          </p>
        </div>
  
        <!-- Benefit 3 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Consent-Based Sharing:</span> Securely share your health data with hospitals, labs, and doctors with your permission.
          </p>
        </div>
  
      </div>
    </div>
  </section>


  <section class="bg-gradient pt-6 w-full">
    <div class="max-w-7xl px-4 mx-auto text-center">
  
      <!-- Headline -->
      <h2 class="text-[17px] text-[#35395] poppins md:text-2xl lg:text-3xl font-semibold text-black mb-2">
        Your guide to ABHA: Everything you need to know
      </h2>
  
      <!-- Underline -->
      <div class="mx-auto w-2/3 xl:w-[45rem] border-[2px] border-[#333333] mb-8"></div>
  
      <!-- Read More Link -->
      <div class="text-right max-w-[85%] mx-auto">
        <a href="#" class="poppins text-[#0331b5] text-lg hover:underline hover:text-blue-900 transition">
          Read More →
        </a>
      </div>
  
    </div>
  </section>
  
  
  
  <section class="w-full bg-white py-12">
    <div class="max-w-7xl pl-5 lg:pl-20 pr-4 mx-auto text-center">
  
      <!-- Section Title -->
   
      <!-- Benefit List (Vertical Flex) -->
      <div class="flex flex-col items-start gap-8 text-left">
  
        <!-- Benefit 4 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Hassle-Free Healthcare Experience:</span> Avoid long queues and paperwork during hospital visits.
          </p>
        </div>
  
        <!-- Benefit 5 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Linked to Public Health Benefits:</span> Connect with government health programs and insurance schemes.
          </p>
        </div>
  
        <!-- Benefit 6 -->
        <div class="flex items-start gap-5">
            <i class="fas fa-check-circle text-[#0331b5] text-2xl mt-[7px]"></i>
          <p class="text-[18px] md:text-[21px] leading-relaxed">
            <span class="font-semibold">Data Privacy & Security:</span> Your health data is encrypted and shared only with your consent.
          </p>
        </div>
  
      </div>
    </div>
  </section>

  
  <!-- Blue border -->
  <!-- <div class="w-full h-7 bg-primary-color my-20"></div> -->


         </form>


                <%-------------------- footer --------------------%>
                <div id="helpPopup" class="popup-overlay">
    <div class="popup-content">
        <span class="close-btn">&times;</span>
        <h2 style="font-weight: 700;">Do you want any help with Your Account?</h2>
        <p>Contact us at <a href="mailto:contact@hfiles.in">contact@hfiles.com</a></p>
       
    </div>
</div>
             <section class="footer_section">
                <div class="main_footer">

                    <div class="logo_section">
                        <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" class="footer-logo" />
                        <p>Be a part of India's first social healthcare network</p>
                        
                        <div class="footer_icons">
                            <h3>Join us</h3>
                            <hr />
                            <div class="social-icons">
                              <a href="https://www.instagram.com/hfiles.in/" target="_blank" style="color:white;background: linear-gradient(315deg, #FBE18A 0.96%, #FCBB45 21.96%, #F75274 38.96%, #D53692 52.96%, #8F39CE 74.96%, #5B4FE9 100.96%);"><i class="fab fa-instagram"></i></a>
                                <a href="https://x.com/health_files" target="_blank" style="color:white;background-color: #1D9BF0;"><i class="fab fa-twitter"></i></a>
                                <a href="https://www.linkedin.com/company/health-files/" target="_blank" style="color:white;background-color: #0A66C2;"><i class="fab fa-linkedin"></i></a>
                                <a href="https://www.youtube.com/@healthfiles" target="_blank" style="color:white;background-color: #ff0000;"><i class="fab fa-youtube"></i></a>
                                <a href="https://www.facebook.com/profile.php?id=61563889084881" target="_blank" style="color:white;background-color: #1877F2;"><i class="fab fa-facebook"></i></a>
                            </div>
                        </div>

                    </div>

                    <div class="footer_links">
                        <div class="help_section">

                            <div class="help_header">
                                <h3><u>Let us help you</u></h3>
                             </div>
                                <a href="#" id="accountLink"><p>Your Account</p></a>
                                <a href="index.aspx#talkus"><p>Contact Us</p></a>
                                <a href="FAQ.aspx"><p>FAQs</p></a>
                           
                        </div>

                        <div class="policies_section">
                            <div class="policies_header">
                                <h3><u>Our Policies</u></h3>
                             </div>
                                <a href="Terms&Conditions.aspx"><p>Terms & Conditions</p></a>
                                <a href="privacypolicy.aspx"><p>Privacy Policy</p></a>
                               
                            
                        </div>

                        <div class="address_section">
                            <div class="address_header">
                                <h3><u>Address</u></h3>
                             </div>
                            <hr />
                            <div class="addresses">
                                <div class="first_address">
                                    <h1>Ahmedabad branch</h1>
                                    <p>5-A, Ravi Pushp Apartment,<br /> Ahmedabad - 380052, Gujarat</p>
                                </div>

                                <div class="sec_address">
                                    <h1>Mumbai branch</h1>
                                    <p>13/4, Marine Lines, Mumbai -<br /> 400020, Maharashtra</p>
                                </div>
                            </div>
                            
                        </div>

                    </div>

                </div>         
             </section>

         <div class="footer">
             <p>Copyright @2025 H.Files. All rights reserved by Health Files Medico Pvt. Ltd.</p>
         </div>

  <%--  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>--%>

</body>
</html>
