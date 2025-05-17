<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article.aspx.cs" Inherits="hfiles.article" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 200vh;
}
html, body {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
}

.reached-bottom footer section-footer {
    visibility: visible; /* Show footer when at the bottom */
}

/* Header */
.header {
    font-family: "Poppins";
    background-color: #0331B5;
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    height:86px;
}
    
/* Hamburger Button */
.hamburger {
    display: none;
    background: none;
    border: none;
    font-size: 30px;
    color: white;
    cursor: pointer;
    margin-top: -53px;
    text-align: right;
}

/* Navigation Menu */
.nav {
    display: flex;
    margin-right: 54px;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 47px;
    text-align: left;
    margin-left: 86px;
}

    .nav-links li {
        margin: 0;
    }

    .nav-links a {
        text-decoration: none;
        color: white;
        font-family: Poppins;
        font-size: 20px;
    }

/* Signup Button */
.signup {
    background-color: #FFD100;
    width: 89px;
    height: 30px;
    font-family: Montserrat;
    font-weight: 600;
    font-size: 18.5px;
    text-align: center;
    color: #0331B5 !important;
    padding: 10px;
    border-radius: 10px;
}
/* Ensure full-page layout */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
}

/* Wrapper to contain all content */
.wrapper {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Full viewport height */
}

/* Main content area grows to push the footer down */
.content {
    flex: 1;
}

/* Blue footer section */
.section-footer {
    background-color: blue;
    color: white;
    padding: 20px;
    text-align: center;
}

/* Yellow copyright footer */


/* Footer */
.footer {
/*margin-top: 1779px !important;
*/    padding: 29px 15px 22px 15px !important;
    position: sticky; /* Fixes the footer */
    bottom: 0; /* Positions it at the bottom */
    left: 0;
    width: 100%;
    background-color: #FFD100;
    color: #0331B5;
    text-align: center;
    padding: 10px;
    margin-top: auto;
    
}


body {
    min-height: 200vh; /* Ensure there's enough content to scroll */
}


/* Responsive Design for Mobile */
@media(max-width: 768px) {
    .header {
        flex-direction: column;
        text-align: center;
    }
        .header img {
            width: 92px;
            height: 64px;
            text-align: left;
            margin-left: -258px;
        }
    /* Show Hamburger Button */
    .hamburger {
        display: block;
        text-align: right;
        margin-left: 298px;
    
    }

    /* Initially Hide Menu */
    .nav {
        display: none;
        position: absolute;
        top: 60px;
        right: 0;
        background-color: white;
        color:black !important;
        width: 100%;
        height:100%;
        flex-direction: column;
        text-align: center;
        padding: 10px 0;
        z-index: 1000;
    }

        /* Show Menu When Active */
        .nav.active {
            display: flex;
            height: 784px;
            line-height: 34px;
            text-align: center;
            font-size: 30px;
            color: black !important;
        }

    .nav-links {
        color: black !important;
        flex-direction: column;
        gap: 10px;
        text-align: left;
        margin-left: 86px;
    }
   
}
.textsearch{
    margin-left: 1539px;
    margin-top: 21px;
    width: 277px;
    height: 41px;
    border-radius: 30px;
}
.searchicon
{
    position: absolute;
    transform: translateY(-48%);
    color: #aaa;
    margin-top: 41px;
    margin-left: -39px;
    background-color: #01154C;
    border-radius: 30px;
    height: 35px;
    width: 35px;
        line-height: 33px;
    padding: 3px 9px;
}

