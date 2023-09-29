<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="reports.aspx.cs" Inherits="hfiles.reports" %>



<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
    integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
    integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
    integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/solid.min.css"
    integrity="sha512-P9pgMgcSNlLb4Z2WAB2sH5KBKGnBfyJnq+bhcfLCFusrRc4XdXrhfDluBl/usq75NF5gTDIMcwI1GaG5gju+Mw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="<%= ResolveUrl("style.css") %>" />
  <title>Document</title>

  <style>
    .footer {
      position: relative;
      bottom: 0;
      width: 100%;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="upload-file">
  <div class="top-home-icons d-flex justify-content-between align-items-center w-100">
    <%--<div class="common-heading mx-5">
      <img src="../assets/h-file-logo-white.png" alt="" width="200px">
    </div>
    <div class="d-flex mx-2">
      <a href="#">
        <img class="" src="../Avatar/home-icon-white.png" alt=""></a>
    </div>--%>
  </div>
  <div class="top-header-div">
    <span>App &#62; Reports</span>
  </div>
  <div class="table-div">
    <div class="row align-items-center my-1">
      <div class="col-6">
        <h4 class="report-heading"><strong>Report List</strong></h4>
      </div>
      <div class="col-6 text-end">
        <a href="avatar.aspx">
          <button class="btn btn-primary" href="avatar.aspx">Add Report</button></a>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-lg-6 col-md-6 col-sm-12 text-start position-relative">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input class="product-search" type="text" name="search" id="product-search" placeholder="Search">
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12 text-end">
        <img src="../assets/filter.svg" alt="" width="40px">
        <p>Total Products : <span runat="server" id="tcount"></span></p>
      </div>

    </div>

    <table class="table table-striped">
      <thead>
        <tr>
          <th class="active">
            <input type="checkbox" class="select-all checkbox" name="select-all" />
            ID <i class="fa-solid fa-sort"></i>
          </th>
          <th class="success">File Name <i class="fa-solid fa-sort"></i></th>
          <th class="warning">Title <i class="fa-solid fa-sort"></i></th>
          <th class="info">Action </th>
        </tr>
      </thead>
      <tbody>
        <asp:Repeater runat="server" ID="rptReports">
          <ItemTemplate>
            <tr>
              <td class="active">
                <input type="checkbox" class="select-item checkbox" name="select-item" value="1000" />
                1
              </td>
              <td class="success">
                <a class="thm-btn" target="_blank" href="<%# ResolveUrl( string.Format("~/upload/report/{0}", Eval("ReportUrl"))) %>">View Report </a><%--<img src="https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_640.jpg"
                    alt="" width="50px">--%></td>
              <td class="warning"><%# Eval("ReportName") %></td>
              <td class="action">
                <a href="#">
                  <button class="btn btn-danger"><i class="fa-regular fa-trash-can"></i></button>
                </a>
              </td>
            </tr>

          </ItemTemplate>
        </asp:Repeater>
      </tbody>

    </table>
    <div class="pagination">
      <button class="btn">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="btn--icon"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2">
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15 19l-7-7 7-7" />
        </svg>
      </button>
      <div class="pages">
        <a class="page active" href="#">1</a>
        <a class="page" href="#">2</a>
        <a class="page">...</a>
        <a class="page" href="#">23</a>
      </div>
      <button class="btn">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="btn--icon"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2">
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M9 5l7 7-7 7" />
        </svg>
      </button>
    </div>
    <!-- <button id="select-all" class="btn button-default">SelectAll/Cancel</button>
        <button id="select-invert" class="btn button-default">Invert</button>
        <button id="selected" class="btn button-default">GetSelected</button> -->

  </div>
  <div class="footer d-flex justify-content-around">
    <div class="t-c">
      <a href="#">Terms & Conditions</a>
    </div>
    <div class="copy-right">
      <span>Copyright@2023</span>
    </div>
    <div class="p-p">
      <a href="#">Privacy & Policy</a>
    </div>
  </div>
  <script>
    $(function () {

      //button select all or cancel
      $("#select-all").click(function () {
        var all = $("input.select-all")[0];
        all.checked = !all.checked
        var checked = all.checked;
        $("input.select-item").each(function (index, item) {
          item.checked = checked;
        });
      });

      //button select invert
      $("#select-invert").click(function () {
        $("input.select-item").each(function (index, item) {
          item.checked = !item.checked;
        });
        checkSelected();
      });

      //button get selected info
      $("#selected").click(function () {
        var items = [];
        $("input.select-item:checked:checked").each(function (index, item) {
          items[index] = item.value;
        });
        if (items.length < 1) {
          alert("no selected items!!!");
        } else {
          var values = items.join(',');
          console.log(values);
          var html = $("<div></div>");
          html.html("selected:" + values);
          html.appendTo("body");
        }
      });

      //column checkbox select all or cancel
      $("input.select-all").click(function () {
        var checked = this.checked;
        $("input.select-item").each(function (index, item) {
          item.checked = checked;
        });
      });

      //check selected items
      $("input.select-item").click(function () {
        var checked = this.checked;
        console.log(checked);
        checkSelected();
      });

      //check is all selected
      function checkSelected() {
        var all = $("input.select-all")[0];
        var total = $("input.select-item").length;
        var len = $("input.select-item:checked:checked").length;
        console.log("total:" + total);
        console.log("len:" + len);
        all.checked = len === total;
      }
    });
  </script>
</div>
</asp:Content>
