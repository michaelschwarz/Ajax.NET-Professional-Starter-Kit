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

public partial class CachingWebForm : System.Web.UI.Page
{
	[AjaxPro.AjaxMethod]
	[AjaxPro.AjaxServerCache(10)]
	public DateTime GetServerTime()
	{
		return DateTime.Now;
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		AjaxPro.Utility.RegisterTypeForAjax(typeof(CachingWebForm));
    }
}
