<%@ Page Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="SubscriptionPlan.aspx.cs" Inherits="hfiles.SubscriptionPlan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <style>

            .subscription-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
            }

            .subscription-card {
                background-color: #fff;
                border-radius: 20px;
                padding: 25px;
                font-weight: bold;
                width: 280px;
                text-align: center;
                margin: 10px;
            }

           /* @media (min-width: 820px) and (max-width: 1180px) {
                .subscription-container {
                    flex-direction: column;
                    align-items: center;
                }

                .row1, .row2 {
                    display: flex;
                    justify-content: center;
                    gap: 10px;
                }
            }*/

           .fa {
                    display: inline-block;
                    /* The following line is commented out to avoid overriding Bootstrap's default font */
                    /* font: normal normal normal 14px/1 FontAwesome; */
                    font-size: inherit;
                    text-rendering: auto;
                    -webkit-font-smoothing: antialiased;
                    -moz-osx-font-smoothing: grayscale;
                }

            /* 1 column for small screens */
            @media (max-width: 599px) {  
                .for_make_2 {
                    grid-template-columns: 1fr;
                }
            }

            /* 2 columns between 900px - 1200px */
            /*@media (min-width: 600px) and (max-width: 1200px) {  
                .for_make_2 {
                    display: inline-grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 0px;*/ /* Reduce gap between Basic and Standard */
                    /*justify-content: center;*/ /* Center align if needed */
                /*}
                 .for_make_2 > * {
                        margin: 0;
                        padding: 0;
                    }*/
                /*.pricing-card {*/ /* If each box has margin, reduce it */
                    /*margin: 0;
                    padding: 10px;*/ /* Adjust padding if necessary */
                /*}*/
            /*}*/
            
           @media (min-width: 600px) and (max-width: 1200px) and (max-width: 1500px){
            .for_make_2 {
                display: grid;
                grid-template-columns: repeat(2, 1fr); /* Ensures equal-width columns */
                gap: 0px; /* Removes unnecessary space */
                justify-content: center;
            }

    /* Ensure each column doesn't have extra margins */
            .for_make_2 {
    padding: 76px;
}
           }
           /*.for_make_2 {
                max-width: 80%;*/ /* Adjust as needed 
            }*/
            .for_make_2 > div {
                margin: 0; /* Remove unnecessary spacing */
            }
           



            /* 4 columns for large screens (above 1200px) */
            @media (min-width: 1201px) {  
                .for_make_2 {
                    grid-template-columns: 1fr 1fr 1fr 1fr;
                }
     
             }

            


        
    </style>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
            
              <form action="Charge.aspx" method="post" name="razorpayForm" >
      <input id="razorpay_payment_id" type="hidden" name="razorpay_payment_id" />
      <input id="razorpay_order_id" type="hidden" name="razorpay_order_id" />
      <input id="razorpay_signature" type="hidden" name="razorpay_signature" />
  </form>
             <div class="col-md-4 d-flex justify-content-md-start justify-content-start py-1">
     <a class="back-arrow-btn-2" href="Dashboard.aspx">Back to Home
     </a>
 </div>

            <div style="text-align: center;margin:auto;margin-top:5vh;" class="card-box">
                <div style="display:flex;justify-content:center">
                    <h1 style="font-weight:bold;color:#0331b5">Simplify Your Health Journey</h1>
                </div>
                <div style="display:flex;justify-content:center">
                    <h4 style="font-weight:bold;color:black">Choose a plan that fits your needs and stay in control of your health.</h4>
                </div>
                <br />
                <br />
                



            </div>
            <div class="row col-12 for_make_2" style="margin: auto;place-items:center; justify-content: center;width: 100%;text-align: center;padding-bottom:20vh;font-size: smaller;">
                    
<div class="" style="background-color: #b0dcd4;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;height: 466px;">
    <p style="font-size: xx-large;color:#0331b5" _msttexthash="57356" _msthash="14">Basic</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="31941" _msthash="15">FREE</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: revert;">
    <div style="text-align:left;padding:5px 20px;font-size: 14px;">
    <p _msttexthash="281008" _msthash="16"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 5 members</p>
    <p _msttexthash="181064" _msthash="17"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload files with a total</p>
    <p style="padding-left: 21px;"> Storage of up to 100 MB</p>
    <p _msttexthash="240006" _msthash="18" style="text-decoration: line-through;"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"><%--</i>Upload files</p>
            <p _msttexthash="240006" _msthash="18" style="text-decoration: line-through;"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;--%>
