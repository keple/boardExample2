<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <!-- jQuery 3 -->

<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
      <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
       <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <meta  name="csrf_token" content="${_csrf.token}">
  <meta  name="_csrf_header" content="${_csrf.headerName}">
<link rel="stylesheet" href="/resources/css/userRegist.css">
<script src="/resources/utils/urlMaker.js"></script>
   <script src="/resources/controll/js/successFunctions.js"></script>
  <script src="/resources/controll/js/failFunctions.js"></script>
 <script src="/resources/utils/pageChanger.js"></script>
  <script src="/resources/js/userCheckFunction.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="formWrapper" style="width:80%;margin-left:10%;background-color:rgba(0,160,219,0.4);padding:1%;border-radius:25px;margin-top:10%;">
	<h4>회원가입</h4>
	<div style="width:100%;height:5%;background:rgba(255,255,255,1);padding:2%;">	
		<form id="userForm" method="post">
			<div id="idContainer"class="form-group has-error">
				<span>사용자 아이디를 입력해 주세요</span>
		        <label class="control-label"><i class="fa fa-check"></i>사용불가</label>
		        <div class="input-group input-group-sm">
		            <input type="text" id="uid"class="form-control"name="userid" placeholder="Enter ..." maxlength='25'>
		            <span class="input-group-btn">
                       <button type="button" id="uidCheck" class="btn btn-warning btn-flat"onclick="userCheck(event)">검사요청</button>
                    </span>
                </div>
		        <span class="help-block">중복된 아이디를 제외하곤 사용할 수 있습니다.(아이디5글자 이상)</span>
		    </div>
		    <div class="form-group">
		    	<span>사용자 비밀번호</span>
				<input type="password" class="form-control"name="password" maxlength="25"></input>
			</div>
			<div id="nameContainer"class="form-group has-error">
				<span>이름을 입력해주세요.</span>
				<label class="control-label"><i class="fa fa-check"></i>사용불가</label>
		         <div class="input-group input-group-sm">
		            <input type="text" id="uname"class="form-control"name="username" placeholder="Enter ..." maxlength='10'>
		            <span class="input-group-btn">
                       <button type="button" id="unameCheck"class="btn btn-warning btn-flat" onclick="userCheck(event)">검사요청</button>
                    </span>
                </div>
                <span class="help-block">이름은 10글자 까지입니다.</span>
			</div>
			<input type="hidden"name="_csrf"value='${_csrf.token}'></input>
		</form>
		<a id="regRequest"class="btn btn-app">
            <span class="badge bg-purple">등록!</span>
            <i class="fa fa-users"></i>Regist
        </a>
        <a id="cancel" class="btn btn-app">
           <span class="badge bg-red">취소</span>
           <i class="fa fa-users"></i>Cancel
        </a>
	</div>
</div>
</body>
<script>
$(document).ready(function(){
	var registForm = $(".formWrapper").addClass('show-cont');
	$("#uid").on("change",function(e){
		console.log("flagChanged In ID");
		$("#idContainer").removeClass('has-success').addClass('has-error').find('.control-label').text("사용불가");
		flag = false;
	});
	$("#uname").on("change",function(e){
		console.log("flagChanged In userName");
		$("#nameContainer").removeClass('has-success').addClass('has-error').find('.control-label').text("사용불가");
		flag=false;
	});
	$("#regRequest").on("click",function(e){
		e.preventDefault();
		console.log("이전저장된 아이디",prevObject);
		userRegist(prevObject);
	});

	
});
</script>
</html>