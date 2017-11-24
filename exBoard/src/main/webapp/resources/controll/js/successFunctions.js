var successFunctions = (function(){
	
	var registSuccess = function(result){
		console.log(result);
		var source = $("#success").html();
		var template = Handlebars.compile(source);
		$("#success-body").html("");
		$("#success-body").append(template({data:result}));

		
		$("#registModal").modal({backdrop:'static'});
		
		return;
	}
	var uploadSuccess = function(result){
		var source = $('#success').html();
		var template = Handlebars.compile(source);
		$("#upload-body").html();
		$("#upload-body").append(template({data:result}));
		
		$("#fileModal").modal({backdrop:'static'});
	}
	var pagenation = function(result,option){
		console.log(result);
		console.log(option.pageDivId);
		var source = $("#page-btn").html();
		var template = Handlebars.compile(source);
		var html;
		var data;
		var buttons = [];
		if(result.prev==true){

			buttons.push({num:"<<",className:'btn btn-primary btn-sm'});
			
		}
		for(i=result.start;i<=result.end;i++){
			if(i==option.currentPage){
				buttons.push({num:i+'',className:'btn btn-info btn-sm'});
			}else{
				buttons.push({num:i+'',className:'btn btn-primary btn-sm' });
			}
			
		}
		if(result.next==true){
			buttons.push({num:">>",className:'btn btn-primary btn-sm'})
			
		
		}
		console.log(buttons);
		data = {buttons:buttons};
		html = template(data);
		$("#"+option.pageDivId).html("");
		$("#"+option.pageDivId).append(html);
	}
	var replySuccess = function(result,option){
		console.log("result",option);
		$('#'+option.div).html("");
		option.fnc(option.obj);
		var source = $("#success").html();
		var template = Handlebars.compile(source);
		var html = template({data:result});
		$("#rep-success-body").html("");
		$("#rep-success-body").append(html);
		
		$("#replyModal").modal();
		
		
		
	}
	
	var replyAccept = function(result,option){
		var source = $("#reply-div").html();
		var template = Handlebars.compile(source);
		console.log(result);
		var data = {replies:result};
		var html = template(data);
		var state;
		if(result.length<option.size.value && result.length>0){
			option.size.set(result.length);
			state = 'none';
		}else{
			state = 'block';
		}
		$("."+option.target).css('display',state);
		$("#"+option.div).append(html);
	}
	var deleteSuccess = function(result,pageDivId){
		var source = $("#delete-success").html();
		var template = Handlebars.compile(source);
		
		
	}
	var fileUploadSuccess = function(result,option){
		console.log('res',result);
		console.log('opt',option);
		var $view = $('#'+option.viewport);
		var thumbSrc = $("#insertImageTag ").html();
		var thumbTemp = Handlebars.compile(thumbSrc);
		var thumbHtml = thumbTemp({imgArr:result});
		var thumbs = $view.find('img');
		$view.append(thumbHtml);
	
	}
	var fileAccept = function(result,option){
		var source = $('#readPageFiles').html();
		var template = Handlebars.compile(source);
		var html = template({files:result});
		
		$('#'+option.target).append(html);
		
	}
	var filesForUpdatePage = function(result,option){
		var source = $('#updatePageFiles').html();
		var template = Handlebars.compile(source);
		var html = template({files:result});
		
		$("#"+option.target).append(html);
		
		
		
		
	}
	return {registSuccess:registSuccess,
			pagenation:pagenation,
			replySuccess:replySuccess,
			replyAccept:replyAccept,
			fileUploadSuccess:fileUploadSuccess,
			fileAccept:fileAccept,
			filesForUpdatePage:filesForUpdatePage
	};
	
})();

