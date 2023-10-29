<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="addmember.aspx.cs" Inherits="hfiles.addmember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap-grid.min.css"
        integrity="sha512-EAgFb1TGFSRh1CCsDotrqJMqB2D+FLCOXAJTE16Ajphi73gQmfJS/LNl6AsjDqDht6Ls7Qr1KWsrJxyttEkxIA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
    <link rel="stylesheet" href="./style3.css">

    <title>Add Members</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <img class="blue-t-top-left" src="../Avatar/blue-trangle-1.png" alt="">
    <img class="blue-t-top-right" src="../Avatar/blue-trangle-2.png" alt="">
    <img class="blue-t-right" src="../Add Members/blue-trangle-3.png" alt="">
    <a href="#">
        <%--<img class="home-icon-top-right" src="../Add Members/home-icon.png" alt="">--%></a>
    <img class="plus-top-left" src="../assets/plus-icon-3.png" alt="">
    <div class="main-div">
        <div class="container d-flex justify-content-center p-0">
            <div class="inner-div pt-5">
                <div class="row pt-5">
                    <div class="col-12 text-blue">
                        <h1>Add Members</h1>
                    </div>
                </div>
               <%-- <div class="row my-xl-5 my-lg-3">
                    <div class="col-lg-5 col-md-5 col-sm-4 pl-lg-5 pr-0 d-xl-flex justify-content-end">
                        <div id="family" class="tab" style="color: #0116b8;" onclick="handleTabs('family')">
                            Family
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 or p-0" style="color: #bababa; font-size: 28px;">OR </div>
                    <div class="col-lg-5 col-md-5 col-sm-4 pr-lg-5 pl-0">
                        <div id="friends" class="tab" style="color: #bababa;" onclick="handleTabs('friend')">
                            Friends
                        </div>
                    </div>
                   
                </div>--%>
                <div class="row input-group my-xl-4 my-lg-3">
                   <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-5 col-sm-12 px-xl-4">
                        <input type="text" id="name" runat="server" placeholder="First Name">
                    </div>
                   </div>
                    <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-5 col-sm-12 px-xl-4">
                        <input type="text" id="lastname" runat="server" placeholder="Last Name">
                    </div> <asp:HiddenField runat="server" ID="hfMemberType" />
                    </div>
                    <div class="row justify-content-center">
                         <div id="relation-input" class="col-lg-5 col-md-5 col-sm-12 px-xl-4">
                        <div class="relation-div">
                            <span class="fa-solid fa-earth-americas form-control-feedback"></span>
                            <select id="relation" runat="server" class="form-select form-control relation-select"
                                aria-label="Default select example" onchange="handleRelation()">
                                <option selected disabled>Relation</option>
                                <option value="father">Father</option>
                                <option value="mother">Mother</option>
                                <option value="sister">Sister</option>
                                <option value="brother">Brother</option>
                                <option value="wife">Wife</option>
                                <option value="husband">Husband</option>
                                <option value="grandMother">Grand Mother</option>
                                <option value="grandFather">Grand Father</option>
                                 <option value="Friend">Friend</option>
                                <option value="pet">Pet</option>
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="row justify-content-center">
                         <div class="col-lg-5 col-md-5 col-sm-12 px-xl-4">
                        <input class="email-input" id="emailid" runat="server" type="email" placeholder="Email ID" />
                    </div>
                    </div>
                     <div class="row justify-content-center">
                         <div class="col-lg-5 col-md-5 col-sm-12 px-xl-4">
                        <input class="number-input" id="phoneno" runat="server" type="number" placeholder="Phone No." pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}">
                    </div>
                    </div>
                </div>
               
                <div class="btn-div">
                    <%--<asp:Button runat="server" Text="Submit" CssClass="btn submit-btn" ID="btnSubmit"></asp:Button>--%>
                    <button runat="server" id="btn_Submit" onserverclick="btn_Submit_ServerClick" class="btn submit-btn">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <img class="plus-bottom-right" src="../Add Members/plus-2.png" alt="">
    <img class="blue-t-bottom-left" src="../Add Members/blue-trangle-4.png" alt="">
    <img class="blue-t-bottom-right" src="../Add Members/blue-trangle-5.png" alt="">
    <script>
        let selected = true
        var relation = ''

        const family = document.getElementById('family');
        const friends = document.getElementById('friends');
        const relationInput = document.getElementById('relation-input');
        const friendInput = document.getElementById('friend-input');
        const defaultNumber = document.getElementById('default-number');

        family.classList.add('active')
        friends.classList.add('inactive')

        defaultNumber.style.display = 'none'
        friendInput.style.display = 'none'
        notSelectMobile.style.display = 'none'
        selectMobile.style.display = 'block'
        relationInput.style.display = 'flex'




        function handleTabs(tab) {
            if (tab === 'family') {
                family.style.color = '#0512b9'
                friends.style.color = '#bababa'
                family.classList.remove('inactive')
                friends.classList.remove('active')
                family.classList.add('active')
                friends.classList.add('inactive')
                relationInput.style.display = 'flex'
                friendInput.style.display = 'none'
                if (relation === 'grandFather' || relation === 'grandMother') {
                    defaultNumber.style.display = 'block'
                } else {
                    defaultNumber.style.display = 'none'
                }
                document.getElementById("<%= hfMemberType.ClientID%>").value = "1";
                } else if (tab === 'friend') {
                    family.style.color = '#bababa'
                    friends.style.color = '#0512b9'
                    family.classList.remove('active')
                    friends.classList.remove('inactive')
                    family.classList.add('inactive')
                    friends.classList.add('active')
                    relationInput.style.display = 'none'
                    friendInput.style.display = 'block'
                    defaultNumber.style.display = 'none'
                    document.getElementById("<%= hfMemberType.ClientID%>").value = "2";
            }
        }
        function handleRelation() {
            relation = document.getElementById('relation').value
            $('.email-input').attr('disabled', 'false');
            $('.number-input').attr('disabled', 'false');
            if (relation === 'grandFather' || relation === 'grandMother') {
                defaultNumber.style.display = 'block'
                $(".email-input").removeAttr('disabled');
                $(".number-input").removeAttr('disabled');
            } else if (relation === 'pet') {
                $('.email-input').attr('disabled', 'disabled');
                $('.number-input').attr('disabled', 'disabled');
                defaultNumber.style.display = 'none'
            } else {
                defaultNumber.style.display = 'none'
                $(".email-input").removeAttr('disabled');
                $(".number-input").removeAttr('disabled');
            }
            console.log(relation)
        }

    </script>


</asp:Content>
