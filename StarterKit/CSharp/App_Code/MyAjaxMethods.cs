/*
 * MS	06-06-03	added comment that the BitmapConverter does not cache the
 *					image for AjaxServerCache attribute duration
 * MS	06-07-04	added some more demo methods
 * 
 * 
 * 
 */
using System;
using System.Xml;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections;
using System.Collections.Generic;
using System.Security.Permissions;

/// <summary>
/// Example AjaxMethods that will test different behaviours.
/// </summary>
public partial class MyAjaxMethods
{
	// Because we are using only static methods we do not need a
	// constructor here.

	/// <summary>
	/// This method will test if a string can be used as an argument and return value.
	/// </summary>
	/// <param name="input">A string.</param>
	/// <returns>Returns a string with prefix "Hello ".</returns>
	[AjaxPro.AjaxMethod]
	public static string Test01(string input)
	{
		return "Hello " + input;
	}

	/// <summary>
	/// This method will test if a DateTime object can be used as an argument and return value.
	/// </summary>
	/// <param name="d">The DateTime object (will be a "new Date()" JavaScript object).</param>
	/// <returns>Returns a DateTime object where 10 minutes are added.</returns>
	[AjaxPro.AjaxMethod]
	public static DateTime Test02(DateTime d)
	{
		return d.AddMinutes(10);
	}

	/// <summary>
	/// This method will test if an interger array can be used as an argument and return value.
	/// </summary>
	/// <param name="i">An integer array.</param>
	/// <returns>Returns the integer array from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static int[] Test03(int[] i)
	{
		return i;
	}

	/// <summary>
	/// This method will test if an ArrayList can be used as an argument and return value.
	/// </summary>
	/// <param name="list">The ArrayList.</param>
	/// <returns>Returns the ArrayList from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static ArrayList Test04(ArrayList list)
	{
		return list;
	}

	/// <summary>
	/// This method will test if a Decimal value can be used as an argument and return value.
	/// </summary>
	/// <param name="d">The Decimal value.</param>
	/// <returns>Returns twice the Decimal value from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static Decimal Test05(Decimal d)
	{
		return d * 2;
	}

	/// <summary>
	/// This method will test if a DataSet object can be used as an argument and return value.
	/// </summary>
	/// <param name="ds">The DataSet object.</param>
	/// <returns>Returns the DataSet object from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static System.Data.DataSet Test06(System.Data.DataSet ds)
	{
		return ds;
	}

	/// <summary>
	/// This method will test if a boolean can be used as an argument and return value.
	/// </summary>
	/// <param name="b">The boolean.</param>
	/// <returns>Returns the opposite of the argument (!b).</returns>
	[AjaxPro.AjaxMethod]
	public static bool Test07(bool b)
	{
		return !b;
	}

	/// <summary>
	/// This method will test if a string array can be used as an argument and return value.
	/// </summary>
	/// <param name="s">The string array.</param>
	/// <returns>Returns a joined string with "#" as seperator.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test08(string[] s)
	{
		string ss = "";

		foreach (string _s in s)
			ss += _s + "#";

		return ss.Substring(0, ss.Length - 1);
	}

	/// <summary>
	/// This method will test if a generic list can be used as an argument and return value.
	/// </summary>
	/// <param name="s">The generic &lt;string&gt; list.</param>
	/// <returns>Returns the generic list from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static List<string> Test09(List<string> s)
	{
		return s;
	}

	/// <summary>
	/// This method will test if a generic list can be used as an argument and return value.
	/// </summary>
	/// <param name="d">The generic &lt;double&gt; list.</param>
	/// <returns>Returns the generic list from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static List<double> Test10(List<double> d)
	{
		return d;
	}

	/// <summary>
	/// This method will test if a char value can be used as an argument and return value.
	/// </summary>
	/// <param name="c">The char value.</param>
	/// <returns>Retruns the char value from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static char Test11(char c)
	{
		return c;
	}

	/// <summary>
	/// This method will test if a null char value can be used as a return value.
	/// </summary>
	/// <returns>Returns a null char.</returns>
	[AjaxPro.AjaxMethod]
	public static char Test12()
	{
		return (char)0;
	}

	/// <summary>
	/// This method will test if a null char value can be used as an argument and return value.
	/// </summary>
	/// <param name="c">The char value.</param>
	/// <returns>Returns a null char.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test13(char c)
	{
		return "\0";
	}

	/// <summary>
	/// This method will test if a custom class can be used as a return value.
	/// </summary>
	/// <returns>Returns a new instance of MyAjaxClass.</returns>
	[AjaxPro.AjaxMethod]
	public static MyAjaxClass Test14()
	{
		return new MyAjaxClass();
	}

