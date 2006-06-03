using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

[AjaxPro.AjaxNamespace("AutoComplete")]
public partial class AutoCompleteWebForm : System.Web.UI.Page 
{
	[AjaxPro.AjaxMethod]
	public string[] SimpleSearch(string search)
	{
		return new string[] { "AAA", "BBB", "CCC", search };
	}

	[AjaxPro.AjaxMethod]
	public DataTable Search(string search, int count)
	{
		DataTable dt = new DataTable();

		dt.Columns.Add("CustomerID", typeof(int));
		dt.Columns.Add("CustomerName", typeof(string));

		SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["AjaxDemoSqlServer"]);

		SqlCommand cmd = new SqlCommand("SELECT TOP " + count + " ID, Name FROM Customers WHERE Name LIKE @Name ORDER BY Name", conn);
		cmd.Parameters.AddWithValue("@Name", search + "%");

		try
		{
			conn.Open();

			try
			{
				using (SqlDataReader dr = cmd.ExecuteReader())
				{
					DataRow row;

					while (dr.Read())
					{
						if (dr[0] == DBNull.Value || dr[1] == DBNull.Value)
							continue;

						row = dt.NewRow();

						row["CustomerID"] = dr[0];
						row["CustomerName"] = dr[1];

						dt.Rows.Add(row);
					}
				}
			}
			finally
			{
				conn.Close();
			}
		}
		catch (Exception ex)
		{
			throw ex;
		}

		return dt;
	}

	[AjaxPro.AjaxMethod]
	public DataTable SearchAdvanced(string orderNumber, int customerID, int count)
	{
		DataSet ds = new DataSet();

		SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["AjaxDemoSqlServer"]);
		
		SqlCommand cmd = new SqlCommand("SELECT TOP " + count + " * FROM Orders WHERE CustomerID = @CustomerID AND OrderNumber LIKE @OrderNumber ORDER BY OrderNumber, PartNumber, JobNumber", conn);
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
		catch (Exception ex)
		{
			throw ex;
		}

		return ds.Tables.Count == 1 ? ds.Tables[0] : null;
	}

	protected void Page_Load(object sender, EventArgs e)
    {
		// Register Ajax.NET methods from this class
		AjaxPro.Utility.RegisterTypeForAjax(typeof(AutoCompleteWebForm));
    }
}

