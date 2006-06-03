<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Converter.aspx.cs" Inherits="ConverterWebForm" Title="Ajax.NET Professional - JSON Converters" %>
<%@ Register TagPrefix="MS" TagName="ArticleInfo"  Src="~/controls/ArticleInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<MS:ArticleInfo ID="ArticleInfo1" runat="server"
	Title="IJavaScriptConverter Example"
	Published="2006-06-03T10:00:00"
	Author="Michael Schwarz"
	Description=" "
/>

<!-- content -->

<p>By default Ajax.NET Professional allows you to return any custom class or struct. The framework includes different converters to add some logic to the client-side JavaScript or to reduce the traffic sent to and from the web browser.</p>
<p>But let us first have a look at the custom class which we want to de-/serialize with a custom converter.</p>

<pre class="codeSample">public class MyAjaxClass
{
  private string m_FirstName = "Michael";
  private int m_Age = 29;
  public DateTime Birthday = new DateTime(1977, 4, 20);
	
  public MyAjaxClass()
  {
  }

  public double GetAgeInDays()
  {
    return ((TimeSpan)(DateTime.Now - Birthday)).TotalDays;
  }

  public string FirstName
  {
    get { return m_FirstName; }
    set { m_FirstName = value; }
  }

  public int Age
  {
    get { return m_Age; }
    set { m_Age = value; }
  }
}</pre>

<p>If your AjaxMethod will return such an instance the data that is returned to the client will look like this:</p>

<pre class="codeSample">{"__type":"MyAjaxClass,Assembly",</pre>

<!-- end of content -->

</asp:Content>