	/// <summary>
	/// This method will test if a custom class can be used as an argument and return value.
	/// </summary>
	/// <param name="c">A custom class MyAjaxClass object.</param>
	/// <returns>Returns the MyClass object from the argument.</returns>
	[AjaxPro.AjaxMethod]
	public static MyAjaxClass Test15(MyAjaxClass c)
	{
		return c;
	}

	/// <summary>
	/// This method will test if a DataTable can be used as an argument and return value.
	/// </summary>
	/// <returns>Returns a DataTable.</returns>
	[AjaxPro.AjaxMethod]
	public static System.Data.DataTable Test16()
	{
		System.Data.DataTable dt = new System.Data.DataTable();

		dt.Columns.Add("FamilyName", typeof(string));
		dt.Columns.Add("Birthday", typeof(DateTime));
		// dt.Columns.Add("PersonInfo", typeof(MyClass));

		System.Data.DataRow row = dt.NewRow();

		row["FamilyName"] = "Schwarz";
		row["Birthday"] = new DateTime(1977, 4, 20);

		MyAjaxClass c = new MyAjaxClass();
		c.FirstName = "Michael";
		c.Age = 28;
		// row["PersonInfo"] = c;

		dt.Rows.Add(row);

		return dt;
	}

	/// <summary>
	/// This method will test if a DataTable can be used as an argument.
	/// </summary>
	/// <param name="dt">The DataTable.</param>
	/// <returns>Returns a string containing the xml representation of the DataSet.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test17(System.Data.DataTable dt)
	{
		System.Data.DataSet ds = new System.Data.DataSet();
		ds.Tables.Add(dt);

		return ds.GetXml();
	}

	/// <summary>
	/// This method will test if an XmlDocument object can be used as return value.
	/// </summary>
	/// <returns>Returns an XmlDocument object including special chars.</returns>
	[AjaxPro.AjaxMethod]
	public static System.Xml.XmlDocument Test18()
	{
		System.Xml.XmlDocument doc = new System.Xml.XmlDocument();

		doc.LoadXml("<ROOT/>");

		System.Xml.XmlElement e = doc.CreateElement("FirstName");
		e.InnerText = "Michael";

		doc.DocumentElement.AppendChild(e);

		e = doc.CreateElement("SpecialChars");
		e.InnerText = "öäüÖÄÜß!\"<>§$";

		doc.DocumentElement.AppendChild(e);

		return doc;
	}

	/// <summary>
	/// This method will test if Ajax.NET Professional can handle the PrincipalPermissionAttribute.
	/// The method can only be invoked when the current user is authenticated and the user is
	/// configured in the "myallowedgroupname" role.
	/// </summary>
	/// <returns>Returns a string if the authenticated user is in the "myallowedgroupname" role.</returns>
	[AjaxPro.AjaxMethod]
	[PrincipalPermission(SecurityAction.Demand, Role = "myallowedgroupname")]
	public static string Test19()
	{
		return "You should not see this text.";
	}

	/// <summary>
	/// This method will test if we need any argument.
	/// </summary>
	/// <returns>Returns a string.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test20()
	{
		return "Test";
	}

	/// <summary>
	/// This method will test if we can use an enum value as argument and return value.
	/// </summary>
	/// <param name="e">The MyAjaxEnum value.</param>
	/// <returns>Returns a MyAjaxEnum value.</returns>
	[AjaxPro.AjaxMethod]
	public static MyAjaxEnum Test21(MyAjaxEnum e)
	{
		if (e == MyAjaxEnum.No)
			return MyAjaxEnum.Yes;

		return MyAjaxEnum.None;
	}

	/// <summary>
	/// This method will test if we can use any JavaScript object as argument.
	/// </summary>
	/// <param name="o">A IJavaScriptObject object.</param>
	/// <returns>Returns the XML representation of the IJavaScriptObject.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test22(AjaxPro.IJavaScriptObject o)
	{
		System.Xml.XmlDocument doc = AjaxPro.JavaScriptUtil.ConvertIJavaScriptObjectToXml(o);
		return doc.OuterXml;
	}

	/// <summary>
	/// This method will test if we can convert a IJavaScriptObject XML representation.
	/// </summary>
	/// <param name="xml">The IJavaScriptObject XML representation.</param>
	/// <returns>Returns a IJavaScriptObject.</returns>
	[AjaxPro.AjaxMethod]
	public static AjaxPro.IJavaScriptObject Test23(string xml)
	{
		System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
		doc.LoadXml(xml);

		return AjaxPro.JavaScriptUtil.ConvertXmlToIJavaScriptObject(doc);
	}

