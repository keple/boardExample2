var AnimationManager = (function(){
	
	var aniObjects = [];
	
	var addObject = function(object){
		
		if(!checkObject(object)){
			aniObjects.push(object);
		}
		
	}
	var checkObject = function(object){
		var state;
		aniObjects.forEach(function(src,index){
			if($(src).id==$(object).id){
				state= true;
			}
			
			state= false;
		});
		return state;
	}
	var getAniObjects = function(){
		return aniObjects;
	}
	var changeClass = function(source,target,effect){
		aniObjects.forEach(function(src,index){
			$(src).removeClass();
			
		});
		console.log('st',source,target,effect);
		source.addClass(effect+'-out');
		target.addClass(effect+'-in');
		console.log("src",source);
		
		source.one("webkitAnimationEnd",function(e){
			e.stopPropagation();
			e.preventDefault();
			console.log(aniObjects);
			aniObjects.forEach(function(src,index){
				console.log(src.id,target[0].id)
				if(src.id!=target[0].id){
					$(src).css('display','none');
				}else{
					$(src).css('display','block');
				}
				return;
			});
			return;
		});
		
		return;
	}
	
	return{addObject:addObject,
		   getAniObjects:getAniObjects,
		   changeClass:changeClass}
})();