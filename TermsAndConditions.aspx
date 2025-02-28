<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="TermsAndConditions.aspx.cs" Inherits="hfiles.TermsAndConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../style2.css" />
    <title>T&C</title>
    <style>
        h1 {
            text-align: center;
            color: #333;
        }
        h2{
            color:#0331b5;
        }
        p {
            font-size:16px;
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
            /* color: #0512b9; */
            padding: 5px 20px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: #0512b9;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 700;
            font-size: 16px;
            background-color: #fdd001;
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

        @media (max-width:940px) {
            .footer {
                position: fixed;
            }
        }

        @media (min-width: 1600px) and (max-width: 1920px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0;
            }
        }

        @media (min-width: 1280px) and (max-width: 1600px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0;
            }

            .privacy_main .blue_trangle_bottom_right {
                position: absolute;
            }

            .privacy_main {
                height: 88vh;
            }
        }

        @media (min-width: 1022px) and (max-width: 1024px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0;
            }

            .privacy_main .blue_trangle_bottom_right {
                position: absolute;
            }

            .privacy_main {
                height: 88vh;
            }
        }

        @media (min-width: 768px) and (max-width: 992px) {
            .footer {
                position: absolute;
                width: 100%;
                bottom: 0;
            }

            .privacy_main .blue_trangle_bottom_right {
                /*                position: absolute;
*/ bottom: 0 !important;
            }
        }

        @media (min-width: 912px) and (max-height: 1368px) {
            .privacy_main .blue_trangle_bottom_right {
                position: absolute;
                bottom: 0 !important;
            }
        }

        @media (min-width: 1024px) and (max-height: 600px) {
            .privacy_main .inner_div .desciption {
                max-height: 70%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="privacy_main h-100vh h-xl-90vh">

        <img class="blue_trangle_top_left" src="../Terms & Conditions/blue-trangle1.png" alt="">
        <img class="blue_trangle_top_right" src="../Terms & Conditions/blue-trangle2.png" alt="">
        <img class="plus_top_left" src="../Terms & Conditions/plus-1.png" alt="">

        <a class="back-arrow-btn" href="javascript: history.go(-1)">Back</a>

        <div class="mt-5 mt-lg-0" style="height: 90%;">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="inner_div">
                    <div class="heading">
                        <h1 class="fw-bolder">Terms of Services</h1>
                    </div>
                    <div class="desciption">
                        <p>The Terms of Services outlined in this document regulate the utilization of the online portal located at <a href="http://hfiles.in/">http://hfiles.in/</a> hereinafter referred to as the 'Site' which is owned developed and operated by HEALTH FILES MEDICO PRIVATE LIMITED. The Content on the Site including data text designs graphics articles blogs user interfaces images trademarks and code is the exclusive property of HEALTH FILES MEDICO PRIVATE LIMITED. By accessing or using the Site you are explicitly agreeing to abide by these Terms which may be revised periodically. It is assumed that you have the necessary authorization to accept these Terms on behalf of yourself a company or any other relevant entity. Failure to agree with any aspect of these Terms prohibits the use of the Site. This Agreement along with associated Terms and referenced documents constitutes the complete agreement between the user and <a href="http://hfiles.in/">http://hfiles.in/</a> and HEALTH FILES MEDICO PRIVATE LIMITED concerning the Site overriding any prior agreements whether written or oral regarding the use of <a href="http://hfiles.in/">http://hfiles.in/</a>.</p>

                        <h2>Description of Service</h2>
                        <p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> serves as an online platform designed for the storage and sharing of personal and family medical documents reports and records. Users are provided with a personal cloud space within their account to securely store these medical files medical records. Key functionalities of the website include document storage and accessibility from any location at any time. Access to <a href="http://hfiles.in/">http://hfiles.in/</a> is available to individuals who create an account using their mobile numbers or email addresses.</p>

                        <h2>Ownership of Content and Licence</h2>
                        <p>When user/ subscriber utilizing the website users are required to submit various types of information such as files documents certifications and medical records. By using the platform users authorize the storage of their documents and information in their <a href="http://hfiles.in/">http://hfiles.in/</a> account. Access to these documents is restricted unless explicitly shared with others. Users are granted a limited revocable non-exclusive non-sublicensable and non-transferable license to utilize the services provided by the website subject to compliance with the terms and conditions outlined. Any violation of these terms may lead to the termination of the user's account. Users retain intellectual property rights over the content they upload share or store on the platform. The website does not claim ownership of user content but requires legal permissions known as a license to utilize the content for hosting and backup purposes to enhance the products and services offered. This license ceases to exist once the user's content is removed from the site. Users are accountable for the content they share and the ensuing consequences. While the website does not actively screen content it reserves the right to reject or delete any content or account that is deemed unlawful offensive threatening violent defamatory pornographic or in violation of the website's terms of service privacy policy or the intellectual property rights of other users or parties.</p>

                        <h2>Account Security and Consent</h2>
                        <p>In order to utilize the services provided by <a href="http://hfiles.in/">http://hfiles.in/</a> it is necessary to create an account. Users bear the responsibility of safeguarding the confidentiality of their account information such as passwords and are accountable for any actions conducted under their account due to negligence in maintaining the security of this information. When registering an account on <a href="http://hfiles.in/">http://hfiles.in/</a> individuals are required to provide their mobile number and email address.</p>

                        <h2>Disclaimer</h2>
                        <p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> has been developed with a focus on ensuring high availability functionality testing and security auditing conducted by an authorized agency. However it does not guarantee that the Site its content services or features will be free of errors uninterrupted or completely secure. Additionally there is no assurance that any product service information or material obtained through the Site will meet user expectations achieve desired outcomes be compatible with other software or systems unless explicitly stated in the specifications. The Site and its content are provided on an 'as-is' and 'as-available' basis with all information subject to change without prior notice. The website explicitly disclaims all warranties whether express or implied including accuracy non-infringement merchantability and fitness for a specific purpose.</p>

                        <h2>Limitation on Liability</h2>
                        <p>It is explicitly acknowledged and agreed that under no circumstances will <a href="http://hfiles.in/">http://hfiles.in/</a> operated by HEALTH FILES MEDICO PRIVATE LIMITED be held liable for any costs losses or damages including but not limited to indirect consequential exemplary or incidental losses or damages or any expenses losses or damages whatsoever resulting from the utilization or inability to use data arising from or in relation to the use of <a href="http://hfiles.in/">http://hfiles.in/</a>.</p>

                        <h2>Indemnity</h2>
                        <p>In agreeing to the terms outlined by <a href="http://hfiles.in/">http://hfiles.in/</a> you are consenting to assume responsibility for defending indemnifying and absolving <a href="http://hfiles.in/">http://hfiles.in/</a> and its associated entities including its officers directors employees and agents from any claims damages obligations losses liabilities debts and expenses (inclusive of legal fees) that may arise from the following circumstances:</p>
                        <ul>
                            <li>Your utilization of and interaction with the Site and its services.</li>
                            <li>Your breach of any provision within this Agreement.</li>
                            <li>Your infringement upon any rights held by a third party encompassing but not limited to copyright property or privacy rights.</li>
                            <li>Any assertions that your User Content has caused harm to a third party.</li>
                        </ul>

                        <h2>Limitation on Use</h2>
                        <p>The platform located at <a href="http://hfiles.in/">http://hfiles.in/</a> is designated for personal use exclusively and should not be utilized for commercial purposes. Users are prohibited from engaging in activities such as decompiling reverse engineering renting leasing selling sublicensing copying modifying reproducing republishing distributing displaying or creating derivative works from the website. Additionally the use of network monitoring or discovery software to analyze the site's architecture or extract information regarding usage individual identities or users is strictly forbidden. Prior written consent is required from <a href="http://hfiles.in/">http://hfiles.in/</a> to employ any robot spider automatic software or device or manual process for monitoring or duplicating content from the website. Unauthorized utilization of <a href="http://hfiles.in/">http://hfiles.in/</a> is not allowed. The use of software tools (e.g. bots scraper tools) or other automatic devices to access monitor or duplicate website pages is prohibited unless explicitly authorized in writing by <a href="http://hfiles.in/">http://hfiles.in/</a>. Users are not permitted to exploit the Site or any Content for unlawful purposes or activities that contravene the Terms of Use or to solicit engagement in illegal activities or actions that violate the rights of <a href="http://hfiles.in/">http://hfiles.in/</a> or others.</p>

                        <h2>Right to Modify or Terminate</h2>
                        <p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> retains the authority to alter or cease the Service either temporarily or permanently at any given time with or without prior notification. The website <a href="http://hfiles.in/">http://hfiles.in/</a> also holds the discretion to suspend or end any user account and deny present or future access to the platform for any cause at any time. Consequently such termination could lead to the deactivation or removal of the account resulting in the loss of all content stored within it.</p>

                        <h2>Translations</h2>
                        <p>Translations available on the <a href="http://hfiles.in/">http://hfiles.in/</a> website are produced by third-party translators. While efforts have been made to ensure accuracy automated translations are not flawless and are not meant to replace human translation. These translations are offered as a convenience to users of the <a href="http://hfiles.in/">http://hfiles.in/</a> website and are provided on an "as is" basis. It should be noted that certain content such as images videos and Flash files may not be translated accurately. The website <a href="http://hfiles.in/">http://hfiles.in/</a> does not accept liability for any errors omissions or uncertainties in translations from English into other languages on the site. In case of any doubts regarding the accuracy of information in the translated version users are advised to consult the official English version of the website. Users are encouraged to contact the website administrators to report any translation errors or inaccuracies.</p>

                        <h2>Miscellaneous</h2>
                        <p>The website <a href="http://hfiles.in/">http://hfiles.in/</a> retains the authority to alter amend supplement or delete sections of the Terms of Use without prior written notification at its own discretion. Any modifications to these Terms will be promptly implemented and communicated by updating the website with the revised Terms and specifying the 'last updated date. Users are advised to regularly review the Terms of Use for any changes. By continuing to use the website after such revisions are posted users are deemed to have accepted the updated Terms.</p>

                        <h2>Jurisdiction</h2>
                        <p>These Terms will be regulated by and interpreted in accordance with Indian law. Any disagreement arising from these Terms will be subject to the exclusive jurisdiction of the courts situated in Mumbai Maharashtra.</p>
                    </div>
                    <%--<div class="agree">
                        <input id="agree" type="checkbox">
                        <label for="agree">I Agree to all the term and conditions.</label>
                    </div>--%>
                </div>

            </div>
        </div>
        <img class="blue_trangle_right" src="../Terms & Conditions/blue-trangle3.png" alt="">
        <img class="blue_trangle_bottom_right" src="../Terms & Conditions/blue-trangle4.png" alt="">
        <img class="blue_trangle_bottom_left" src="../Terms & Conditions/blue-trangle5.png" alt="">
        <img class="plus_bottom_right" src="../Terms & Conditions/plus-2.png" alt="">
    </div>

</asp:Content>
