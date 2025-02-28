<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="hfiles.FAQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5 py-5 common-design">
            <img class="blue-trangle-top-left" src="../assets/blue-trangle.png" alt="">
            <img class="blue-trangle-top-right" src="../assets/blue-trangle.png" alt="">
            <img class="plus-top-left" src="../assets/plus-1.png" alt="">
            <a class="back-arrow-btn" href="javascript: history.go(-1)">
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
                                    <strong>5 members and 2 pets can be added, if not pets then just 5 members.</strong>
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
                                    <strong>A total of 500 MB disk space is allocated for an individual with free account.</strong>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
