<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/user.Master" CodeBehind="FamilyPrescription.aspx.cs" Inherits="hfiles.FamilyPrescription1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <style>
                html, body {
   overflow:scroll;
   position:relative;
    min-height: 100%;
    top: 0px;
}.container {
    display: flex;
    flex-direction: column;
}* {
    box-sizing: border-box;
    max-width: 100%;
}

 img, video, iframe, table, pre, code {
    max-width: 100%;
    height: auto;
}
       h1 {
    font-size: 28px;
    color: #007bff;
    display: flex;
    align-items: center;
    gap: 10px;
}
#prescription {
    display: table !important;
    opacity: 1 !important;
    visibility: visible !important;
    position: relative !important;
    z-index: 1000 !important;
    overflow-y:scroll;/* Make sure it is above background layers */
}
/* Buttons */
button {
    padding: 10px 16px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    opacity: 0.8;
}

/* Button Variants */

/* Table Styling */
/*table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 10px;
    
    margin-top: 10px;

}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}*/

/* Header Row */
/*th {
    background-color: #ACEDFF;
    
    font-size: 16px;
    text-align: center;
}*/

/* Rows */
/*tr:nth-child(even) {
    background: #f2f2f2;
}

tr:hover {
    background: #e9ecef;
}*/

/* Dropdown Styling */
select {
    padding: 8px 12px;
    font-size: 14px;
    border-radius: 6px;
    border: 1px solid #ccc;
    background: white;
    cursor: pointer;
}

/* Adjustments */
.container {
    max-width:100%;
    margin: auto;
}

.btn-share {
    background-color: #f4b400;
    color: #fff;
}

.btn-add {
    background-color: #007bff;
    color: #fff;
}

.btn-access {
    background-color: #ccc;
    color: #000;
}

.btn-edit {
    background-color: #28a745;
    color: white;
    padding: 5px 10px;
}

.btn-delete {
    background-color: #dc3545;
    color: white;
    padding: 5px 10px;
}

/* Share Buttons */
.share-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 150px;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-weight: bold;
    font-size: 14px;
    transition: 0.3s;
}



/* Table Header Buttons */
th button {
    width: 100px;
    height: 40px;
   
    border: none;
    border-radius: 5px;
    cursor: text;
    font-weight: bold;
}

/* Select Dropdown */
.form-select {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
   
}
#contentpdf {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.d-flex {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px; /* Reduce gap between image and text */
}

.d-flex img {
    width: 50px; /* Adjust image size if needed */
    height: 50px;
}

h1.text-primary {
    color:#0331b5;
    font-size: 47px; /* Adjust font size */
    margin: 0; /* Remove unwanted margin */
}

@media(min-width:1440px){
                #UserSelect{
                  width: 207px ;
height: 43px ;
top: 265px;
left: 1178px;
border-width: 1px ;
border: 1px solid #000000 ;
padding: 3px 93px 2px 14px ;
margin-bottom: -37px;
justify-content: right ;
margin-right: 467px;
margin-left: 1109px ;
margin-top: -2px;
            }
}
                @media(min-width:1024px) {
                    #addprescription {
                        width: 156px;
                        height: 42px;
                        top: 274px;
                        left: 394px;
                        border-radius: 30px;
                        border-width: 1px;
                        border: 1px solid #000000;
                        padding: 3px 45px 2px 41px !important;
                        font-size: 22px;
                    }

                    #accessprescription {
                        width: 156px;
                        height: 43px;
                        top: 274px;
                        left: 232px;
                        border-radius: 30px;
                        border: 1px solid #000000;
                        padding: 3px 29px 2px 22px !important;
                        font-size: 22px;
                    }

                    #shareprescription {
                        width: 156px;
                        height: 43px;
                        top: 274px;
                        left: 69px;
                        border-radius: 30px;
                        border-width: 1px;
                        border: 1px solid #000000;
                        padding: 3px 31px 2px 24px !important;
                        font-size: 22px;
                    }
                    .table-responsive {
    max-width: 80%;
    margin: auto;
    margin-left: -115px;
    overflow-x: unset !important;
    -webkit-overflow-scrolling: unset !important;
}

                    #UserSelect {
                        width: 207px;
                        height: 43px;
                        top: 265px;
                        left: 1178px;
                        border-width: 1px;
                        border: 1px solid #000000;
                        padding: 3px 93px 2px 14px;
                        margin-bottom: -37px;
                        justify-content: right;
                        margin-right: 467px;
                        margin-left: 744px;
                        margin-top: -2px;
                    }
                }             
                
                #addprescription{
                   width: 156px;
                   height: 42px;
                   top: 274px;
                   left: 394px;
                    border-radius: 30px;
                   border-width: 1px;
                   border: 1px solid #000000;
                   padding: 3px 5px 2px 14px;
                    font-size:22px;
                }
                #accessprescription{
                    width: 156px;
                    height: 43px;
                    top: 274px;
                    left: 232px;
                     border-radius: 30px;
                    border: 1px solid #000000;
                    padding: 3px 5px 2px 14px;
                     font-size:22px;
                }
                #shareprescription{

                    width: 156px;
                    height: 43px;
                    top: 274px;
                    left: 69px;
                    border-radius: 30px;
                    border-width: 1px;
                    border: 1px solid #000000;
                    padding: 3px 5px 2px 14px;
                    font-size:22px;
                }
                #UserSelect{
                      width: 207px;
    height: 43px ;
    top: 265px;
    left: 1178px;
    border-width: 1px ;
    border: 1px solid #000000 ;
    padding: 3px 93px 2px 14px;
    margin-bottom: -37px;
    justify-content: right ;
    margin-right: 467px;
    margin-left: 1483px;
    margin-top: -2px;
                }
                
                @media (min-width: 767px) {
                    .responsive-button {
                        font-size: x-large; 
                    }
                   
                   #mobileTableBody{
                       display:none;
                   }
                   
                #addprescription{
                   width: 156px;
                   height: 42px;
                   top: 274px;
                   left: 394px;
                    border-radius: 30px;
                   border-width: 1px;
                   border: 1px solid #000000;
                   padding: 3px 5px 2px 14px;
                    font-size:22px;
                }
                #accessprescription{
                    width: 156px;
                    height: 43px;
                    top: 274px;
                    left: 232px;
                     border-radius: 30px;
                    border: 1px solid #000000;
                    padding: 3px 5px 2px 14px;
                     font-size:22px;
                }
                #shareprescription{

                    width: 156px;
                    height: 43px;
                    top: 274px;
                    left: 69px;
                    border-radius: 30px;
                    border-width: 1px;
                    border: 1px solid #000000;
                    padding: 3px 5px 2px 14px;
                    font-size:22px;
                }
                #UserSelect{
                       width: 156px !important;
                       height: 43px !important;
                       top: 265px;
                       left: 1178px;
                       border-width: 1px !important;
                       border: 1px solid #000000 !important;
                       padding: 3px 5px 2px 14px !important;
                       margin-bottom: -48px;
                       justify-content: right !important;
                       margin-right: 467px;
                       margin-left:973px;
                }
                }
          @media (max-width: 820px) {
   .button-container {
        display: flex;
        flex-direction: row; /* Ensures horizontal layout */
        justify-content: center; /* Centers buttons horizontally */
        align-items: center; /* Aligns buttons vertically */
        gap: 15px; /* Adds space between buttons */
        flex-wrap: nowrap; /* Prevents buttons from wrapping to new line */
        margin-bottom: 20px;
    }
   .table-responsive{
           max-width: 98vw;
    margin-left: -194px !important;
   }
    .responsive-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 15px;
        font-size: 16px;
        white-space: nowrap; /* Prevents buttons from breaking into multiple lines */
        min-width: 120px; /* Ensures all buttons have a uniform width */
        text-align: center;
    }

    /* Ensure buttons don’t have absolute positioning */
                #addprescription {width: 195px !important;
        height: 62px !important;
        border-radius: 30px;
        border: 1px solid #000000;
        padding: 0px 63px 61px 86px;
        font-size: 18px;
        display: inline-block;
        text-align: left;
        max-width: 200px;
        margin-left: -134px;
                }
    #accessprescription{width: 200px !important;
        height: 62px !important;
        border-radius: 30px;
        border: 1px solid #000000;
        padding: 10px 55px;
        font-size: 18px;
        display: inline-block;
        text-align: center;
        max-width: 200px;
        margin-left: -2px;}
    #shareprescription {
               width: 200px !important;
        height: 62px !important;
        border-radius: 30px;
        border: 1px solid #000000;
        padding: 10px 62px;
        font-size: 18px;
        display: inline-block;
        text-align: center;
        max-width: 200px;
        margin-left: -2px;
    }
    #UserSelect {
           width: 207px !important;
        height: 49px !important;
        top: 265px;
        left: 1178px;
        border-width: 1px !important;
        border: 1px solid #000000 !important;
        padding: 3px 93px 2px 14px !important;
        margin-bottom: -37px;
        justify-content: right !important;
        margin-right: 467px;
        margin-left: 629px !important;
        margin-top: 10px;
}
}
@media (max-width:1180px) and (min-width:820px)
{
                #UserSelect{
                 width: 207px !important;
        height: 43px !important;
        top: 265px;
        left: 1178px;
        border-width: 1px !important;
        border: 1px solid #000000 !important;
        padding: 2px 84px 2px 14px !important;
        margin-bottom: -37px;
        justify-content: right !important;
        margin-right: 467px;
        margin-left: 926px !important;
        margin-top: -2px;
            }
}

                    #prescription th {
                        width: 237.28px;
                         background-color: #ACEDFF;
                         text-align: center;
                    }

                   
                    #prescription td {
                        width: 169.28px;
                        height: 41px;
                        text-align: center;
                    } 

                   
                    #prescription th button {
                        width: 100px; 
                        height: 40px;
                        background-color: #ACEDFF;
                        border: none;
                        border-radius: 5px;
                        cursor: text;
                        text-align:center;
                    }

                   
                    #prescription td:last-child {
                        width: 169.28px; 
                    }
                    .form-control{
                        border-radius: 3.375rem;
                        height:52px;
                        text-align: center;
                    }
                  
                    .table-responsive {
                        max-width: 80%;
                        margin: auto;
                       margin-left: -9px;
                       overflow-x: unset !important;
    -webkit-overflow-scrolling: unset !important;
                    }

                 
                    table {
    width: 80%;
    margin-left:188px;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
}

