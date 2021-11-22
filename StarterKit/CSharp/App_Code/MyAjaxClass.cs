using System;

/// <summary>
/// Example custom class.
/// </summary>
public class MyAjaxClass
{
	private string m_FirstName = "Michael";
	private int m_Age = 35;
	public DateTime Birthday = new DateTime(1987, 4, 20);
	
	public MyAjaxClass()
	{
	}

	public double GetAgeInDays()
	{
		return ((TimeSpan)(DateTime.Now - Birthday)).TotalDays;
	}

	public string FirstName
	{
		get { return m_FirstName; }
		set { m_FirstName = value; }
	}

	public int Age
	{
		get { return m_Age; }
		set { m_Age = value; }
	}
}
