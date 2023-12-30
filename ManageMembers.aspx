<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="hfiles.ManageMembers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Manage Members</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="row justify-content-center align-items-center h-100vh m-0">
      <div class="col-12 col-md-10 col-lg-8">
        <table class="table table-bordered manage-members-table">
  <thead>
    <tr>
      <th scope="col">SR. No</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>@mdo</td>
      <td>1234567890</td>
        <td>
             <a href="#"><i class="fa-solid fa-pen-to-square fa-2x color-thm-blue"></i></a> &nbsp; &nbsp;
             <a href="#"><i class="fa-solid fa-trash fa-2x color-thm-danger"></i></a>
        </td>
    </tr>
    <tr>
      <th scope="row">2</th>
     <td>Mark</td>
<td>@mdo</td>
<td>1234567890</td>
  <td>
       <a href="#"><i class="fa-solid fa-pen-to-square fa-2x color-thm-blue"></i></a> &nbsp; &nbsp;
 <a href="#"><i class="fa-solid fa-trash fa-2x color-thm-danger"></i></a>
  </td>
    </tr>
    <tr>
      <th scope="row">3</th>
     <td>Mark</td>
<td>@mdo</td>
<td>1234567890</td>
  <td>
       <a href="#"><i class="fa-solid fa-pen-to-square fa-2x color-thm-blue"></i></a> &nbsp; &nbsp;
 <a href="#"><i class="fa-solid fa-trash fa-2x color-thm-danger"></i></a>
  </td>
    </tr>
  </tbody>
</table>
      </div>
  </div>
</asp:Content>
