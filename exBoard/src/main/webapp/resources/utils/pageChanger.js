var pageChanger = (function(){
	function pageChanger(opt){
		var obj = typeof opt=='undefined'?{}:opt;
		this.url=obj.url||"";
		this.type=obj.type||'get';
		this.success=obj.success||undefined;
		this.fail=obj.fail||undefined;
		this.data=obj.data||undefined;
		this.contentType = obj.ct;
		this.header = obj.header||undefined;
		this.processData = obj.processData;
	};
	pageChanger.prototype.redirect = function(){
	
		$(location).attr("href",this.url);
	
	};
	pageChanger.prototype.callAjax= function(option){
	
	var temp={};
	temp.url = this.url;
	temp.type = this.type;
	if(typeof this.success!="undefined"){
		temp.success=this.ajaxSuccess(this.success.fnc,this.success.option);
	}
	if(typeof this.fail!="undefined"){
		temp.fail=this.ajaxFail(this.fail.fnc);
	}
	if(typeof this.data!="undefined"){
		temp.data=this.data;
	}
	if(typeof this.contentType!="undefined"){
		temp.contentType=this.contentType;
	}
	if(typeof this.header!="undefined"){
		temp.headers=this.header;
	}
	if(typeof this.processData!="undefined"){
		temp.processData=this.processData;
	}
	console.log("ajaxProperties",temp);
	
	$.ajax(temp);
	};
	pageChanger.prototype.ajaxSuccess = function(func,option){
		
		return function(result){
			console.log(result);
			func(result,option); 
			return;
			};
	};
	pageChanger.prototype.ajaxFail = function(func){
		
		return function(result){func(result); return;};
	};
	pageChanger.prototype.setUrl = function(url){
		this.url = url;
	};
	pageChanger.prototype.setType = function(type){
		this.type = type;
		return this;
	};
	pageChanger.prototype.setSuccess = function(successFnc,obj){
		this.success={fnc:successFnc,option:obj};
		return this;
	};
	pageChanger.prototype.setFail = function(failFnc){
		this.fail = {fnc:failFnc};
		return this;
	};
	pageChanger.prototype.setData = function(data){
		this.data = data;
		return this;
	};
	pageChanger.prototype.setHeader = function(headerName,headerValue){
	
		var obj = {};
		obj[headerName] = headerValue;
		this.header = obj;

		return this;
	}
	pageChanger.prototype.setFileMode = function(opt){
		this.processData=false;
	    this.contentType=false;
	    return this;
	}
	
	return pageChanger;
})();