var readPage = (function(){
	var addViewSize = function(num){
		this.value +=5;
		return size;
	}
	var setViewSize = function(num){
		this.value = num;
		return size;
	}
	var size = {value:5,
				incre:addViewSize,
				set:setViewSize};
	
	var callReplyList = function(obj){
		obj.um.setDefaultUrl('/board/replies');
		obj.um.setParam('pageNum',1);
		obj.um.setParam('size',size.value);
		obj.um.setParam('bno',obj.bno);
		obj.um.changeState(false).makeUrl();
		obj.um.getPageChanger().setType('get')
						   .setSuccess(successFunctions.replyAccept,{div:'comments',size:size,target:'reply-scroll'})
						   .setFail(failFunctions.replyFail);
		
		/*var ajaxObj={url:obj.um.changeState(false).makeUrl(),
					 type:'get',
					 success:obj.pc.ajaxSuccess(successFunctions.replyAccept,{div:'comments',size:size,target:'reply-scroll'}),
					 error:obj.pc.ajaxFail(failFunctions.replyFail)
					 };*/
		
		obj.um.getPageChanger().callAjax();
	}

	var getSize = function(){
		return size;
	}
	var callFileList = function(obj){
		obj.um.setDefaultUrl('/board/fileList');
		obj.um.setParam('bno',obj.bno)
			  .changeState(false).makeUrl()
			  .getPageChanger().setType('get')
			  .setSuccess(successFunctions.fileAccept,{target:'file-list-body'})
			  .callAjax();
		
		
	}
	return {callReplyList:callReplyList,
			getSize:getSize,
			callFileList:callFileList};
	
})();