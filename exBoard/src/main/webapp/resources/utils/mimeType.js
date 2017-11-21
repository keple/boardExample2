var MimeType=(function(){
	
	var mime = {TXT:"text/utf-8",
				JPG:"image/jpg",
				GIF:"image/gif",
				HTML:"text/html",
				PNG:"image/png"};
	

	var getMime = function(type){
		
		return mime[type.toUpperCase()];
	}

	return {getMime:getMime}
})();