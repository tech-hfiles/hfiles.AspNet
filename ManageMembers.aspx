<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true"  CodeBehind="ManageMembers.aspx.cs" Inherits="hfiles.ManageMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>

 
 <script type="text/javascript">
     function confirmDelete(userReference) {
         // Convert userReference to a number if needed
         userReference = parseInt(userReference);

         // Check if userReference is 0 (Independent Member)
         if (userReference === 0) {
             // Show a confirmation dialog for Independent Member
             var result = confirm("This will permanently delete the Independent Member and all associated Dependent Members. Do you want to proceed?");
         } else {
             // Default confirmation for Members
             var result = confirm("This will permanently delete Members.");
         }

         // Return true if the user clicks "OK", false if "Cancel"
         return result;
     }
</script>





    
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



        <style>
        .manage-members-div {
            max-width: 100% !important;
        }

        .container-search {
            width: 100%;
        }

        .list-unstyled {
            color: #000;
        }

        .back-arrow-btn-managem {
            padding: 5px 10px;
            border-radius: 50px;
            border: 0;
            outline: 0;
            color: #0512b9;
            cursor: pointer;
            margin-top: 20px;
            font-family: 'Red Hat Display', Sans-serif !important;
            font-weight: 600;
            font-size: 16px;
            background-color: #fdd001;
            margin: 1px 10px;
            /*top:10% !important;
        left:1% !important;
        margin-top: 0 !important;*/
        }

        .search-file {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

            .search-file i {
                margin-right: 10px;
            }

        .container-fluid {
            min-height: 90vh;
            /*            border-right:1px solid #000;
*/
        }

        .profile-card .btn-delete, .profile-card .btn-accept, .profile-card .btn-reject {
            border: none;
            border-radius: 10px;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
        }

        @media(max-width:540px) {
            .container-fluid {
                width: 100% !important;
                min-height: 50vh;
            }

            .search-file {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                margin: 10px 10px;
            }

            .manage-members-div {
                margin-top: 0 !important;
            }
            /*.back-arrow-btn {
                top: 8% !important;
            }*/


        }

        @media(width>540px) {

            /*.search-file input{
            justify-self:center !important;
            width:100% !important;
        }*/
        }

        @media (min-width:980px) and (max-width:1100px) {
            .back-arrow-btn {
                top: 7% !important;
            }

            .manage-members-div {
            }
        }
        //.access{
            color:blue;
        }
    </style>
   
   

  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:ScriptManager ID="scm1" runat="server"></asp:Scri ptManager>--%>
    <div class="container-search mt-3 w-100">
        <div class="row d-flex align-items-center w-100">
            <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
