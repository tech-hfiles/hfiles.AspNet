<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index3.aspx.cs" Inherits="hfiles.index3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <link href="css/index3.css" rel="stylesheet" />
    <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png" sizes="32x32" />
    <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png" sizes="192x192" />
    <link rel="apple-touch-icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-TileImage" content="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  

    <script type="text/javascript">
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

        window.onload = function () {
            setTimeout(function () {
                document.getElementById("phone-info").style.display = "block";
            }, 500);

            setTimeout(function () {
                document.getElementById("email-info").style.display = "block";
            }, 1500);

            setTimeout(function () {
                document.getElementById("whatsapp-info").style.display = "block";
            }, 2500);
        };
        document.addEventListener("DOMContentLoaded", function () {
            const container = document.querySelector(".review-container");
            const prevBtn = document.getElementById("prevBtn");
            const nextBtn = document.getElementById("nextBtn");

            const cardWidth = 320; // 300px width + 20px gap

            nextBtn.addEventListener("click", (e) => {
                e.preventDefault();
                container.scrollBy({ left: cardWidth, behavior: "smooth" });
            });

            prevBtn.addEventListener("click", (e) => {
                e.preventDefault();
                container.scrollBy({ left: -cardWidth, behavior: "smooth" });
            });
        });
        $(document).ready(function () {
            const track = document.querySelector('.article-track');

            const articleCards = document.querySelectorAll('.article-card');
            var article = track.innerHTML;
            setTimeout(() => {
                track.innerHTML += article;
            }, 1000);

            let animationPaused = false;
        });
        window.addEventListener("scroll", function () {
            let footer = document.querySelector("footer");
            if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
                footer.style.visibility = "visible"; // Show when at the bottom
            } else {
                footer.style.visibility = "hidden"; // Hide when scrolling
            }
        });
       
        document.addEventListener("DOMContentLoaded", function () {
            // Get the video element after the DOM has loaded
            var video = document.getElementById("myVideo1");

            if (video) {
                // Mute the video to allow autoplay
                video.muted = true;

                // Function to play the video
                function playVideo() {
                    if (video.paused) {
                        video.play();
                    }
                }

                // Function to pause the video
                function pauseVideo() {
                    if (!video.paused) {
                        video.pause();
                    }
                }

                // Automatically play the video when the page is visible
                document.addEventListener('visibilitychange', function () {
                    if (document.visibilityState === 'visible') {
                        playVideo();  // Play the video when the page is active
                    } else {
                        pauseVideo(); // Pause the video when the page is hidden
                    }
                });

                // You can also trigger the play/pause when the video comes into the viewport
                // Using Intersection Observer (optional)
                let videoObserver = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            playVideo(); // Play video when it comes into the viewport
                        } else {
                            pauseVideo(); // Pause video when it leaves the viewport
                        }
                    });
                }, { threshold: 0.5 });

                videoObserver.observe(video);
            } else {
                console.error("Video element with id 'myVideo1' not found.");
            }
        });
        
            document.addEventListener("DOMContentLoaded", function () {
          // Get the video element after the DOM has loaded
          var video = document.getElementById("myVideo");

            if (video) {
                // Mute the video to allow autoplay
                video.muted = true;

            // Function to play the video
            function playVideo() {
                  if (video.paused) {
                video.play();
                  }
              }

            // Function to pause the video
            function pauseVideo() {
                  if (!video.paused) {
                video.pause();
                  }
              }

            // Automatically play the video when the page is visible
            document.addEventListener('visibilitychange', function () {
                  if (document.visibilityState === 'visible') {
                playVideo();  // Play the video when the page is active
                  } else {
                pauseVideo(); // Pause the video when the page is hidden
                  }
              });

              // You can also trigger the play/pause when the video comes into the viewport
              // Using Intersection Observer (optional)
              let videoObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        playVideo(); // Play video when it comes into the viewport
                    } else {
                        pauseVideo(); // Pause video when it leaves the viewport
                    }
                });
              }, {threshold: 0.5 });

            videoObserver.observe(video);
          } else {
                console.error("Video element with id 'myVideo' not found.");
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

</head>

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
                        <li><a href="/signup.aspx" class="signup">Sign up</a></li>
                    </ul>
                </nav>
            </header>
        </div>
    
                <section class="healthcare-section">
    
        <!-- Left Section -->
        <div class="text-content" style="background-image:url('https://hfiles.in/wp-content/uploads/2023/03/hero-bh-pattern2.jpg')">

            <p class="small-text">Create your social health care network</p>
            <h1 class="main-heading">Get Smart With Your Health</h1>
            <p class="sub-text">Join India’s Pioneering Social Healthcare Network</p>
            <a href="/login.aspx" class="cta-button">Create your health file</a>
            <div class="badges">
                <img src="/journal-page-images/article/SecureStorageAssured.jpeg" alt="Secure Storage Assured" class="badge"/>
                <img src="/journal-page-images/article/AyushmanBharat.jpeg" alt="Ayushman Bharat" class="badge"/>
            </div>
        </div>

        <!-- Right Section (Images & Icons) -->
        <div class="image-content">
            <div class="image-circle family">
              <img loading="lazy" decoding="async"  src="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png" class="elementor-animation-grow attachment-full size-full wp-image-992" alt="" srcset="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png 1318w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-300x248.png 300w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-1024x846.png 1024w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-768x635.png 768w" sizes="(max-width: 1318px) 100vw, 1318px" />
                           
        </div>
</div>
</section>

        <section class="whyuse-section">
    <div class="whyuse-header">
        <h2>Why use Health Files?</h2>
        <p>One secure health file profile can replace all physical copies of your medical history. Update your bond with health by signing up with us today!</p>
    </div>

    <div class="whyuse-container">
        <!-- Left Features -->
        <div class="whyuse-features">
            <div class="feature-card">
                <img src="/journal-page-images/article/secure-storage.png" alt="Secure Storage">
                <h3>Secure Document Storage</h3>
                <p>Your data is secured and safely stored on a cloud storage</p>
            </div>
            <div class="feature-card">
                <img src="/journal-page-images/article/easy-access.png" alt="Easy Access">
                <h3>Easy Access and Sharing</h3>
                <p>View, download, or share your medical files anytime and anywhere</p>
            </div>
            <div class="feature-card">
                <img src="/journal-page-images/article/time-saving.png" alt="Time-Saving">
                <h3>Time-Saving Digital Solution</h3>
                <p>Access your records instantly, saving time and avoiding the hassle of sifting through documents</p>
            </div>
        </div>

        <!-- Mobile Mockup -->
        <div class="whyuse-mockup">
            <img src="journal-page-images/article/pixelcut-export.png" />
  
        </div>

        <!-- Right Features -->
        <div class="whyuse-features">
            <div class="feature-card">
                <img src="/journal-page-images/article/family-health.png" alt="Family Management">
                <h3>Family Health Management</h3>
                <p>Effortlessly manage and access medical records for the whole family</p>
            </div>
            <div class="feature-card">
                <img src="/journal-page-images/article/track-history.png" alt="Track History">
                <h3>Track Medical History Easily</h3>
                <p>Keep a comprehensive history of diagnoses, treatments, and prescriptions</p>
            </div>
            <div class="feature-card upcoming">
                <img src="/journal-page-images/article/abha-id.png" alt="ABHA ID">
                <h3>Create ABHA ID and Analyze your Health Records</h3>
                <p>COMING SOON!</p>
            </div>
        </div>
    </div>
</section>

        
        <%-- how does health file work--%>
     <%--       <header>
     <img src="/journal-page-images/article/howhealthpic.png" class="videopbadge"/>

</header>--%>
       <section class="health-files-section">
  
        
       
           
        <!-- Right Column: Steps Content -->
        <div class="section-header">
             <h2 class="section-title">How does Health Files Work?</h2>
             <p class="section-subtitle">
             Sign up easily in just a few steps to securely manage your health records 
             and take control of your healthcare journey with confidence.
            </p>
        </div>
        <!-- Left Column: Video Placeholder -->
        <div class="content">
            <div class="video-container">
                <div class="videodesktop">
                 <video id="myVideo" controls>
                     <source src="/journal-page-images/article/Welcome to Health Files.mp4" type="video/mp4">
                     Your browser does not support the video tag.
                 </video>
                    </div>
                                                                <div class="videomobile">
<!-- Video Embed -->
                                        <video id="myVideo1" controls >
                                         <source src="/journal-page-images/article/phoneview.mp4" type="video/mp4">
                                             Your browser does not support the video tag.
                           
                                            </video>
                                        </div>
            <div class="stepss">

            <div class="step">
                <h3 class="step-title">Step 1</h3>
                <p class="step-description">Sign up and create a profile for you. Add your family members.</p>
            </div>

            <div class="step">
                <h3 class="step-title">Step 2</h3>
                <p class="step-description">Securely upload medical records and organize them for easy access.</p>
            </div>
               
            <div class="step">
                <h3 class="step-title">Step 3</h3>
                <p class="step-description">Grant your family access to records anytime and seamlessly 
                share them with your healthcare providers.</p>
            </div>
              </div>   </div>
                                                
                                </div>
    <%-- <footer1>
      <img src="/journal-page-images/article/howhealthpic2.png"  class="videobadge"/>
      
    </footer1>    --%>
           
            
</section>

   <section class="abha-section">
    <div class="container">
        <div class="abha-content">
            <h2>Create Your ABHA Health ID Card Today</h2>
            <hr class="separator">
            <p>
                Join India’s digital health revolution by making your ABHA 
                (Ayushman Bharat Health Account) Health ID card!
            </p>
            <ul class="abha-benefits">
                <li><i class="fas fa-check-circle"></i> Establish a unique identity with healthcare providers</li>
                <li><i class="fas fa-check-circle"></i> Link all healthcare benefits to your unique ABHA number</li>
                <li><i class="fas fa-check-circle"></i> Avoid registration queues in healthcare facilities across the country</li>
            </ul>
        </div>

        <div class="abha-image-container">
            <img src="https://hfiles.in/wp-content/uploads/2022/12/user-profile-screen.png" 
                 alt="ABHA Health ID" class="abha-card-image">
        </div>
    </div>
</section>

    <section class="abha-id-section">
   <%-- <div class="container">--%>
        <!-- Left Image Container -->
        <div class="abha-image-container">
            <!-- Floating Cards -->
            <div class="floating-card signup-card">
                <img src="/journal-page-images/article/signupabhaid.png" class="signup-icon">
            </div>
           
      
<%--  </div>--%>
        <!-- Right Content -->
        <div class="abha-content-Id">
            <h2>Create your ABHA ID</h2>
            <p>The Indian healthcare system is going digital.</p>
            <p class="abhap">Join us in our mission by signing up with Health Files and creating your ABHA ID today!</p>
            <button class="abha-button" >Create your ABHA ID</button>
             <div class="ayushman-badge">
             <img src="/journal-page-images/article/ayushman.png" class="ayushman-icon">
             </div>
        </div>
    </div>
</section>
                <section class="personalizedSection" style="background-color:none !important;" >
    <div>
        <div  data-element_type="column" >
            <div>
                <section>
                    <div >

                        <!-- TEXT COLUMN (Now on the Left) -->
                        <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-403aef59" data-id="403aef59" data-element_type="column">
                            <div class="elementor-widget-wrap elementor-element-populated">
                                <div class="elementor-element elementor-element-223afac elementor-invisible elementor-widget elementor-widget-heading" data-id="223afac" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="heading.default">
                                    <div class="personalizedcontact" >
                                        <h2 class="personalized">Personalized Health</h2>
                                        <h2 class="personalizedsolut">Solutions</h2>
                                        <h4 class="enterprose">Enterprise and Organizations</h4>
                                        <p class="tailored">Tailored solutions designed to meet your organization's needs and goals.</p>
                                        <img src="/journal-page-images/article/personalized.png" />
                                         <a class="personalizedcontact" href="#talkus">
                                             Contact Us</a>

                                    </div>
                                </div>
                             
                            </div>
                        </div>

                        

                   


                    </div>
                </section>
            </div>
        </div>
    </div>
</section>

          <section id="aboutussection" class="about-section">
    
        <div class="about-content">
            <div class="about-image">
                <img src="https://hfiles.in/wp-content/uploads/2023/03/about.svg" alt="about" />
            </div>
            <div class="about-text">
                <h2>About Us</h2>
                <hr class="separator1"/>
                <p>Welcome to Hfiles, where we aim to simplify and manage the healthcare system for your entire family, from birth to adulthood. We believe that organization is the key to leading a successful life, and our mission is to help you organize your medical life into one neat file.
                We understand that visiting a doctor can be a stressful experience, and it can be even more challenging to keep track of past prescriptions, medical records, and medications. With Hfiles, you no longer have to worry about these issues as we help manage this stress by maintaining all of your prescriptions, medical records, and history in one place.
                Our system is designed to facilitate easy transfer and access to medical files, so you can be confident that your family’s health information is always up-to-date and readily available to you and your healthcare providers. We prioritize the security and privacy of your sensitive medical information, and use the latest technology to ensure that your data is safe and protected at all times.</p>
            </div>
             <div class="mission">
     <h2>Mission</h2>
      <hr class="separator2"/>
     <p>To streamline the process of managing medical records from birth to old age, ensuring that your family’s health information is organized, easily accessible, and can be shared effortlessly when you need it the most.</p>
     <p>With our support, you can focus on what matters most – taking care of your family’s health – while we take care of the rest.</p>
 </div>
             <div class="vision">
     <h2>Vision</h2>
      <hr class="separator3"/>
     <p>To create a social healthcare network that connects families and healthcare professionals seamlessly. To build a global health community where individuals can share experiences and empower each other to lead healthier lives.</p>
 </div>
        </div>
        </section>
       

                       <section class="recognized-section">
    <div class="recognized">
        <div class="image-wrapper1">
            <h3>Recognized Under</h3>
            <img src="/journal-page-images/article/Recognized.jpeg" alt="Image 1">
        </div>

        <div class="image-wrapper2">
            <h3>Active Integrator</h3>
            <div class="image-flex">
                <img src="/journal-page-images/article/Active.jpeg" alt="Image 3">
                <img src="/journal-page-images/article/Active2.jpeg" alt="Image 4">
            </div>
        </div>
    </div>
</section>

     
        <section style="text-align: center; padding: 40px; background-color: white; position: relative;">
        <!-- Heading -->
        <h2 style="color: black; font-size: 36px; margin-bottom: 40px; text-align:left;"><u>Discover the Voices Behind Our Success</u></h2>

        <!-- Arrows for Navigation -->
        <%--  <button id="prevBtn" class="arrow-btn left-arrow"><</button>--%>
        <a id="prevBtn" class="arrow-btn left-arrow" href="#">&#60;</a>
        <!-- Cards Section -->
        <div class="review-container">

            <!-- Card 1 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text">We found Health Files to be such a unique and a great platform...</p>
                <p class="review-text">We found Health Files to be such a unique and a great platform We found Health Files to be such a unique and a great platform We found Health Files to be such a unique and a great platform...</p>
                <br />
                <a style="color:white">Read More</a>
                <br />

                <h5 style="color: white">-Akshay Tandon</h5>
                <p style="color: yellow">Newcastle, UK</p>
            </div>

            <!-- Card 2 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text">The best health record system I have ever used...</p>
                <p class="full-review">The best health record system I have ever used The best health record system I have ever used The best health record system I have ever used...</p> 
                <br />
                <a style="color:white">Read More</a>
                <br />
                <h5 style="color: white">-Sarah Johnson</h5>
                <p style="color: yellow">London, UK</p>
            </div>

            <!-- Card 3 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text">The most reliable and secure platform...</p>
                <p class="full-review">The most reliable and secure platform. The most reliable and secure platform The most reliable and secure platform..</p>
                <br />

                <a style="color:white">Read More</a>
                <br />
                <h5 style="color: white">-Amit Patel</h5>
                <p style="color: yellow">Delhi</p>
            </div>

            <!-- Card 4 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text">The most reliable and secure platform...</p>
                <p class="full-review">The most reliable and secure platform The most reliable and secure platform The most reliable and secure platform...</p>
                <br />

                <a style="color:white">Read More</a>
                <br />
                <h5 style="color: white">-Amit Patel</h5>
                <p style="color: yellow">Mumbai</p>
            </div>

            <!-- Card 5 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text">The most reliable and secure platform...</p>
                <p class="full-review">The most reliable and secure platform The most reliable and secure platform The most reliable and secure platform...</p>
                <br />

               <a style="color:white">Read More</a>
                <br />
                <h5 style="color: white">-Amit Patel</h5>
                <n>
                    <p style="color: yellow">Mumbai</p>
                </n>
            </div>

            <div class="review-card" style="text-align: left;">
                <p class="review-text">The most reliable and secure platform...</p>
                <p class="full-review">The most reliable and secure platform The most reliable and secure platform The most reliable and secure platform...</p>
                <a style="color:white">Read More</a>
                <h5 style="color: white">-Amit Patel</h5>
                <p style="color: yellow">Mumbai</p>
            </div>

            <!-- Card 5 -->
            <div class="review-card" style="text-align: left;">
                <p class="review-text" style="margin: 0; padding: 0;">The most reliable and secure platform...</p>
                <p class="full-review" style="margin: 0; padding: 0;">The most reliable and secure platform The most reliable and secure platform The most reliable and secure platform...</p>
                <a style="color:white">Read More</a>
                <h5 style="color: white; margin: 0; padding: 0;">-Amit Patel</h5>
                <p style="color: yellow; margin: 0; padding: 0;">Mumbai</p>
            </div>

        </div>

        <!-- Right Arrow -->
        <a id="nextBtn" class="arrow-btn right-arrow" href="#">&#62;</a>
        <%-- <button id="nextBtn" class="arrow-btn right-arrow">></button>--%>
    </section>


    <%-- articel library--%>

     <section id="ABHA" style="text-align: center; padding: 40px; background-color: white;">
       <!-- Heading -->
       <p class="articlename"><b>Articles Library</b></p>
       <hr />

       <!-- Infinite Scrolling Wrapper -->
<div class="scroll-container">
           <div class="article-cards-container">
               <div class="article-card">
                   <img src="/journal-page-images/article/helathyeat.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p class="article-description">Good digestion is important for feeling good, but many of us don't pay attention....</p>
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                     
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/buddahasing.png" alt="Article Image"  >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                           Good digestion is important for feeling good, but many of us don't pay attention...   </p>
  
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                        
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/helathyeat.png" alt="Article Image"  >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                           Good digestion is important for feeling good, but many of us don't pay attention... </p>  
      
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                       
                           <p style="text-align: left;"><strong>Hena Kanakia</strong>&nbsp;&nbsp; | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/buddahasing.png" alt="Article Image"  >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                            Good digestion is important for feeling good, but many of us don't pay attention...   
      
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                       
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/helathyeat.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                           Good digestion is important for feeling good, but many of us don't pay attention...   
      
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                         
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/buddahasing.png" alt="Article Image"  >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                           Good digestion is important for feeling good, but many of us don't pay attention...   
      
                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                         
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/helathyeat.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                            Good digestion is important for feeling good, but many of us don't pay attention...   
      
      

                       <p class="reviewby" style="text-align: left;">
                           Reviewed by
                           
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/buddahasing.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                           Good digestion is important for feeling good, but many of us don't pay attention...   
      
      

                       <p class="review" style="text-align: left;">
                           Reviewed by
                          
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/helathyeat.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                            Good digestion is important for feeling good, but many of us don't pay attention...   
      
      

                       <p class="review" style="text-align: left;">
                           Reviewed by
                         
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
               <div class="article-card">
                   <img src="/journal-page-images/article/buddahasing.png" alt="Article Image" >
                   <div class="article-content" style="text-align: left;">
                       <h4>7 Healthy Habits That Can Improve Your Digestion</h4>
                       <p>
                            Good digestion is important for feeling good, but many of us don't pay attention...   
      
      

                       <p class="review" style="text-align: left;">
                           Reviewed by
                           
                           <p style="text-align: left;"><strong>Hena Kanakia</strong> | 14 January, 24</p>
                           <hr />
                           <a ref="#"><u>read more...</u></a>
                       </p>
                   </div>
               </div>
           </div>
       </div>       


   </section>

        <section id="talkus" >
   
       
                            <div >
                                <div class="talktous" >
                                    <h2 class="talkusheader" >Talking To Us Is Easy</h2>
                                    <p class="talkusp">Have questions about Health Files, want to explore a partnership, or interested in joining our team? We’d love to hear from you!</p>
<div class="talkus">
    <p id="phone-info">
        <img src="/journal-page-images/article/phone-icon.png" alt="Phone Icon" >
        <br />
        <strong>Give us a call:</strong>
        <br />
        <a href="tel:+919978043453"><span>9978043453</span></a>
    </p>
    <p id="email-info" >
        <img src="/journal-page-images/article/email-icon.png" alt="Email Icon" >
        <br />
        <strong>Write to us:</strong>
         <a href="mailto:contact@hfiles.in" class="_cf_email_" data-cfemail="066e606f6a6375286f6846616b676f6a2865696b">contact@hfiles.in</a>
    </p>
    <p id="whatsapp-info" >
        <img src="/journal-page-images/article/whatsapp-icon.png" alt="WhatsApp Icon" >
        <br />
        <strong>WhatsApp us:</strong>
        <br />
         <a href="https://api.whatsapp.com/send?phone=919978043453&text=Hi">+91 9978043453</a>
    </p>
</div>


                         
                </section>

             <section class="handshakesection">
    <div class="handshake1">
        <!-- Left Column for Logo -->
      
            <div class="handshake">
                <img src="/journal-page-images/article/landing-handshake.png" alt="Health Files Logo" >
            </div>
        
        <!-- Right Column for Text -->
    
           
               
                <div class="handshakecontent" style="margin-top: 30px;">
                    <p>Ready to make a difference in healthcare? Join our team and help shape the future of health management!</p>
                    <a href="#careers" class="getintouch" >GET IN TOUCH</a>
                    
                    <!-- Add new image next to the button -->
                 <%--   <img src="/journal-page-images/article/your-image.jpg" alt="Career Image" style="width: 50px; height: 50px; margin-left: 20px; vertical-align: middle;">--%>
                </div>
         
        
    </div>
</section>


     
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

        <div id="helpPopup" class="popup-overlay">
    <div class="popup-content">
        <span class="close-btn">&times;</span>
        <h2>Do you want any help about HFiles?</h2>
        <p>Just Contact on <a href="mailto:contact@hfiles.in">contact@hfiles.com</a></p>
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
