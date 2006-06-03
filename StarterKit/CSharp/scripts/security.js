addNamespace("MS.Web.Security");

MS.Web.Security = function(u_ele, p_ele, msg_ele) {
	this.u_ele = $(u_ele);
	this.p_ele = $(p_ele);
	this.msg_ele = $(msg_ele);
}

Object.extend(MS.Web.Security.prototype, {
	timer: null,
	
	msg_login_failed: "Could not login with specified username/password!",
	msg_logged_in_as: "Logged-in as <i>{0}</i>.",
	msg_logged_out: "Signout finished.",
	
	callback: function(res) {
		this.resetColors();
		var c = this.msg_ele;
		if(res.error != null) {
			c.innerHTML = res.error.Message;
			c.style.visibility = "visible";
		} else {
			c.innerHTML = res.value;
			c.style.visibility = "visible";
			c.style.backgroundColor = "Yellow";
			c.style.color = "Black";
		}
		this.doClear();
	},
	doClear: function() {
		if(this.timer != null) clearTimeout(this.timer);
		this.timer = setTimeout(this.clearMessage.bind(this), 3*1000);
	},
	clearMessage: function() {
		var c = this.msg_ele;
		c.innerHTML = "&nbsp;";
		c.style.visibility = "hidden";
	},
	resetColors: function() {
		var c = this.msg_ele;
		c.style.backgroundColor = "Red";
		c.style.color = "White";
	},
	doLogin: function() {
		AjaxPro.Services.Authentication.Login(this.u_ele.value, this.p_ele.value, this.doLogin_callback.bind(this));
	},
	doLogin_callback: function(res) {
		var c = this.msg_ele;
		if(res.error != null) {
			c.innerHTML = res.error.Message;
			c.style.visibility = "visible";
		} else if(res.value == false) {
			c.innerHTML = this.msg_login_failed;
			c.style.visibility = "visible";
		} else {
			c.innerHTML = String.format(this.msg_logged_in_as, res.request.args.username);
			c.style.visibility = "visible";
			c.style.backgroundColor = "Yellow";
			c.style.color = "Black";
		}
		this.doClear();
	},
	signOut: function() {
		AjaxPro.Services.Authentication.Logout(this.signOut_callback.bind(this));
	},
	signOut_callback: function(res) {
		var c = this.msg_ele;
		if(res.error != null) {
			c.innerHTML = res.error.Message;
			c.style.visibility = "visible";
		} else {
			c.innerHTML = this.msg_logged_out;
			c.style.visibility = "visible";
			c.style.backgroundColor = "Yellow";
			c.style.color = "Black";
		}
		this.doClear();
	}
}, false);