var QueryToServer=(function(mimeType){
	
	//fn->행동
	//args->파라미터
	//subFn->초기화
	var query = {
			findFileInfo:{
				fn:queryFileInfo,
				args:['fileNameDataArr'],
				initFn:setFileNameArr
			},
			makeObject:{
				fn:makeObject,
				args:['imgArr','linkArr'],
				initFn:setArrays
			}
			
	}
	function queryFileInfo(args){
		console.log("답이 뭐냐",args[0]);
		var dataArr = JSON.stringify(args[0]);
		new urlMaker(new pageChanger(),'/board/fileInfo',false).makeUrl()
															   .getPageChanger()
															   .setType('post')
															   .setData({data:dataArr})
															   .setSuccess(querySuccess)
															   .callAjax();
		
		
	}
	function querySuccess(result){
		var attachments={};
		
		attachments['image'] = [];
		attachments['file']=[];
		Array.prototype.forEach.call(result,function(src,index){
			if(src.mimeType.includes("image")){
				attachments['image'].push({
					'attacher':'image',
					'data':{
						'imageurl':src.src,
						'filename':src.originName,
						'originalurl':src.src,
						'thumburl':src.src.replace("_","s_"),
						'filesize':src.fileSize
					}
					
				});
				
			}else{
				attachments['file'].push({
					'attacher':'file',
					'data':{
						'attachurl':src.src,
						'filemime':src.mimeType,
						'filename':src.originName,
						'filesize':src.fileSize
					}
					
				});
	
			}
			Editor.modify({
				"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
					var allattachments = [];
					for (var i in attachments) {
						allattachments = allattachments.concat(attachments[i]);
					}
					return allattachments;
				}(),
				"content": document.getElementById("realCon") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
				});

		});
		
	};
	function setFileNameArr(fileNameDataArr){
		this.args[0] = fileNameDataArr;
		console.log('infoQuery',this.args);
		this.fn.call(this,this.args);
	}
	function makeObject(args){
		console.log("parameter in?",args);
		var transArr=[];
		Array.prototype.forEach.call(args[0],function imgCall(src,index){
			transArr.push({fileSrc:src.src, value:mimeType.getMimeWithName(src.src)});
			
			
		});
		Array.prototype.forEach.call(args[1],function linkCall(src,index){
			console.log("Link업을텐디?",args[1]);
			transArr.push({fileSrc:src.href, value:mimeType.getMimeWithName(src.href)});
		});
		console.log("병합",transArr);
		return transArr;
	};
	//서버로 파일의 정보를 요청할 때 필요한 이미지파일 이름배열, 링크 이름배열
	function setArrays(imgArr,linkArr){
		this.args[0] = imgArr;
		this.args[1] = linkArr;
		
		console.log('setFirstArrays',this.args);
		console.log("what is this?",this);
		
		return this.fn.call(this,this.args);
	
	}
	
	return query;
})(MimeType);