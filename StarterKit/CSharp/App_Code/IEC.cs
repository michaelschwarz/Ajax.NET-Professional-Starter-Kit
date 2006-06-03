using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Collections;
using System.Collections.Generic;

public class IEC : IEnumerable<MyAjaxClass>
{
	private List<MyAjaxClass> list = new List<MyAjaxClass>();

	public IEC()
	{
		list.Add(new MyAjaxClass());
		list.Add(new MyAjaxClass());

		list[1].FirstName = "Tanja";
	}

	#region IEnumerable<MyAjaxClass> Member

	public IEnumerator<MyAjaxClass> GetEnumerator()
	{
		return list.GetEnumerator();
	}

	#endregion

	#region IEnumerable Member

	IEnumerator IEnumerable.GetEnumerator()
	{
		return list.GetEnumerator();
	}

	#endregion
}