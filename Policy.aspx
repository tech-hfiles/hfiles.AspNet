﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Policy.aspx.cs" Inherits="hfiles.Policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../style2.css" />
    <title>Privacy Policy</title>

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

        @media (min-width: 1300px) {
            .privacy_main {
                max-height: 60vh;
                margin-top: 50px;
            }

            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="privacy_main">

        <img class="blue_trangle_top_left" src="../Terms & Conditions/blue-trangle1.png" alt="">
        <img class="blue_trangle_top_right" src="../Terms & Conditions/blue-trangle2.png" alt="">
        <img class="plus_top_left" src="../Terms & Conditions/plus-1.png" alt="">

        <a class="back-arrow-btn" href="javascript: history.go(-1)"><%--<img src="../assets/back-arrow.png" alt="">--%>Back</a>

        <div class="mt-5 mt-lg-0" style="height: 90%;">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="inner_div">
                    <div class="heading">
                        <h1 class="fw-bold">Privacy Policy</h1>
                    </div>
                    <%--<div class="desciption">
                    <div class="px-2">
                        <p><strong>
                           This Privacy Policy describes how Hfiles manages your Personal Data in compliance with the Indian Laws. We encourage you to read this Privacy Policy so that you know and understand the purposes for which we collect, use, process, store and disclose your Personal Data in a restricted manner.
                        </strong></p>
                       
                        <p>
                            <strong>
                                We may update this Privacy Policy from time to time. Subject to your rights at law, you agree to be bound by the prevailing terms of this Privacy Policy as updated from time to time. We encourage you to check the latest version of this Privacy Policy regularly.
                            </strong>
                        </p>
                        <p>
                            <strong>
                               By signing up for or using any services or campaigns offered by Hfiles or submitting information to or otherwise communicating with Hfiles, you agree and consent to, as well as their respective representatives and/or agents, collecting, using and disclosing your Personal Data in accordance with this Privacy Policy.
                            </strong>
                        </p>
                        <p>
                            <strong>
                               This Privacy Policy does not supersede or replace any other consents which you may have previously or separately provided to us in respect of your Personal Data and your consent to this Privacy Policy is in addition to any other rights which any of the Companies may have at law to collect, use or disclose the Personal Data.
                            </strong>
                        </p>
                        <p>
                            <strong>
                               This Privacy Policy and your use of this website shall be governed in all respects by the laws of India.
                            </strong>
                        </p>
                        <p>
                            <strong>
                                A few possible privacy issues and concerns for the users are stipulated hereunder:
                            </strong>
                        </p>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">1 . What data do we collect?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p><strong>Personal data or personal information means any data about an individual from which that person can be identified.</strong></p>

                            <p><strong>We may collect, use, store and transfer the following kinds of personal data about you:</strong></p>

                            <li><p>Personal data: Name, phone number, date of birth;</p></li>

                            <li><p>Address: Email, billing, organization, residential;</p></li>

                            <li><p>Medical: Medical records submitted by you including doctor’s prescriptions, diagnosis records, medicines and drugs, laboratory test reports, patient insurance data, and other data submitted by you while availing the services provided by Hfiles;</p></li>

                            <li><p>Technical and Analytical data: Username, password, IP address, browser information, registration data, and other data used to identify the ways in which you access to our website;</p></li>
                            <li>
                                <p>Profile data: Preferences, feedback and survey responses;</p>
                            </li>
                            <li>
                                <p>Marketing and Communications data: Your preferences in receiving marketing from us and our third parties and your communication preferences.</p>
                            </li>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">2 . How do we collect your data?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>We use the following methods to collect your data:</strong>
                            </p>
                            <li><p>You may provide us your data via our website, mobile application, email, phone, by completing a form, correspondence, or other means;</p></li>

                            <li><p>By registering online to use the website or for any other services that we offer;</p></li>

                            <li><p>By completing a survey request or providing feedback via email or other means of contact;</p></li>

                            <li><p>Use or view our website via your browser’s cookies.</p></li>
                           
                            <p><strong>Our website and mobile application tracking tools also collect information like your IP, Location, Website clicks in anonymized format and aggregates this data.</strong></p>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">3 . How do we use your data?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p><strong>Hfiles collects your data for the following purposes:</strong></p>
                            <li>
                                <p>
                                    Providing and administering our medical records storage and consultation services;
                                </p>
                            </li>
                            <li>
                                <p>
                                    Provide you with the information, answers to queries, and/or directions;
                                </p>
                            </li>
                            <li>
                                <p>
                                    Provide you with the services that you have requested;
                                </p>
                            </li>
                            <li>
                                <p>
                                    Manage your membership, including registration;
                                </p>
                            </li>
                            <li>
                                <p>
                                   Processing quotation offers and managing the customer relationship inclusive of providing customer the required services, support and process, evaluate and respond to requests and inquiries, and capturing personal data of potential customers for future communications;
                                </p>
                            </li>
                            <li>
                                <p>
                                   Conducting and facilitating customer satisfaction surveys, marketing campaigns, market analysis, contests or other promotional activities;
                                </p>
                            </li>
                            <li>
                                <p>
                                    Market services which are of special interest and its relevance;
                                </p>
                            </li> 
                            <li>
                                <p>
                                   Furnishing marketing communications by post, telephone, text, emails and other digital methods are products and services (such as alerts, promotional materials, newsletter, etc.);
                                </p>
                            </li>
                            <li>
                                <p>
                                    Analyzing personal data to provide with the relevant marketing offers and information, ensure accuracy of customer contact information;
                                </p>
                            </li>
                            <li>
                                <p>
                                     Reporting and data analytics such as market research, trend analysis, financial analysis, customer segmentation and profiling of customers in order to improve customers experience with Hfiles and provide better and more personalized content;
                                </p>
                            </li> 
                            <li>
                                <p>
                                    Improve our website to serve you better;
                                </p>
                            </li>
                            <li>
                                <p>
                                    Any other purpose within the scope of Anahat Solution’s work.
                                </p>
                            </li>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">4 . Will the data be shared with any third party?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                    We do not share your data to any third party. Further unless a specific consent is taken, it can never be shared with the third party.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                   We may be compelled to share your details under following special circumstances such as when we believe in good faith and is required by law:
                                </strong>
                            </p>
                            <li>
                                <p>
                                   To prevent, investigate, or take action regarding illegal activities, suspected fraud, situations involving potential threats to the physical safety of any person, violations of our Terms of Service or any other agreement related to the services, or as otherwise required by law.
                                </p>
                            </li>
                            <li>
                                <p>
                                    In the interest of public health or public interest.
                                </p>
                            </li>
                            <li>
                                <p>
                                    Any kind of medical emergency wherein there is a threat to your life or health.
                                </p>
                            </li> 
                            <li>
                                <p>
                                   To confirm to legal requirements, or to respond to lawful Court orders, subpoenas, warrants, or other requests by public authorities (including to meet national security or law enforcement requirements).
                                </p>
                            </li>
                            <li>
                                <p>
                                    Personal information may also be shared with the company that acquires our business, whether through merger, acquisition, bankruptcy, dissolution, reorganization, or other similar transaction or proceeding. If this happens, we will display a prior notice on our Website.
                                </p>
                            </li>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">5 . What happens if you do not provide us with the information, we had asked you for or if you ask us to stop processing your information?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                           <p><strong>Where it concerns processing operations related to the business relationship with you, Hfiles will not be able to adequately establish, conduct or terminate a business relationship with you and generally perform the purposes described above without certain data.</strong></p>
                            
                            <p><strong>Although we cannot obligate you to share your personal data with us, please note that this then may have consequences which could affect the business relationship in a negative manner, such as not to establish and continue the business relationships you have asked for.</strong></p>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">6 .How do we safely store your data and for how long?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                   Hfiles takes appropriate security measures to protect your data from being accidentally lost, used or accessed by unauthorized sources. We limit access to your personal data to employees within the organization, medical practitioners, and to those with a legitimate business or industry need.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                    We will only retain your data for stipulated time to fulfil the purposes, we collected it for, including for the purposes of satisfying any legal, accounting, audit, or reporting requirements or until you notify us that you no longer wish to receive the services and storage/consultation facilities provided by Hfiles.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                    In general, customer related personal data is kept for the duration of the contractual relationship and for a minimum period or for longer period if required by local laws and regulatory requirements.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                   For data provided to us by our clients, we are governed by their data retention rules as specified in their privacy notices.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                   Through the setting of IT applications and policies we ensure that our keeping of your personal data is deleted when we no longer need it.
                                </strong>
                            </p>
                           
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">7 . What we do not do with your Data?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>We strictly refrain from sharing, disclosing, selling, renting or otherwise provide personal information to other companies (other than to specific Hfiles marketplace administrators you are interacting with, or to third party apps or service providers being used by the administrators you are interacting with) for the marketing of their own products or services.</strong>
                            </p>
                             <p>
                                 <strong>If you are a medical practitioner using Hfiles’ services, we do not use the personal information to independently contact or market your patients. However, Hfiles may contact or market your patients, if we obtain their information from another source, such as from the patients themselves.</strong>
                            </p>
                            
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">8 .Processing of Personal Data of a Minor</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                   In the event any personal data of a minor, i.e., below 18 years of age, is submitted via our website, mobile application, email form, surveys, etc., the same shall be submitted and collected by us only after obtaining due consent from the minor’s parents or guardian.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                    In such circumstances, a valid ID proof of the parent or guardian along with the minor should be mandatorily submitted in order to verify the consent of the parent or guardian.
                                </strong>
                            </p>
                            <p>
                                <strong>
                                    Hfiles will not collect, use, process or transfer the personal data of a minor in any manner that is likely to cause harm to the minor.
                                </strong>
                            </p>
                           
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">9 .What are your data protection rights?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                    Under data protection law, you have the following rights:s
                                </strong>
                            </p>
                            <li>
                                <p>
                                   Right to access your data: You are entitled to ask Hfiles for an overview of or to obtain a copy of the personal data we hold about you.
                                </p>
                            </li>
                             <li>
                                 <p>
                                    Right to have your data corrected: You may request immediate rectification of any inaccurate or incomplete personal data we hold about you.
                                 </p>
                            </li>
                             <li>
                                 <p>Right to have your data erased: You may request the personal data to be erased when it is no longer needed, where applicable law obliges us to delete the data or the processing of it is unlawful. In the event you want your personal data to be erased, please send an email requesting the erasure at <a href="mailto:customer.support@health-e.in">customer.support@health-e.in</a>.
                                 </p>
                            </li>
                             <li>
                                 <p>
                                     Right to restrict data processing: You have the right to restrict the processing of your personal data in specific circumstances.
                                 </p>
                            </li>
                             <li>
                                 <p>
                                     Right to data portability: You have the right to receive your personal data in a structured, machine-readable format for your own purposes, or to request us to share it with a third party.
                                 </p>
                            </li>
                             <li>
                                 <p>
                                     Right to object to data processing: You have the right to object to our processing of your personal data, where we rely on our legitimate interests, as the basis for our processing, where your data protection rights outweigh our reasoning for legitimate interests.
                                 </p>
                            </li>
                             <li>
                                 <p>
                                     Right to withdraw consent: Where Hfiles has asked for your consent to process personal data, you may withdraw your consent at any point of time. The withdrawal of consent will not affect the lawfulness of processing based on consent before its withdrawal.
                                     <br />
                                     Right to be informed about how the data is used which is being collected from you;
                                 </p>
                            </li>
                             <li>
                                 <p>
                                     Cookies
                                 </p>
                            </li>
                            <p><strong>Cookies are data files that are placed on your computer or mobile device when you first visit a website or page. They contain information</strong></p>

                             <p><strong>created by a web server, such as IP address, operating system, referring URL that can be stored on a user's hard disk for use during a session or for future use. Our cookies are session cookies which are only stored temporarily and are deleted from the user’s device when the browser is closed.</strong></p>
                            
                             <p><strong>Hfiles uses cookies to provide you with the best browsing experience on the site and to improve speed/security. We do not use cookies to collect any personal data from you, or to pass data on to a third party, without your permission.</strong></p>
                            
                             <p><strong>If your browser enables the use of cookies, we take this, and your continued use of our site as acceptance of our use of cookies. If you do not wish to accept the use of cookies, please go to your browser settings to restrict or block the use of cookies set by our website.</strong></p>

                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">10 .Privacy policies of other websites</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                    Hfiles, may contain links to external sites. These external sites will have their own privacy policies, and Hfiles holds no direct or indirect responsibility for the privacy policies and/or practices or the content of such third-party websites.
                                </strong>
                            </p>
                            
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">11 .Disclosure</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                   Hfiles will not rent or sell your personal data to any individual or entity. We will not disclose your personal data to third parties, except as required in the course of providing our services or for purposes as described above.
                                </strong>
                            </p>
                             <p>
                                 <strong>
                                    Other than to contractors, medical practitioners associated with Hfiles and affiliated organizations, we disclose personal data only in response to a subpoena, court order or other governmental request or when we believe in good faith that disclosure is reasonably necessary to protect the property or rights of Hfiles, third parties or the public health or interest at large.
                                 </strong>
                            </p>

                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">12 .Changes to our privacy policy</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                   Changes to our privacy policy will be made occasionally in line with any changes to data protection law. We encourage you to regularly check this notice on our website for updates.
                                </strong>
                            </p>
                        </ol>
                    </div>
                    
                    <div class="desc-heading">
                        <h4 class="fw-bolder">How to contact us?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                    If you want to access your personal data, make use of any of your other rights mentioned above or if you have any questions or concerns about how Hfiles processes your personal data, please contact us via your registered email or in writing to the:
                                </strong>
                            </p>
                        </ol>
                    </div>
                    <div class="desc-heading">
                        <h4 class="fw-bolder">How to make a complaint and contact the appropriate authorities?</h4>
                    </div>
                    <div class="px-2">
                        <ol>
                            <p>
                                <strong>
                                   If you have any concerns about how Hfiles uses and stores your personal data, please contact us in the first instance, so that, we can address and rectify the issue.
                                </strong>
                            </p>
                             <p>
                                 <strong>
                                    Should you not be satisfied with our response or believe we are processing your personal data against the law, you may also have the right to file a complaint with the Data Privacy Authority in your country of residence or work, or seek a remedy through the Courts where you believe an infringement of data privacy laws may have taken place.
                                 </strong>
                            </p>
                              <p>
                                  <strong>
                                     It is exclusive property of “Hfiles”. No part of the same can be reproduced, copied, shared, altered, photocopied, etc., in any direct or indirect manner whether directly or indirectly.
                                  </strong>
                            </p>

                        </ol>
                    </div>

                </div>--%>


                    <%-- NEw Policy --%>
                    <div class="desciption">
                        <p>HFILES PRIVACY POLICY</p>
                        <p>This Privacy Policy pertains and regulates the access and use of the website <a href="http://hfiles.in/">http://hfiles.in/</a> which is operated and owned by HEALTH FILES MEDICO PRIVATE LIMITED.</p>
                        <p>This Privacy Policy outlines the procedures and protocols employed by the website <a href="http://hfiles.in/">http://hfiles.in/</a> in managing and handling personal and usage information of users (referred to as You or User), in compliance with the relevant laws and regulations of India. The Privacy Policy is subject to modifications at the discretion of HEALTH FILES MEDICO PRIVATE LIMITED without prior notice. Any alterations to the Privacy Policy will be communicated to all account holders of <a href="http://hfiles.in/">http://hfiles.in</a>. The Privacy Policy for <a href="http://hfiles.in/">http://hfiles.in</a> has been designed to be straightforward and informative, detailing the collection of personal and usage information from users. Users who may not be familiar with certain technical terms are encouraged to review the key terms provided.</p>
                        <ol type="1">
                        <li><p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> permits users to navigate its content without requiring registration. Consequently, it does not collect any identifiable personal data such as names, phone numbers, or email addresses that could be used to distinguish individuals.</p></li>
                        <li><p>If the user desires to register for an account on the website <a href="http://hfiles.in/">http://hfiles.in/</a>, they are required to furnish their full name, personal mobile number, and email address.</p></li>
                        <li><p>The <a href="http://hfiles.in/">http://hfiles.in/</a> Portal gathers data including Internet Protocol (IP) Addresses, Domain name, Browser type, Operating System, Date and Time of the visit, Pages visited, Referring URLs, among other information. It is important to note that there is no intention to correlate this data with the identities of individuals visiting the portal, unless there is an unlawful attempt to breach the <a href="http://hfiles.in/">http://hfiles.in/</a> service, privacy policy, or violate the provisions of the Information Technology Act, 2000, or any current Rules, Legislation of India.</p></li>
                        <li><p>The <a href="http://hfiles.in/">http://hfiles.in/</a> System utilizes cookies to store temporary session data aiming to enhance user experience and customize preferences. It is important to note that only temporary cookies are employed, and users have the ability to manage cookie settings through their web browser or other tools. Disabling cookies may disrupt the continuity of the <a href="http://hfiles.in/">http://hfiles.in/</a> session. Users are recommended to log out after each session to mitigate potential misuse of cookie data.</p></li>
                        <li><p>The <a href="http://hfiles.in/">http://hfiles.in/</a> System ensures the confidentiality of user information, specifically details obtained during registration, by refraining from sharing or disclosing such data to any party, be it an individual or an organization, unless mandated by legal requirements or explicitly authorized by the account holder.</p></li>
                        <li><p>Account holders of <a href="http://hfiles.in/">http://hfiles.in/</a> retain the autonomy to voluntarily share their uploaded documents or URIs with any party, whether an individual or an organization, by providing explicit consent. It is important to note that the responsibility for sharing documents with requesters or other entities rests solely with the user, as the <a href="http://hfiles.in/">http://hfiles.in/</a> system primarily serves as a platform for facilitating document sharing.</p></li>
                        <li><p>The individual holding the account on <a href="http://hfiles.in/">http://hfiles.in/</a> is accountable for all self-uploaded documents. It is prohibited for the account holder to share or engage in any activities that contravene the terms and conditions, privacy policy, or regulations outlined in the Information Technology Act, 2000, or any other prevailing legislation.</p></li>
                        <li><p>Collected personal and usage data may be disclosed to third-party organizations by HEALTH FILES MEDICO PRIVATE LIMITED if there is a genuine belief that such action is necessary to comply with regulations, legal proceedings, or official government requests; adhere to relevant laws; identify, prevent, or resolve instances of fraud, security breaches, or technical problems; or safeguard the rights, assets, or well-being of <a href="http://hfiles.in/">http://hfiles.in/</a>, other users, or the general public as mandated or permitted by laws of India.</p></li>
                        <li><p>The personally identifiable information submitted on the <a href="http://hfiles.in/">http://hfiles.in/</a> Portal/Website is not sold or shared with any third party, whether public or private, except as outlined in the aforementioned conditions. Any data provided to this website will be safeguarded against loss, unauthorized access, disclosure, alteration, or destruction to a reasonable extent.</p></li>
                       </ol>

                    </div>
                    <!-- <div class="agree">
        <input type="checkbox"> <label for="">I Agree</label>
    </div> -->
                </div>

            </div>
        </div>

        <img class="blue_trangle_bottom_right" src="../Terms & Conditions/blue-trangle4.png" alt="">
        <img class="blue_trangle_right" src="../Terms & Conditions/blue-trangle3.png" alt="">
        <img class="blue_trangle_bottom_left" src="../Terms & Conditions/blue-trangle5.png" alt="">
        <img class="plus_bottom_right" src="../Terms & Conditions/plus-2.png" alt="">
    </div>
</asp:Content>
