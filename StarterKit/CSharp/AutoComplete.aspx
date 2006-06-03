<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AutoComplete.aspx.cs" Inherits="AutoCompleteWebForm" Title="Ajax.NET Professional - AutoComplete Example" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>AutoComplete Example</h1>

<div class="date">Published: 02.06.2005<span class="datePipe"> | </span>Edited: 02.06.2006</div>
<div class="byline">Michael Schwarz</div>
<div class="overview"><p>Ajax.NET comes without any web control, it is designed only for data exchange with the web server. Here you will see how easy it is to implement a AutoComplete feature.</p></div>
<div style="height: 18px"></div>


<p>This example will include following features:</p>

<ul>
	<li>Keyboard support (TAB, ENTER, DOWN, UP, ESC)</li>
	<li>Mouse support (select on value with the mouse, dblclick in textbox to get list)</li>
	<li>ParentControl support (change value if parent control has been changed)</li>
	<li>DataTable built-in support</li>
	<li>MinChars needed support (default is 0)</li>
	<li>WaitAfterInput to prevent high request interval to the server</li>
</ul>

<p>Please notice that it is only tested on Firefox and Internet Explorer, it may fail on other web browser not because of Ajax.NET.</p>
<p>Try to enter a cusomter name beginning with <i>A</i>. You will see a list of customer names I have stored in SQL Server. Hitting <i>Tab</i> will place your cursor in the order number text box. All order numbers are starting with <i>0</i>, so try to enter <i>0</i>. You should see a order number in bold and maybe one character at the end in red. If you use a customer name starting with i.e. <i>M</i> you will get a different order number selection, it will be text only.</p>

<p>Customer: <input type="text" id="searchCustomerID" /></p>
<p>OrderNumber: <input type="text" id="searchOrder" /></p>

<h2>JavaScript Code</h2>

<p>To use the example AutoComplete feature you need to add a behaviour to the text box control. After you have included the <i>autocomplete.js</i> you can write this:</p>

<pre class="codeSample">&lt;script type="text/javascript" src="scripts/autocomplete.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
function init() {
  var x = new MS.Web.AutoCompleteDataTable("searchCustomerID", 10);

  x.getDisplay = function(item) {
    return (item != null ? item.CustomerName : "");
  }
  x.getValue = function(item) {
    return (item != null ? item.CustomerName.toString().trimRight() : "");
  }
  x.getData = function() {
    <b>Namespcae.Classname.AjaxMethod</b>(this.ele.value, this.count, this.callback.bind(this));
  }
}
addEvent(window, "load", init);
&lt;/script&gt;</pre>

<p>In the example above we are returning a DataTable from the method <i>Namespcae.Classname.AjaxMethod</i>. In <i>getDisplay()</i> we have to return the data that will be displayed in the select control, and <i>getValue()</i> must return the text that will be put in the text box value after selected one item.</p>

<h2>C# Source Code</h2>

<p>Below you will find the source code used on the server-side Ajax.NET method which will return the list of order numbers for the second text box.</p>

<pre class="codeSample">[AjaxPro.AjaxMethod]
public <b>DataTable</b> SearchAdvanced(string orderNumber, int customerID, int count)
{
  DataSet ds = new DataSet();

  SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["AjaxDemoSqlServer"]);
		
  SqlCommand cmd = new SqlCommand("SELECT TOP " + count + " * FROM Orders " + 
                                       "WHERE CustomerID = @CustomerID " +
                                       "AND OrderNumber LIKE @OrderNumber " +
                                       "ORDER BY OrderNumber, PartNumber, JobNumber", conn);

  cmd.Parameters.AddWithValue("@CustomerID", customerID);
  cmd.Parameters.AddWithValue("@OrderNumber", orderNumber + "%");

  try
  {
    conn.Open();

    try
    {
      SqlDataAdapter da = new SqlDataAdapter(cmd);
      da.Fill(ds);
    }
    finally
    {
      conn.Close();
    }
  }
  catch (Exception)
  {
    return null;
  }

  return ds.Tables.Count == 1 ? ds.Tables[0] : null;
}</pre>

<p>As you can see it doesn't matter which arguments you want to use for the search. If you want to return a <i>string[]</i> you can simply use the <i>MS.Web.AutoComplete</i> class in JavaScript and only implement the <i>getData()</i> method, that's all.</p>


<script type="text/javascript" src="scripts/autocomplete.js"></script>
<script type="text/javascript">
function init() {

	var x = new MS.Web.AutoCompleteDataTable("searchCustomerID", 10);

	x.getDisplay = function(item) {
		return (item != null ? item.CustomerName : "");
	}
	x.getValue = function(item) {
		// return item.CustomerID;
		return (item != null ? item.CustomerName.toString().trimRight() : "");
	}
	x.getData = function() {
		AutoComplete.Search(this.ele.value, this.count, this.callback.bind(this));
	}

	var y = new MS.Web.AutoCompleteDataTable("searchOrder", 10, x);
	y.getDisplay = function(item) {
		if(item == null) return "";
		
		if(item.CustomerID < 100)
			return "<div style=\"float:left;font-weight:bold;\">" + item.OrderNumber + item.PartNumber + "</div><div style=\"width:20px;float:right;color:Red\">" + item.JobNumber + "</div>";
		
		return (item != null ? item.OrderNumber + item.PartNumber + item.JobNumber + " (CID:" + item.CustomerID + ")" : "");
	}
	y.getValue = function(item) {
		return item.OrderNumber + item.PartNumber + item.JobNumber;
	}
	y.getData = function() {
		var cid = x.getItem(x.pos);
		cid = (cid != null ? cid.CustomerID : "");
		AutoComplete.SearchAdvanced(this.ele.value, cid, this.count, this.callback.bind(this));
	};

}

setTimeout(init, 1);
</script>
		
</asp:Content>