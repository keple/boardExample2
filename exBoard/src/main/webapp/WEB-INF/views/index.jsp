<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<nav class="navbar navbar-inverse bg-inverse" style="width:100%;">
   <div id="buttonWrapper" style="width:20%;display:inline-block">
         <button  id="prev"class="btn" style="background:#292b2c" >
            <a href="#Indicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
        </button>
        <button id='next' class="btn" style="background:#292b2c">
          <a  href="#Indicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
          </a>
        </button>
    </div>
   <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
     
    
    <span class="navbar-toggler-icon"></span>
  </button>
 
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/board/list">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Login</a>
      </li>
    </ul>
    <span class="navbar-text">
      Navbar text with an inline element
    </span>
  </div>
</nav>
<section>
  <div id="wrapper"class="box-body" style="width:80%;height:60%;margin-left:20%;margin-top:5%;border-radius:15px;">
  <div id="Indicators" class="carousel slide" data-ride="carousel" style="width:80%;">
    <ol class="carousel-indicators" style="width:60%">
      <li data-target="#Indicators" data-slide-to="0" class="active"></li>
      <li data-target="#Indicators" data-slide-to="1" class=""></li>
      <li data-target="#Indicators" data-slide-to="2" class=""></li>
      <li data-target="#Indicators" data-slide-to="3" class=""></li>
      <li data-target="#Indicators" data-slide-to="4" class=""></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="carousel-item active"style="width:100%;">
        <img src="/resources/img/carousel1.jpg"style="width:100%;height:60%"></image>
        
      </div>
      <div class="carousel-item"style="width:100%;">
      	<img src="/resources/img/carousel3.jpg"style="width:100%;height:60%"></image>
      </div>
       <div class="carousel-item"style="width:100%;">
         <img src="/resources/img/carousel4.PNG"style="width:100%;height:60%"></image>
        
      </div>
       <div class="carousel-item"style="width:100%;">
         <img src="/resources/img/carousel5.jpg"style="width:100%;height:60%"></image>
        
      </div>
       <div class="carousel-item"style="width:100%;">
         <img src="/resources/img/carousel6.jpg"style="width:100%;height:60%"></image>
        
      </div>
    </div>
  </div>

  </div>
     <div id="introContent">
  	
  		<h2>Introduce</h2>
  		<div id="inner">
	  		<div id="intro">
	  			<h3>경기 과학기술대학교 컴퓨터정보 시스템과 졸업</h3>
	  			<br>
	  			<h3>웹개발자를 꿈꾸며 계속해서 공부하고있습니다.</h3>
	  			<br>
	  			<h3></h3>
	  		</div>
	  		<div id="imgs">
	  			<img src="/resources/img/4dolar.jpg"></img>
	  			<img src="/resources/img/gtec.jpg"></img>
	  		</div>
  		</div>
  		
  
  </div>
</section>
</body>
<script>
$(document).ready(function(){
	console.log("윈도우 사이즈",window.innerHeight);
	console.log("스크롤 위치",document.body.scrollTop);
	var introDiv = $("#introContent");
	$(document).on("scroll",function(e){
		console.log("??",$(document).scrollTop());
		var scrollHeight = $(document).scrollTop()
		if(scrollHeight>10){
			introDiv.css('display','block');
			introDiv.addClass('show-cont');
			introDiv.one('webkitAnimationEnd',function(e){
				$("#intro").css('display','inline-block');
				$("#imgs").css('display','inline-block');
				$("#intro").addClass('show-cont');
				$("#imgs").addClass('show-cont');
			});
		}
		
		
	});
		
	
	
	
	
});

</script>
</html>