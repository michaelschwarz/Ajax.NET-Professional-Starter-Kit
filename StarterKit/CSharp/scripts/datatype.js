AjaxPro.onLoading = function(b) {
	window.status = b ? "Loading..." : "";
	$("loading").style.display = b ? "inline" : "none";
}

// =============================================================================
//
// The following array defines a list of Ajax.NET method tests.
//

var i = 0;
var oldResult = null;

var tests = [
	{
		desc: "Checks if a string will be parsed correct in both directions.",
		run:function() { MyAjaxMethods.Test01("Michael öäüß!\"§$%&/()=+´`@€'", callback); },
		callback:function(res) { return res.value == "Hello " + "Michael öäüß!\"§$%&/()=+´`@€'"; }
	},
	{
		desc: "Checks if a Date object will be parsed correct in both directions.",
		showValue: false,
		run:function() { var d = new Date();
			MyAjaxMethods.Test02(d, callback, d);
		},
		callback:function(res) { return res.value.getTime() == res.context.getTime() + 10*60*1000; }
	},
	{
		desc: "Checks if an integer array will be parsed correct in both directions.",
		run:function() { var i = [1,2,3,4,5,6];
			MyAjaxMethods.Test03(i, callback, i);
		},
		callback:function(res) { return compareArray(res.value, res.context); }
	},
	{
		desc: "Checks if an ArrayList will be parsed correct in both directions.",
		run:function() { var i = [1,2,3,"Hello World",true,-2000];
			MyAjaxMethods.Test04(i, callback, i);
		},
		callback:function(res) { return compareArray(res.value, res.context); }
	},
	{
		desc: "Checks if a Decimal value will be parsed correct in both directions.",
		run:function() { var i = -2.445566;
			MyAjaxMethods.Test05(i, callback, i);
		},
		callback:function(res) { return res.value == res.context *2; }
	},
	{
		desc: "Checks if a DataSet can be passed in both directions.",
		showValue: false,
		run:function() {
			var ds = new Ajax.Web.DataSet();
			var dt = new Ajax.Web.DataTable();
			dt.addColumn("FirstName", "System.String");
			dt.addColumn("Age", "System.Int32");
			ds.addTable(dt);
			
			var r = {};
			r.FirstName = "Michael";
			r.Age = 28;
			dt.addRow(r);
			
			MyAjaxMethods.Test06(ds, callback, ds);
		},
		callback:function(res) {
			return res.value.Tables[0].Rows[0].FirstName == "Michael" && res.value.Tables[0].Rows[0]["Age"] == 28 && !isNaN(res.value.Tables[0].Rows[0].Age && compareArray(res.value.Tables[0].Rows[0], res.context.Tables[0].Rows[0]));
		}
	},
	{
		desc: "Checks if a Boolean can be passed in both directions.",
		run:function() { MyAjaxMethods.Test07(true, callback); },
		callback:function(res) { return res.value == false; }
	},
	{
		desc: "Checks if a string array can be passed to the AJAX method.",
		run:function() { var l = ["Hello", "Michael", "Schwarz"];
			MyAjaxMethods.Test08(l, callback, l);
		},
		callback:function(res) { return res.value == res.context.join("#"); }
	},
	{
		desc: "Checks if a generic string list can be passed in both directions.",
		run:function() { var l = ["Hello", "Michael", "Schwarz"];
			MyAjaxMethods.Test09(l, callback, l);
		},
		callback:function(res) { return compareArray(res.value, res.context); }
	},
	{
		desc: "Checks if a generic double list can be passed in both directions.",
		run:function() { var l = [-1,-0.22223,0,1,2,3,4.5678,9.001];
			MyAjaxMethods.Test10(l, callback, l);
		},
		callback:function(res) { return compareArray(res.value, res.context); }
	},
	{
		desc: "Checks if a char can be passed in both directions.",
		run:function() { MyAjaxMethods.Test11("s", callback);
		},
		callback:function(res) { return "s" == res.value; }
	},
	{
		desc: "Checks if a null char can be returned.",
		run:function() { MyAjaxMethods.Test12(callback);
		},
		callback:function(res) { return "" == res.value; }
	},
	{
		desc: "Checks if a null string can be returned.",
		run:function() { MyAjaxMethods.Test13("", callback);
		},
		callback:function(res) { return "" == res.value; }
	},
	{
		desc: "Checks if embedded MyClass object can be returned.",
		showValue: false,
		run:function() { MyAjaxMethods.Test14(callback);
		},
		callback:function(res) {
			oldResult = res.value;
			return res.value.FirstName == "Michael";
		}
	},
	{
		desc: "Checks if embedded MyClass can be used as an argument.",
		showValue: false,
		run:function() { 
			oldResult.FirstName = "Hans";
			MyAjaxMethods.Test15(oldResult, callback);
		},
		callback:function(res) {
			return res.value.FirstName == "Hans";
		}
	},
	{
		desc: "Checks if we can get a DataTable with custom classes.",
		showValue: false,
		run:function() { MyAjaxMethods.Test16(callback); },
		callback:function(res) {
			oldResult = res.value;
			return res.value.Rows[0].FamilyName == "Schwarz";
		}
	},
	{
		desc: "Checks if a DataTable retrieved from server can be used as an argument.",
		showValue: false,
		run:function() { MyAjaxMethods.Test17(oldResult, callback); },
		callback:function(res) {
			return true;
		}
	},
	{
		desc: "Checks if an XmlDocument can be returned.",
		showValue: false,
		run:function() { MyAjaxMethods.Test18(callback); },
		callback:function(res) {
			if(res.value == null || res.value.documentElement == null) return false;
			if(MS.Browser.isIE)
				return res.value.documentElement.selectSingleNode("SpecialChars").text == "öäüÖÄÜß!\"<>§$";
			return res.value.documentElement.getElementsByTagName("SpecialChars")[0].firstChild.data == "öäüÖÄÜß!\"<>§$";
		}
	},
	{
		desc: "Checks if the PrincipalPermission attribute is working correct.",
		run:function() { MyAjaxMethods.Test19(callback); },
		callback:function(res) {
			return res.error != null && res.error.Type == "System.Security.SecurityException";
		}
	},
	{
		desc: "Checks if we need any argument or not.",
		run:function() { MyAjaxMethods.Test20(callback); },
		callback:function(res) {
			return res.value == "Test";
		}
	},
	{
		desc: "Checks if we can use enums in both directions.",
		run:function() { MyAjaxMethods.Test21(MyAjaxEnum.No, callback); },
		callback:function(res) {
			return res.value == MyAjaxEnum.Yes;
		}
	},
	{
		desc: "Checks if we can convert any JavaScript object into an XML.",
		showValue: false,
		obj:{"FirstName":"Michael","Age":29,"IsMarried":true,"Kids":["Marc Julian","Jan Oliver"],"PropertyA":-2345.6789},
		run:function() { MyAjaxMethods.Test22(this.obj, callback); },
		callback:function(res) {
			oldResult = res.value;
			return res.value == "<root><object><property name=\"FirstName\"><string>Michael</string></property><property name=\"Age\"><number>29</number></property><property name=\"IsMarried\"><boolean>true</boolean></property><property name=\"Kids\"><array><string>Marc Julian</string><string>Jan Oliver</string></array></property><property name=\"PropertyA\"><number>-2345.6789</number></property></object></root>";
		}
	},
	{
		desc: "Checks if we can convert a XML into an JavaScript object.",
		showValue: false,
		run:function() { MyAjaxMethods.Test23(oldResult, callback); },
		callback:function(res) {
			return res.value.FirstName == "Michael" && res.value.IsMarried == true && res.value.Age == 29 && res.value.Kids[0] == "Marc Julian" && res.value.PropertyA == -2345.6789;
		}
	},
	{
		desc: "Checks if we can get a DataView.",
		run:function() { MyAjaxMethods.Test24(callback); },
		callback:function(res) {
			return res.value.Rows.length == 2;
		}
	},
	{
		desc: "Checks if we can access the original JSON request.",
		run:function() { MyAjaxMethods.Test25("Hello World!", 555, callback); },
		callback:function(res) {
			return res.value == "{\"s\":\"Hello World!\",\"n\":555}";
		}
	},
	{
		desc: "Checks if we can return a on-the-fly generated JavaScript object.",
		run:function() { MyAjaxMethods.Test26(callback); },
		callback:function(res) {
			return res.value.firstName == "Michael" && res.value.isMarried == true && res.value.age == 29;
		}
	},
	{
		desc: "Checks if we can return a Bitmap.",
		run:function() { MyAjaxMethods.Test27(callback); },
		callback:function(res) {
			var b = res.value != null;
			if(b) {
				this.html = "<a href=\"" + res.value.src + "\"><img src=\"" + res.value.src + "\" border=\"0\"/></a>";
				// document.body.appendChild(res.value.getImage());
			}
			return b;
		}
	},
	{
		run:function() {
			// alert("Done.");
		}
	}
];