<a class="back-arrow-btn-2" href="avatar2.aspx" style="margin-left: 20px;">Back
 </a>

            </div>
            <div class="col-12 col-md-8 col-xl-6 search-file">
                <i class="fa-solid fa-magnifying-glass" style="position: absolute;"></i>
                <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" placeholder="Search member by Name" class="form-control" />
            </div>
        </div>
    </div>

    <div class="manage-members-div" style="display: flex; flex-direction: row-reverse;padding-bottom:10vh;">
        <%--<div class="row justify-content-center pt-5 m-0" style="min-height: 100vh">
             <div class="col-12 col-md-10 col-lg-10">--%>
        <div class="container-fluid w-50 justify-content-center">
            <h2 class="text-center heading my-3">Request List
            </h2>

            <div class="container-fluid member-cards ">
                <div class="row justify-content-center">
                    <asp:Repeater ID="rptRequests" runat="server">
                        <ItemTemplate>
                            <div class="profile-card">
                                <img class="members-image" src="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" alt="<%#Eval("user_firstname")  %>" class="img-fluid">
                                <h5 class="font-weight-bold text-primary u-name"><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                <ul class="list-unstyled text-left mx-auto" style="max-width: 280px;">
                                    <li><strong>HF - ID :</strong> <%# Eval("user_membernumber")%></li>
                                    <li><strong>Email:</strong> <%# Eval("user_email")%></li>
                                    <li><strong>Mobile No :</strong> <%# Eval("user_contact")%></li>
                                    <li runat="server" visible='<%# hfiles.DAL.validateInt(Eval("IsDependent")) == 1 ? true : false %>'><strong>Get access of: </strong><%# Eval("dependent_info")%></li>
                                    <asp:HiddenField ID="hfDependentUserId" runat="server" Value='<%# Eval("DependentUserId") %>' />
                                </ul>
                                <asp:LinkButton class="btn btn-accept" ID="LinkButton1" runat="server" Text="Accept" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" class="btn btn-reject" runat="server" Text="Reject" OnClick="rejectBtn_Click" CommandArgument='<%# Eval("sentby")%>'></asp:LinkButton>
                               
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <%-- <div class="col-12 col-md-4 col-xl-6 text-center py-3 search-file">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <asp:TextBox ID="SearchInput" OnTextChanged="SearchInput_TextChanged" AutoPostBack="true" runat="server" />
                </div>--%>
        <%--<asp:GridView ID="friendrequests" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="friendrequests_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                    <Columns>
                        <asp:TemplateField HeaderText="HFiles Number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerialNumber" runat="server" Text='<%#Eval("user_membernumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblHFilesNumber" Text='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="acceptBtn" runat="server" Text="Accept" OnClick="acceptBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="rejectBtn" runat="server" Text="Reject" OnClick="rejectBtn_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
        <asp:UpdatePanel ID="uplManageMembers" runat="server">
            <ContentTemplate>
                <div class="row">
                    <%-- <div class="col-md-4 col-lg-3 my-2">--%>

                    <%--  <h2 class="text-center heading mb-5">Requests </h2>--%>
                    <%-- <div class="col-md-4 my-2">
                                        <div class="card text-start px-3" style="height: 100%;">
                                            <a href='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' class="btn btn-sm btn-primary" style="align-self: center; height: 100px; object-fit: cover;">
                                            </a>
                                            <div class="card-body" style="align-self: center;">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>
                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
                                            </div>
                                        </div>
                                    </div>--%>
                    <%--<div class="card text-start px-3">
                                           
                                            <a href="<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>" target="_blank" style="align-self: center">
                                                <img src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>' class="card-img-top" alt='<%#Eval("user_firstname") + " " + Eval("user_lastname") %>' target="_blank" class="btn btn-sm btn-primary" style="align-self: center">
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>Name: </strong><%#Eval("user_firstname") + " " + Eval("user_lastname") %></h5>


                                                <asp:ImageButton CssClass="mx-3" ID="acceptBtn" runat="server" Text="Accept" ImageUrl="assets/select.png" OnClick="acceptBtn_Click" CommandArgument='<%# Eval("sentby")%>' />
                                                <asp:ImageButton ID="rejectBtn" CssClass="mx-3" runat="server" Text="Reject" OnClick="rejectBtn_Click" ImageUrl="assets/cancel-icon.png" Height="25px" Width="25px" />
</div>
                                        </div>--%>

                    <div>
                        <div class="">
                        </div>
                    </div>
