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
         <button  id="prev"class="btn btn-primary" >
            <a href="#Indicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
        </button>
        <button id='next' class="btn btn-danger">
          <a  href="#Indicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
          </a>
        </button>
    </div>
   <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
     
    
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#">메인페이지</a>
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

  <div class="wrapper" style="width:80%;height:80%;position:absolute;">
  <div id="Indicators" class="carousel slide center">
    <ol class="carousel-indicators">
      <li data-target="#Indicators" data-slide-to="0" class="active"></li>
      <li data-target="#Indicators" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="carousel-item active">
        <video id="fst" class="d-block img-fluid"  autoplay loop style="width:100%;height:100%;" controls>
          <source src="/resources/img/success.mp4" type="video/mp4">
        </video>
        <div class="carousel-caption" style="color:black">
          <h3>JPA예제</h3>
         </div>
      </div>
      <div class="carousel-item">
         <video id="fst" class="d-block img-fluid" style="width:100%;height:100%;" controls>
          <source src="/resources/img/boardTest.mp4" type="video/mp4">
        </video>
        <div class="carousel-caption" style="color:white">
         <h3>현재게시판 파일 업로드</h3>
         </div>
      </div>
    </div>
  </div>
   
  </div>

</body>
</html>