<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
  <link rel="stylesheet" href="/resources/css/register.css"/>
  <script src="/resources/js/register.js"></script>
 <link rel="stylesheet" href="/resources/kepEditor/css/menuStyle.css"/>

<section id="regSec"class="content">
	<div id= "wrapDiv">
		<form id="regForm">
			<c:if test= "${!empty board.bno}">
				<input type="hidden" name="bno" id="bno" value='${board.bno}'></input>
			</c:if>
			 <!-- text input -->
			 <!-- 제목  -->
                <div class="form-group">
                  <label>제목</label>
                <c:choose>
                 	<c:when test="${!empty board.bno}">
                  		<input type="text" id="conTitle"class="form-control" name="title" placeholder="Enter ..."value="${board.title}">
                 	</c:when>
                 <c:otherwise>
                 	<input type="text" id="conTitle"class="form-control" name="title" placeholder="Enter ..."value="">
                 </c:otherwise>
                 </c:choose>
                </div>
               
                <!-- 작성자는 자동으로, 유저닉네임 읽은 값으로 세팅. 유동닉도 고려해봄. -->
                <div class="form-group">
                  <label>작성자.</label>
                  <input class="form-control" name="writer" type="text" class="form-control" value="Test사용자"placeholder="Enter ..." readonly="readonly">
                </div>
                 
                 
                 <textarea rows="20" cols="70" id="realCon"class = "form-control" name = "content" style="display:none;"></textarea>
		</form>
		
		<span class="help-block">글을 작성해 주세요.</span>
		<div id="wrap_fake" class="fake_wrapper">
			<div id="editMenu">
	                 
	                 
	        </div>
			<div id="editContent" contenteditable="true">
	          <c:if test="${!empty board.content}">
	          		${board.content}
	          </c:if>
	        </div>
	        
        </div>
         <a id="form_can" class="btn btn-app">
                <i class="fa fa-repeat"></i> Cancel
         </a>
       <c:choose>
        <c:when test = "${empty board.bno}">
        	<a id="form_sub" class="btn btn-app">
                <i class="fa fa-save"></i> Save
         	</a>
         </c:when>
         <c:otherwise>
         	<a id="form_upd" class="btn btn-app">
                <i class="fa fa-wrench" aria-hidden="true"></i> Update
         	</a>
         </c:otherwise>
         </c:choose>
	</div>
	<div id="downloadContent" contenteditable="false" style="background:white;">
	        	
	 </div>
</section>


<script type="text/javascript">
$(document).ready(function(){
	EditControll.setEditor('editMenu','original')
				.initiateAniContent([$('#wrapDiv'),$('#linkForm'),$('#editF')]);
	EditControll.downContentdelEvent('downloadContent');
	
	$title = $("#conTitle").val();
	if(RegistPage.isEnterForUpdate($title)){
		
		var $bno = $("#bno").val();
		new urlMaker(new pageChanger(),'/board/fileList',false).setParam("bno",$bno)
														 .makeUrl()
														 .getPageChanger()
														 .setSuccess(successFunctions.filesForUpdatePage,{target:'downloadContent'})
														 .callAjax();
	}
	$("#form_sub").on("click",function(e){
		e.preventDefault();
		e.stopPropagation();
		console.log($('#conTitle').val().trim().length);
		if($('#conTitle').val().trim().length==0){
			alert('제목은 필수입니다.');	
		}else{
		
		
		var $content=$("#editContent").html();
		
		$("#realCon").text($content);
		EditControll.scanElement($('#editContent'),$('#downloadContent'),'regForm');
		
		
		var formData = $("#regForm").serialize();
		
		new urlMaker(new pageChanger(),"/board/register",false).makeUrl()
															   .getPageChanger()
															   .setType('post')
															   .setSuccess(successFunctions.registSuccess)
															   .setFail(failFunctions.registFail)
															   .setData(formData)
															   .callAjax();
		};
	});
	$("#form_can").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		
		new urlMaker(new pageChanger(),"/board/list",false).makeUrl()
														   .getPageChanger()
														   .redirect();
	});
	$("#form_upd").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		var $content=$("#editContent").html();
		
		$("#realCon").text($content);
		EditControll.scanElement($('#editContent'),$('#downloadContent'),'regForm');
		
		
		var formData = $("#regForm").serialize();
		new urlMaker(new pageChanger(),"/board/update",false).makeUrl()
															 .getPageChanger()
															 .setType("post")
															 .setSuccess(successFunctions.registSuccess)
															 .setData(formData)
															 .callAjax();
	});
});



</script>
  <script type="text/javascript"src="/resources/kepEditor/animationManager.js"></script>
  <script type="text/javascript" src="/resources/kepEditor/editorControll.js"></script>
<script src="/resources/kepEditor/helper.js"></script>
<script src="/resources/kepEditor/eventReg.js"></script>   



<%@include file="../include/footer.jsp" %>

