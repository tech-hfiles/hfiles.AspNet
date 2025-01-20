<%@ Page Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="SubscriptionPlan.aspx.cs" Inherits="hfiles.SubscriptionPlan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            

            <div style="text-align: center;margin:auto;max-width:70vh;margin-top:5vh;" class="card-box">
                <div style="display:flex;justify-content:center">
                    <h1 style="font-weight:bold;color:#0331b5">Subscription Plans</h1>
                </div>
                <div style="display:flex;justify-content:center">
                    <h4 style="font-weight:bold;color:#0331b5">Get started with your health journey today</h4>
                </div>
                
                



            </div>
            <div class="row col-12" style="margin: auto;display: flex;justify-content: center;width: 100%;text-align: center;padding-bottom:20vh;font-size: smaller;">
                    
<div class="" style="background-color: #b0dcd4;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;">
    <p style="font-size: xx-large;color:#0331b5" _msttexthash="57356" _msthash="14">Basic</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="31941" _msthash="15">FREE</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: revert;">
    <div style="text-align:left;padding:5px 20px;">
    <p _msttexthash="281008" _msthash="16"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 5 members</p>
    <p _msttexthash="181064" _msthash="17"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>100 MB storage</p>
    <p _msttexthash="240006" _msthash="18"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload PDF files</p>
        <br>
        <br>
        <br>
        
        
        <button style="
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
">Get started for free</button>
        </div>
</div>
<div class="" style="background-color: #fff44c;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;">
    <p style="font-size: xx-large;color:#0331b5;margin-bottom: 0;" _msttexthash="112164" _msthash="19">Standard</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="129155" _msthash="20">Rs. 99/year</p>
<p style="
    font-size: larger;
    text-decoration: line-through;
    margin-bottom: 0;
" _msttexthash="47502" _msthash="21">Rs. 149</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: 0;">
    <div style="text-align:left;padding:5px 20px;">
    <p _msttexthash="281008" _msthash="22"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 7 members</p>
    <p _msttexthash="181064" _msthash="23"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>300 MB storage</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload PDF files</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Access to blogs</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card</p>
        
        <button style="
    width: 80%;
    background-color: #0331b5;
    color: white;
    font-size: larger;
    border: none;
    border-radius: 20px;
    bottom: 0;
    margin-top: 50px;
    margin-bottom: 0;
    margin-left:20px;
">Go Standard</button>
        </div>
</div>
<div class="" style="background-color: #f8ccc4;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;">
    <p style="font-size: xx-large;color:#0331b5;margin-bottom: 0;" _msttexthash="96811" _msthash="19">Premium</p>
    <p style="font-size: x-large;margin-bottom: 0;" _msttexthash="143507" _msthash="20">Rs. 399/year</p>
<p style="
    font-size: larger;
    text-decoration: line-through;
    margin-bottom: 0;
" _msttexthash="48997" _msthash="21">Rs. 799</p>
    <hr style="opacity: inherit;border-top-color: #000;margin-top: 0;">
    <div style="text-align:left;padding:5px 20px;">
    <p _msttexthash="281008" _msthash="22"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Add upto 10 members</p>
    <p _msttexthash="181064" _msthash="23"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>1000 MB storage</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Upload PDF,video files</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Access to exclusive blogs</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Membership card</p>
        <button style="
    width: 80%;
    background-color: #0331b5;
    color: white;
    font-size: larger;
    border: none;
    border-radius: 20px;
    bottom: 0;
    margin-top: 50px;
    margin-bottom: 0;
    margin-left:20px;
">Go Premium</button>
        </div>
</div><div class="" style="background-color: #90bcfc;border-radius: 20px;padding: 25px;font-weight: bold;margin: 10px;width: 280px;">
    <p style="font-size: xx-large;color:#0331b5" _msttexthash="57356" _msthash="14">Advanced</p>
<p style="font-size: x-large;margin-bottom: 0;" _msttexthash="31941" _msthash="15">Contact Sales</p>
<hr style="opacity: inherit;border-top-color: #000;margin-top: inherit;">
    <div style="text-align:left;padding:5px 20px;">
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
"></i>Wellness kit</p>
    <p _msttexthash="240006" _msthash="24"><i class="fa fa-check-circle" aria-hidden="true" style="
    padding-right: 10px;
"></i>Personalized solutions</p>
        <button style="
    width: 80%;
    background-color: #0331b5;
    color: white;
    font-size: larger;
    border: none;
    border-radius: 20px;
    bottom: 0;
    margin-top: 50px;
    margin-bottom: 0;
    margin-left:20px;
">Contact Sales</button>
        </div>
</div>
                </div>
    
            
        </ContentTemplate>
        
    </asp:UpdatePanel>
    
</asp:Content>