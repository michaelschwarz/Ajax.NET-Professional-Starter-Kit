addNamespace("MS.Web.AutoComplete");

MS.Web.AutoComplete = Class.create();

Object.extend(MS.Web.AutoComplete.prototype, {
	timer: null,
	count: 10,
	pos: -1,
	waitAfterInput: 230,
	minChars: 0,
	children: null,
	
	changeHighlight: function() {
		var l = this.getLength();
		for(var i=0; i<this.count && i<l; i++) {
			if(i == this.pos)
				this.div.childNodes[i].className = "item selected";
			else
				this.div.childNodes[i].className = "item"
		}
	},
	getItem: function(idx) {
		return null;
	},
	getLength: function() {
		return 0;
	},
	getDisplay: function(item) {
		return item;
	},
	getValue: function(item) {
		return item;
	},
	hide: function() {
		this.div.style.display = "none";
	},
	show: function() {
		this.changeHighlight();
		this.div.style.display = "inline";
	},
	focusTextbox: function() {
		this.ele.focus();
	},
	select: function() {
		if(this.pos > -1) {
			var v = this.getValue(this.getItem(this.pos));
			if(v != this.ele.value) {
				this.ele.value = v;
				if(this.children != null)
					for(var i=0; i<this.children.length; i++) {
						this.children[i].onparentchange(v);
					}
			}
		}
		this.hide();	
	},
	onkeydown: function(e) {
		var key = MS.Keys.getCode(e);
		switch(key) {
			case MS.Keys.TAB:
			case MS.Keys.ENTER:
				this.select();
				if(key == MS.Keys.ENTER) MS.cancelEvent(e);
				break;

			case MS.Keys.ESC:
				this.hide();
				break;

			case MS.Keys.KEYUP:
				if(this.pos > 0) this.pos--;
				this.changeHighlight();
				break;

			case MS.Keys.KEYDOWN:
				if(this.pos < this.getLength() -1 && this.pos < this.count -1) this.pos++;
				this.changeHighlight();
				break;
		}
	},
	onkeyup: function(e) {
		switch(MS.Keys.getCode(e)) {
			case MS.Keys.TAB:
			case MS.Keys.ENTER:
			case MS.Keys.ESC:
			case MS.Keys.KEYUP:
			case MS.Keys.KEYDOWN:
			case MS.Keys.KEYLEFT:
			case MS.Keys.KEYRIGHT:
			case MS.Keys.ALT:
			case MS.Keys.SHIFT:
			case MS.Keys.CTRL:
				break;

			default:
				if(this.ele.value.length < this.minChars)
					return false;
					
				if(this.timer != null) clearTimeout(this.timer);
				this.timer = setTimeout(this.getData.bind(this), this.waitAfterInput);
				break;
		}
	},
	onfocus: function(e) {
		this.changeHighlight();
	},
	onblur: function(e) {
		setTimeout(this.hide.bind(this), 200);	// 200 msec for onclick event of item
	},
	onmouseover: function(e) {
		this.pos = MS.getTarget(e).idx;
		this.changeHighlight();
	},
	onclick: function(e) {
		this.pos = MS.getTarget(e).idx;
		this.changeHighlight();
		this.select();
	},
	ondblclick: function(e) {
		if(this.ele.value == "")
			this.getData();
	},
	onchange: function(e) {
		if(this.children != null)
			for(var i=0; i<this.children.length; i++) {
				this.children[i].onparentchange(this.ele.value);
			}
	},
	onparentchange: function(v) {
		this.ele.value = "";
	},
	updateList: function() {
		var l = this.getLength();
		
		for(var i=0; i<l && i<this.count; i++) {
			// MS.setText(this.div.childNodes[i], this.getDisplay(this.getItem(i)));
			this.div.childNodes[i].innerHTML = this.getDisplay(this.getItem(i));
			
			this.div.childNodes[i].style.display = "block";
		}
		if(this.pos > l) this.pos = this.getLength() -1;
		
		for(var i=l; i<this.count; i++) {
			this.div.childNodes[i].style.display = "none";
		}
		
		if(this.pos > l -1) {
			this.pos = l -1;
		}

		if(this.div.childNodes[0].clientHeight == 0) {
			this.show();
			this.updateList();
			return;
		}

		var h = (l < this.count ? l : this.count) * this.div.childNodes[0].clientHeight;
		
		if(h > 0) {
			this.div.style.height = h + "px";
			this.show();
		} else 
			this.hide();
	},
	getData: function() {
	},
	ondata: function() {
		this.updateList();
	},
	onresize: function() {
		var r = MS.Position.getBounds(this.ele);
		this.ele.rect = r;
		r.top += r.height;
		MS.Position.setLocation(this.div, r);
	},
	initialize: function(id, count, parent) {
		this.ele = $(id);
		if(this.ele == null || this.ele.tagName != "INPUT") throw "Control could not be found.";
		this.count = count != null && !isNaN(count) ? count : this.count;

		if(parent != null) {	// no the parent control, instance of MS.Web.AutoComplete
			parent.children = [];
			parent.children.push(this);
		}
		
		addEvent(this.ele, "keydown", this.onkeydown.bind(this));
		addEvent(this.ele, "keyup", this.onkeyup.bind(this));
		addEvent(this.ele, "blur", this.onblur.bind(this));
		addEvent(this.ele, "focus", this.onfocus.bind(this));
		addEvent(this.ele, "change", this.onchange.bind(this));
		addEvent(this.ele, "dblclick", this.ondblclick.bind(this));
		
		// build list

		this.div = document.createElement("div");
		document.body.appendChild(this.div);			// see iframe ajaxpro

		this.div.id = this.ele.id + "_list";
		
		this.div.style.display = "none";
		this.div.style.border = "1px solid black";
		
		var r = MS.Position.getBounds(this.ele);
		this.ele.rect = r;
		r.top += r.height;
		MS.Position.setBounds(this.div, r);

		this.div.style.width = (r.width -2) + "px";

		for(var i=0; i<this.count; i++) {
			var d = document.createElement("div");
			this.div.appendChild(d);

			// d.style.width = (r.width -2) + "px";
			d.style.width = this.ele.clientWidth;
			// d.style.height = r.height + "px";
			d.style.whiteSpace = "nowrap";
			d.style.overflow = "hidden";
			d.className = this.ele.id + "_item";
			d.idx = i;
			
			addEvent(d, "mouseover", this.onmouseover.bind(this));
			addEvent(d, "click", this.onclick.bind(this));

			MS.setText(d, " ");
		}
		
		addEvent(window, "resize", this.onresize.bind(this));
		
		delete r;
	}
}, false);


MS.Web.AutoCompleteDataTable = Class.create();
Object.extend(MS.Web.AutoCompleteDataTable.prototype, MS.Web.AutoComplete.prototype, true);

Object.extend(MS.Web.AutoCompleteDataTable.prototype, {
	dt: null,
	
	getItem: function(idx) {
		if(idx >= 0 && idx < this.dt.Rows.length)
			return this.dt.Rows[idx];
		return null;
	},
	getLength: function() {
		if(this.dt != null && this.dt.Rows != null) {
			return this.dt.Rows.length;
		}
		return 0;
	},
	callback: function(res) {
		if(res.error != null) {
			// alert(res.error.Message);
			return;
		}
		this.dt = res.value;
		this.ondata();
	}
}, true);