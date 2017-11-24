Handlebars.registerHelper('isOctet',function(src,option){
	var type = src.substring(src.lastIndexOf(".")+1);
	console.log("meta",type);
	if(type.toUpperCase()=="JPG"||type.toUpperCase()=="GIF"||type.toUpperCase()=="PNG"){
		return option.fn(this);
	}else{
		return option.inverse(this);
		}

});