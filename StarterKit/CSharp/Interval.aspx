<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Interval.aspx.cs" Inherits="IntervalWebForm" Title="Ajax.NET Professional - Interval and Object Example" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo ID="ArticleInfo1" runat="server"
	Title="Some special examples..."
	Published="2006-06-03T10:00:00"
	Author="Michael Schwarz"
	Description=" "
/>
    
<div id="loading" style="position:absolute;left:1px;top:1px;color:White;background-color:Red;padding:2px;margin:2px;display:none;">Loading...</div>

<p><a href="javascript:displayServerTime();void(0);">Display Server Time</a> <a href="javascript:runLongOperation();void(0);">Run Long Operation</a></p>
<p><a href="javascript:srvTime.start();void(0);">Start Interval</a> <a href="javascript:srvTime.stop();void(0);">Stop Interval</a> <span id="d_srvTime">?????</span></p>

<script type="text/javascript" src="scripts/interval.js"></script>

</asp:Content>