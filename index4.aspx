<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index4.aspx.cs" Inherits="hfiles.index3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <link href="css/index4.css" rel="stylesheet" />
    <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-32x32.png" sizes="32x32" />
    <link rel="icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-192x192.png" sizes="192x192" />
    <link rel="apple-touch-icon" href="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-180x180.png" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-TileImage" content="https://hfiles.in/wp-content/uploads/2022/12/cropped-favicon-270x270.png" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
    <%--for font cdn poppins, red hat display and montserrat--%>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Red+Hat+Display:ital,wght@0,300..900;1,300..900&display=swap" rel="stylesheet">
    
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

      
        //$(document).ready(function () {
        //    const track = document.querySelector('.articles_row');

        //    const articleCards = document.querySelectorAll('.article-card');
        //    var article = track.innerHTML;
        //    setTimeout(() => {
        //        track.innerHTML += article;
        //    }, 1000);

        //    let animationPaused = false;
        //});
        document.addEventListener('DOMContentLoaded', function () {
            // Get the elements
            const container = document.querySelector('.article-cards-container');
            const cards = Array.from(document.querySelectorAll('.article_card'));

            if (!container || cards.length === 0) {
                console.error('Required elements not found');
                return;
            }

            // Clear any existing clones to start fresh
            container.innerHTML = '';

            // Add the original cards back to the container
            cards.forEach(card => {
                container.appendChild(card);
            });

            // Clone enough sets of cards to ensure no glitches
            // We need at least 2 complete sets of clones for seamless looping
            for (let i = 0; i < 3; i++) {
                cards.forEach(card => {
                    const clone = card.cloneNode(true);
                    container.appendChild(clone);
                });
            }

            // Calculate dimensions
            const cardWidth = cards[0].offsetWidth + 20; // Card width + gap
            const originalSetWidth = cardWidth * cards.length;

            // Style the container for smooth scrolling
            container.style.display = 'flex';

            // Set up variables for scrolling
            let currentPosition = 0;
            let animationId = null;
            let isPaused = false;

            // The main scroll function
            function smoothScroll() {
                if (isPaused) {
                    animationId = requestAnimationFrame(smoothScroll);
                    return;
                }

                // Move the container left for scrolling effect
                currentPosition -= 0.5; // Adjust speed as needed

                // Handle the reset point - the key to eliminating the glitch
                if (Math.abs(currentPosition) >= originalSetWidth) {
                    // Reset position perfectly at the set boundary
                    currentPosition = currentPosition % originalSetWidth;

                    // Apply the reset instantly without animation to avoid any visible jump
                    container.style.transition = 'none';
                    container.style.transform = `translateX(${currentPosition}px)`;

                    // Force a reflow to make the transition removal take effect immediately
                    void container.offsetWidth;

                    // Re-enable the smooth transition
                    container.style.transition = 'transform 0.01s linear';
                } else {
                    // Normal scrolling
                    container.style.transform = `translateX(${currentPosition}px)`;
                }

                animationId = requestAnimationFrame(smoothScroll);
            }

            // Initialize scroll
            container.style.transition = 'transform 0.01s linear';
            animationId = requestAnimationFrame(smoothScroll);

            // Handle pause on hover
            container.addEventListener('mouseenter', function () {
                isPaused = true;
            });

            container.addEventListener('mouseleave', function () {
                isPaused = false;
            });

            // Handle resize to recalculate dimensions if needed
            window.addEventListener('resize', function () {
                // Recalculate card width and total width on resize
                const updatedCardWidth = cards[0].offsetWidth + 20;
                originalSetWidth = updatedCardWidth * cards.length;
            });
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
        //document.addEventListener("DOMContentLoaded", function () {
        //    const menuToggle = document.getElementById("menu-toggle");
        //    const navMenu = document.getElementById("nav-menu");
        //    const navLinks = document.querySelectorAll(".nav-links a");

        //    // Toggle the 'active' class when the hamburger button is clicked
        //    menuToggle.addEventListener("click", () => {
        //        navMenu.classList.toggle("active"); // Toggle visibility of the menu

        //    });

        //    // Close the menu when clicking outside the nav menu or hamburger button
        //    document.addEventListener("click", (event) => {
        //        if (!navMenu.contains(event.target) && !menuToggle.contains(event.target)) {
        //            navMenu.classList.remove("active"); // Close menu when clicking outside
        //            menu.classList.add("closing");

        //        }
        //    });

        //    // Close the menu when any nav link is clicked
        //    navLinks.forEach(link => {
        //        link.addEventListener("click", () => {
        //            navMenu.classList.remove("active"); // Close menu on link click


        //        });
        //    });
        //});
        document.addEventListener("DOMContentLoaded", function () {
            const menuToggle = document.getElementById("menu-toggle");
            const navMenu = document.getElementById("nav-menu");
            const navLinks = document.querySelectorAll(".nav-links a");

            menuToggle.addEventListener("click", () => {
                if (navMenu.classList.contains("active")) {
                    navMenu.classList.remove("active");
                    navMenu.classList.add("closing");

                    // Wait for animation to finish before hiding
                    setTimeout(() => {
                        navMenu.classList.remove("closing");
                        navMenu.style.display = "none"; // Hide the menu after animation
                    }, 400);
                } else {
                    navMenu.style.display = "flex"; // Show menu before animation
                    navMenu.classList.remove("closing");
                    navMenu.classList.add("active");
                }
            });

            document.addEventListener("click", (event) => {
                if (!navMenu.contains(event.target) && !menuToggle.contains(event.target)) {
                    if (navMenu.classList.contains("active")) {
                        navMenu.classList.remove("active");
                        navMenu.classList.add("closing");

                        setTimeout(() => {
                            navMenu.classList.remove("closing");
                            navMenu.style.display = "none";
                        }, 400);
                    }
                }
            });

            navLinks.forEach(link => {
                link.addEventListener("click", () => {
                    navMenu.classList.remove("active");
                    navMenu.classList.add("closing");

                    setTimeout(() => {
                        navMenu.classList.remove("closing");
                        navMenu.style.display = "none";
                    }, 400);
                });
            });
        });




 


    </script>

</head>


<body>
    <form id="form1" runat="server">
        <%------------  Nav Bar ---------------%>

        
            <div>
                <header class="header">
                    <img src="https://hfiles.in/wp-content/uploads/2022/11/hfiles.png" alt="hfiles logo" />
                    <%--<button class="hamburger" id="menu-toggle" type="button">☰</button>--%>
                                    <button class="hamburger" id="menu-toggle" type="button">&#9776;</button>


                    <nav id="nav-menu" class="nav" >
                        <ul class="nav-links">
                            <li><a href="#about_us_section" class="aboutus">About us</a></li>
                            <li><a href="/article.aspx">Article</a></li>
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
            </div>
        

    



                <%------------  Hero header start ---------------%>

                <section class="healthcare-section" style="background-image:url('https://hfiles.in/wp-content/uploads/2023/03/hero-bh-pattern2.jpg')">
    
                    <div class="main-heroheader">

                        <!-- Left Section -->
                        <div class="text-content" >

                            <p class="small-text">Create your social health care network</p>
                            <h1 class="main-heading">Get Smart With Your Health</h1>
                            <p class="sub-text">Join India's Pioneering Social Healthcare Network</p>
                            <a href="/signup.aspx" class="cta-button">Create your health file</a>

                            <div class="badges">
                                <img src="/journal-page-images/article/SecureStorageAssured.png" alt="Secure Storage Assured" class="badge"/>
                                <img src="/journal-page-images/article/AyushmanBharat.png" alt="Ayushman Bharat" class="badge"/>
                            </div>
                        </div>

                             <!-- Right Section (Images & Icons) -->
                            
                                <div class="image-circle family">
                                  <img loading="lazy" decoding="async"  src="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png" class="elementor-animation-grow attachment-full size-full wp-image-992" alt="" srcset="https://hfiles.in/wp-content/uploads/2023/03/features-hero-6.png 1318w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-300x248.png 300w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-1024x846.png 1024w, https://hfiles.in/wp-content/uploads/2023/03/features-hero-6-768x635.png 768w" sizes="(max-width: 1318px) 100vw, 1318px" />
                           
                                </div>
                            
                     </div>
                </section>

        <%---------------------- second section -----------------%>
                            
    <section class="whyuse-section">
        <div class="main_second_slide">

                <div class="whyuse-header">
                    <h2>Why use Health Files?</h2>
                    <p>One secure health file profile can replace all physical copies of your medical history. Update your bond with health by signing up with us today!</p>
                </div>

                 <div class="secound_slide_image">
                            <img class="whyuse-mockup" src="journal-page-images/article/pixelcut-export-mockup.png" />
                 </div>
    
                 <div class="whyuse-container">
        
                    <div class="whyuse-features" >
                        <div class="feature-card">
                            <img src="/journal-page-images/article/secure-storage.png" alt="Secure Storage">
                            <h3>Secure Document Storage</h3>
                            <p>Your data is secured and safely stored on a cloud storage</p>
                        </div>

                        <div class="feature-card">
                            <img src="/journal-page-images/article/family-health.png" alt="Family Management">
                            <h3>Family Health Management</h3>
                            <p>Effortlessly manage and access medical records for the whole family</p>
                        </div>
                    </div>

                    <div class="whyuse-features" >
                        <div class="feature-card">
                            <img src="/journal-page-images/article/easy-access.png" alt="Easy Access">
                            <h3>Easy Access and Sharing</h3>
                            <p>View, download, or share your medical files anytime and anywhere</p>
                        </div>

                        <div class="feature-card">
                             <img src="/journal-page-images/article/track-history.png" alt="Track History">
                             <h3>Track Medical History Easily</h3>
                             <p>Keep a comprehensive history of diagnoses, treatments, and prescriptions</p>
                        </div>
                    </div>

                    <div class="whyuse-features" >
                        <div class="feature-card">
                            <img src="/journal-page-images/article/time-saving.png" alt="Time-Saving">
                            <h3>Time-Saving Digital Solution</h3>
                            <p>Access your records instantly, saving time and avoiding the hassle of sifting through documents</p>
                        </div>

                        <div class="feature-card">
                            <img src="/journal-page-images/article/abha-id.png" alt="ABHA ID">
                            <h3>Create ABHA ID and Analyze your Health Records</h3>
                            <p>COMING SOON!</p>
                        </div>
                    </div>

        </div>

            </div>
     </section>

        <%------------------ third section --------------------%>


     <section class="health-files-section">

         <div class="main_video_section">

        <!-- Right Column: Steps Content -->
             <div class="video_section_header">

                    <div class="section-header">
                         <h2 class="section-title">How does Health Files Work?</h2>
                         <p class="section-subtitle">
                         Sign up easily in just a few steps to securely manage your health records 
                         and take control of your healthcare journey with confidence.
                        </p>
                    </div>
             </div>
        <!-- Left Column: Video Placeholder -->
        <div class="content">
            <div class="video-container">

               <div class="videodesktop">
                     <video id="myVideo" class="desktop_final_video" controls>
                         <source src="/journal-page-images/article/Welcome to Health Files.mp4" type="video/mp4">
                         Your browser does not support the video tag.
                     </video>
                </div>

                <div class="videomobile">
                     <video id="myVideo1" class="mobile_final_video" controls >
                          <source src="/journal-page-images/article/phoneview.mp4" type="video/mp4">
                                             Your browser does not support the video tag.  
                     </video>
                </div>
             </div>
                  <%---------- 3 Steps --------%>
            <div class="all_steps">

                <div class="steps">

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
                  </div>  
            </div>
            
                                                
        </div>
    </div>
    
</section>

        <%--------------------- 4th abha card section ------------------%>

           <section class="abha-section">
               <div class="main_abha_card">

               
                    <div class="container">
                        <div class="abha-content">

                            <div class="abha_header">
                                <h2>Create Your ABHA Health ID Card Today</h2>
                                <hr class="separator">
                                <p>
                                    Join India’s digital health revolution by making your ABHA 
                                    (Ayushman Bharat Health Account) Health ID card!
                                </p>
                            </div>

                            <ul class="abha-benefits">
                                <li><i class="abha_righticon fas fa-check-circle"></i> Establish a unique identity with healthcare providers</li>
                                <li><i class="abha_righticon fas fa-check-circle"></i> Link all healthcare benefits to your unique ABHA number</li>
                                <li><i class="abha_righticon fas fa-check-circle"></i> Avoid registration queues in healthcare facilities across the country</li>
                            </ul>
                        </div>

                        
                    </div>

                    <div class="abha-image-container1">
                        <img src="https://hfiles.in/wp-content/uploads/2022/12/user-profile-screen.png" 
                             alt="ABHA Health ID" class="abha-card-image">
                    </div>

                </div>
            </section>


        <%------------- 5th abha id card ---------------%>

            <section class="abha-id-section">
                <div class="just_for_desktop">

                    <!-- Left Image Container -->
                    <div class="main_abha_idcard">

                        <div class="floating-card signup-card">
                            <img src="/journal-page-images/article/signupabhaid.png" class="signup-icon">
                        </div>
           
      
                    <!-- Right Content -->
                    <div class="abha-content-Id">
                        <div class="abha-content-box">


                        <div class="abha-content-id-header">
                            <h2>Create your ABHA ID</h2>
                            <p>The Indian healthcare system is going digital.</p>
                        </div>
                        <p class="abha_sub_text">Join us in our mission by signing up with Health Files and creating your ABHA ID today!</p>
                       
                        <div class="create_abha_button">
                            <div class="comming_soon_alignment">

                           
                            <div class="abha_id_button">
                                 <button class="abha-button" ><span>Create your ABHA ID</span></button>
                            </div>
                                                    <img src="journal-page-images/article/comingsoon.png" />
                          </div>
                        </div>

                         <div class="ayushman-badge">
                         <img src="/journal-page-images/article/AyushmanBharat.png" class="ayushman-icon">
                         </div>
                    </div>
                        
                        </div>
                </div>
                                    </div>

            </section>


        <%----------------- corporate slide ------------%>


                        
                                            <section class="personalized_solutions_section">
                                                <div class="main_solution">

                                                    <div class="solution_desktop">

                                                    <div class="solution_header">
                                                        <div class="solution_title">
                                                             <h2 class="personalized">Personalized Health</h2>
                                                             <h2 class="solution">Solutions</h2>
                                                             <p>Enterprise and Organizations</p>

                                                        </div>

                                                        <div class="solution_sub_text">

                                                              <p class="tailored">Tailored solutions designed to meet your organization's needs and goals.</p>
                                                        
                                                        </div>

                                                         <div class="desktop_solution_id_button">
                                                             <a class="solution_button" href="#talkus" ><span>Contact Us</span></a>
                                                         </div>
                                                    </div>

<%--                                                    <div class="solution_image">--%>
                                                        <img class="main_solution_image solution_image" src="/journal-page-images/article/personalized.png" />
                                                    <%--</div>--%>
                                                    </div>

                                                     <div class="solution_id_button">
                                                         <a class="solution_button" href="#talkus" ><span>Contact Us</span></a>
                                                     </div>
                                                </div>
                                            </section>
                                       
        <%--------------- About us --------------%>

                 <section id="about_us_section" class="about-section">
   
                     <div class="main_about_us">
                       <div class="about-content">
                           <%--<div class="about-image">--%>
                               <%--<img class="main_image_aboutus" src="/journal-page-images/article/about_us_long.png" />--%>
                               <img class="desktop_image_aboutus" src="/journal-page-images/article/about_us_short.png" />
                               <%--<img src="https://hfiles.in/wp-content/uploads/2023/03/about.svg" alt="about" />--%>
                           <%--</div>--%>
                           <div class="about-text">
                              
                                    <h2>About Us</h2>
                                    <hr class="separator1"/>
                               <p>Welcome to Hfiles, where we aim to simplify and manage the healthcare system for your entire family, from birth to adulthood. We believe that organization is the key to leading a successful life, and our mission is to help you organize your medical life into one neat file.</p>
                               <p>We understand that visiting a doctor can be a stressful experience, and it can be even more challenging to keep track of past prescriptions, medical records, and medications. With Hfiles, you no longer have to worry about these issues as we help manage this stress by maintaining all of your prescriptions, medical records, and history in one place.</p>
                               <p>Our system is designed to facilitate easy transfer and access to medical files, so you can be confident that your family’s health information is always up-to-date and readily available to you and your healthcare providers. We prioritize the security and privacy of your sensitive medical information, and use the latest technology to ensure that your data is safe and protected at all times.</p>
                           
                           </div>

                        </div>

                         <div class="mission_vision">
                            <div class="mission">
                                
                                    <h2>Mission</h2>
                                    <hr class="separator2"/>
                                
                                <p>To streamline the process of managing medical records from birth to old age, ensuring that your family’s health information is organized, easily accessible and can be shared effortlessly when you need it the most. With our support, you can focus on what matters most – taking care of your family’s health – while we take care of the rest.</p>
                                <p>Join us on this mission to transform the way you manage your family’s medical life.</p>
                            </div>
                            <div class="vision">
                                
                                    <h2>Vision</h2>
                                    <hr class="separator3"/>
                               
                                <p>To create a social healthcare network that connects families and healthcare professionals seamlessly. To build a global health community where individuals can share experiences and empower each other to lead healthier lives.</p>
                            </div>
                        </div>
                       
                     </div>

                   </section>

        <%-------------------- recognizition slide ------------------%>

                        <section class="recognized-section">
                            <div class="main-recognized">
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

        <%--------------------------- testimonial -------------------%>

                    <section class="testimonial_section">
                        <div class="main_testimonial">
                            <div class="testimonial_header">
                                <h2><u>Discover the Voices Behind Our Success</u></h2>
                            </div>

                            <!-- Cards Section -->
                            <div class="review-container">
                                        <a id="prevBtn" class="arrow-btn left-arrow" href="#">&#60;</a>

                                <div class="main_review_card">

                                <!-- Card 1 -->
                                <div class="review-card">
                                    <div class="review_text">
                                        <p>
                                           Being a healthcare professional myself and a mom to my child and my puppy, it has really helped my husband and I to streamline our process... 
                                        </p>
                                    </div>
                                    <div class="readmore_link">
                                        <a href="#"  class="read-more-btn" data-full-review="<p style='text-align:left;'>Being a healthcare professional myself and a mom to my child and my puppy, it has really helped my husband and I to streamline our process of data management. No more 35 missed calls and messages to coordinate where our records are when either of us takes our pet to the vet.</p> <br><br><p style='text-align:left;'>-Dr. Ekta</p> <p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                    </div>
                                    <div class="review_footer">
                                        <div class="name_part">
                                            <span>-</span>
                                            <h2>Dr. Ekta</h2>
                                        </div>
                                        <p>Mumbai, India</p>
                                    </div>
                                </div>

                                <!-- Card 2 -->
                                <div class="review-card">
                                    <div class="review_text">
                                        <p class="review-text">
                                            Being a user of HFiles, I can safely say maintaining my family health data, reports and history has never been more convenient. The ease of access of data...
                                        </p>
                                    </div>
                                    <div class="readmore_link">
                                        <a href="#" class="read-more-btn" data-full-review="<p style='text-align:left;'>Being a user of HFiles, I can safely say maintaining my family health data, reports and history has never been more convenient. The ease of access of data and sharing it with necessary professionals AT THE CORRECT time has never been easier! I recommend everyone to use this immediately for themselves and their family!</p><br><br><p style='text-align:left;'>-Vinit D</p> <p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                    </div>
                                    <div class="review_footer">
                                        <div class="name_part">
                                            <span>-</span>
                                            <h2>Vinit D</h2>
                                        </div>
                                        <p>Mumbai, India</p>
                                    </div>
                                </div>

                                <!-- Card 3 -->
                                <div class="review-card">
                                    <div class="review_text">
                                        <p class="review-text">
                                            Being a working professional and newly married it’s been so helpful during my pregnancy because my husband and I as well as my family all have access ...
                                        </p>
                                    </div>
                                    <div class="readmore_link">
                                        <a href="#" class="read-more-btn" data-full-review="<p style='text-align:left;'>Being a working professional and newly married it’s been so helpful during my pregnancy because my husband and I as well as my family all have access to my reports and it helps us remain stress free about reports and prescriptions and focus on what matters the most.. my beautiful journey of pregnancy! Thanks Hfiles!</p><br><br><p style='text-align:left;'>-Dr. Shetty</p> <p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                    </div>
                                    <div class="review_footer">
                                        <div class="name_part">
                                            <span>-</span>
                                            <h2>Dr. Shetty</h2>
                                        </div>
                                        <p>Mumbai, India</p>
                                    </div>
                                </div>


                                <!-- Card 4 -->
                                <div class="review-card">
                                    <div class="review_text">
                                        <p class="review-text">
                                           This Website is incredibly helpful! H files allows me to keep all my family’s medical records in one place. No more hunting ...
                                        </p>
                                    </div>
                                    <div class="readmore_link">
                                        <a href="#" class="read-more-btn" data-full-review="<p style='text-align:left;'>This Website is incredibly helpful! H files allows me to keep all my family’s medical records in one place. No more hunting for documents during emergencies. It’s reliable and super convenient!</p><br><br><p style='text-align:left;'>-Dr.Sanjana</p><br><br> <p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                    </div>
                                    <div class="review_footer">
                                        <div class="name_part">
                                            <span>-</span>
                                            <h2>Dr.Sanjana</h2>
                                        </div>
                                        <p>Mumbai, India</p>
                                    </div>
                                </div>

                                 <!-- Card 5 -->
                                 <div class="review-card">
                                     <div class="review_text">
                                         <p class="review-text">
                                             HFiles is a highly effective app for securely organizing and storing medical documents. Its user-friendly interface makes it simple to upload...
                                         </p>
                                     </div>
                                     <div class="readmore_link">
                                         <a href="#" class="read-more-btn" data-full-review="<p style='text-align:left;'>HFiles is a highly effective app for securely organizing and storing medical documents. Its user-friendly interface makes it simple to upload, categorize, and manage files such as prescriptions, lab results, and insurance forms. Overall, Hfiles provides a convenient, secure, and dependable solution for managing and accessing your medical records digitally from anywhere in the world. I highly recommend it!</p><br><br><p style='text-align:left;'>-Akshay Tondon</p> <p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                     </div>
                                     <div class="review_footer">
                                         <div class="name_part">
                                             <span>-</span>
                                             <h2>Akshay Tondon</h2>
                                         </div>
                                         <p>Newcastle, UK</p>
                                     </div>
                                 </div>

                                 <!-- Card 6 -->
                                 <div class="review-card">
                                     <div class="review_text">
                                         <p class="review-text">
                                             As new parents, it was so important that my husband and I have all our important medical records in one place including our son’s vaccination records...
                                         </p>
                                     </div>
                                     <div class="readmore_link">
                                         <a href="#" class="read-more-btn" data-full-review="<p style='text-align:left;'>As new parents, it was so important that my husband and I have all our important medical records in one place including our son’s vaccination records. Health files has helped us in doing exactly that in an organised manner with ease of access!</p><br><br><p style='text-align:left;'>-Jenita Soni</p><p style='color:#ffd100;text-align:left;'>Mumbai, India</p>">Read More</a>
                                     </div>
                                     <div class="review_footer">
                                         <div class="name_part">
                                             <span>-</span>
                                             <h2>Jenita Soni</h2>
                                         </div>
                                         <p>Mumbai, India</p>
                                     </div>
                                 </div>

                                     </div>

                                                                        <a id="nextBtn" class="arrow-btn left-arrow" href="#" >&#62;</a>


                            </div>
                        </div>
                    </section>


        <%-------------- Article slide ------------%>

        <section class="article_section">

            <div class="main_article">

                <div class="article_header">
                    <h2>Articles Library</h2>
                    <hr />
                </div>
                
                <div class="articles_row">
                    <div class="article-cards-container">

                    
                    <%------------ card one -----------%>
                    <div class="article_card">
                           <img class="article_image" src="/journal-page-images/article/article_image.jpg" alt="Article Image" />
                        <div class="article_content">
                            <div class="article_title">
                                <h1>1 healthy Habits That Can Improve Your Digestion</h1>
                                <p>Good digestion is important for feeling good but many of us don't pay attention to habits that directly . . . </p>
                             </div>

                            <span> Reviewed by</span>
                            <div class="footer_of_article_content">
                                <p>Hena Kanakia</p>
                                <p>14 Janurary, 24</p>
                            </div>

                            <hr class="lower_hr" />

                            <p class="readmore">Read more . . .</p>
                        </div>
                    </div>

                       <%------------ card two -----------%>
                       <div class="article_card">
                              <img class="article_image" src="/journal-page-images/article/article_image.jpg" alt="Article Image" />
                           <div class="article_content">
                               <div class="article_title">
                                   <h1>2 healthy Habits That Can Improve Your Digestion</h1>
                                   <p>Good digestion is important for feeling good but many of us don't pay attention to habits that . . . </p>
                                </div>

                               <span> Reviewed by</span>
                               <div class="footer_of_article_content">
                                   <p>Hena Kanakia</p>
                                   <p>14 Janurary, 24</p>
                               </div>

                               <hr class="lower_hr" />

                               <p class="readmore">Read more . . .</p>
                           </div>
                       </div>


                       <%------------ card three -----------%>
                       <div class="article_card">
                              <img class="article_image" src="/journal-page-images/article/article_image.jpg" alt="Article Image" />
                           <div class="article_content">
                               <div class="article_title">
                                   <h1>3 healthy Habits That Can Improve Your Digestion</h1>
                                   <p>Good digestion is important for feeling good but many of us don't pay attention to habits that . . . </p>
                                </div>

                               <span> Reviewed by</span>
                               <div class="footer_of_article_content">
                                   <p>Hena Kanakia</p>
                                   <p>14 Janurary, 24</p>
                               </div>

                               <hr class="lower_hr" />

                               <p class="readmore">Read more . . .</p>
                           </div>
                       </div>

</div>
                </div>
            </div>

        </section>



        <%------------------ Contact us ---------------%>

                <section id="talkus" class="talkus_section">

                    <div class="main_talk_to_us">

                        <div class="talkus_header">
                            <h1> Talking To Us Is Easy</h1>
                            <hr />
                            <p>Have questions about Health Files, want to explore a partnership, or interested in joining our team?</p>
                            <h3>We'd love to hear from you!</h3>
                        </div>

                        <%------------- first icon --------%>
                        <div class="talkus_icon_row">

                            <div class="giveus_call">
                               <img src="/journal-page-images/article/phone-icon.png" alt="Phone Icon" />

                                <h2>Give Us Call</h2>
                            <a href="tel:+919978043453"><p>+91 9978043453</p></a>
                            </div>

                        

                         <%------------- second icon --------%>

                             <div class="giveus_call">
                                <img src="/journal-page-images/article/email-icon.png" alt="Phone Icon" />

                                 <h2>Write to us</h2>
                                 <a href="mailto:contact@hfiles.in"><p>contact@hfiles.in</p></a>
                             </div>

                         

                         <%------------- third icon --------%>
                         

                             <div class="giveus_call">
                                <img src="/journal-page-images/article/whatsapp-icon.png" alt="Phone Icon" />

                                 <h2>WhatsApp us</h2>
                                  <a href="https://api.whatsapp.com/send?phone=919978043453&text=Hi" ><p>+91 9978043453</p></a>
                             </div>

                         </div>

                    </div>
                </section>


        <%---------------- get in touch -----------%>

                     <section class="handshake_section">
                         <div class="main_handshake">

                         
                                <div class="handshake1">
      
                                       
                                            <img src="/journal-page-images/article/landing-handshake.png" alt="Health Files Logo" />
                                        
        
    
           
               
                                            <div class="handshakecontent">
                                                <p>Ready to make a difference in healthcare? Join our team and help shape the future of health management!</p>
                                                <button class="gat_in_touch"><span>GET IN TOUCH</span></button>
                                            </div>
                                </div>
        
                            </div>
                        </section>


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
                                <a href="#talkus"><p>Contact Us</p></a>
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



    </form>
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
        document.addEventListener("DOMContentLoaded", function () {


            const container = document.querySelector(".main_review_card");
            const prevBtn = document.getElementById("prevBtn");
            const nextBtn = document.getElementById("nextBtn");

            if (!container || !prevBtn || !nextBtn) {
                console.error("Error: Elements not found!");
                return;
            }

            const cardWidth = document.querySelector(".review-card").offsetWidth + 20; // Adjust for margin

            // Scroll Right
            nextBtn.addEventListener("click", (e) => {
                e.preventDefault();
                container.scrollBy({ left: cardWidth, behavior: "smooth" });
            });

            // Scroll Left
            prevBtn.addEventListener("click", (e) => {
                e.preventDefault();
                container.scrollBy({ left: -cardWidth, behavior: "smooth" });
            });
        });
        document.addEventListener("DOMContentLoaded", function () {
            // Function to handle 'Read More' clicks
            function attachReadMoreEvent() {
                document.querySelectorAll(".readmore_link a").forEach(link => {
                    link.addEventListener("click", function (e) {
                        e.preventDefault();

                        // Get the specific review text
                        const fullReviewText = this.getAttribute("data-full-review");


                        // Remove existing modal if present
                        const existingModal = document.querySelector(".review-modal");
                        if (existingModal) existingModal.remove();

                        // Create a new modal
                        const modal = document.createElement("div");
                        modal.classList.add("review-modal");
                        modal.innerHTML = `
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <p>${fullReviewText}</p>
                    </div>
                `;

                        // Append modal to body
                        document.body.appendChild(modal);

                        // Close modal events
                        modal.querySelector(".close-btn").addEventListener("click", () => modal.remove());
                        modal.addEventListener("click", (event) => {
                            if (event.target === modal) modal.remove();
                        });
                    });
                });
            }

            // Attach event listeners initially
            attachReadMoreEvent();

            // If new reviews are dynamically added, re-attach event listeners
            const reviewContainer = document.querySelector(".main_review_card");
            const observer = new MutationObserver(() => attachReadMoreEvent());
            observer.observe(reviewContainer, { childList: true });
        });


    </script>

</body>
</html>