</i>Wellness kit</p>
            <p _msttexthash="240006" _msthash="18" style="text-decoration: line-through;"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Access to blogs</p>
            <p _msttexthash="240006" _msthash="18" style="text-decoration: line-through;"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card</p>
        <br>
        <br>
        <br>
        
        
       <%-- <button style="
    width: 80%;
    background-color: #0331b5;
    color: white;
    font-size: larger;
    border: none;
    border-radius: 20px;
    bottom: 0;
    margin-top: 55px;
    margin-bottom: 0;
    margin-left:20px;
">Get started for free</button>--%>
        </div>
</div>
<div class="" style="background-color: #fff44c;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;height: 466px;">
    <p style="font-size: xx-large;color:#0331b5;margin-bottom: 0;" _msttexthash="112164" _msthash="19">Standard</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="129155" _msthash="20">Rs. 99/year</p>
<p style="
     font-size: larger;
 text-decoration: line-through;
 margin-bottom: 0;
" _msttexthash="47502" _msthash="21">Rs. 149</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: 0;">
    <div style="text-align:left;padding:5px 20px;font-size: 14px;">
    <p _msttexthash="281008" _msthash="22"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 7 members</p>
    <p _msttexthash="181064" _msthash="23"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload files with a total</p><p style="padding-left: 21px;"> Storage of up to 300 MB</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"><%--</i>Upload files</p>
            <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
">--%></i>Wellness kit</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Access to exclusive </p><p style="padding-left: 21px;"> Article</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card</p>
        
        <button style="
  width: 186px;
    height: 45px;
    top: 860.97px;
    left: 1165px;
    font-family: Montserrat;
    font-weight: 500;
    font-size: 20px;
    line-height: 100%;
    letter-spacing: 0%;
    text-align: center;
    vertical-align: middle;
    background-color: #0331B5;
    border-radius: 14px;
    color: white;
        border: none;
            margin-top: -1px;

" id="rzp-button1">Go Standard</button>
        </div>
</div>
<div class="" style="background-color: #f8ccc4;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;height: 466px;">
    <p style="font-size: xx-large;color:#0331b5;margin-bottom: 0;" _msttexthash="96811" _msthash="19">Premium</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="143507" _msthash="20">Rs. 399/year</p>
<p style="
    font-size: larger;
    text-decoration: line-through;
    margin-bottom: 0;
" _msttexthash="48997" _msthash="21">Rs. 799</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: 0;">
    <div style="text-align:left;padding:5px 20px;font-size: 13.5px;">
    <p _msttexthash="281008" _msthash="22"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 10 members</p>
    <p _msttexthash="181064" _msthash="23"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload files with a total</p><p style="padding-left: 21px;"> Storage of up to 1000 MB</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"><%--</i>Upload files</p>
     <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
">--%></i>Wellness kit</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Access to exclusive </p><p style="padding-left: 21px;"> Article</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card </p>
        <button style="
   width: 186px;
    height: 45px;
    top: 860.97px;
    left: 1165px;
    font-family: Montserrat;
    font-weight: 500;
    font-size: 20px;
    line-height: 100%;
    letter-spacing: 0%;
    text-align: center;
    vertical-align: middle;
    background-color: #0331B5;
    border-radius: 14px;
    color: white;
        border: none;
            margin-top: 3px;

" id="rzp-button2">Go Premium</button>
        </div>
</div><div class="" style="background-color: #90bcfc;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;height:466px;">
    <p style="font-size: xx-large;color:#0331b5" _msttexthash="57356" _msthash="14">Advanced</p>
<p style="font-size: x-large;margin-bottom: 0;" _msttexthash="31941" _msthash="15">Contact Sales</p>
<hr style="opacity: inherit;border-top-color: #000;margin-top: inherit;">
    <div style="text-align:left;padding:5px 20px;font-size: 14px;">
    <p _msttexthash="281008" _msthash="22"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add unlimited members</p>
    <p _msttexthash="181064" _msthash="23"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Unlimited storage</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Wellness program</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Personalized solutions</p>
        <!-- Contact Sales Button -->
<button onclick="openModal()" type="button" runat="server" style="width: 186px; height: 45px; font-family: Montserrat; font-weight: 500; font-size: 20px; line-height: 100%; text-align: center; background-color: #0331B5; border-radius: 14px; color: white; border: none; margin-top: 69px; cursor: pointer;">
  Contact Sales
</button>