.main-content h2{
    text-align:center;
    font-family: Crimson Text;
font-weight: 700;
font-size: 50px;
line-height: 64.99px;
letter-spacing: 0%;
text-align: center;
text-decoration: underline;
text-decoration-style: solid;
text-decoration-offset: 20%;
text-decoration-thickness: Auto;
text-decoration-skip-ink: auto;
margin-bottom: 16px;
}
.main-content h5{
    text-align:center;
    font-family: Montserrat;
font-weight: 400;
font-size: 30px;
line-height: 36.57px;
letter-spacing: 0%;
text-align: center;

}
 .featured-article {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin: 40px auto;
            max-width: 800px;
        }

        .article-img img {
          
            border-radius: 10px;
            width: 534px;
            height: 534px;
            top: 417px;
            left: 110px;
            border-radius: 40px;
            box-shadow: -20px 20px 4px 0px #35393559;


        }

        .article-content {
            max-width: 400px;
        }

        .article-content h3 {
            width: 618px;
            height: 240px;
            top: 492px;
            left: 701px;
            font-family: Poppins;
            font-weight: 700;
            font-size: 58px;
            line-height: 80px;
            letter-spacing: 1%;
            
            color: #353935;
        }

        .article-content p {
            width: 366px;
            height: 33px;
            top: 750px;
            left: 701px;
            font-family: Poppins;
            font-weight: 500;
            font-size: 28px;
            line-height: 42px;
            letter-spacing: 0%;
            color: #0331B5;
        }

        .btn {
            background-color: black;
            color: white;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

            .badge {
                width: 160px;
                height:40px;
                top: 12px;
                left: 15px;
                font-family: Poppins;
                font-weight: 700;
                font-size: 24px;
                line-height: 36px;
                letter-spacing: 0%;
                text-align: center;
                background: #333333;
                color: white;
                border:2px solid black;
                border-radius: 20px;
                    padding: 11px;
            }
            .badge1 {
    width: 160px;
    height:40px;
    top: 12px;
    left: 15px;
    font-family: Poppins;
    font-weight: 700;
    font-size: 24px;
    line-height: 36px;
    letter-spacing: 0%;
    text-align: center;
    background: white;
    border-radius: 20px;
        padding: 11px;
}
            .badge2{
                width: 160px;
    height: 47px;
    top: 12px;
    left: 15px;
    font-family: Poppins;
    font-weight: 700;
    font-size: 24px;
    line-height: 36px;
    letter-spacing: 0%;
    text-align: center !important;
    border-radius: 20px;
    padding: 6px;
    color: black;
    margin-left: 1694px;
    margin-top: -25px !important;
    border: 2px solid black;
            }
        .name{
            width: 556px;
            height: 52px;
            top: 793px;
            left: 701px;
            font-family: Montserrat;
            font-weight: 300;
            font-size: 28px;
            line-height: 34.13px;
            letter-spacing: 0%;
            color:#333333 !important;

        }
        /* Footer Styles */
.section-footer {
     margin-top: auto ;
   /* position: sticky; */
    background: #0331B5; /* Blue Background */
    color: white;
    padding: 40px 20px;
    font-family: 'Montserrat', sans-serif;
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
    gap: 20px;
}

/* Left Section: Logo & Social Icons */
.footer-left {
    flex: 1;
    min-width: 280px;
    text-align: left;
}

.footer-logo {
    width: 180px;
    margin-bottom: 10px;
    margin-left: -22px;
}

.footer-left p {
    font-size: 18px;
    margin-bottom: 10px;
}

.footer-left h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

.social-icons {
    display: flex;
    gap: 10px;
}

    .social-icons a {
        background: white;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        text-decoration: none;
        color: #02378B;
        font-size: 20px;
    }

/* Middle Section: Links */
.footer-links {
    display: flex;
    /*flex: 2;*/
    justify-content: space-between;
    min-width: 320px;
}

    .footer-links h3 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .footer-links ul {
        list-style: none;
        padding: 0;
    }

        .footer-links ul li {
            margin-bottom: 8px;
        }

            .footer-links ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
            }

                .footer-links ul li a:hover {
                    text-decoration: underline;
                }

/* Right Section: Address */
.footer-address {
    flex: 1;
    min-width: 280px;
        text-align: left;
}

    .footer-address h3 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .footer-address p {
        font-size: 18px;
        margin-bottom: 10px;
    }

/* Bottom Section */
.footer-bottom {
    background: #FFC107; /* Yellow Background */
    text-align: center;
    padding: 10px 0;
    font-size: 16px;
    font-weight: bold;
    color: black;
    margin-top: 20px;
}

/* 🔥 Mobile Responsiveness */
@media (max-width: 1024px) {
    .footer-container {
        flex-direction: column;
        text-align: center;
    }

    .footer-left,
    .footer-links,
    .footer-address {
        text-align: center;
    }

    .social-icons {
        justify-content: center;
    }

    .footer-links {
        flex-direction: column;
        gap: 20px;
        align-items: center;
    }
}
.general h7{
    width: 534px;
height: 58px;
font-family: Montserrat;
font-weight: 500;
font-size: 33.5px;
line-height: 40.84px;
letter-spacing: 0%;
text-align: center;
text-decoration: underline;
text-decoration-style: solid;
text-decoration-offset: 54.5%;
text-decoration-thickness: 8%;
text-decoration-skip-ink: auto;
color:#393539;
margin-left: 469px;
}
.general h6{
    width: 346px;
height: 58px;
left: 580px;
font-family: Montserrat;
font-weight: 500;
font-size: 33.5px;
line-height: 40.84px;
letter-spacing: 0%;
text-align: center;
color:#393539;
margin-top: -43px;
    margin-left: 1039px;

}
    </style>