function compareArray(a, b) {
	if(a == null || b == null) return false;
	if(a.length != b.length) return false;
	for(var i=0; i<a.length; i++) {
		if(typeof a[i] != typeof b[i]) return false;
		if(a[i] != b[i]) return false;
	}
	return true;
}

function callback(res) {
	var v = [];
	
	if(tests[i].callback(res) == true) {
		v.push("<p><b>Test " + (i+1) + " finished</b>");
		if(tests[i].desc) v.push("<br/><i>" + tests[i].desc + "</i>");

		if(tests[i].html != null) {
			v.push("<br/>" + tests[i].html);
		}
		
		if(tests[i].showValue != false) {
			v.push("<pre class=\"codeSample\"><b>res.request:</b>\r\n " + AjaxPro.toJSON(res.request).replace(/</g,"&lt;").replace(/>/g,"&gt;") + "\r\n");
			v.push("<b>res.value:</b>\r\n " + AjaxPro.toJSON(res.value).replace(/</g,"&lt;").replace(/>/g,"&gt;") + "</pre>");
		}
		
		v.push("</p>");
	} else {
		v.push("<p><b style=\"color:red\">Test " + (i+1) + " failed" + (res.error != null ? " (" + res.error.Message + ")" : "") + "</b>");
		if(tests[i].desc) v.push("<br/><i>" + tests[i].desc + "</i>");
		
		if(tests[i].html != null) {
			v.push("<br/>" + tests[i].html);
		}
		
		v.push("</p>");
		v.push("<pre class=\"codeSample\"><b>res.error:</b>\r\n " + AjaxPro.toJSON(res.error).replace(/</g,"&lt;").replace(/>/g,"&gt;") + "\r\n");
		v.push("<b>res.request:</b>\r\n " + AjaxPro.toJSON(res.request).replace(/</g,"&lt;").replace(/>/g,"&gt;") + "\r\n");
		v.push("<b>res.value:</b>\r\n " + AjaxPro.toJSON(res.value).replace(/</g,"&lt;").replace(/>/g,"&gt;") + "</pre>");
	}


	$("display").innerHTML += v.join('');
	
	i++;
	setTimeout(run, 10);
}

function run() {
	if(i<tests.length) {
		tests[i].run();
	}
}

function btn_click(ev) {
	$('display').innerHTML='';
	i=0;
	run();
	MS.cancelEvent(ev);
	return true;	
}

function init() {
	addEvent($("btn"), "click", btn_click);
}

// =============================================================================
//
// Start the test of several methods...
//

setTimeout(init, 1);