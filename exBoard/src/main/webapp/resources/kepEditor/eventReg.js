
//function changeEffect(source,target,effectorOption){
//	console.log('st',source,target);
//	var effect = $("#wrapDiv").attr(effectorOption);
//	source.addClass(effect+'-out');
//	target.addClass('current '+effect+'-in');
//
//	source.one("webkitAnimationEnd",function(e){
//		e.stopPropagation();
//		e.preventDefault();
//		console.log(this);
//		source.removeClass('current '+effect+'-in');
//		target.removeClass(effect+'-out');
//		source.css('display','none');
//		target.css('display','block');
//		return;
//	});
//	
//	return;
//}
function moveToContent(viewport){
	var arr = $("#"+viewport).find('img');
	console.log('arr',arr);
	
	var inContent= new Array();
	
	var outContent = new Array();
	
	Array.prototype.forEach.call(arr,function(src,index){
		$src = $(src);
		if($src.attr('data-compare')=='tt'){
			console.log('outCont',$src.parent());
			outContent.push($src.parent().parent());//수정
		}else{
			$src.removeAttr('style');
			inContent.push(src);
		}
		
		
	});
	return {inContent:inContent,outContent:outContent};
}

$("#editMenu").on("click","#editMenu_ori #img_add",function(e){
	e.stopPropagation();
	e.preventDefault();
	AnimationManager.changeClass($("#wrapDiv"),$("#editF"),'flow');
	var dconArr = $('#downloadContent').find('nifWrapper');
	console.log('dconArr',dconArr);
});

$("#regSec").on("click","#editF #fileCancel",function(e){
	e.stopPropagation();
	e.preventDefault();
	console.log("ddd");
	
	$("#fbody").html("");
	$(".fWrapper").remove();
	$("#viewPort").html("");
	
	AnimationManager.changeClass($('#editF'),$("#wrapDiv"),'flow');
	
});

$("#regSec").on("click","#editF #fileAdd",function(e){
	e.stopPropagation();
	e.preventDefault();
	
	var source=$("#fileInput").html();
	var template = Handlebars.compile(source);
	
	$("#fileForm").append(template);
});
$("#regSec").on("click","#editF #upFile",function(e){
	e.stopPropagation();
	e.preventDefault();
	var fileData = new FormData($("#fileForm")[0]);
	console.log(fileData);
	
	new urlMaker(new pageChanger() , '/board/fileUpload' ,false).makeUrl()
															 .getPageChanger()
															 .setType('post')
															 .setFileMode()
															 .setData(fileData)
															 .setSuccess(successFunctions.fileUploadSuccess,{viewport:'viewPort'})
															 .setFail(failFunctions.registFail)
															 .callAjax();
	
	$("#fileForm").html("");
});//이게 파일이다.
$("#regSec").on("click","#editF #intoContent",function(e){
	e.stopPropagation();
	e.preventDefault();
	AnimationManager.changeClass($('#editF'),$("#wrapDiv"),'flow');
	//callBack;
	var obj = moveToContent('regSec #editF #viewPort');
	
	obj.inContent.forEach(function(src,index){
		$("#editContent").append(src);
		
		
	});
	obj.outContent.forEach(function(osrc,index){
		$("#downloadContent").append(osrc);
		
	});
	
	
	$('#viewPort').html("");
	
	
});
$("#editMenu").on("click","#editMenu_ori #link_add",function(e){
	e.stopPropagation();
	e.preventDefault();
	AnimationManager.changeClass($('#wrapDiv'),$('#linkForm'),'toss');
	
	
	
});
$("#regSec").on("click","#linkForm #linkCancel",function(e){
	e.stopPropagation();
	e.preventDefault();
	AnimationManager.changeClass($('#linkForm'),$('#wrapDiv'),'toss');
	
});
$("#regSec").on("click","#fbody .wrap .delElement",function(e){
	e.stopPropagation();
	e.preventDefault();
	$(this).parent().remove();
	
});


$('#regSec').on('click','#viewPort .fWrapper .delThumb',function(e){
	e.stopPropagation();
	e.preventDefault();
	console.log('thjththththt',this);
	$(this).parent().remove();
});
