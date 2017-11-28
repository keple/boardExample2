
var prevObject={
idContainer:{val:'',
			set:function(id){this.val=id},
			get:function(){return this.val}
			},

nameContainer:{val:'',
			   set:function(name){this.val=name},
			   get:function(){return this.val}
			   }
			   
			
};
function userCheck(event){
		event.preventDefault();
		console.log("누구?",event.target.id);
		var id = event.target.id.trim();
		var targetDiv = id=='uidCheck'?'idContainer':'nameContainer';
		var checkTarget = id=='uidCheck'?$("#uid").val():$("#uname").val();
		console.log(checkTarget);
		if(checkTarget.trim()!=""&&checkTarget.length>5){
			new urlMaker(new pageChanger(),'/user/check',true).setParam("checkString",decodeURI(checkTarget))
														   .makeUrl()
														   .getPageChanger()
														   .setType('post')
														   .setHeader('X-CSRF-TOKEN',$('meta[name="csrf_token"]').attr('content'))
														   .setSuccess(successFunctions.userCheckSuccess,{target:targetDiv,prevObject:prevObject[targetDiv],value:decodeURI(checkTarget)})
														   .callAjax();
		}
		
	};
	function userRegist(prevObject){
		event.preventDefault();
		if(isCheckFunctionEnd(prevObject)){
				var formData = $("#userForm").serialize();
				new urlMaker(new pageChanger(),'/user/register',true).makeUrl()
																     .getPageChanger()
																 	 .setType('post')
																 	 .setHeader('X-CSRF-TOKEN',$('meta[name="csrf_token"]').attr('content'))
																 	 .setSuccess(successFunctions.userRegistSuccess)
																 	 .setData(formData)
																 	 .callAjax();
			};
		
	};
	function isCheckFunctionEnd(prevObject){
		var idCheck = $("#idContainer")[0].className;
		var nameCheck = $("#nameContainer")[0].className;
		if(idCheck.includes('has-error')||nameCheck.includes('has-error')||checkFromPrev(prevObject)){
			
			return false;
		}
		
		console.log("ids",idCheck);
		console.log("names",nameCheck);
		return true;
		
	}
	function isFlagChecked(flag){
		if(typeof flag !="undefined"||typeof flag!=false){
			return true;
		}
		return false;
	}
	function checkFromPrev(prevObject){
		var $userid = $("#uid").val(),
			$username = $("#uname").val();
		if($userid==prevObject.idContainer.get()&&$username==prevObject.nameContainer.get()){
			return false;
		}
		alert("내용변경하시면 검사요청 꼭 해주세요^^");
		return true;
	}
	