<!-- Modal -->
<div id="contactModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5); z-index:1000;">
  <div style="background:white; max-width: 500px; margin:100px auto; padding: 20px; border-radius: 8px; position: relative;">
    <span onclick="closeModal()" style="position:absolute; top:10px; right:15px; cursor:pointer; font-size:18px;">&times;</span>
    <h3>Drop us your query and we’ll get in touch with you</h3>
    <p>Please share some details regarding your query</p>

    <div id="contactForm">
      <label>Business email*</label><br>
     <asp:TextBox ID="txtemail" runat="server" TextMode="Email" 
    placeholder="Your email" 
    style="width:100%; padding:10px; margin-bottom:10px;" />
      <small>No spam, we promise!</small><br><br>

      <label>Your query*</label><br>
     <asp:TextBox ID="query" runat="server" TextMode="MultiLine" 
    placeholder="Tell us how we can help" 
    style="width:100%; padding:10px; height:100px;" /><br><br>

      <asp:Button id="btnAdd" runat="server" OnClick="btnAdd_Click" style="background-color:#0061F2; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;" Text="Submit"/>
    </div>
  </div>
</div>
    <script>
        var orderId = "<%=orderId%>";
 
            


    document.getElementById('rzp-button1').onclick = function (e) {
        var options = {
            "key": "rzp_live_kpCWRpxOkiH9M7", // Replace with your Razorpay Key ID
            "amount": 9900, // Amount in paise (99 INR)
            "currency": "INR",
            "name": "Hfiles",
            "description": "Subscription Payment",
            "image": "https://hfiles.in/wp-content/uploads/2022/11/hfileslogo.jpeg",
            "order_id": orderId, // Generate order ID from backend
            "handler": function (response) {
                // Send payment details to Charge.aspx
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                document.razorpayForm.submit();
            },
            //"prefill": {
            //    "name": "HEALTH FILES MDEICO PRIVATE LIMITED",
            //    "email": "contact@hfiles.in",
            //    "contact": "+919978043453"
            //},
            "theme": {
                "color": "#0331B5"
            },
            "config": { // Move the method settings inside config
                "display": {
                    "blocks": {
                        "upi": {
                            "name": "UPI Payment",
                            "instruments": [
                                {
                                    "method": "upi"
                                }
                            ]
                        }
                    },
                    "sequence": ["upi", "card", "netbanking"],
                    "preferences": {
                        "show_default_blocks": true
                    }
                }
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault();
    };
    document.getElementById('rzp-button2').onclick = function (e) {
        var options = {
            "key": "rzp_live_kpCWRpxOkiH9M7", // Replace with your Razorpay Key ID
            "amount": 39900, // Amount in paise (99 INR)
            "currency": "INR",
            "name": "Hfiles",
            "description": "Subscription Payment",
            "image": "https://hfiles.in/wp-content/uploads/2022/11/hfileslogo.jpeg",
            "order_id": orderId, // Generate order ID from backend
            "handler": function (response) {
                // Send payment details to Charge.aspx
                document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                document.getElementById('razorpay_signature').value = response.razorpay_signature;
                document.razorpayForm.submit();
            },
            //"prefill": {
            //    "name": "HEALTH FILES MDEICO PRIVATE LIMITED",
            //    "email": "contact@hfiles.in",
            //    "contact": "+919978043453"
            //},
            "theme": {
                "color": "#0331B5"
            }
            ,
            "config": { // Move the method settings inside config
                "display": {
                    "blocks": {
                        "upi": {
                            "name": "UPI Payment",
                            "instruments": [
                                {
                                    "method": "upi"
                                }
                            ]
                        }
                    },
                    "sequence": ["upi", "card", "netbanking"],
                    "preferences": {
                        "show_default_blocks": true
                    }
                }
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault();
    };
        function openModal() {
            document.getElementById("contactModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("contactModal").style.display = "none";
        }

       //  Close modal if clicking outside the content box
        window.onclick = function (event) {
            const modal = document.getElementById("contactModal");
            const modalContent = modal.querySelector("div");

            // Only close if clicking on backdrop (not the inner content)
            if (event.target === modal) {
                closeModal();
            }
        };

        // Handle form submission
        document.getElementById("contactForm").addEventListener("submit", function (e) {
            e.preventDefault();
            alert("Your query has been submitted!");
            closeModal();
        });
    </script>
            
        </ContentTemplate>
        
    </asp:UpdatePanel>
    
</asp:Content>