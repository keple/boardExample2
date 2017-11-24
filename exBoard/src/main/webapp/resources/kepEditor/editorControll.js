var EditControll = (function(){
	//setTarget 추가?
	var scanObj = {
			myImg:{fn:function(template,data){
				return template({data:$(data).attr('data-compare')});
				},
				target:'img'
			},
			daumImg:{fn:function(template,data){
				return template({data:data.src.substring(data.src.indexOf("=")+1)});
				},
				target:'.txc-image'
			},
			myLink:{fn:function(template,data){
				return template({data:$(data).attr('data-name')});
				},
				target:'a'
			},
			daumLink:{fn:function(template,data){
				return template({data:data.href.substring(data.href.indexOf("=")+1)});
				},
				target:'a'
			}
	};
	
	
	var chain = function(){
		var target = $("#regSec");
		
		var fileEdit = $("#fileAdder").html();
		
		var fileTemp = Handlebars.compile(fileEdit);
		
		var linkEdit = $("#linkAdder").html();
		
		var linkTemp = Handlebars.compile(linkEdit);
		
		
		target.append(fileTemp);
		target.append(linkTemp);
	}
	
	
	
	var setEditor = function(tag,menuStyle){
		var source = $("#"+menuStyle).html();
		var template = Handlebars.compile(source);
		$('#'+tag).append(template);
		chain();
		
		return this;
	}
	var scanElement = function(contentDiv,downConDiv,selector){
		var imgContentArr = $("#"+contentDiv).find(scanObj[selector+"Img"].target);
		console.log('이미지콘텐츠',imgContentArr);
		var downContentArr = $("#"+downConDiv).find(scanObj[selector+"Link"].target);
		
		
		return {imgArr:imgContentArr,fileArr:downContentArr};
	};
	var setElementToContent = function(imgArr,fileArr,formId,selector){
		var source = $('#formInput').html();
		var template = Handlebars.compile(source);
		var html;
		Array.prototype.forEach.call(imgArr,function(src,index){
			console.log('$src.src',$(src).attr('data-compare'));
			html = scanObj[selector+"Img"].fn(template,src);
			
			$('#'+formId).append(html);
			
		});
		Array.prototype.forEach.call(fileArr,function(src,index){
			html = scanObj[selector+"Link"].fn(template,src);
			
			$('#'+formId).append(html);
		});
	};

	var initiateAniContent = function(objArr){
		console.log("ani",AnimationManager);
		objArr.forEach(function(src,index){
			
			AnimationManager.addObject(src[0]);
		});
	};
	var deleteImg = function(obj){
		var imgFiles = obj.targetDiv.find('fWrapper');
		
		Array.prototype.forEach.call(imgFiles,function(src,index){
			$(src).remove();
			
		});
		
	}
	var downContentdelEvent = function(targetDiv){
		console.log('active');
		$('#'+targetDiv).on('click','.nifWrapper .delThumb',function(e){
			e.preventDefault();
			e.stopPropagation();
			$(this).parent().remove();
			
		});
	}
	return {setEditor:setEditor,
			initiateAniContent:initiateAniContent,
			scanElement:scanElement,
			deleteImg:deleteImg,
			downContentdelEvent:downContentdelEvent,
			setElementToContent:setElementToContent}
	
})();