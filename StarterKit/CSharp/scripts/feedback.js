addNamespace("MS.Web.FormFeedback");

MS.Web.FormFeedback = function(form, ctrl_done) {
	this.form = form;
	this.ctrl_done = ctrl_done;
	addEvent(this.form, "submit", this.submit.bind(this));
}

Object.extend(MS.Web.FormFeedback.prototype, {
	callback: function(res) {
		if(res.error != null) {
			alert(res.error.Message);
		}
		if(res.value == true) {
			if(this.ctrl_done != null) {
				this.ctrl_done.style.visibility = "visible";
			}
			this.form.reset();
			setTimeout(this.clear.bind(this), 1300);
		}
	},
	clear: function() {
		if(this.ctrl_done != null) {
			this.ctrl_done.style.visibility = "hidden";
		}
	},
	submit: function(ev) {
		var data = {};
		var ele;
		for(var i=0; i<this.form.length; i++) {
			ele = this.form[i];
			switch(ele.tagName.toLowerCase()) {
				case "hidden":
				case "button":
					break;
				case "textarea":
					data[ele.name] = ele.value;
					break;
				case "input":
					switch(ele.type) {
						case "text":
						case "checkbox":
						case "radio":
							data[ele.name] = ele.value;
							break;
						default:
							break;
					}
					break;
				default:
					break;
			}
		}

		Feedback.Send(data, this.callback.bind(this));
		MS.cancelEvent(ev);
		return true;
	}
});