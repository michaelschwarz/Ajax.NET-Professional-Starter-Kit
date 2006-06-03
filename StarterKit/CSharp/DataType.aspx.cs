using System;
using System.Data;
using System.Configuration;
using System.Web;

[AjaxPro.AjaxNamespace("AjaxDataTypes")]
public partial class DataTypeWebForm : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
		AjaxPro.Utility.RegisterTypeForAjax(typeof(MyAjaxMethods));
		AjaxPro.Utility.RegisterEnumForAjax(typeof(MyAjaxEnum));
    }
}
