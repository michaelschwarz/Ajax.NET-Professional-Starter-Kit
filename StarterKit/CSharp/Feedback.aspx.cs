using System;
using System.Data;
using System.Configuration;
using System.Web;

[AjaxPro.AjaxNamespace("Feedback")]
public partial class FeedbackWebForm : System.Web.UI.Page 
{
	[AjaxPro.AjaxMethod]
	public static bool Send(AjaxPro.JavaScriptObject o)
	{
		string s = "";

		foreach (string key in o.Keys)
			s += key + ": " + o[key].ToString() + "\r\n";

		System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("localhost");

		smtp.Send("info@schwarz-interactive.de", "info@schwarz-interactive.de",
			"My Subject", s);

		return true;
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		// Register Ajax.NET methods from this class
		AjaxPro.Utility.RegisterTypeForAjax(typeof(FeedbackWebForm));
    }
}
