var RegistPage = (function(){
	var isEnterForUpdate = function(titleParameterValue){
		if(typeof titleParameterValue =="undefined"||titleParameterValue.trim()==""){
			return false;
		}
		return true;
	}
	
	
	
	return {isEnterForUpdate:isEnterForUpdate}
})();