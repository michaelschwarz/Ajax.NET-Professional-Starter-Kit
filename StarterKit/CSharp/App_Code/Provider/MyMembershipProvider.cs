using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Xml;

/// <summary>
/// Example MembershipProvider that will use ~/App_Data/users.xml to
/// store and read users.
/// </summary>
public class MyMembershipProvider : MembershipProvider
{
	private string m_ApplicationName;

	public override string ApplicationName
	{
		get
		{
			return m_ApplicationName;
		}
		set
		{
			m_ApplicationName = value;
		}
	}

	private XmlNode GetUserNode(string username)
	{
		XmlDocument users = new XmlDocument();
		users.Load(System.Web.HttpContext.Current.Server.MapPath("~/App_Data/users.xml"));

		XmlNode n = users.DocumentElement.SelectSingleNode("user[@name = '" + username.ToLower() + "']");
		return n;
	}

	public override bool ChangePassword(string username, string oldPassword, string newPassword)
	{
		XmlNode n = GetUserNode(username);

		XmlAttribute pwd = n.Attributes["password"];
		if (pwd == null || pwd.Value != oldPassword)
			return false;

		pwd.Value = newPassword;

		// save
		return true;
	}

	public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool DeleteUser(string username, bool deleteAllRelatedData)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool EnablePasswordReset
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override bool EnablePasswordRetrieval
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override int GetNumberOfUsersOnline()
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string GetPassword(string username, string answer)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override MembershipUser GetUser(string username, bool userIsOnline)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override string GetUserNameByEmail(string email)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override int MaxInvalidPasswordAttempts
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override int MinRequiredNonAlphanumericCharacters
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override int MinRequiredPasswordLength
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override int PasswordAttemptWindow
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override MembershipPasswordFormat PasswordFormat
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override string PasswordStrengthRegularExpression
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override bool RequiresQuestionAndAnswer
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override bool RequiresUniqueEmail
	{
		get { throw new Exception("The method or operation is not implemented."); }
	}

	public override string ResetPassword(string username, string answer)
	{
		throw new Exception("This method has not been implemented.");
	} 

	public override bool UnlockUser(string userName)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override void UpdateUser(MembershipUser user)
	{
		throw new Exception("This method has not been implemented.");
	}

	public override bool ValidateUser(string username, string password)
	{
		XmlNode n = GetUserNode(username);

		if (n == null)
			return false;

		XmlAttribute pwd = n.Attributes["password"];
		if (pwd == null || pwd.Value != password)
			return false;

		return true;
	}
}