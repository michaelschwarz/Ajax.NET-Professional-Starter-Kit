using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

[AjaxPro.AjaxNamespace("ArticleInfo")]
public partial class controls_ArticleInfo : System.Web.UI.UserControl
{
	private string m_Title;

	public string Title
	{
		get { return m_Title; }
		set { m_Title = value; }
	}

	private DateTime m_Published;

	public DateTime Published
	{
		get { return m_Published; }
		set { m_Published = value; }
	}

	private DateTime m_Edited;

	public DateTime Edited
	{
		get { return m_Edited; }
		set { m_Edited = value; }
	}

	private string m_Author;

	public string Author
	{
		get { return m_Author; }
		set { m_Author = value; }
	}

	private string m_Description;

	public string Description
	{
		get { return m_Description; }
		set { m_Description = value; }
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		AjaxPro.Utility.RegisterTypeForAjax(typeof(controls_ArticleInfo), Page);

		Page.RegisterClientScriptBlock("ArticleInfo", @"<script type=""text/javascript"">
function getAgeInDays_callback(res) {
	window.status = ""The article has been published "" + res.value + "" days ago."";
}
function getAgeInDays(d) {
	ArticleInfo.GetAgeInDays(d, getAgeInDays_callback);
}

</script>");
    }

	[AjaxPro.AjaxMethod]
	public static double GetAgeInDays(DateTime d)
	{
		return ((TimeSpan)(DateTime.Now - d)).TotalDays;
	}
}