th {
    background-color: #ACEDFF;
    padding: 10px;
    text-align: left;
    border: 1px solid #ccc;
}

td {
    padding: 10px;
    border: 1px solid #ccc;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #e0f7ff;
}

button {
    padding: 5px 10px;
    border: none;
    cursor: pointer;
}

button.edit {
    background-color: black;
    color: white;
}

button.delete {
    background-color: black;
    color: white;
}
/* === Default Table Styles === */
/* Default Table Styling */



                  /*
                    @media (max-width: 767px) {
                        .table-responsive {
                            max-height: 400px;
                        }

                        .table {
                            min-width: 600px;
                        }
                    }
                                    .select-user {
                   
                                        width: 151px!important;
                                        margin-right: -19px;
                                    }
                  
                    @media (min-width: 768px) and (max-width: 1180px) {
                        #contentpdf {
    width: 100vw !important;
    overflow: visible !important;
}
                        .table-responsive {
                            max-height: 500px;
                        }
                    }

                   
                    @media (min-width: 1181px) {
                        .table-responsive {
                            max-height: 650px;
                        }
                    }*/
                             .share-btn {
                       display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 10px 15px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 7px;
                text-decoration: none;
                color: black;
                margin: 10px;
                border: none;
                border: 2px solid dimgray;
                    width: 165px;
                }

   

                .share-btn img {
                    margin-right: 8px;
                }

.mobile-table {
    width: 100%;
    display: block;
    border: 1px solid #ddd;
    margin-bottom: 15px;
    padding: 10px;
    background: #fff;
    border-radius: 5px;
    overflow-y:scroll;
    margin-left: 359px;
}
@media(max-width:480)
{
    .table-responsive table{
        display:none;
    }
}
.mobile-row {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #eee;
}

.mobile-row:last-child {
    border-bottom: none;
}

.mobile-header {
    font-weight: bold;
    width: 40%; /* Adjust width for alignment */
}

.mobile-data {
    width: 60%;
    text-align: left;
}

.action-row {
    text-align: center;
    padding-top: 10px;
}