</head>
 
    <script type="text/javascript"> 

     
        $(document).ready(function () {
            if (localStorage.getItem("buttonsShown") === "true") {
                $("#btnsort").hide();
                $("#btnold, #btnnew").show();
            }
            $("#btnsort").click(function () {
                $(this).hide(); // Hide Sort button
                $("#btnold, #btnnew").show();
                localStorage.setItem("buttonsShown", "true");// Show Oldest First and Newest First buttons
            });
            if (localStorage.getItem("buttonsShown") === "true") {
                $("#btnold, #btnnew").hide();
                $("#btnsort").show();
            }
            $("#btnold,#btnnew").click(function () {
                $(this).hide(); // Hide Sort button
                $("#btnsort").show();
                localStorage.setItem("buttonsShown", "true");// Show Oldest First and Newest First buttons
            });
        });

        window.addEventListener("scroll", function () {
     let footer = document.querySelector("footer");
     let footer1 = document.querySelector("section-footer");
            if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
                footer.style.visibility = "visible";
                footer1.style.visibility = "visible";// Show when at the bottom
            } else {
                footer.style.visibility = "hidden";
                footer1.style.visibility = "hidden";// Hide when scrolling
            }
 });
        document.addEventListener("DOMContentLoaded", function () {
            const menuToggle = document.getElementById("menu-toggle");
            const navMenu = document.getElementById("nav-menu");
            const navLinks = document.querySelectorAll(".nav-links a");

            // Toggle the 'active' class when the hamburger button is clicked
            menuToggle.addEventListener("click", () => {
                navMenu.classList.toggle("active"); // Toggle visibility of the menu
            });

            // Close the menu when clicking outside the nav menu or hamburger button
            document.addEventListener("click", (event) => {
                if (!navMenu.contains(event.target) && !menuToggle.contains(event.target)) {
                    navMenu.classList.remove("active"); // Close menu when clicking outside
                }
            });

            // Close the menu when any nav link is clicked
            navLinks.forEach(link => {
                link.addEventListener("click", () => {
                    navMenu.classList.remove("active"); // Close menu on link click
                });
            });
        });
       
    </script>
<body>
    <form id="form1" runat="server">
        <div>
            <header class="header">
    <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" />
    <button class="hamburger" id="menu-toggle" type="button">☰</button>

    <nav id="nav-menu" class="nav" >
        <ul class="nav-links">
            <li><a href="#aboutussection">About us</a></li>
            <li><a href="#ABHA">Article</a></li>
            <li><a href="login.aspx" class="signup">Sign In</a></li>
        </ul>
    </nav>
</header>

        </div>

        <div class="Main">
      <div class="searchbox">
    <asp:TextBox ID="SearchInput" Class="textsearch"  AutoPostBack="true" runat="server" />
    <i class="fas fa-magnifying-glass searchicon"></i>
</div>
            <div class="main-content">
            <h2>Your Trusted Guide to a Healthier, Happier Life!</h2>
           
            <h5>“Expert-reviewed insights and practical tips to elevate your well-being with confidence”</h5>
            </div>

            <asp:Repeater ID="rptArticles" runat="server">
    <ItemTemplate>
        
    
             <div class="featured-article">
            <div class="article-img">
               <img src="<%#Eval("articleImage") %>"  alt="Article Image"/>
            </div>
            <div class="article-content">
                <span class="badge">Most Liked</span>
                <h3><%#Eval("Title") %></h3>
                <p>Reviewed by <b></b></p>
                <p class="name"><%#Eval("Author") %>, <%#Eval("AuthorDesignation") %></p>
               <a href="<%#Eval("ArticleContent") %>"  class="btn">Read More →</a>
            </div>
        </div>
            </ItemTemplate>
</asp:Repeater>

            <%--<div id="pdfModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.8);">
    <div style="width:80%; height:80%; margin:5% auto; background:#fff; padding:10px;">
        <button onclick="hideArticle()" style="float:right;">Close</button>
        <iframe id="pdfViewer" src="<%#Eval("ArticleContent") %>" width="100%" height="90%"></iframe>
    </div>
