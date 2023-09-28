<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AddBlog.aspx.cs" Inherits="hfiles.AddBlog" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager id="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Add Product</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Add Blog</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">
                        <h3>
                            <asp:Label Text="" ID="lblMsg" runat="server" /></h3>
                        <!-- general form elements disabled -->
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Add Product</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Blog Heading</label>
                                            <asp:TextBox runat="server" ID="txtHeading" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtHeading" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Blog Date</label>
                                            <asp:TextBox ID="txtBlogDate" CssClass="form-control" placeholder="Enter purpose name" runat="server" />
                                            <asp:CalendarExtender ID="blogdateCalendarExtender" TargetControlID="txtBlogDate" runat="server" Format="yyyy-MM-dd" Enabled="true"></asp:CalendarExtender>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtBlogDate" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Author Name</label>
                                            <asp:TextBox runat="server" ID="txtAuthorName" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtAuthorName" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Blog Catogory</label>
                                            <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" InitialValue="0" ControlToValidate="ddlCategory" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <label>Meta Title (max 70 characters)</label>
                                        <asp:TextBox ID="txtMetaTitle" runat="server" MaxLength="70" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtMetaTitle" runat="server" />
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <label>Meta Description (max 200 characters)</label>
                                        <textarea id="txtMetaDescription" runat="server" class="form-control" maxlength="200" rows="3" style="resize: none;"></textarea>
                                        <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtMetaDescription" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Sub Heading</label>
                                            <ckeditor:ckeditorcontrol ID="CKEditorBlogSubHeading" BasePath="~/ckeditor/" Toolbar="Advance" runat="server" Height="50">
                                            </ckeditor:ckeditorcontrol>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="CKEditorBlogSubHeading" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Keywords</label>
                                            <asp:TextBox runat="server" ID="txtKeywords" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddP" ControlToValidate="txtKeywords" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-file">
                                                <label class="custom-file-label">Blog Image</label>
                                                <asp:FileUpload runat="server" CssClass="custom-file-input" ID="fuProductMainImage" />
                                                <asp:RequiredFieldValidator ID="rfvMainimg" ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddP" ControlToValidate="fuProductMainImage" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Blog Body</label>
                                            <ckeditor:ckeditorcontrol ID="CKEditorBlogSection" BasePath="~/ckeditor/" Toolbar="Basic" runat="server" Height="50">
                                            </ckeditor:ckeditorcontrol>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="CKEditorBlogSection" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>1st Blog</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBlog1">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" InitialValue="0" ControlToValidate="ddlBlog1" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>2nd Blog</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBlog2">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddBb" InitialValue="0" ControlToValidate="ddlBlog2" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>3rd Blog</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBlog3">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddBb" InitialValue="0" ControlToValidate="ddlBlog3" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>4th Blog</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBlog4">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddBb" InitialValue="0" ControlToValidate="ddlBlog4" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>5th Blog</label>
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlBlog5">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddBb" InitialValue="0" ControlToValidate="ddlBlog5" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label>Reading Time</label>
                                            <asp:TextBox runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" ID="txtReadingMin">
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="Red" Display="Dynamic" ValidationGroup="AddB" ControlToValidate="txtReadingMin" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <asp:Button Text="Add Blog" ValidationGroup="AddB" CssClass="btn btn-dark float-right" ID="btnAddBlog" runat="server" OnClick="btnAddBlog_Click" />
                                        </div>
                                    </div>

                                </div>
                                <!-- input states -->
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                        <!-- general form elements disabled -->

                        <!-- /.card -->
                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
</asp:Content>