.edit-btn {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.action-icons {
    color: black;
    cursor: pointer;
    margin-left: 10px;
}


             
/* Keep button style for headers */
.header-btn {
    height: 40px;
    width: 100px;
    background-color: #8cbcfa;
    border: none;
    border-radius: 5px;
    cursor: text;
    font-weight: bold;
}
/* Ensure headers are visible */
thead {
    display: table-header-group !important;
}
.button-container {
    display: flex;
    gap: 11px;
    justify-content: left;
    margin-right: 550px;
    margin-left: 213px;
    margin-top: -12px;
    margin-bottom: 11px;

}
.btn-custom {
    padding: 8px 16px; /* Adjust padding */ 
    font-size: 14px; /* Adjust text size */
    border-radius: 8px; /* Rounded corners */
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px; /* Space between icon and text */
}

.btn-custom img {
    width: 16px; /* Icon size */
    height: 16px;
}



/* Mobile View: Convert Table to Vertical Format */
/* Default table styling (for desktop view) */
/* Default table styling */
/*.table-container table {
    width: 100%;
    border-collapse: collapse;
}

.table-container th, 
.table-container td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}*/

/* Mobile view adjustments */
/*@media screen and (max-width: 768px) {
    .table-container table, 
    .table-container thead, 
    .table-container tbody, 
    .table-container th, 
    .table-container td, 
    .table-container tr { 
        display: block; 
        width: 100%;
    }*/

    /* Hide table headers in mobile view */
    /*.table-container thead {
        display: none;
    }*/

    /* Make each row act like a card */
    /*.table-container tr {
        border: 1px solid #ccc;
        margin-bottom: 10px;
        padding: 10px;
        background: #e5f6ff;
    }*/

    /* Stack table data and show labels */
    /*.table-container td {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        text-align: left;
    }*/

    /* Use data-label to show field names */
    /*.table-container td:before {
        content: attr(data-label);
        font-weight: bold;
        flex: 1;
    }
}*/

  .modal {
    overflow-y: auto !important;
}.select2-container {
    z-index: 1050 !important; /* Higher than Bootstrap modal */
}
   @media (min-width: 768px) and (max-width: 1180px) {
      .select2-container--default select2-selection select2-selection--multiple{
        width: 183px !important;
   overflow: visible !important;
   border: none !important;
   background: transparent !important;
}
      .select2-container--default .select2-selection--multiple {
     background-color: none !important; 
     border: none !important; 
    border-radius: 4px;
    cursor: text;
                     width: 183px !important;
overflow: visible !important;

}
      .row .col-8
      {
              padding: 10px;
    border: 1px solid #ced4da ;
    border-radius: 30px ;
    height: 49px;
    width: 212px;
    margin-left: 179px;
    margin-top: -40px;
      }
          .familyprescription-row .col-8 input {
    border: none !important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px !important;
}
      .familyprescription-row .col-8 select {
    border: none !important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px !important;
}
  }
   @media(max-width:480px)
   {
       #prescription{
           width:0px !important;
           display:block !important;
       }

         #addprescription{
    width: 104px !important;
        height: 42px !important;
        top: 274px;
        left: 394px;
        border-radius: 30px;
        border-width: 1px;
        border: 1px solid #000000;
        padding: 1px 7px 2px 14px;
        font-size: 15px;
        margin-left: -197px;
  }
         .button-container {
    display: flex
;
    gap: 10px;
    justify-content: left;
    margin-right: 550px;
    margin-left: 213px;
    width: 100%;
}
  #accessprescription{
     width: 107px !important;
        height: 43px !important;
        top: 274px;
        left: 232px;
        border-radius: 30px;
        border: 1px solid #000000;
        padding: 3px 5px 2px 14px;
        font-size: 14px;
        margin-left: -7px;
  }
  #shareprescription{

            width: 98px !important;
        height: 43px !important;
        top: 274px;
        left: 69px;
        border-radius: 30px;
        border-width: 1px;
        border: 1px solid #000000;
        padding: 3px 5px 2px 14px;
        font-size: 14px;
        margin-left: -3px;
    }
    #UserSelect{
                     width: 129px !important;
        height: 43px !important;
        top: 265px;
        left: 1178px;
        border-width: 1px !important;
        border: 1px solid #000000 !important;
        padding: 3px 54px 2px 14px !important;
        margin-bottom: 18px;
        justify-content: right !important;
        margin-right: 467px;
        margin-left: 198px !important;
        margin-top: 34px;

  }



      #prescriptionTable {
    width: 100%;
    border-collapse: collapse;
    
    display: table !important;
    opacity: 1 !important;
    visibility: visible !important;

}
      /*.modal-backdrop {
    background: rgba(0, 0, 0, 0.5);*/ /* Adjust transparency */
/*}

.modal {
    z-index: 1050 !important;*/ /* Ensure modal is above but does not affect table */
/*}*/
.person-header {
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    background-color: #f0f0f0;
    padding: 8px;
}

