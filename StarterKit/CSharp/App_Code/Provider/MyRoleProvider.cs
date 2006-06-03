using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Xml;

/// <summary>
/// Example RoleProvider that will use ~/App_Data/roles.xml to
/// store and read roles.
/// </summary>
public class MyRoleProvider : RoleProvider
{
	public override void AddUsersToRoles(string[] usernames, string[] roleNames)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string ApplicationName
	{
		get
		{
			throw new Exception("The method or operation is not implemented.");
		}
		set
		{
			throw new Exception("The method or operation is not implemented.");
		}
	}

	public override void CreateRole(string roleName)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string[] FindUsersInRole(string roleName, string usernameToMatch)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string[] GetAllRoles()
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string[] GetRolesForUser(string username)
	{
		XmlDocument roles = new XmlDocument();
		roles.Load(System.Web.HttpContext.Current.Server.MapPath("~/App_Data/roles.xml"));

		XmlNode n = roles.DocumentElement.SelectSingleNode("user[@name = '" + username.ToLower() + "']/@roles");
		
		if (n == null)
			return new string[0];

		return n.InnerText.Split(',');
	}

	public override string[] GetUsersInRole(string roleName)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool IsUserInRole(string username, string roleName)
	{
		string[] s = this.GetRolesForUser(username);

		roleName = roleName.ToLower();

		for (int i = 0; i < s.Length; i++)
		{
			if (s[i] == roleName)
				return true;
		}

		return false;
	}

	public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool RoleExists(string roleName)
	{
		throw new Exception("This method has not been implemented.");
	}
}