<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo runat="server"
	Title="Welcome to the Ajax.NET Professional Starter Kit"
	Published="2006-06-03T10:00:00"
	Author="Michael Schwarz"
	Description="This Starter Kit will help you to develop great web sites using Ajax.NET Professional"
/>

</asp:Content>

