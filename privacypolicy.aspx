<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="privacypolicy.aspx.cs" Inherits="hfiles.privacypolicy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Privacy Policy</title>
    <link rel="stylesheet" href="../style2.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />


    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>

    <%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <style>
        h1 {
            text-align: center;
            color: #333;
        }

        p {
            font-size: 16px;
            margin: 20px 0;
        }

        ul {
            list-style-type: disc;
            margin: 20px;
            padding-left: 40px;
        }

            ul li {
                margin: 10px 0;
            }

        .back-arrow-btn {
            position: absolute;
            left: 10%;
            top: 10%;
            color: #0512b9; 
            padding: 5px 20px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: gray;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 700;
            font-size: 16px;
           /* background-color: #fdd001;*/
        }

        @media (max-width:540px) {
            .blue_trangle_top_left {
                display: none;
                visibility: hidden;
            }

            .back-arrow-btn {
                left: 5%;
                top: 0%;
            }
        }

        @media (min-width: 768px) and (max-width: 991px) {
            .PrivacyPolicyblue_trangle_bottom_right {
                position: absolute !important;
                bottom: 0px !important;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .PrivacyPolicyblue_trangle_bottom_right {
                position: absolute !important;
                bottom: 0px !important;
            }
        }

        @media only screen and (max-width: 1300px) {

            .PrivacyPolicyblue_trangle_bottom_right {
                position: absolute !important;
            }
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="privacy_main h-100vh h-xl-90vh">


                              <a class="back-arrow-btn" href="index4.aspx">Back</a>

            <img class="blue_trangle_top_left" src="../Terms & Conditions/blue-trangle1.png" alt="">
            <img class="blue_trangle_top_right" src="../Terms & Conditions/blue-trangle2.png" alt="">
            <img class="plus_top_left" src="../Terms & Conditions/plus-1.png" alt="">

                      

            <div class="mt-5 mt-lg-0" style="height: 100%;">
                <div class="d-flex justify-content-center align-items-center h-100">
                    <div class="inner_div">
                        <div class="heading">
                            <h1 class="fw-bold">Privacy Policy</h1>
                        </div>
                        <div class="desciption">
                            <p>HFILES PRIVACY POLICY</p>
                            <p>This Privacy Policy pertains and regulates the access and use of the website <a href="http://hfiles.in/">http://hfiles.in/</a> which is operated and owned by HEALTH FILES MEDICO PRIVATE LIMITED.</p>
                            <p>This Privacy Policy outlines the procedures and protocols employed by the website <a href="http://hfiles.in/">http://hfiles.in/</a> in managing and handling personal and usage information of users (referred to as You or User), in compliance with the relevant laws and regulations of India. The Privacy Policy is subject to modifications at the discretion of HEALTH FILES MEDICO PRIVATE LIMITED without prior notice. Any alterations to the Privacy Policy will be communicated to all account holders of <a href="http://hfiles.in/">http://hfiles.in</a>. The Privacy Policy for <a href="http://hfiles.in/">http://hfiles.in</a> has been designed to be straightforward and informative, detailing the collection of personal and usage information from users. Users who may not be familiar with certain technical terms are encouraged to review the key terms provided.</p>
                            <ol type="1">
                                <li>
                                    <p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> permits users to navigate its content without requiring registration. Consequently, it does not collect any identifiable personal data such as names, phone numbers, or email addresses that could be used to distinguish individuals.</p>
                                </li>
                                <li>
                                    <p>If the user desires to register for an account on the website <a href="http://hfiles.in/">http://hfiles.in/</a>, they are required to furnish their full name, personal mobile number, and email address.</p>
                                </li>
                                <li>
                                    <p>The <a href="http://hfiles.in/">http://hfiles.in/</a> Portal gathers data including Internet Protocol (IP) Addresses, Domain name, Browser type, Operating System, Date and Time of the visit, Pages visited, Referring URLs, among other information. It is important to note that there is no intention to correlate this data with the identities of individuals visiting the portal, unless there is an unlawful attempt to breach the <a href="http://hfiles.in/">http://hfiles.in/</a> service, privacy policy, or violate the provisions of the Information Technology Act, 2000, or any current Rules, Legislation of India.</p>
                                </li>
                                <li>
                                    <p>The <a href="http://hfiles.in/">http://hfiles.in/</a> System utilizes cookies to store temporary session data aiming to enhance user experience and customize preferences. It is important to note that only temporary cookies are employed, and users have the ability to manage cookie settings through their web browser or other tools. Disabling cookies may disrupt the continuity of the <a href="http://hfiles.in/">http://hfiles.in/</a> session. Users are recommended to log out after each session to mitigate potential misuse of cookie data.</p>
                                </li>
                                <li>
                                    <p>The <a href="http://hfiles.in/">http://hfiles.in/</a> System ensures the confidentiality of user information, specifically details obtained during registration, by refraining from sharing or disclosing such data to any party, be it an individual or an organization, unless mandated by legal requirements or explicitly authorized by the account holder.</p>
                                </li>
                                <li>
                                    <p>Account holders of <a href="http://hfiles.in/">http://hfiles.in/</a> retain the autonomy to voluntarily share their uploaded documents or URIs with any party, whether an individual or an organization, by providing explicit consent. It is important to note that the responsibility for sharing documents with requesters or other entities rests solely with the user, as the <a href="http://hfiles.in/">http://hfiles.in/</a> system primarily serves as a platform for facilitating document sharing.</p>
                                </li>
                                <li>
                                    <p>The individual holding the account on <a href="http://hfiles.in/">http://hfiles.in/</a> is accountable for all self-uploaded documents. It is prohibited for the account holder to share or engage in any activities that contravene the terms and conditions, privacy policy, or regulations outlined in the Information Technology Act, 2000, or any other prevailing legislation.</p>
                                </li>
                                <li>
                                    <p>Collected personal and usage data may be disclosed to third-party organizations by HEALTH FILES MEDICO PRIVATE LIMITED if there is a genuine belief that such action is necessary to comply with regulations, legal proceedings, or official government requests; adhere to relevant laws; identify, prevent, or resolve instances of fraud, security breaches, or technical problems; or safeguard the rights, assets, or well-being of <a href="http://hfiles.in/">http://hfiles.in/</a>, other users, or the general public as mandated or permitted by laws of India.</p>
                                </li>
                                <li>
                                    <p>The personally identifiable information submitted on the <a href="http://hfiles.in/">http://hfiles.in/</a> Portal/Website is not sold or shared with any third party, whether public or private, except as outlined in the aforementioned conditions. Any data provided to this website will be safeguarded against loss, unauthorized access, disclosure, alteration, or destruction to a reasonable extent.</p>
                                </li>
                            </ol>

                        </div>
                        <!-- <div class="agree">
     <input type="checkbox"> <label for="">I Agree</label>
 </div> -->
                    </div>

                </div>
            </div>

            <img class="blue_trangle_bottom_right PrivacyPolicyblue_trangle_bottom_right" src="../Terms & Conditions/blue-trangle4.png" alt="">
            <img class="blue_trangle_right" src="../Terms & Conditions/blue-trangle3.png" alt="">
            <img class="blue_trangle_bottom_left" src="../Terms & Conditions/blue-trangle5.png" alt="">
            <img class="plus_bottom_right" src="../Terms & Conditions/plus-2.png" alt="">
        </div>
    </form>
</body>
</html>
