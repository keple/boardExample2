var urlMaker = (function(){
	
	function urlMaker(changer,defaultUrl,bool){
		this.defaultUrl = defaultUrl||"";
		this.state = bool;
		this.params=[];
		this.pageChanger = changer||new pageChanger();
		
	};
	urlMaker.prototype.setParam = function(propertyName,propValue,sortIndex){
		var flag = -1;
		if(typeof sortIndex=="undefined"){sortIndex=(this.params.length)+1}
		this.params.forEach(function(inValue,index){
			if(inValue.name==propertyName){
				this.changeParamValue(inValue,propValue);
				flag = index;
			}
			if(inValue.sortIndex==sortIndex){
				this.changeSortIndex(inValue,sortIndex);
				console.log('중복된 인덱스 이기 때문에 맨뒤로 보내버렷습니다.');
			}
		}.bind(this));
		
		if(flag==-1)
			this.addParam(propertyName,propValue,sortIndex);
		
		
		return this;
	};
	urlMaker.prototype.changeParamValue = function(arrElement,propValue){
		arrElement.value = propValue;
	};
	urlMaker.prototype.changeSortIndex = function(arrElement,sortIndex){
		
		arrElement.sortIndex = sortIndex;
	};
	urlMaker.prototype.sortParams = function(){
		this.params.sort(function(a,b){return a.sortIndex-b.sortIndex})
	};
	urlMaker.prototype.addParam = function(propertyName,propValue,sortIndex){

		this.params.push({name:propertyName,value:propValue,sortIndex:sortIndex});
	};
	//option ==> rest or nonRest
	urlMaker.prototype.makeUrl = function(){
		this.sortParams();
		console.log('sorted',this.params);
		var obj = this.defaultUrl;
		var word;
		var state;
		if(typeof this.state=="undefined"){state=true;}
			
		 state= this.state;
		
		this.params.forEach(function(result,index){
			if(state){ 
				word = index==0?"?":"&";
			 	obj = obj+word+result.name+"="+result.value;
			}else{
				word = "/";
				obj = obj+word+result.value;
			}
		});
		this.pageChanger.setUrl(obj);
	
		return this;
	};
	urlMaker.prototype.changeState = function(bool){
		this.state = bool;
		
		return this;
	};
	urlMaker.prototype.setDefaultUrl = function(defaultUrl){
		this.defaultUrl = defaultUrl;
		
		return this;
	};
	
	urlMaker.prototype.getPageChanger = function(){
		return this.pageChanger;
	};
	return urlMaker;
	
	
})();