</div>
               <div class="container-fluid member-cards">
    <div class="row justify-content-center gap-3">
        <h2 class="text-center heading my-3">Members List</h2>
        <asp:Repeater ID="gvMembers1" runat="server">
            <ItemTemplate>
                <div class="profile-card">
                    <!-- Profile Image -->
                    <img class="members-image" src='<%# ResolveUrl(string.Format("~/upload/{0}", string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : Eval("user_image"))) %>'
                        alt="<%# Eval("user_firstname") %>" class="img-fluid" />

                    <h5 class="font-weight-bold u-name">
                        <%# Eval("user_firstname") + " " + Eval("user_lastname") %>
                    </h5>
                    <ul class="list-unstyled text-left mx-auto">
                        <li><strong>HF - ID :</strong> <%# Eval("user_membernumber") %></li>
                        <li><strong>Email:</strong> <%# Eval("user_email") %></li>
                        <li><strong>Mobile No :</strong> <%# Eval("user_contact") %></li>
                    </ul>

                 <%--   <asp:LinkButton ID="LinkButtonEdit" class="btn btn-primary" runat="server" Text="Edit" OnClick="editBtn_Click" CommandArgument='<%# Eval("user_id") %>'></asp:LinkButton>--%>

                    <asp:LinkButton ID="LinkButtonEdit" class="btn btn-primary" runat="server" Text="Edit" OnClick="editBtn_Click" CommandArgument='<%# Eval("user_id") %>' Visible='<%# Convert.ToInt32(Eval("User_Reference")) != 0 %>'>
                             </asp:LinkButton>




                    <asp:LinkButton ID="lbtnRemove" class="btn btn-delete" runat="server" OnClick="lbtnRemove_Click"
                        OnClientClick='<%# "return confirmDelete(" + Eval("User_Reference") + ");" %>' Text="Delete"
                        CommandArgument='<%# Eval("user_id") + "|" + Eval("user_relation") + "|" + Eval("DependentUserId") + "|" + Eval("User_Reference") %>'>
                    </asp:LinkButton>
                   
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</div>



                <%--<asp:GridView ID="gvMembers" runat="server" CssClass="table table-bordered manage-members-table" AutoGenerateColumns="false" OnRowDataBound="gvMembers_RowDataBound" AlternatingRowStyle-BackColor="Wheat">
                 <Columns>
                     <asp:TemplateField HeaderText="Serial Number">
                         <ItemTemplate>
                             <asp:Label ID="lblSerialNumber" runat="server"></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="HFiles Number">
                         <ItemTemplate>
                             <asp:Label ID="lblHFilesNumber" Text='<%#Eval("user_membernumber") %>' runat="server"></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Image">
                         <ItemTemplate>
                             <asp:Image ID="profileImage" runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("user_image").ToString()) ? "../My Data/default-user-profile.png" : "~/upload/" + Eval("user_image") %>' Height="50px" Width="50px"></asp:Image>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Full Name">
                         <ItemTemplate>
                             <asp:Label ID="lblFullname" Text='<%#Eval("user_firstname") %>' runat="server"></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Email ID">
                         <ItemTemplate>
                             <asp:Label ID="lblEmail" Text='<%#Eval("user_email") %>' runat="server"></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Contat No.">
                         <ItemTemplate>

                             <asp:Label ID="lblContact" Text='<%#Eval("user_contact") %>' runat="server"></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Actions">
                         <ItemTemplate>
                             <%-- <asp:LinkButton ID="LbtnEdit" runat="server" OnClick="LbtnEdit_Click" CommandArgument='<%#Eval("user_id") %>'>
                         <i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i>
                     </asp:LinkButton>--%>
 <%--<a href='<%# "addmember.aspx?UserId=" + Eval("user_id") %>'>
                         <i class="fa-solid fa-pen-to-square fa-1x color-thm-blue"></i>
                     </a>--%>

 <%--  <a href="#" onclick="return confirm('Are you sure you want to delete this user?');">
                         
                         <i class="fa-solid fa-trash fa-1x color-thm-danger"></i>
                     </a>--%>

 <%--   </ItemTemplate>
                     </asp:TemplateField>

                 </Columns>

             </asp:GridView>--%>     <div id="toast">
     <div id="img">
         <img src="assets/h-file-logo-white.png" />
     </div>
     <div id="desc"></div>
 </div>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center">
    <div id="editUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <label for="txtMobile">Mobile Number</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter your mobile number"></asp:TextBox>
                    </div>
                    <asp:HiddenField ID="hfUserId" runat="server" />
                    
                    <!-- Profile Image Upload Section -->
                    <div class="Addbasicbtnboth mt-3">
                      <%--  <asp:Button ID="showInputButton" CssClass="btn btn-info" runat="server" Text="Change Profile Image" OnClientClick="showFileUpload(); return false;" />--%>
                        
                       

                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Change Profile Image" OnClientClick="showFileUpload(); return false;" />
                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" OnClick="lbtnSave_Click" CssClass="btn btn-primary">Save</asp:LinkButton>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="lbtnSave" />
                                </Triggers>
                            </asp:UpdatePanel>
                         <asp:FileUpload ID="Profileupload" runat="server" CssClass="form-control hidden" accept=".png,.jpg,.jpeg" />
                    </div>
                    
                </div>
                <div class="modal-footer mt-3">
                    <button type="button" id="btnClose" class="btn btn-secondary mx-3" data-bs-dismiss="modal">Close</button>
                    <asp:LinkButton ID="lbtnSave" runat="server" OnClick="lbtnSave_Click" Text="Save" CssClass="btn btn-primary"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>







            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <%--<div>
                    <h2 class="text-center heading mb-5">My Members </h2>
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID : </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No :</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="col-12 col-md-12 col-xl-6 my-3">
                            <div class="member-list-cards p-3">
                                <div class="row">
                                    <div class="col-12 col-md-3 d-flex justify-content-center align-items-center">
                                        <div class="text-center">
                                            <img class="members-image" src="MY Data/default-user-profile.png" alt="member image" />
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <div class="members-details py-2">
                                            <div class="px-3 tex">
                                                <h4>Member Name</h4>
                                            </div>
                                            <ul>
                                                <li>
                                                    <strong>HF-ID: </strong>HF010110BET4187
                                                </li>
                                                <li>
                                                    <strong>Email: </strong>abc@gmail.com
                                                </li>
                                                <li>
                                                    <strong>Mobile No:</strong>7276765423
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 d-flex justify-content-center align-items-center">
                                        <div class="d-flex d-md-block">
                                            <div class="my-4 mx-1">
                                                <a class="member-accept-btn member-action-btn" href="#">Accept</a>
                                            </div>
                                            <div class="my-4 mx-1">
                                                <a class="member-rejects-btn member-action-btn" href="#">Reject</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
       
        </div>
   

     <script>
         function launch_toast(message, icon) {
             var x = document.getElementById("toast")
             x.className = "show";
             document.getElementById("img").innerHTML = "<img src='" + icon + "' />"; // Set the message
             document.getElementById("desc").innerHTML = message; // Set the message
             setTimeout(function () { x.className = x.className.replace("show", ""); });
         }
         //launch_toast()
     </script>

   <%--<script type="text/javascript">
       //document.getElementById("change-profile-img").addEventListener("click", function () {
       //    var inputBox = document.getElementById("Profileupload");
       //    inputBox.classList.remove("hidden");
       //});
       function showFileUpload() {
           var fileUpload = document.getElementById('<%= Profileupload.ClientID %>');
           fileUpload.classList.remove("hidden");
       }
       function previewImage() {
           var fileInput = document.getElementById('Profileupload');
           var preview = document.getElementById('imagePreview');

           // Check if file input and preview elements exist
           if (!fileInput || !preview) {
               console.error("File input or preview element not found.");
               return;
           }

           var file = fileInput.files[0];

           // Check if a file is selected
           if (file) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   // Create an image element
                   var img = document.createElement('img');
                   img.src = e.target.result;

                   img.width = 100;
                   img.height = 100;

                   // Clear any previous preview
                   preview.innerHTML = '';

                   // Append the image to the preview div
                   preview.appendChild(img);
               };

               // Read the file as a data URL
               reader.readAsDataURL(file);
           } else {
               // Clear the preview if no file is selected
               preview.innerHTML = '';
           }
       }


       //function uploadImage() {
       //    var fileUpload = document.getElementById("Profileupload");
       //    var imagePreview = document.getElementById("imagePreview");

       //    if (fileUpload.files.length > 0) {
       //        var file = fileUpload.files[0];
       //        var reader = new FileReader();

       //        reader.onloadend = function () {
       //            var base64String = reader.result;
       //            PageMethods.UploadImage(base64String, onSuccess, onError);
       //        };

       //        reader.readAsDataURL(file);
       //    }
       //}

       function onSuccess(response) {
           // Update the image preview source
           document.getElementById("imagePreview").src = response;
       }

       function onError(error) {
           // Handle error (display error message, log, etc.)
           console.error(error);
       }
       function launch_toast() {
           var x = document.getElementById("toast")
           x.className = "show";
           setTimeout(function () { x.className = x.className.replace("show", ""); }, 5000);
       }
       //launch_toast()

   </script>--%>
    <script>
        function showFileUpload() {
            var fileUpload = document.getElementById('<%= Profileupload.ClientID %>');
           fileUpload.classList.remove('hidden');
           return false; // prevent the page from reloading
       }
</script>


    <style>

.hidden {
    display: none;
}
    </style>
    
<%--<style>
    .hidden {
        display: none;
    }
    .file-upload-container {
        margin-top: 10px;
    }
</style>--%>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</asp:Content>