</div>--%>
            <div class="secondPara">
            <div class="general">
                <h7>General Health and Wellness</h7>
                <h6>The Healthy Platter</h6>
            </div>
            <hr />
            <div class="tab-buttons">
                  <button class="badge2" id="btnsort" style="text-align:right;">
                      <img src="journal-page-images/article/icon-sort.png" /> Sort</button>
                <%-- <span class="badge1" style="text-align:right">
                     <img src="journal-page-images/article/heart-icon.png" />Most Liked</span>OnClick="btnold_Click" OnClick="btnnew_Click"--%>
                 <button class="badge2" id="btnold" runat="server" onclick="btnold_Click" style="text-align:right; display:none">
                     <img src="journal-page-images/article/icon-down.png" />Oldest First</button>
                 <button class="badge2" id="btnnew" runat="server" onclick="btnnew_Click"  style="text-align:right;  display:none">
                     <img src="journal-page-images/article/icon-plus.png" />Newst First</button>
            </div>

                    <asp:Repeater ID="rptArticleSort" runat="server">
<ItemTemplate>
                 <div class="featured-article">
    <div class="article-img">
       <img src="<%#Eval("articleImage") %>"  alt="Article Image"/>
    </div>
    <div class="article-content">
        <%--<span class="badge">Most Liked</span>--%>
        <h3><%#Eval("Title") %></h3>
        <p>Reviewed by <b></b></p>
        <p class="name"><%#Eval("Author") %>, <%#Eval("AuthorDesignation") %></p>
       <a href="<%#Eval("ArticleContent") %>" class="btn">Read More →</a>
    </div>
</div>
                </ItemTemplate>
</asp:Repeater>
         <%--        <div class="featured-article1">
    <div class="article-img1">
       
        <img src="journal-page-images/article/fatperson.jpg" alt="Article Image"/>
    </div>
    <div class="article-content1">
        <span class="badge">Most Liked</span>
        <h3>Addressing Mental Health in Children and Adolescents</h3>
        <p>Reviewed by <b></b></p>
        <p class="name">Hena Kanakia, Nutritionist</p>
        <a href="#" class="btn">Read More →</a>
    </div>
</div>--%>
</div>

     
             <section class="section-footer">
    <div class="footer-container">
        <!-- Left Section: Logo & Join Us -->
        <div class="footer-left">
            <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" class="footer-logo">
            <p>Be a part of India's first social healthcare network</p>
            <h3>Join us</h3>
            <div class="social-icons">
                <a href="https://www.instagram.com" target="_blank" style="color:white;background: linear-gradient(315deg, #FBE18A 0.96%, #FCBB45 21.96%, #F75274 38.96%, #D53692 52.96%, #8F39CE 74.96%, #5B4FE9 100.96%);"><i class="fab fa-instagram"></i></a>
                <a href="https://twitter.com" target="_blank" style="color:white;background-color: #55acee;"><i class="fab fa-twitter"></i></a>
                <a href="https://www.linkedin.com" target="_blank" style="color:white;background-color: #0082ca;"><i class="fab fa-linkedin"></i></a>
                <a href="https://www.youtube.com" target="_blank" style="color:white;background-color: #ed302f;"><i class="fab fa-youtube"></i></a>
                <a href="https://www.facebook.com" target="_blank" style="color:white;background-color: #3b5998;"><i class="fab fa-facebook"></i></a>
            </div>
        </div>

        <!-- Middle Section: Links -->
        <div class="footer-links">
            <div>
                <h3><u>Let us help you</u></h3>
                <ul>
                    <li><a href="#" id="accountLink">Your Account</a></li>
                    <li><a href="/contact">Contact Us</a></li>
                    <li><a href="/faqs">FAQs</a></li>
                </ul>
            </div>
            <div>
                <h3><u>Our Policies</u></h3>
                <ul>
                    <li><a href="/terms-and-conditions">Terms & Conditions</a></li>
                    <li><a href="/privacy-policy">Privacy Policy</a></li>
                    <li><a href="/copyright">Copyright</a></li>
                </ul>
            </div>
        </div>

       

        <!-- Right Section: Address -->
        <div class="footer-address">
            <h3><u>Address</u></h3>
            <p><strong>Ahmedabad Branch:</strong><br>5-A, Ravi Pushp Apartment, Ahmedabad - 380052, Gujarat.</p>
            <p><strong>Mumbai Branch:</strong><br>13/4, Marine Lines, Mumbai - 400020, Maharashtra.</p>
        </div>
    </div>

   
</section>

            <div>
        <footer class="footer">
            <p><b style="font-size: 18px;">Copyright @2025 H.Files. All rights reserved by Health Files Medico Pvt. Ltd.</b></p>
        </footer>
    </div>
    </form>
</body>
</html>
