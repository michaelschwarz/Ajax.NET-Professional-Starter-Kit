<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Session.aspx.cs" Inherits="SessionWebForm" Title="Untitled Page" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo runat="server"
	Title="Session example"
	Published="2006-07-04T20:00:00"
	Author="Michael Schwarz"
	Description="This example will show you how to access the session collection."
/>

<!-- content -->

<p>If you want to access the session collection you have to use the HttpContext instead of the page property.</p>

<pre class="codeSample">public partial class SessionWebForm : System.Web.UI.Page
{
  [AjaxPro.AjaxMethod]
  public static bool SetSession(string name, string value)
  {
    HttpContext.Current.Session[name] = value;
    return true;
  }

  [AjaxPro.AjaxMethod]
  public static string GetSession(string name)
  {
    return HttpContext.Current.Session[name].ToString();
  }

  protected void Page_Load(object sender, EventArgs e)
  {
    AjaxPro.Utility.RegisterTypeForAjax(typeof(SessionWebForm));
  }
}</pre>

<p>Click <a href="javascript:setSession();void(0);">here</a> to set a session value and <a href="javascript:getSession();void(0);">here</a> to get the value back from server-side code. Try to reload this page (using Internet Explorer press F5) and click on the second link to see if you get the same value!</p>

<script type="text/javascript">

function setSession() {
	SessionWebForm.SetSession("test", new Date().toLocaleString(), function(res){
		if(res.error != null) {
			alert(res.error.Message);
			return;
		}
		alert("Session value is set to '" + res.request.args.value + "'");
	});
}

function getSession() {
	SessionWebForm.GetSession("test", function(res){
		if(res.error != null) {
			alert(res.error.Message);
			return;
		}
		alert("Session value = " + res.value);
	});
}

</script>

<!-- end of content -->

</asp:Content>

