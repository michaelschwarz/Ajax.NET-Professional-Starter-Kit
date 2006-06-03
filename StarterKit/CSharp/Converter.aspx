<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Converter.aspx.cs" Inherits="ConverterWebForm" Title="Ajax.NET Professional - JSON Converters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>IJavaScriptConverter Example</h1>

<div class="date">Published: 02.06.2005<span class="datePipe"> | </span>Edited: 02.06.2006</div>
<div class="byline">Michael Schwarz</div>
<div class="overview"><p> </p></div>
<div style="height: 18px"></div>

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

