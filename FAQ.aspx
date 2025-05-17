<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="hfiles.FAQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
       <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png" sizes="32x32" />
   <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png" sizes="192x192" />
   <link rel="apple-touch-icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

     <link rel="preconnect" href="https://fonts.googleapis.com"/>
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
 <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet"/>
    
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <meta name="msapplication-TileImage" content="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png" />
    <title>FAQ's</title>
    <link rel="stylesheet" href="../style.css" />
  
    <style>
        @media (min-height: 598px) and (max-height: 600px) {
            .back-arrow-btn {
                top: 13% !important;
            }
        }
        /* Add styles for better mobile responsiveness */
        .container {
            padding: 20px;
        }
        .heading {
            font-size: 1.8rem;
        }
        .accordion-button {
            font-size: 1.2rem;
        }
        .accordion-body {
            font-size: 1rem;
        }
        @media (max-width: 576px) {
            .heading {
                font-size: 1.5rem;
                margin:0 0 0 0 !important;
            }
            .accordion-button {
                font-size: 1rem;
            }
            .accordion-body {
                font-size: 0.9rem;
            }
            .blue-trangle-top-right{
                visibility:hidden !important;
            }
        }
 @media (max-width: 480px) {
    .back-arrow-btn {
       
        padding: 22px 10px;
       
    }
}
    </style>
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
     p { 
    margin-top: 0;
    margin-bottom: 0rem !important;
}
     .nav {
        display: none;
        margin-bottom: -19px !important;
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
    font-size: 20px;
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
     <header class="header">
     <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" />
     <%--<button class="hamburger" id="menu-toggle" type="button">☰</button>--%>
                     <button class="hamburger" id="menu-toggle" type="button">&#9776;</button>


     <nav id="nav-menu" class="nav" >
         <ul class="nav-links">
             <li><a href="index.aspx#about_us_section" class="aboutus">About us</a></li>
             <li><a href="https://articles.hfiles.in/">Article</a></li>
             <li>
                 <a href="/signup.aspx" >
                   <div class="signup">
                       <p>Sign up</p>
                   </div>
                 </a>
             </li>
         </ul>
     </nav>
 </header>
    <form id="form1" runat="server">
        <div class="container my-5 py-5 common-design">
            <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
            <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">
            <img class="plus-top-left" src="../assets/plus-1.png" alt="">
            <a class="back-arrow-btn" href="index.aspx">
                Back</a>
            <div class="col-lg-12 row justify-content-center mt-5 pt-5 w-100">
                <h2 class="heading text-center mt-1 pt-1">Frequently Asked Questions</h2>
                <div class="col-12 col-md-8 w-100 justify-content-center">
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    How many members can I add?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>You can add only 5 members for free; to add more, you'll need to upgrade your plan..</strong>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    How many documents can I upload?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>A total of 100 MB disk space is allocated for an individual with free account.</strong>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    What type of documents can I upload?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Any relevant medical history documentation, including X-rays, sonograms, and prescriptions, can be submitted.</strong>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    Can I add pets as a member in my profile?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Absolutely, we care for pets too.</strong>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    How can I edit my personal info?
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Email us at <a href="mailto:contact@hfiles.in">contact@hfiles.in</a></strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>



            <%-------------------- footer --------------------%>
                <div id="helpPopup" class="popup-overlay">
    <div class="popup-content">
        <span class="close-btn">&times;</span>
        <h2>Do you want any help with Your Account?</h2>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
