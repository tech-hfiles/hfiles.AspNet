<%@ Page Title="Clinics" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="WellnessKit.aspx.cs" Inherits="hfiles.Clinics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.css" rel="stylesheet" />
    <style>
       body {
           min-height: 100vh;
           background: linear-gradient(to left, #c9c8c8, #f8f8f8);
       }

       .ComingSoonPage img {
           width: 50%;
           padding-top: 50px;
       }

       .ComingSoonPage {
           display: flex;
           align-items: center;
           justify-content: center;
       }

       .footer {
           position: absolute;
           width: 100%;
           bottom: 0px;
       }

       @media (max-width: 480px) {
           .ComingSoonPage img {
               width: 100%;
               padding-top: 100px;
           }
       }

       @media (max-width: 540px) {
           .ComingSoonPage img {
               width: 100%;
           }
       }
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="ComingSoonPage">
    <img src="../Suppor Group (BG  & Icons)/ComingSoon.png" alt="" />
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jsScript" runat="server">
  
</asp:Content>