	/// <summary>
	/// This method will test if we can use a DataView object with Sort and RowFilter as return value.
	/// </summary>
	/// <returns>Returns a DataView object.</returns>
	[AjaxPro.AjaxMethod]
	public static System.Data.DataView Test24()
	{
		System.Data.DataTable dt = new System.Data.DataTable();

		dt.Columns.Add("FirstName", typeof(string));
		dt.Columns.Add("Age", typeof(int));

		System.Data.DataRow row = dt.NewRow();
		row["FirstName"] = "Michael";
		row["Age"] = 29;
		dt.Rows.Add(row);

		row = dt.NewRow();
		row["FirstName"] = "Tanja";
		row["Age"] = 25;
		dt.Rows.Add(row);

		row = dt.NewRow();
		row["FirstName"] = "Marc Julian";
		row["Age"] = 4;
		dt.Rows.Add(row);

		row = dt.NewRow();
		row["FirstName"] = "Jan Oliver";
		row["Age"] = 1;
		dt.Rows.Add(row);

		System.Data.DataView dv = new System.Data.DataView(dt);

		dv.Sort = "Age";
		dv.RowFilter = "Age < 10";

		return dv;
	}

	/// <summary>
	/// This method will test if we can retreive the original JSON request data.
	/// </summary>
	/// <param name="s">A string value.</param>
	/// <param name="n">An integer value.</param>
	/// <returns>Returns the original JSON request data.</returns>
	[AjaxPro.AjaxMethod]
	public static string Test25(string s, int n)
	{
		string json = System.Web.HttpContext.Current.Items[AjaxPro.Utility.AjaxID + ".JSON"].ToString();

		AjaxPro.JavaScriptObject jso = (AjaxPro.JavaScriptObject)AjaxPro.JavaScriptDeserializer.DeserializeFromJson(json, typeof(AjaxPro.JavaScriptObject));

		if ((AjaxPro.JavaScriptString)jso["s"] != s || (int)((AjaxPro.JavaScriptNumber)jso["n"]) != n)
			throw new Exception("Wrong JSON format.");

		return json;
	}

	[AjaxPro.AjaxMethod]
	public static AjaxPro.JavaScriptObject Test26()
	{
		AjaxPro.JavaScriptObject o = new AjaxPro.JavaScriptObject();

		o.Add("firstName", new AjaxPro.JavaScriptString("Michael"));
		o.Add("age", new AjaxPro.JavaScriptNumber(29));
		o.Add("isMarried", new AjaxPro.JavaScriptBoolean(true));
		o.Add("x", new AjaxPro.JavaScriptNumber(2.3456));
		o.Add("y", new AjaxPro.JavaScriptArray(new AjaxPro.IJavaScriptObject[] { new AjaxPro.JavaScriptBoolean(true), new AjaxPro.JavaScriptNumber(2.33) }));

		return o;
	}

	[AjaxPro.AjaxMethod]
	public static Bitmap Test27()
	{
		Bitmap pic = new Bitmap(300, 80);
		Graphics g = Graphics.FromImage(pic);
		// g.SmoothingMode = SmoothingMode.AntiAlias;

		g.FillRectangle(new SolidBrush(Color.YellowGreen), 0, 0, 300, 80);
		g.DrawRectangle(new Pen(new SolidBrush(Color.Black)), 0, 0, 299, 79);

		g.DrawString("Your IP is: " + System.Web.HttpContext.Current.Request.UserHostAddress, new Font("Arial", 10),
			new SolidBrush(Color.Red), 10, 20);

		g.DrawString("Creation Time: " + DateTime.Now.ToString(), new Font("Courier New", 8),
			new SolidBrush(Color.Blue), 10, 40);

		return pic;
	}

	[AjaxPro.AjaxMethod]
	public static System.Collections.Generic.Dictionary<string, string> Test28()
	{
		System.Collections.Generic.Dictionary<string, string> n = new System.Collections.Generic.Dictionary<string, string>();

		n.Add("firstName", "Michael");
		n.Add("lastName", "Schwarz");
		n.Add("xy", "Hello World");

		return n;
	}

	[AjaxPro.AjaxMethod]
	public static System.Collections.Generic.Dictionary<string, int> Test29(System.Collections.Generic.Dictionary<string, int> n)
	{
		if (n == null)
		{
			n = new System.Collections.Generic.Dictionary<string, int>();

			n.Add("firstName", 1);
			n.Add("lastName", 2);
			n.Add("xy", 4333);
		}
		else n.Add("test", 90547);

		return n;
	}

	[AjaxPro.AjaxMethod]
	public static System.Collections.Specialized.NameValueCollection Test30(System.Collections.Specialized.NameValueCollection n)
	{
		n.Add("test", "AJAX");
		return n;
	}

	[AjaxPro.AjaxMethod]
	[AjaxPro.AjaxServerCache(240)]
	public static AjaxPro.IJavaScriptObject Test31()
	{
		XmlDocument doc = new XmlDocument();
		doc.Load("http://groups.google.de/group/ajaxpro/feed/rss_v2_0_msgs.xml");

		return AjaxPro.JavaScriptUtil.GetIJavaScriptObjectFromXmlNode(doc.DocumentElement);
	}
}



