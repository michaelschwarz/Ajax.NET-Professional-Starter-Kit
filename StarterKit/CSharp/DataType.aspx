<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DataType.aspx.cs" Inherits="DataTypeWebForm" Title="Ajax.NET Professional - Data Type Examples" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>DataTypes working with Ajax.NET</h1>

<div class="date">Published: 02.06.2005<span class="datePipe"> | </span>Edited: 02.06.2006</div>
<div class="byline">Michael Schwarz</div>
<div class="overview"><p>Ajax.NET allows you to return any kind of class or struct. Mark your method with the AjaxMethod attribut, register the type to create wrapper files, finished!</p></div>
<div style="height: 18px"></div>

<!-- content -->

<p>I have created some example AjaxMethods to show how to use different data types with Ajax.NET starting with primitive data types, using DataSet or DataTable, DateTime and generic Lists or XML documents. Click on the button below to start all these test.</p>
<p><button id="btn">Run Test...</button></p>

<div id="display"></div>

<div id="loading" style="position:absolute;left:1px;top:1px;color:White;background-color:Red;padding:2px;margin:2px;display:none;">Loading...</div>

<!-- end of content -->

<script type="text/javascript" src="scripts/datatype.js"></script>

</asp:Content>