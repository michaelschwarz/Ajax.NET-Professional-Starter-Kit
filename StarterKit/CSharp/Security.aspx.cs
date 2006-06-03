using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Security.Permissions;

[AjaxPro.AjaxNamespace("Security")]
public partial class SecurityWebForm : System.Web.UI.Page 
{
	[AjaxPro.AjaxMethod]
	[PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
	public static string AdminMethod()
	{
		return "Hello Admin, you can get this text only if you are a Admin!";
	}

	[AjaxPro.AjaxMethod]
	[PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
	[PrincipalPermission(SecurityAction.Demand, Role = "Editor")]
	public static string EditorAndAdminMethod()
	{
		return "Hello Editor or Admin, both roles can see this text!";
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		// Register Ajax.NET methods from this class
		AjaxPro.Utility.RegisterTypeForAjax(typeof(AjaxPro.Services.AuthenticationService));
		AjaxPro.Utility.RegisterTypeForAjax(typeof(SecurityWebForm));
    }
}
