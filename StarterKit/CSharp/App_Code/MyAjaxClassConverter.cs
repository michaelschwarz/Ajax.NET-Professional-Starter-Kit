using System;
using System.Text;
using System.Data;

public class MyAjaxClassConverter : AjaxPro.IJavaScriptConverter
{
	private string clientType = "MyAjaxClass";

	public MyAjaxClassConverter()
		: base()
	{
	}

	public override string GetClientScript()
	{
		return @"var " + clientType + @" = function(age, firstName, birthday) {
	this.__type = ""MyAjaxClass,App_Code"";

	this.Age = age;
	this.FirstName = firstName;
	this.Birthday = birthday;

	this.GetAgeInDays = function() {
		return (new Date().getTime() - this.Birthday.getTime()) / 1000/60/60/24;
	}

	this.toJSON = function() {
		var o = [this.Age, this.FirstName, this.Birthday];
		return AjaxPro.toJSON(o);
	}
}
";
	}

	public override object Deserialize(AjaxPro.IJavaScriptObject o, Type t)
	{
		AjaxPro.JavaScriptArray a = o as AjaxPro.JavaScriptArray;

		if (a == null || a.Count != 3)
			throw new NotSupportedException();

		MyAjaxClass c = new MyAjaxClass();

		c.Age = (int)AjaxPro.JavaScriptDeserializer.Deserialize((AjaxPro.IJavaScriptObject)a[0], typeof(int));
		c.FirstName = a[1].ToString();
		c.Birthday = (DateTime)AjaxPro.JavaScriptDeserializer.Deserialize((AjaxPro.IJavaScriptObject)a[2], typeof(DateTime));

		return c;
	}


	public override string Serialize(object o)
	{
		MyAjaxClass c = o as MyAjaxClass;

		if (c == null)
			throw new NotSupportedException();

		StringBuilder sb = new StringBuilder();

		sb.Append("new ");
		sb.Append(clientType);
		sb.Append("(");

		sb.Append(AjaxPro.JavaScriptSerializer.Serialize(c.Age));
		sb.Append(",");
		sb.Append(AjaxPro.JavaScriptSerializer.Serialize(c.FirstName));
		sb.Append(",");
		sb.Append(AjaxPro.JavaScriptSerializer.Serialize(c.Birthday));

		sb.Append(")");

		return sb.ToString();
	}

	public override Type[] SerializableTypes
	{
		get
		{
			return new Type[] { typeof(MyAjaxClass) };
		}
	}

	public override Type[] DeserializableTypes
	{
		get
		{
			return new Type[] { typeof(MyAjaxClass) };
		}
	}

}

