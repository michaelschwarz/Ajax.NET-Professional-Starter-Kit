/*
 * MS	06-07-04	initial version
 * 
 * 
 * 
 * 
 */
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

public partial class SessionWebForm : System.Web.UI.Page
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
}
