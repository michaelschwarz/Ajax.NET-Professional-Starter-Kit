<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Security.aspx.cs" Inherits="SecurityWebForm" Title="Ajax.NET Professional - Security Example" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo ID="ArticleInfo1" runat="server"
	Title="ASP.NET Security with Ajax.NET"
	Published="2006-06-03T10:00:00"
	Author="Michael Schwarz"
	Description="Ajax.NET is working great with forms authentication. See how you can use ASP.NET security to protect your Ajax.NET methods."
/>

<!-- content -->

<pre class="codeSample">[AjaxPro.AjaxMethod]
[PrincipalPermission(SecurityAction.Demand, <b>Role = "Admin"</b>)]
public static string AdminMethod()
{
  return "Hello Admin, you can get this text only if you are a Admin!";
}

[AjaxPro.AjaxMethod]
[PrincipalPermission(SecurityAction.Demand, <b>Role = "Admin"</b>)]
[PrincipalPermission(SecurityAction.Demand, <b>Role = "Editor"</b>)]
public static string EditorAndAdminMethod()
{
  return "Hello Editor or Admin, both roles can see this text!";
}</pre>

<div id="d_Message" style="background-color:Red;color:White;padding:3px;text-align:center;visibility:hidden">&nbsp;</div>

<p>If you are not logged-in you cannot run one of the methods below. Try to login as <i>admin</i> (role = Admin,Editor) or <i>editor</i> (role = Editor), both have the password <i>ajax</i>.</p>
<p>Try to invoke <a href="javascript:Security.AdminMethod(function(res){s.callback(res);});void(0);">AdminMethod()</a> which is only allowed for users in role <i>Admin</i>. Or try the <a href="javascript:Security.EditorAndAdminMethod(function(res){s.callback(res);});void(0);">EditorAndAdminMethod()</a> that can invoked from any <i>Admin</i> or <i>Editor</i>.</p>
	
<table>
<tr>
	<td>User Name:</td><td><input type="text" id="username"/></td>
</tr>
<tr>
	<td>Password:</td><td><input type="password" id="password" /></td>
</tr>
<tr>
	<td></td><td><a href="javascript:s.doLogin();void(0);">Login</a> <a href="javascript:s.signOut();void(0);">Sign Out</a></td>
</tr>
</table>  

<script type="text/javascript" src="scripts/security.js"></script>
<script type="text/javascript">
var s = new MS.Web.Security("username", "password", "d_Message");
</script>

<!-- end of content -->
		
</asp:Content>