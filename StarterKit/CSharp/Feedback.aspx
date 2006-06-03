<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="FeedbackWebForm" Title="Ajax.NET Professional - Feedback Example" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo ID="ArticleInfo1" runat="server"
	Title="How to use Ajax.NET on feedback forms"
	Published="2006-06-03T10:00:00"
	Author="Michael Schwarz"
	Description=" "
/>

<div id="d_Message" style="background-color:Lime;color:Black;padding:3px;text-align:center;visibility:hidden">Thanks for sending us your feedback!</div>
<div>
	<table>
		<tr>
			<td>First Name:</td><td><input type="text" name="firstName" /></td>
		</tr>
		<tr>
			<td>Family Name:</td><td><input type="text" name="familyName" /></td>
		</tr>
		<tr>
			<td>Family Name:</td><td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>Feedback Type:</td><td><input type="radio" name="feedbackType" value="0" checked="checked"/> Feedback &nbsp; <input type="radio" name="feedbackType" value="1" /> Request</td>
		</tr>
		<tr>
			<td>Your comment:</td><td><textarea name="comment" rows="5" cols="30"></textarea></td>
		</tr>
		<tr>
			<td></td><td><input type="submit" value="Send Feedback..." /></td>
		</tr>
	</table>  
</div>  

<script type="text/javascript" src="scripts/feedback.js"></script>
<script type="text/javascript">
var f = new MS.Web.FormFeedback(document.forms[0], $("d_Message"));
</script>

</asp:Content>