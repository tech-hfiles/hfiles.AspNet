<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="Membershipcard.aspx.cs" Inherits="hfiles.Membershipcard" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
                @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

                .accordion-button.collapsed::after {
                    background-image: url( "data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='white'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>" );
                }

                .accordion-button:not(.collapsed)::after {
                    background-image: url( "data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='white'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>" );
                }

                .accordion-button::after {
                    margin-left: 10px;
                }

                .accordionbutton {
                    background-color: #0331b5 !important;
                    color: #ffd101 !important;
                    border-radius: 9px !important;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
                    height: 50px;
                    /* width: auto; */
                    padding: 10px 15px;
                }

                accordion-button:not(.collapsed) {
                    background-color: #0331b5 !important;
                    color: #ffd101 !important;
                }

                .right-align {
                    display: block;
                    text-align: left;
                    /*                    padding-left: 15px;
                    padding-top: 10px;*/
                    font-weight: 500;
                    font-family: 'Poppins', sans-serif;
                    font-size: 16px;
                    text-decoration: underline !important;
                    color: #0331B5;
                    letter-spacing: 1px;
                    margin-top: 5px;
                }

                .membership-container {
                    display: grid;
                    grid-template-columns: 1fr; /* Mobile: 1 column by default */
                    gap: 1rem;
                    padding-bottom: 50px;
                }



                .accordion-item span {
                    font-family: 'Montserrat', sans-serif;
                    color: black;
                    font-size: 18px;
                    font-weight: 600;
                }

                .accordian-divider {
                    height: 1px;
                    background-color: black;
                    max-width: 100%;
                    margin-bottom: 11px;
                    margin-top: 5px;
                }

                .accordion-item {
                    display: flex;
                    flex-direction: column;
                    outline: none;
                    border: none;
                }

                .card-header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

                .fa-chevron-up {
                    display: none;
                }

                .edit-button {
                    display: none;
                }

                .fade-in {
                    animation: slideFadeIn 0.5s ease-in-out forwards;
                }

                .fade-out {
                    animation: slideFadeOut 0.5s ease-in-out forwards;
                }


                .back-arrow-btn-2 {
                    position: absolute;
                    /*color: #333333;*/
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 5px;
                    padding: 5px 20px;
                    border-radius: 50px;
                    border: 0;
                    outline: 0;
                    cursor: pointer;
                    margin-top: 3px !important;
                    font-family: 'Red Hat Display', Sans-serif !important;
                    font-weight: 700;
                    font-size: 15px;
                }

                .membership-card h1{
                    font-family: 'Poppins', sans-serif;
                }

                @keyframes slideFadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(-5px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                @keyframes slideFadeOut {
                    from {
                        opacity: 1;
                        transform: translateY(0);
                    }

                    to {
                        opacity: 0;
                        transform: translateY(-5px);
                    }
                }


                @keyframes slideFadeOut {
                    from {
                        opacity: 1;
                        transform: translateY(0);
                    }

                    to {
                        opacity: 0;
                        transform: translateY(-5px);
                    }
                }

                .display-image {
                    display: none;
                }

                .membership-card {
                    display: flex;
                    flex-direction: column;
                    gap: 10px;
                    margin: 0 20px;
                    background: linear-gradient(180deg, #FFFFFF 7%, #CAE5FF 85%);
                    border-radius: 25px;
                    padding: 10px;
                }

                    .membership-card h1 {
                        margin: 0;
                    }

                    .membership-card span {
                        font-family: 'Poppins', sans-serif;
                        font-size: 14px;
                    }

                .card-box {
                    display: flex;
                    flex-direction: column;
                    gap: 30px;
                }


                @media (min-width: 768px) {
                    .display-image {
                        display: block !important;
                    }

                    .edit-button {
                        display: block !important;
                    }

                    .membership-container {
                        grid-template-columns: repeat(2, 1fr);
                    }

                        .membership-container > .accordion-item:last-of-type:nth-child(odd) {
                            display: grid;
                            grid-column: 1 / -1;
                            justify-self: center;
                        }


                    .accordian-divider {
                        height: 1.5px;
                        max-width: 90%;
                        margin: 0 auto 20px auto;
                    }

                    .accordian-card {
                        box-shadow: 0px 9px 10px 5.5px #00000014;
                        padding: 10px 15px 15px 15px;
                        border-radius: 30px;
                        width: 93%;
                    }

                    .accordion-item span {
                        font-size: 20px;
                    }

                    .right-align {
                        padding-left: 15px;
                        padding-top: 10px;
                        font-size: 18px;
                    }

                    .fa-chevron-down {
                        display: none !important;
                    }

                    .fa-chevron-up {
                        display: none !important;
                    }

                    .card-header {
                        display: block !important;
                    }

                    .fade-in {
                        animation: none;
                    }

                    .fade-out {
                        animation: none;
                    }

                    .back-arrow-btn-2 {
                        gap: 10px;
                    }

                    .membership-card {
                        padding: 20px 0;
                    }

                        .membership-card span {
                            font-size: 19px;
                        }
                }

                @media (min-width: 1024px) {

                    .accordion-item span {
                        font-family: 'Poppins', sans-serif;
                        font-size: 24px;
                    }

                    .membership-container {
                        grid-template-columns: repeat(3, 1fr);
                        gap: 1rem;
                    }

                    .membership-card {
                        padding: 25px 0;
                    }

                        .membership-card span {
                            font-size: 21px;
                        }
                }
            </style>

            <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
                <a class="back-arrow-btn-2" href="dashboard.aspx">Back to Home
                </a>
            </div>

            <div style="text-align: center; max-width: 100%; margin-top: 5vh; padding-bottom: 10vh;" class="card-box">
                <div class="membership-card" style="display: flex; justify-content: center">
                    <h1 style="font-weight: bold; color: #0331b5">Membership Card</h1>
                    <span>View yours and your Family’s Membership cards here</span>
                </div>
                <div class="membership-container" style="width: 100%; max-height: 65vh; padding: 0 20px;">
                    <!-- Static Accordion Item -->
                    <div class="accordion-item">
                        <%-- <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed accordionbutton" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                My Card
            </button>
        </h2>--%>
                        <div class="card-header">
                            <span>My Card</span> <i class="fa-solid fa-chevron-down toggle-down"></i><i class="fa-solid fa-chevron-up toggle-up"></i>
                        </div>
                        <div class="accordian-card">
                            <div class="accordian-divider"></div>
                            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                </div>

                            </div>
                            <asp:Image ID="membershipImageAccount" runat="server" AlternateText="MembershipCard" class="responsive-image display-image" />
                        </div>
                    </div>




                    <!-- Dynamic Accordion Items -->
                    <asp:Repeater ID="rptUsers" runat="server">
                        <ItemTemplate>
                            <div class="accordion-item">
                                <%--<h2 class="accordion-header" id="heading<%# Eval("user_id") %>">
                        <button class="accordion-button accordionbutton collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapse<%# Eval("user_id") %>" aria-expanded="false"
                                aria-controls="collapse<%# Eval("user_id") %>">
                            <%# Eval("user_firstname") %> 
                        </button>
                    </h2>--%>
                                <div class="card-header">
                                    <span id="heading<%# Eval("user_id") %>"><%# Eval("user_firstname") %>'s Card</span> <i class="fa-solid fa-chevron-down toggle-down"></i><i class="fa-solid fa-chevron-up toggle-up"></i>
                                </div>
                                <div class="accordian-card">
                                    <div class="accordian-divider"></div>
                                    <div id="collapse<%# Eval("user_id") %>" class="accordion-collapse collapse"
                                        aria-labelledby="heading<%# Eval("user_id") %>"
                                        data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                        </div>

                                    </div>
                                    <img id='membershipImageAccount<%# Eval("user_id") %>' src='<%# Eval("user_image") %>' class="responsive-image display-image" />
                                </div>
                                <asp:LinkButton ID="LinkButtonEdit" runat="server" Text="Edit" OnClick="LinkButtonEdit_Click" CommandArgument='<%# Eval("user_id") %>' CssClass="right-align edit-button">
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                     <!-- Dynamic Accordion Items -->
 <asp:Repeater ID="Repeater1" runat="server">
     <ItemTemplate>
         <div class="accordion-item">
             <%--<h2 class="accordion-header" id="heading<%# Eval("user_id") %>">
     <button class="accordion-button accordionbutton collapsed" type="button" data-bs-toggle="collapse"
             data-bs-target="#collapse<%# Eval("user_id") %>" aria-expanded="false"
             aria-controls="collapse<%# Eval("user_id") %>">
         <%# Eval("user_firstname") %> 
     </button>
 </h2>--%>
             <div class="card-header">
                 <span id="heading<%# Eval("user_id") %>"><%# Eval("user_firstname") %>'s Card</span> <i class="fa-solid fa-chevron-down toggle-down"></i><i class="fa-solid fa-chevron-up toggle-up"></i>
             </div>
             <div class="accordian-card">
                 <div class="accordian-divider"></div>
                 <div id="collapse<%# Eval("user_id") %>" class="accordion-collapse collapse"
                     aria-labelledby="heading<%# Eval("user_id") %>"
                     data-bs-parent="#accordionFlushExample">
                     <div class="accordion-body">
                     </div>

                 </div>
                 <img id='membershipImageAccount<%# Eval("user_id") %>' src='<%# Eval("user_image") %>' class="responsive-image display-image" />
             </div>
             <asp:LinkButton ID="LinkButtonEdit" runat="server" Text="Edit" OnClick="LinkButtonEdit_Click" CommandArgument='<%# Eval("user_id") %>' CssClass="right-align edit-button">
             </asp:LinkButton>
         </div>
     </ItemTemplate>
 </asp:Repeater>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="MemberSelect" class="form-label">Select Blood Group</label>
                                        <asp:DropDownList ID="DropDownbloodgrp" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Blood Group" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="A+" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="A-" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="B+" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="B-" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="AB+" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="AB-" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="O+" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="O-" Value="8"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                    <div class="mb-3" style="border-radius: 14px">
                                        <label for="Emergency" class="form-label">Emergency Contact</label>
                                        <asp:TextBox ID="txtEmerContact" runat="server" CssClass="form-control" placeholder="Enter Contact No." Style="border-radius: 15px;"></asp:TextBox>
                                        <asp:CustomValidator ID="cvEmerContact" runat="server" ControlToValidate="txtEmerContact"
                                            ClientValidationFunction="validatePhoneNumber"
                                            ForeColor="Red" ErrorMessage="Please enter a valid 10-digit phone number."
                                            ValidationGroup="phoneValidation" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:LinkButton ID="lbtnSave" runat="server" OnClick="lbtnSave_Click" Text="Save" CssClass="btn btn-primary" ValidationGroup="phoneValidation"></asp:LinkButton>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        var isToastrCalled = false;

                        function showToastr(type, message) {
                            if (isToastrCalled) return;  // Prevent showing toastr multiple times
                            isToastrCalled = true;  // Set the flag to true once toastr is shown

                            if (type === 'success') {
                                toastr.success(message);
                            } else if (type === 'error') {
                                toastr.error(message);
                            }

                            // Optional: Reload page after toastr message

                        }
                    </script>
                    <script type="text/javascript">
                        // Client-side validation function
                        function validatePhoneNumber(sender, args) {
                            var phoneNumber = args.Value;

                            // Check if the phone number is exactly 10 digits
                            var phonePattern = /^[0-9]{10}$/;

                            // Validate phone number using regex pattern
                            if (phonePattern.test(phoneNumber)) {
                                args.IsValid = true; // Validation passed
                            } else {
                                args.IsValid = false; // Validation failed
                            }
                        }
                    </script>


                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            var accordions = document.querySelectorAll(".accordion-collapse");
                            accordions.forEach(function (accordion) {
                                new bootstrap.Collapse(accordion, { toggle: false });
                            });

                    </script>

                </div>
                <script>
                            $(document).ready(function () {
                                setTimeout(() => {
                                    var masterImage = document.getElementById('<%= Master.FindControl("membershipImage").ClientID %>');
                                    var childImage = document.getElementById('ContentPlaceHolder1_membershipImageAccount');

                                    if (masterImage && childImage) {
                                        // Set the Master Page image src to the Child Page image
                                        childImage.src = masterImage.src;
                                    }
                                }, 500);
                            });

   </script>

                <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                //if (window.innerWidth < 768) {
                                const headers = document.querySelectorAll(".card-header");

                                let currentOpen = null; // Variable to track the currently open section

                                headers.forEach(header => {
                                    const down = header.querySelector(".toggle-down");
                                    const up = header.querySelector(".toggle-up");
                                    const image = header.parentElement.querySelector(".display-image");
                                    const edit = header.parentElement.querySelector(".edit-button");

                                    // Function to close the currently open section
                                    function closeCurrentOpen() {
                                        if (currentOpen) {
                                            const currentDown = currentOpen.querySelector(".toggle-down");
                                            const currentUp = currentOpen.querySelector(".toggle-up");
                                            const currentImage = currentOpen.parentElement.querySelector(".display-image");
                                            const currentEdit = currentOpen.parentElement.querySelector(".edit-button");

                                            currentImage.classList.remove("fade-in");
                                            currentImage.classList.add("fade-out");
                                            currentImage.addEventListener("animationend", function handler() {
                                                currentImage.style.display = "none";
                                                currentImage.removeEventListener("animationend", handler);
                                            });

                                            if (currentEdit) {
                                                currentEdit.classList.remove("fade-in");
                                                currentEdit.classList.add("fade-out");
                                                currentEdit.addEventListener("animationend", function handler() {
                                                    currentEdit.style.display = "none";
                                                    currentEdit.removeEventListener("animationend", handler);
                                                });
                                            }

                                            currentUp.style.display = "none";
                                            currentDown.style.display = "inline-block";
                                        }
                                    }

                                    down.addEventListener("click", () => {
                                        // Close the currently open section before opening the new one
                                        closeCurrentOpen();

                                        // Now open the clicked section
                                        image.style.display = "block";
                                        image.classList.add("fade-in");
                                        image.classList.remove("fade-out");

                                        down.style.display = "none";
                                        up.style.display = "inline-block";

                                        if (edit) {
                                            edit.style.display = "inline-block";
                                            edit.classList.add("fade-in");
                                            edit.classList.remove("fade-out");
                                        }

                                        // Update the currently open section to the one that was clicked
                                        currentOpen = header;
                                    });

                                    up.addEventListener("click", () => {
                                        // Close the currently open section
                                        closeCurrentOpen();

                                        currentOpen = null; // No section is open now
                                    });
                                });
                                //}
                            });


                </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
