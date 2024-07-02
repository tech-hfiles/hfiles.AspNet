<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="copyright.aspx.cs" Inherits="hfiles.copyright" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../style2.css" />
    <title>Privacy Policy</title>

    <style>
        h1 {
            text-align: center;
            color: #333;
        }
        h2{
            color:#0331b5;
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

        <img class="blue_trangle_top_left" src="../Terms & Conditions/blue-trangle1.png" alt="" />
        <img class="blue_trangle_top_right" src="../Terms & Conditions/blue-trangle2.png" alt="" />
        <img class="plus_top_left" src="../Terms & Conditions/plus-1.png" alt="" />

        <a class="back-arrow-btn" href="javascript: history.go(-1)"><%--<img src="../assets/back-arrow.png" alt="">--%>Back</a>

        <div class="mt-5 mt-lg-0" style="height: 90%;">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="inner_div">
                    <div class="heading">
                        <h1>Copyright Policy</h1>
                    </div>
                    <div class="desciption">
                        <p>Copyright laws protect all content on the <a href="http://hfiles.in/">http://hfiles.in/</a> website including text photos graphics articles blogs and multimedia. The copyright to all materials on this website unless otherwise indicated is owned by the HEALTH FILES MEDICO PRIVATE LIMITED. Users are free to use the material for non-commercial personal use as long as they give credit to the original author. It is completely forbidden to use reproduce or distribute our copyrighted content without permission.</p>

                        <h2>Content Contribution Moderation and Approval (CMAP) Policy</h2>
                        <p>The CMAP policy oversees the process of submitting reviewing and approving content on <a href="http://hfiles.in/">http://hfiles.in/</a> ensuring that users have access to reliable and high-quality information. Designated moderators assess submitted content to preserve compliance with defined criteria and approved content is then published for users ensuring it satisfies the platform's quality benchmarks.</p>

                        <h2>Content Archival (CAP) Policy</h2>
                        <p>The CAP policy monitors the systematic archiving of content in order to preserve historical records and assure information availability. Outdated or obsolete content is archived on a regular basis as determined by predetermined timetables. Critical content versions are archived for reference and audit reasons securely stored and available to authorized persons within a given term.</p>

                        <h2>Content Review (CRP) Policy</h2>
                        <p>The CRP describes the periodic review process used to verify the accuracy relevance and quality of content on <a href="http://hfiles.in/">http://hfiles.in/</a>. Regular assessments are performed on content to ensure that it is up to date modified or removed any outdated information. To maintain content quality authenticity and accuracy checks are performed and user feedback is taken into account to address problems or make necessary modifications.</p>

                        <h2>Hyperlinking Policy</h2>
                        <h3>Links to external websites/portals</h3>
                        <p>This page has links to other websites/portals in numerous locations. We've included these links for your convenience. The website <a href="http://hfiles.in/">http://hfiles.in/</a> does not necessarily support the opinions stated on linked websites and is not liable for their dependability or contents. It should not be inferred that the link's existence or listing on this page constitutes any form of endorsement. We cannot guarantee that these links will work all the time and we have no control over the availability of linked pages. The website <a href="http://hfiles.in/">http://hfiles.in/</a> disclaims any duty for any content or materials of third parties whether expressed or implied. You are responsible for assessing the risks involved in using any content including any reliance on its veracity comprehensiveness or utility.</p>

                        <h3>Links to “http://hfiles.in/” by other websites</h3>
                        <p>It is not against the law to create a link to any of the content hosted on our website as long as you notify us of any revisions or modifications. Any page or content hosted on this portal must open in a newly opened browser window for the user. It is strictly forbidden to host pages or content from this site in frames on your own website.</p>

                        <h2>Website Monitoring Plan</h2>
                        <p>For security reasons the website <a href="http://hfiles.in/">http://hfiles.in/</a> is continuously monitored. Regular vulnerability scans traffic analysis and threat tracking are all part of our monitoring strategy. We use strong security and privacy procedures to protect your personal information and any shared data because we value your privacy and data security.</p>

                        <h2>Contingency Management Plan</h2>
                        <p><a href="http://hfiles.in/">http://hfiles.in/</a> has a comprehensive contingency management plan in place to ensure the continuous availability of our services. This plan includes redundancy in the system data backup techniques and recovery procedures to reduce service interruptions in the case of unanticipated events. We promise to keep your papers and services accessible without interruption.</p>
                    </div>
                </div>
            </div>
        </div>

        <img class="blue_trangle_bottom_right" src="../Terms & Conditions/blue-trangle4.png" alt="">
        <img class="blue_trangle_right" src="../Terms & Conditions/blue-trangle3.png" alt="">
        <img class="blue_trangle_bottom_left" src="../Terms & Conditions/blue-trangle5.png" alt="">
        <img class="plus_bottom_right" src="../Terms & Conditions/plus-2.png" alt="">
    </div>
</asp:Content>