.data-row {
    display: flex;
    justify-content: space-between;
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

.field-name {
    font-weight: bold;
    background-color: lightblue;
    padding: 8px;
    width: 40%;
}

td {
    padding: 8px;
    width: 60%;
}

.action-row td {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.edit-btn {
    background-color: lightblue;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    font-weight: bold;
}

.action-icons {
 
    cursor: pointer;
    font-size: 20px;
    margin-left: 10px;
}


             .row .col-8
      {
              padding: 10px !important;
    border: 1px solid #ced4da !important;
    border-radius: 30px !important;
    height: 49px !important;
    width: 212px !important;
    margin-left: 131px !important;
    margin-top: -40px !important;
      }
          .familyprescription-row .col-8 input {
    border:none !important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px !important;
}
      .familyprescription-row .col-8 select {
    border:none!important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px !important;
}
   }
   .row .col-8{
       padding: 10px; border: 1px solid #ced4da ; border-radius: 30px ; height: 49px; width: 285px;margin-left: 165px;margin-top: -40px;
   }

    .select2-container--default select2-selection select2-selection--multiple{
             width: 183px !important;
overflow: visible !important;
border: none !important;
background: transparent !important;
 }

.select2-container {
    z-index: 9999 !important; /* Ensures Select2 is above modal */
    position: absolute !important;
}

.select2-dropdown {
    z-index: 10000 !important; /* Make sure it's on top */
    position: absolute !important;
    left: 0 !important;
    width: 100% !important;
}

.modal {
    overflow-y: auto !important; /* Allows dropdown to be fully visible */
}

.select2-container--default .select2-selection--multiple {
    display: block !important;
    padding: 6px 12px !important;
    border-radius: 4px !important;
    min-height: 40px !important;
}

.select2-selection__rendered {
    display: flex !important;
    flex-wrap: wrap;
    gap: 5px; /* Adds space between selected items */
}

.select2-selection__choice {
    display: inline-flex !important;
    align-items: center;
    background-color: transparent; /* Change to match your design */
    color: black;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 14px;
    margin: 2px;
}
.familyprescription-row .col-8 select {
    border: none !important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px 52px !important;
}
.familyprescription-row .col-8 input {
    border: none !important;
    box-shadow: none !important;
    outline: none !important;
    border-radius: 5px !important;
    width: 100% !important;
    height: auto !important;
    padding: 5px 52px !important;
}
                     .share-btn {
               display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 7px;
        text-decoration: none;
        color: black;
        margin: 10px;
        border: none;
        border: 2px solid dimgray;
            width: 165px;
        }

   

        .share-btn img {
            margin-right: 8px;
        }

 @media (min-width: 769px) {
    .mobile-view { display: none; }
}
@media (max-width: 768px) {
    #prescriptionTableBody { display: none; }
}

            </style>
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

            <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

             <script type="text/javascript">
                 document.addEventListener("DOMContentLoaded", function () {
                     var conditionSelect = document.getElementById("ConditionSelect");
                     var otherConditionRow = document.getElementById("otherConditionRow");

                     if (conditionSelect) {
                         // Run only when the dropdown value changes
                         conditionSelect.addEventListener("change", function () {
                             debugger
                             if (this.options[this.selectedIndex].text === "Others") {
                                 otherConditionRow.style.display = "flex"; // Show the textbox row
                             } else {
                                 otherConditionRow.style.display = "none"; // Hide the textbox row
                             }
                         });
                     }
                 });
               
                 $(document).ready(function () {
                     $('#Power').select2({
                         dropdownParent: $('#exampleModal'), // Ensure dropdown is inside modal
                         width: '285px',
                         theme: "bootstrap-5",
                         dropdownAutoWidth: true,
                         containerCssClass: "custom-select2",
                         dropdownCssClass: "custom-select2-dropdown",
                       
                     });
                 }); $(document).ready(function () {
                     $('#Schedule option[value="0"]').remove();
                 });
                 $('#Power').select2()

             </script>
            <div id="contentpdf">
                <div class="row">
                <div style="display: flex;margin-left: 322px;height: 51px;text-align: center;width: 100%;justify-content: center;overflow-wrap: normal;">
                            <img src="/journal-page-images/article/familyprescriptionlogo.jpeg" style="width: 60px;">
                            <h1 style="color: #0331b5;margin-top: auto;margin-bottom: auto;margin-right: 702px;">Family Prescription</h1>
                        </div>
                     <%--   <div style="display: flex; margin-left: auto;">
                            <img src="/journal-page-images/article/familyprescriptionlogo.jpeg" style="width: 60px;" />
                            <h1 style="color: #0331b5; margin-top: auto; margin-bottom: auto;">Family Prescription</h1>
                        </div>--%>
                        <div style="display: flex; margin-left: auto; margin-right: 25px; margin-bottom: 10px; margin-top: 10px;">
                            <select class="form-select select-user" id="UserSelect" name="user[]">
                                <option value="" selected>All User</option>
                            </select>
                        </div>
                    </div>
                </div>



  <div class="button-container">
    <button type="button" class="btn-custom" id="addprescription"  onclick="addPrescription()"  >
        <img src="journal-page-images/article/plus.png" />
         Add
    </button>
    <button type="button" class="btn-custom" id="accessprescription" data-bs-toggle="modal" data-bs-target="#AccessModal"  >
         <img src="journal-page-images/article/color.png" />Access
    </button>
    <button type="button" class="btn-custom"  id="shareprescription" data-bs-toggle="modal" data-bs-target="#ShareModal">
        <img src="journal-page-images/article/icon_share.png" />  Share
    </button>
</div>
              

                <div class="row" style="max-width: 98vw; margin: auto; overflow:scroll;">
                    <div class="table-responsive">

                        <table id="prescription" class="table" style="border: solid; border-color: #dee2e6; border-width: thin;">
                            <thead>
                                <tr>
                                    <th hidden>Id</th>
                                    <th>
                                        <button >Member</button>
                                    </th>
                                    <th >
                                        <button >Condition</button>
                                    </th>
                                    <th >
                                        <button >Medication</button>
                                    </th>
                                    <th >
                                        <button >Dosage</button>
                                    </th>
                                    <th >
                                        <button >Schedule</button>
                                    </th>
                                    <th >
                                        <button >Timing</button>
                                    </th>
                                    <th >
                                        <button >Action</button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="prescriptionTableBody"></tbody>
                         
                             </table>
                            <div id="mobileTableBody" class="mobile-view" style="margin-left: -132px;display:none;"></div>
                          <%--<tbody id="prescriptionTableBody">--%>
                           
                      

                       
                        <%--</thead>
                            <tbody id="prescriptionTableBody">
                                <!-- Default rows will be inserted here -->
                            </tbody>
                        </table>--%>
                       <%-- <button id="addRowButton">Add Row</button>
                        <button id="submitPrescriptionButton">Submit Prescription</button>--%>
                    </div>
                </div>
            </div>




           <%-- <div style="display: flex; justify-content: end;">
                <div style="padding: 10px; bottom: 0;">
                    <button type="button" class="responsive-button" id="addprescription" onclick="addPrescription()">Add <i class="fa fa-add" style="color: #ffd101"></i></button>
                    <button type="button" class="responsive-button" id="accessprescription" data-bs-toggle="modal" data-bs-target="#AccessModal">Access <i class="fa fa-check-circle-o" style="color: #ffd101"></i></button>
                    <button type="button" class="responsive-button" id="shareprescription" data-bs-toggle="modal" data-bs-target="#ShareModal">Share <i class="fa fa-share" style="color: #ffd101"></i></button>
                </div>


            </div>--%>


            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Prescription Form</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row grid-row familyprescription-row">
                                <div class="row member" >
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text; pointer-events: none;" class="skip-tab" tabindex="-1">Member</button>
                                    </div>
                                    <div class="col col-8 " style="padding: 10px">
                                        <input type="hidden" id="PrescriptionId" name="Id[]">
                                        <select class="form-select member-select" id="MemberSelect" name="member[]">
                                            <option value="" disabled selected>Select Member</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row condition">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Condition</button>
                                    </div>
                                    <div class="col col-8 " style="padding: 10px">
                                        <select class="form-select condition-select" id="ConditionSelect" name="condition[]" style="width: 100%">
                                            <option value="" disabled selected>Select Condition</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row othercondition" id="otherConditionRow" style="display:none;">
    <div>

    </div>
    <div>
          <input type="text" class="form-control" style="width: 291px; margin-left: 154px;" id="othercondition" placeholder="Type Other Condition" name="othercondition[]" />
    </div>

</div>
                                <div class="medicationspan"> Medication:<asp:Label ID="lblcount" class="medication-label" Text="1" runat="server"></asp:Label>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Medication</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <input type="text" class="form-control" id="Medication" placeholder="Type Medication" name="medication[]" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Dosage</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <input type="text" class="form-control" id="Dosage" placeholder="Type Dosage" name="dosage[]" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Schedule</button>
                                    </div>
                                    <div class="col col-8">
                                        <%--<input type="text" class="form-control" id="Power" placeholder="Power" name="power[]" />--%>
                                        <select class="form-select" id="Power" name="power[]" multiple >
                                           <%-- <option value="" disabled >Select Schedule</option>--%>
                                            <option>All Days</option>
                                            <option>Sunday</option>
                                            <option>Monday</option>
                                            <option>Tuesday</option>
                                            <option>Wednesday</option>
                                            <option>Thursday</option>
                                            <option>Friday</option>
                                            <option>Saturday</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4" style="text-align: center; padding-top: 12px">
                                        <button style="pointer-events: none; height: 40px; width: 100px; background-color: #ACEDFF; border: none; border-radius: 5px; cursor: text" class="skip-tab" tabindex="-1">Timings</button>
                                    </div>
                                    <div class="col col-8" style="padding: 10px">
                                        <%--<input type="text" class="form-control" id="Timings" placeholder="Timings" name="timings[]" />--%>
                                        <select class="form-select" id="Timings" name="timings[]">
                                            <option value="" disabled selected>Select Timings</option>
                                            <option>After BreakFast</option>
                                            <option>Before BreakFast</option>
                                            <option>After Lunch</option>
                                            <option>Before Lunch</option>
                                            <option>After Dinner</option>
                                            <option>Before Dinner</option>
                                            <option>With a Meal</option>
                                            <option>Noon</option>
                                            <option>Tea Time</option>
                                         
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="addMoreBtn">Add More</button>
                            <button type="submit" class="btn btn-primary" id="saveprescription" onclick="submitForm(event)">Save</button>
                            <button type="button" class="btn btn-secondary" id="closeModalBtn" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="AccessModal" tabindex="-1" aria-labelledby="AccessModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title" id="AccessModalLabel">Give Access</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">
                              <span style="font-size:14px;">(If a Member is selected, Prescription access will be granted to them.)</span><br /><br />
                            <div id="checkboxContainer" style="display: flex; justify-content: space-evenly; width: 40%;"></div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="SetAccess">Save changes</button>

                        </div>

                    </div>
                </div>
            </div>
                             <div class="modal fade" id="ShareModal" tabindex="-1" aria-labelledby="ShareModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="ShareModalLabel">Share as File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body text-center">
                <!-- WhatsApp Button -->
                <button class="share-btn whatsapp-btn" onclick="sendWhatsApp(event)">
                           <img src="journal-page-images/article/whatsapp.png" />   WhatsApp
                 </button>
                 <!-- Email Button -->
                 <button class="share-btn gmail-btn" onclick="sendEmail(event)">
                     <img src="journal-page-images/article/gmail.png" />Gmail
                 </button>
            </div>
        </div>
    </div>
</div>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.31/jspdf.plugin.autotable.min.js"></script>
            <script>
                var FetchedData = [];
                var AccessMember = [];
                var memberOptionsFetched = false;
                var conditionOptionsFetched = false;
                var currentUser = [];
                var memberVal = '';
                var conditionVal = '';
                const desktopTable = document.getElementById("prescription");
                const desktopTableBody = document.getElementById("prescriptionTableBody");
                const mobileTableBody = document.getElementById("mobileTableBody");

                GetAccessData();
                function fetchData() {
                    FetchedData = [];
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "MedicalHistory.aspx/GetFamilyPrescriptions",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Data fetched successfully:", response.d);

                            
                            const dataList = JSON.parse(response.d);
                            FetchedData = dataList;

                            // Fetch the member options and condition options only once
                            if (memberOptionsFetched && conditionOptionsFetched) {
                                console.log("Data already fetched, not calling fetch again.");
                                populateTableWithData(FetchedData);
                            } else {
                                Promise.all([fetchMemberOptions(), fetchConditionOptions()])
                                    .then(() => {
                                        memberOptionsFetched = true;
                                        conditionOptionsFetched = true;
                                        populateTableWithData(FetchedData);
                                    })
                                    .catch(err => {
                                        console.error("Error fetching data:", err);
                                    });
                            }

                            $("#addprescription").prop('disabled', false);
                            $("#saveprescription").prop('disabled', false);
                        },
                        error: function (xhr, status, error) {
                            console.error("Error fetching data:", error);
                        }
                    });
                }
                //window.addEventListener("load", () => populateTableWithData(FetchedData));
                //window.addEventListener("resize", () => populateTableWithData(FetchedData));
                window.addEventListener("resize", function () {
                    console.log("Window Resized");
                    populateTableWithData(FetchedData);
                });
                function populateTableWithData(dataList)
                {

                    const isMobile = window.innerWidth <= 768;
                    
                    let filledRows = 0;
                    // Clear previous content
                   
                    desktopTableBody.innerHTML = "";
                    mobileTableBody.innerHTML = "";
                   // let cardBody = document.querySelector("#mo");

                 
                       
                    
                    if (isMobile)
                    {
                        desktopTable.innerHTML = "";
                        desktopTable.style.display = "none"; // Hide desktop table
                        mobileTableBody.style.display = "block";
                        populateMobileView(dataList, mobileTableBody);
                    }
                    else {
                        desktopTable.style.display = "table"; // Show desktop table
                        mobileTableBody.style.display = "none"; 
                        for (let i = 0; i < 14; i++) {
                            const rowData = dataList[i] || {};
                            addRecordTable(rowData, desktopTableBody);
                            filledRows++;
                        }


                        for (let i = filledRows; i < dataList.length; i++) {
                            addRecordTable(dataList[i], desktopTableBody);
                        }
                    }
                  
                }
              
                function populateMobileView(dataList, container) {
                    container.innerHTML = "";
                  // Clearing previous data
                    dataList.forEach(data => {
                        var hiddenData = "";
                        if (currentUser[0].user_id != data.UserId) {
                            hiddenData = "display:none;";
                        }
                        const conditions = conditionMaster.filter(opt => data.Conditions && data.Conditions.includes(opt.Id));
                        const conditionNames = conditions.map(condition => condition.ConditionName).join(', ');

                        // Creating the mobile view container
                        const rowHTML = `
        <div class="mobile-table-container" data-id="${data.Id || ''}" style="${hiddenData}">
            <table class="mobile-table">
                <tr><th>Member</th><td>${data.user_firstname || ''}</td></tr>
                <tr><th>Condition</th><td>${conditionNames || ''}</td></tr>
                <tr><th>Medication</th><td>${data.Medication || ''}</td></tr>
                <tr><th>Dosage</th><td>${data.Dosage || ''}</td></tr>
                <tr><th>Schedule</th><td>${data.Power || ''}</td></tr>
                <tr><th>Timing</th><td>${data.Timings || ''}</td></tr>
                <tr>
                    <th>Actions</th>
                    <td>
                        <button class="edit-btn" onclick="editPrescription(${data.Id || ''})">Edit</button>
                        <i class="fas fa-trash action-icons" onclick="removeRow(${data.Id || ''})"></i>
                    </td>
                </tr>
            </table>
        </div>
        `;

                        // Convert the string into an actual DOM element
                        const tempDiv = document.createElement("div");
                        tempDiv.innerHTML = rowHTML.trim(); // Ensure clean parsing

                        // Ensure the element is correctly created before appending
                        const mobileContainer = tempDiv.firstElementChild;
                        if (mobileContainer) {
                            container.appendChild(mobileContainer);
                        } else {
                            console.error("Failed to create mobile table container.");
                        }
                    });
                }






         

                function loadEmptyRows() {
                    const tableBody = document.querySelector("#prescriptionTableBody");
                    // Ensure that we load 6 empty rows initially
                    for (let i = 0; i < 14; i++) {
                        const newRow = document.createElement("tr");

                        // Set the height of the row to 41px
                        newRow.style.height = '41px';

                                        newRow.innerHTML = `
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                              <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                             <td style="width: 169.28px; height: 41px;">&nbsp;</td>
                         `;

                        tableBody.appendChild(newRow);
                    }
                }



                function GetAccessData() {
                    desktopTable.style.display = "table";

                    FetchedData = [];
                    $.ajax({
                        type: "POST", // Use POST instead of GET
                        url: "FamilyPrescription.aspx/GetAccessFamilyPrescription",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log("Data fetched successfully:", response.d);
                            //const dataList = JSON.parse(response.d);
                            AccessMember = response.d;
                        },
                        error: function (xhr, status, error) {
                            console.error("Error fetching data:", error);
                        }
                    });
                }
                var memberMaster = [];
                var conditionMaster = [];
                var isAllMasterFetched = false;

                let modalElement = document.getElementById('exampleModal');
                let modal = new bootstrap.Modal(modalElement);

              
                function addPrescription(data = {}) {

                    modal.show();
                 

                    $("#PrescriptionId").val(data.Id || '');
                    $("#MemberSelect").val(data.MemberId || '');
                    //const conditions = data.Conditions ? data.Conditions.split(',') : [];
                    //$("#ConditionSelect").val(conditions).trigger('change');
                    $("#ConditionSelect").val(data.Conditions || '');

                    $("#Medication").val(data.Medication || '');
                    $("#Power").val(data.Power || '');
                    $("#Dosage").val(data.Dosage || '');
                    $("#Timings").val(data.Timings || '');
                }
                function editPrescription(id) {
                    const data = FetchedData.filter(opt => opt.Id == parseInt(id));
                    addPrescription(data[0]);
                }

                $(document).ready(function () {
                   

                    $("#UserSelect").on("change", function () {
                        debugger
                        const selectedValue = $(this).val(); 
                        const tableBody = document.querySelector("#prescriptionTableBody");
                        tableBody.innerHTML = ''; 
                        
                        if (selectedValue != "") {

                            const FilteredData = FetchedData.filter(opt => opt.MemberId == parseInt(selectedValue));
                            populateRows(FilteredData); 
                        } else {
                           
                            populateRows(FetchedData);
                        }
                    });
                });

               

               
                function populateRows(dataList) {
                    debugger

                  

                    const tableBody = document.querySelector("#prescriptionTableBody");
                    let filledRows = 0;
                    desktopTableBody.innerHTML = "";
                    mobileTableBody.innerHTML = "";
                    const isMobile = window.innerWidth <= 768;

                    
                  
                    if (isMobile) {
                        populateMobileView(dataList, mobileTableBody);
                    }
                    else {
                        for (let i = 0; i < 14; i++) {
                            const rowData = dataList[i] || {};
                            addRecordTable(rowData, desktopTableBody);
                            filledRows++;
                        }


                        for (let i = filledRows; i < dataList.length; i++) {
                            addRecordTable(dataList[i], desktopTableBody);
                        }
                    }

                    
                }

              
            
                function addRecordTable(rowData, container) {
                    
                    //var hiddenData = "";
                    //    if (currentUser[0].user_id != rowData.UserId) {   
                    //        hiddenData = "display:none;";
                    //    }

                    const newRow = document.createElement("tr");
                    newRow.setAttribute("data-id", rowData.Id || '');
                    let conditionName = "";
                    if (rowData.Conditions) {
                        const conditionId = parseInt(rowData.Conditions); // Convert to number
                        const condition = conditionMaster.find(opt => opt.Id === conditionId);

                        if (condition.ConditionName == "Others") {
                            conditionName = rowData.otherConditions;
                        }
                        else {
                            conditionName = condition ? condition.ConditionName : "";
                        }// Assign name if found
                    }
                    const isEmptyRow = !rowData.user_firstname && !conditionName && !rowData.Medication && !rowData.Dosage && !rowData.Power && !rowData.Timings;
                    newRow.innerHTML = `
        <td hidden>${rowData.Id || ''}</td>
        <td style="text-align:center">${rowData.user_firstname || ''}</td>
        <td style="text-align:center">${conditionName || ''}</td>
        <td style="text-align:center">${rowData.Medication || ''}</td>
        <td style="text-align:center">${rowData.Dosage || ''}</td>
        <td style="text-align:center">${rowData.Power || ''}</td>
        <td style="text-align:center">${rowData.Timings || ''}</td>
        <td style="text-align:center;">
           ${!isEmptyRow ? `
            <i class="fas fa-edit action-icons" onclick="editPrescription(${rowData.Id || ''})"></i>
            &nbsp;
            <i class="fas fa-trash action-icons" onclick="removeRow(${rowData.Id || ''})"></i>` : ''}
        </td>
    
       
    `;

                    container.appendChild(newRow);
                }
         

                function fetchMemberOptions() {
                    return new Promise((resolve, reject) => {
                        $.ajax({
                            type: "POST",
                            url: "FamilyPrescription.aspx/UserData",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                const userData = JSON.parse(response.d);
                                currentUser = userData;
                                console.log(userData);

                                $.ajax({
                                    type: "POST",
                                    url: "MedicalHistory.aspx/GetUserMembers",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        const Data = JSON.parse(response.d);
                                        memberMaster = Data;
                                        const dependentMember = Data.filter(opt => opt.IsDependent == 1);
                                        const IndependentMember = Data.filter(opt => opt.IsDependent == 0);

                                        console.log("Members", Data);
                                        const select = document.getElementById('MemberSelect');
                                        const userselect = document.getElementById('UserSelect');

                                        // Clear previous options
                                        select.innerHTML = "";
                                        userselect.innerHTML = "";

                                        const placeholderOption = document.createElement('option');
                                        placeholderOption.value = "";
                                        placeholderOption.textContent = "Select Member";
                                        placeholderOption.disabled = true;
                                        placeholderOption.selected = true;
                                        select.appendChild(placeholderOption);

                                        const placeholderOption1 = document.createElement('option');
                                        placeholderOption1.value = "";
                                        placeholderOption1.textContent = "All User";
                                        placeholderOption1.disabled = true;
                                        placeholderOption1.selected = true;
                                        userselect.appendChild(placeholderOption1);

                                        // Add Current User Option
                                        const opt1 = document.createElement('option');
                                        opt1.value = currentUser[0].user_id;
                                        opt1.textContent = currentUser[0].user_firstname;
                                        select.appendChild(opt1);

                                        const opt2 = document.createElement('option');
                                        opt2.value = currentUser[0].user_id;
                                        opt2.textContent = currentUser[0].user_firstname;
                                        userselect.appendChild(opt2);

                                        // Adding Dependent Members
                                        dependentMember.forEach(option => {
                                            const opt1 = document.createElement('option');
                                            opt1.value = option.user_id;
                                            opt1.textContent = option.user_FirstName;
                                            select.appendChild(opt1);

                                            const opt2 = document.createElement('option');
                                            opt2.value = option.user_id;
                                            opt2.textContent = option.user_FirstName;
                                            userselect.appendChild(opt2);
                                        });

                                        console.log('Member Options Fetched');
                                        const container = document.getElementById("checkboxContainer");
                                        container.innerHTML = ""; // Clear previous checkboxes

                                        // Adding Independent Members
                                        IndependentMember.forEach(pair => {
                                            const checkbox = document.createElement("input");
                                            checkbox.type = "checkbox";
                                            checkbox.id = pair.user_id;
                                            checkbox.name = "options";
                                            checkbox.value = pair.user_id;
                                            if (AccessMember.includes(pair.user_id)) {
                                                checkbox.checked = true;
                                            }

                                            const label = document.createElement("label");
                                            label.htmlFor = pair.user_id;
                                            label.textContent = pair.user_FirstName;

                                            container.appendChild(checkbox);
                                            container.appendChild(label);

                                            // Create separate option elements for each dropdown
                                            const opt1 = document.createElement('option');
                                            opt1.value = pair.user_id;
                                            opt1.textContent = pair.user_FirstName;
                                            userselect.appendChild(opt1);

                                            const opt2 = document.createElement('option');
                                            opt2.value = pair.user_id;
                                            opt2.textContent = pair.user_FirstName;
                                            select.appendChild(opt2);

                                            container.appendChild(document.createElement("br"));
                                        });

                                        resolve();
                                    },
                                    error: function () {
                                        console.error('Error fetching members data');
                                        resolve();
                                    }
                                });
                            }
                        });
                    });
                }

                        function fetchConditionOptions() {
                    return new Promise((resolve, reject) => {
                        // Simulate async operation
                     
                            $.ajax({
                                type: "POST", // Use POST instead of GET
                                url: "MedicalHistory.aspx/GetCondionList",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    const Data = JSON.parse(response.d);
                                    conditionMaster = Data;
                                    console.log("Conditions", Data);
                                    const select = document.getElementById('ConditionSelect');
                                    conditionMaster.forEach(option => {
                                        const opt = document.createElement('option');
                                        opt.value = option.Id; // Set the option value
                                        opt.textContent = option.ConditionName; // Set the option text
                                        select.appendChild(opt); // Append the option
                                    });
                                    //$('#exampleModal').on('shown.bs.modal', function () {
                                    //    $('#ConditionSelect').select2({
                                    //        dropdownParent: $('#exampleModal')
                                    //    });
                                    //});

                                    //// Prevent modal close on select2 search click
                                    //$('#ConditionSelect').on('select2:opening select2:closing', function (e) {
                                    //    e.stopPropagation();
                                    //});
                                    //$('#ConditionSelect').select2();

                                    //// Trigger dropdown opening to show all options on click
                                    //$('#ConditionSelect').on('select2:open', function () {
                                    //    $('.select2-results__option').css('display', 'block');
                                    //});

                                    // Ensure dropdown shows all options initially

                                    console.log('Condition Options Fetched');
                                    resolve(); // Resolve the promise when done
                                },
                                error: function () {
                                    console.error('Error fetching conditions data');
                                    resolve();
                                }
                            });

                       
                    });
                }

                $("#addprescription").prop('disabled', true);
                $("#saveprescription").prop('disabled', true);
                fetchData();

                function removeRow(rowId) {
                    debugger
                    const isMobile = window.innerWidth <= 768;
                    var row = 0;
                    if (isMobile) {
                         row = document.querySelector(`.mobile-table-container[data-id='${rowId}']`);
                    }
                    else { row = document.querySelector(`tr[data-id='${rowId}']`); }
                    if (row) {

                        console.log(`Row with ID ${rowId} removed`); 
                        $.ajax({
                            type: "POST",
                            url: "FamilyPrescription.aspx/RemoveFamilyPrescription",  
                            data: JSON.stringify({ recordId: rowId }),  
                            contentType: "application/json; charset=utf-8",  // Set content type as JSON
                            dataType: "json",  // Expect JSON response
                            success: function (response) {
                                row.remove();  // Remove the row from the table/grid
                                toastr.success('User Prescription Removed Successfully!');

                                setTimeout(function () {
                                    location.reload();
                                }, 500);
                            },
                            error: function (error) {
                                // Handle error (e.g., show an error message)
                                console.error("Error removing record:", error);
                            }
                        });
                    }
                }
                $(document).ready(function () {
                    var medicationCount = 1; // Start with Medication 1
                    var isFirstDisabled = false; // Track if first row is disabled
                    $(".medication-label").text(medicationCount);
                  
                        $("#addMoreBtn").click(function () {
                            debugger
                            var lastRow = $(".familyprescription-row").last();
                            var newRow = lastRow.clone(); // Clone last row
                            medicationCount++; // Increment count

                            // Update Medication Label
                            newRow.find(".medication-label").text(medicationCount);
                            newRow.find('input, select, textarea').prop('disabled', false);
                            // Keep previous Member & Condition values
                            var memberVal = lastRow.find('select[name="member[]"]').val();
                            var conditionVal = lastRow.find('select[name="condition[]"]').val();
                            var otherconditionVal = lastRow.find('input[name="othercondition[]"]').val();
                            newRow.find('.member').hide();
                            newRow.find('.condition').hide();
                            newRow.find('.othercondition').hide();
                            // Remove Member and Condition fields from the new row
                            newRow.find('select[name="member[]"]').val(memberVal);
                            newRow.find('select[name="condition[]"]').val(conditionVal);
                            newRow.find('select[name="othercondition[]"]').val(otherconditionVal);
                            // Clear medication-specific fields
                            newRow.find('input[name="medication[]"]').val('');
                            newRow.find('select[name="power[]"]').val('').trigger('change');
                            newRow.find('input[name="dosage[]"]').val('');
                            newRow.find('select[name="timings[]"]').val('').trigger('change');

                          
                            // Make sure the new row has a `.medicationspan`
                            newRow.find('.medicationspan').each(function () {
                                $(this).removeAttr('id'); // Remove duplicate IDs
                            });

                            // Append the new row after the last row
                            lastRow.after(newRow);
                        });
                    




                });


                function submitForm(event) {
                    event.preventDefault();
                    var data = [];
                    var isValid = true;

                    $('.familyprescription-row').each(function () {
                        var row = $(this);
                        //var memberId = row.find('select[name="member[]"]').val();
                        //if (!memberId) {
                        //    isValid = false;

                        //    toastr.error('Member is required.');
                        //    return false;
                        //}
                        //var conditions = row.find('select[name="condition[]"]').val(); 

                        row.find('.medicationspan').each(function () {
                            var medicationRow = $(this);

                            // Get input values
                            var id = medicationRow.find('input[name="Id[]"]').val() || 0;
                            var memberId =medicationRow.find('select[name="member[]"]').val() || row.find('select[name="member[]"]').val();
                            var condition = medicationRow.find('select[name="condition[]"]').val() || row.find('select[name="condition[]"]').val();
                            var otherCondition = medicationRow.find('input[name="othercondition[]"]').val() || row.find('input[name="othercondition[]"]').val();
                            var medication = medicationRow.find('input[name="medication[]"]').val();
                            var powerValues = medicationRow.find('select[name="power[]"]').val() || [];
                            var dosage = medicationRow.find('input[name="dosage[]"]').val();
                            var timingsValues = medicationRow.find('select[name="timings[]"]').val() || [];

                            // Ensure timings is always an array
                            var timings = Array.isArray(timingsValues) ? timingsValues : timingsValues;

                            // **🚀 Only add row if it contains actual data**
                            if (memberId || condition || otherCondition || medication || dosage || timings.length > 0) {
                                data.push({
                                    id: id,
                                    memberId: memberId,
                                    condition: condition,
                                    otherCondition: otherCondition,
                                    medication: medication,
                                    power: powerValues.join(','), // Join array into a string
                                    dosage: dosage,
                                    timings: timings  // Keep it as an array
                                });
                            }
                        });
                    });

                    console.log("Final Data to Send:", data);

                    if (data.length == 0 && isValid) {
                        isValid = false;
                        toastr.error('Add at least one prescription.');
                    }

                    //if (isValid) {
                    //    $.ajax({
                    //        type: "POST",
                    //        url: "/MedicalHistory.aspx/SaveFamilyPrescription",
                    //        data: JSON.stringify({ data:data }),
                    //        contentType: "application/json; charset=utf-8",
                    //        dataType: "json",
                    //        success: function (response) {
                    //            $('#gridContainer').html('');
                    //            modal.hide();
                    //            toastr.success('User Prescription Saved Successfully!');
                    //            setTimeout(function () {
                    //                location.reload();
                    //            }, 200);
                    //        }
                    //    });
                    //}
                    if(isValid){
                        $.ajax({
                            type: "POST",
                            url: "FamilyPrescription.aspx/SaveFamilyPrescription",  // Updated URL
                            data: JSON.stringify({ jsonData: JSON.stringify(data) }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                if (response.d) {
                                    var result = JSON.parse(response.d);  // Parse response
                                    if (result.success) {
                                        $('#gridContainer').html('');
                                        modal.hide();
                                        toastr.success(result.message);
                                        setTimeout(function () {
                                            location.reload();
                                        }, 200);
                                    } else {
                                        toastr.error(result.message);
                                    }
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error("AJAX Error:", error);
                                toastr.error("Error saving prescription.");
                            }
                        });
                    }


                }




                //Access
                // Select the button and container for displaying the result
                const fetchCheckedButton = document.getElementById("SetAccess");


                // Add a click event to fetch all checked checkboxes
                fetchCheckedButton.addEventListener("click", () => {
                    // Get all checked checkboxes with the name "options"
                    const checkedCheckboxes = document.querySelectorAll('input[name="options"]:checked');

                    // Map through the NodeList to get their values
                    const checkedValues = String(Array.from(checkedCheckboxes).map(checkbox => checkbox.value));
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/SetAccessFamilyPrescription", // Update with your page name
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Access: checkedValues }),
                        success: function (response) {

                            toastr.success('Access Updated!');
                        }
                    });

                });



                function getBase64Image(url) {
                    return new Promise((resolve, reject) => {
                        let img = new Image();
                        img.crossOrigin = "Anonymous"; // To prevent CORS issues
                        img.src = url;
                        img.onload = function () {
                            let canvas = document.createElement("canvas");
                            canvas.width = img.width;
                            canvas.height = img.height;
                            let ctx = canvas.getContext("2d");
                            ctx.drawImage(img, 0, 0);
                            let dataURL = canvas.toDataURL("image/png"); // Convert to Base64
                            resolve(dataURL);
                        };
                        img.onerror = function () {
                            reject("Error loading image: " + url);
                        };
                    });
                }

                //async function generatePDF() {
                //    const { jsPDF } = window.jspdf;
                //    const doc = new jsPDF("landscape");

                //    const table = document.getElementById("prescription");
                //    if (!table) {
                //        console.error("Error: Table element not found!");
                //        return null;
                //    }

                //    try {
                //        const base64Image = await getBase64Image("/journal-page-images/article/familyprescriptionlogo.jpeg");

                //        const pageWidth = doc.internal.pageSize.getWidth(); // Get page width
                //        const imageWidth = 30; // Image width
                //        const xImage = (pageWidth - imageWidth) / 2; // Center image horizontally

                //        // Add centered image
                //        doc.addImage(base64Image, "JPEG", xImage, 5, imageWidth, 20);

                //        // Center text
                //        const text = "Family Prescription";
                //        const textWidth = doc.getTextWidth(text);
                //        const xText = (pageWidth - textWidth) / 2;

                //        doc.setFontSize(16);
                //        doc.setTextColor(0, 0, 255);
                //        doc.setFont("helvetica", "bold");
                //        doc.text(text, xText, 30); // Text below the image

                //        // Generate Table
                //        doc.autoTable({
                //            html: table,
                //            startY: 40, // Adjust position to avoid overlapping with the image and text
                //            theme: "grid",
                //            headStyles: { fillColor: [0, 150, 136], textColor: 255 },
                //            styles: { fontSize: 10, cellPadding: 2 },
                //            margin: { top: 10, left: 10, right: 10 }
                //        });

                //        return doc.output("datauristring");

                //    } catch (error) {
                //        console.error("Error generating PDF:", error);
                //        return null;
                //    }
                //}

                async function generatePDF() {
                    const { jsPDF } = window.jspdf;
                    const doc = new jsPDF("landscape");

                    const table = document.getElementById("prescription"); // Always use desktop version
                    if (!table) {
                        console.error("Error: Table element not found!");
                        return null;
                    }

                    try {
                        const base64Image = await getBase64Image("/journal-page-images/article/familyprescriptionlogo.jpeg");

                        const pageWidth = doc.internal.pageSize.getWidth();
                        const imageWidth = 30;
                        const xImage = (pageWidth - imageWidth) / 2;

                        doc.addImage(base64Image, "JPEG", xImage, 5, imageWidth, 20);

                        const text = "Family Prescription";
                        const textWidth = doc.getTextWidth(text);
                        const xText = (pageWidth - textWidth) / 2;

                        doc.setFontSize(16);
                        doc.setTextColor(0, 0, 255);
                        doc.setFont("helvetica", "bold");
                        doc.text(text, xText, 30);

                        doc.autoTable({
                            html: table,
                            startY: 40,
                            theme: "grid",
                            headStyles: { fillColor: [0, 150, 136], textColor: 255 },
                            styles: { fontSize: 10, cellPadding: 2 },
                            margin: { top: 10, left: 10, right: 10 }
                        });

                        return doc.output("datauristring");

                    } catch (error) {
                        console.error("Error generating PDF:", error);
                        return null;
                    }
                }

                async function generatePDF() {
                    const { jsPDF } = window.jspdf;
                    const doc = new jsPDF("landscape");

                    // Detect mobile view
                    const isMobile = window.innerWidth <= 768;

                    // Use appropriate table based on device
                    const table = isMobile
                        ? document.getElementById("mobileTableBody")
                        : document.getElementById("prescription");

                    if (!table) {
                        console.error("Error: Table element not found!");
                        return null;
                    }

                    // Temporarily override display if hidden
                    const originalDisplay = table.style.display;
                    table.style.display = "table"; // or "block" for div-style tables

                    try {
                        const base64Image = await getBase64Image("/journal-page-images/article/familyprescriptionlogo.jpeg");

                        const pageWidth = doc.internal.pageSize.getWidth();
                        const imageWidth = 30;
                        const xImage = (pageWidth - imageWidth) / 2;

                        doc.addImage(base64Image, "JPEG", xImage, 5, imageWidth, 20);

                        const text = "Family Prescription";
                        const textWidth = doc.getTextWidth(text);
                        const xText = (pageWidth - textWidth) / 2;

                        doc.setFontSize(16);
                        doc.setTextColor(0, 0, 255);
                        doc.setFont("helvetica", "bold");
                        doc.text(text, xText, 30);

                        doc.autoTable({
                            html: table,
                            startY: 40,
                            theme: "grid",
                            headStyles: { fillColor: [0, 150, 136], textColor: 255 },
                            styles: { fontSize: 10, cellPadding: 2 },
                            margin: { top: 10, left: 10, right: 10 }
                        });

                        return doc.output("datauristring");

                    } catch (error) {
                        console.error("Error generating PDF:", error);
                        return null;
                    } finally {
                        // Restore original display
                        table.style.display = originalDisplay;
                    }
                }




                async function sendWhatsApp(event) {
                    // Prevent the default action that might close the modal
                    event.stopPropagation();
                    event.preventDefault();

                    const pdfData = await generatePDF();
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/ShareFileAsLink",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ base64PDF: pdfData.split(",")[1], shareTo: 'WhatsApp' }), // Remove "data:application/pdf;base64,"
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            window.open(response.d, '_blank');
                           // fetchData();
                        },
                        error: function (error) {
                            console.log("Error Share File As Link:", error);
                        }
                    });
                }



                async function sendEmail(event) {
                    // Prevent the default action that might close the modal
                    event.stopPropagation();
                    event.preventDefault();
                    const pdfData = await generatePDF();
                    $.ajax({
                        type: "POST",
                        url: "FamilyPrescription.aspx/ShareFileAsLink",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ base64PDF: pdfData.split(",")[1], shareTo: 'Email' }), // Remove "data:application/pdf;base64,"
                        dataType: "json",
                        success: function (response) {
                            console.log(response);
                            window.open(response.d, '_blank');
                          //  fetchData();
                        },
                        error: function (error) {
                            console.log("Error Share File As Link:", error);
                        }
                    });
                }

               

            </script>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

 