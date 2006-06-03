using System;
using System.Data;
using System.Configuration;
using System.Web;

[AjaxPro.AjaxNamespace("Interval")]
public partial class IntervalWebForm : System.Web.UI.Page 
{
	/// <summary>
	/// This method will return the time on the web server.
	/// </summary>
	/// <returns>The time on the web server.</returns>
	[AjaxPro.AjaxMethod]
	public DateTime GetServerTime()
	{
		return DateTime.Now;
	}

	/// <summary>
	/// This method will simulate a long running method. Please have
	///	a look on the client-side JavaScript code for AjaxPro.onLoading.
	/// </summary>
	/// <returns>Returns always true.</returns>
	[AjaxPro.AjaxMethod]
	public bool LongOperation()
	{
		System.Threading.Thread.Sleep(3 * 1000);

		return true;
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		// Register Ajax.NET methods from this class
		AjaxPro.Utility.RegisterTypeForAjax(typeof(IntervalWebForm));
    }
}
