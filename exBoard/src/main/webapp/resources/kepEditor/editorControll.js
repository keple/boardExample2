var EditControll = (function(){
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
	var scanElement = function(contentDiv,downConDiv,formId){
		var imgContentArr = contentDiv.find('img');
		console.log('이미지콘텐츠',imgContentArr);
		var downContentArr = downConDiv.find('a');
		var source = $('#formInput').html();
		var template = Handlebars.compile(source);
		var html;
		Array.prototype.forEach.call(imgContentArr,function(src,index){
			console.log('$src.src',$(src).attr('data-compare'));
			html = template({data:$(src).attr('data-compare')});
			
			$('#'+formId).append(html);
			
		})
		Array.prototype.forEach.call(downContentArr,function(src,index){
			html = template({data:$(src).attr('data-name')});
			
			$('#'+formId).append(html);
		})
	}
	var scanElementForDaumEditor = function(contentDiv,formId){
		var imgContentArr = contentDiv.find('img');
		console.log('이미지콘텐츠',imgContentArr);
		var downContentArr = contentDiv.find('a');
		var source = $('#formInput').html();
		var template = Handlebars.compile(source);
		var html;
		Array.prototype.forEach.call(imgContentArr,function(src,index){
			console.log('$src.src',$(src).attr('data-compare'));
			html = template({data:src.src.substring(src.src.indexOf('=')+1)});
			
			$('#'+formId).append(html);
			
		})
		Array.prototype.forEach.call(downContentArr,function(src,index){
			html = template({data:src.href.substring(src.href.indexOf("=")+1)});
			
			$('#'+formId).append(html);
		})
		
		
	}

	var initiateAniContent = function(objArr){
		console.log("ani",AnimationManager);
		objArr.forEach(function(src,index){
			
			AnimationManager.addObject(src[0]);
		});
	}
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
			scanElementForDaumEditor:scanElementForDaumEditor}
	
})();