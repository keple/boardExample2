<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/menuStyle.css">


<section class="content">
	<div id= "wrapDiv">
		<form id="regForm">
			 <!-- text input -->
			 <!-- 제목  -->
                <div class="form-group">
                  <label>제목</label>
                  <input type="text" class="form-control" name="title" placeholder="Enter ...">
                </div>
               
                <div class="form-group">
                  <label>작성자.</label>
                  <input class="form-control" name="writer" type="text" class="form-control" value="Test사용자"placeholder="Enter ..." readonly="readonly" contenteditable="false">
                </div>
                 
                 
                 <textarea rows="20" cols="70" id="realCon"class = "form-control" name = "content" style="display:none;"></textarea>
		</form>
		
		<span class="help-block">글을 작성해 주세요.</span>
		<div id="wrap_fake" class="fake_wrapper">
			<div id="editMenu">
	                 
	                 
	        </div>
			<div id="editContent" contenteditable="true">
	          
	        </div>
        </div>
        <a id="form_sub" class="btn btn-app">
                <i class="fa fa-save"></i> Save
      </a>
	</div>
	
</section>
<%@include file="../include/footer.jsp" %>
<script>






</script>