var failFunctions = (function(){
	
	var registFail = function(result){
		console.log(result);
		var source = $("#fail").html();
		var template = Handlebars.compile(source);

		$("#success-body").html("");
		$("#success-body").append(template({data:result}));
		
		$("#registModal").modal({backdrop:'static'});
		
		return;
	}
	var pagenationFail = function(result){
		alert("실패");
	}
	var replyFail = function(result){
		console.log(result);
		var source = $("#fail").html();
		var template = Handlebars.compile(source);
		var html = template({data:result})
		
		$("#rep-success-body").html("");
		$("#rep-success-body").append(html);
		
		$("#replyModal").modal("show").on("shown", function () {
		    window.setTimeout(function () {
		        $("#myModal").modal("hide");
		    }, 5000);
		});
		
		
	}
	
	
	return {registFail:registFail,
			pagenationFail:pagenationFail,
			replyFail:replyFail}
})();