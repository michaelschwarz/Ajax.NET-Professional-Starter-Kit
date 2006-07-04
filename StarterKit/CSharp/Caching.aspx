<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Caching.aspx.cs" Inherits="CachingWebForm" Title="Untitled Page" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo runat="server"
	Title="AjaxServerCache example"
	Published="2006-07-04T20:00:00"
	Author="Michael Schwarz"
	Description="This example will show you how to use the AjaxServerCache attribute to reduce the CPU and database usage on the server-side code."
/>

<!-- content -->

<p>If you put an AjaxMethod attribute to a server-side method the method will be invoked every time you call this method. Using Ajax will increase the requests done to the web server, maybe with less data but more often. If there are a lot of identical requests it would be nice to have an attribute to tell how long the same result should be returned.</p>
<p>The following example will have the AjaxServerCache attribute for the GetServerTime method configured to cache the result for 10 seconds. This means if you call the method you will get 10 seconds the same requests.</p>

<pre class="codeSample">[AjaxMethod]
[AjaxServerCache(10)]
public static DateTime GetServerTime() 
{
  return DateTime.Now;
}</pre>

<p>Click <a href="javascript:getServerTime();void(0);">here</a> to invoke the GetServerTime method. Click several times the link to see that you will get the same result. Note that the server-side method is not invoked when in the time slice of 10 seconds.</p>

<script type="text/javascript">

function getServerTime() {
	CachingWebForm.GetServerTime(function(res){
		alert(res.value);
	});
}

</script>

<!-- end of content -->

</asp:Content>

