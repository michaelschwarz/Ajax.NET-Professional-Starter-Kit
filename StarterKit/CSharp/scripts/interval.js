AjaxPro.onLoading = function(b) {
	window.status = b ? "Loading..." : "";
	$("loading").style.display = b ? "inline" : "none";
}

/* use of callback method in invoke */

function displayServerTime() {
	Interval.GetServerTime(function(res) {
		if(res.value != null) {
			alert("The web server time: " + res.value.toLocaleString());
		}
	});
}

/* use of callback with separate function */

function runLongOperation() {
	Interval.LongOperation(runLongOperation_callback);
}

function runLongOperation_callback(res) {
	if(res != null && res.value == true) {
		alert("Finished long operation.");
	}
}

/* use of callback in JavaScript class */

var ServerTime = function(id) {
	this.id = id;
	this.isRunning = false;
	this.ondata = null;
	this._run = this._ondata = null;
}

Object.extend(ServerTime.prototype, {
	callback: function(res) {
		if(res != null && res.value != null) {
			this.currentTime = res.value;
		}
		if(this._ondata != null) {
			this._ondata();
		}
		setTimeout(this._run, 1000);
	},
	start: function() {
		if(this.isRunning) return;
		this.isRunning = true;
		if(typeof this.ondata == "function") {
			this._ondata = this.ondata.bind(this);
		}
		this._run = this.run.bind(this);		
		this.run();
	},
	run: function() {
		if(this.isRunning)
			Interval.GetServerTime(this.callback.bind(this), null, AjaxPro.noOperation);
	},
	stop: function() {
		this.isRunning = false;
	}
});

/* create an instance of the ServerTime class */

var srvTime = new ServerTime("d_srvTime");
srvTime.ondata = function() {
	$(this.id).innerHTML = this.currentTime.toLocaleString();
}