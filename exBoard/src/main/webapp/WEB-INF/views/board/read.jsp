<%@page import="org.springframework.http.HttpRequest"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../include/header.jsp" %>
<script src="/resources/kepEditor/helper.js"></script>
<style>

#comment{
	height:500px;
	overflow:scroll;

}
</style>
<section class="content">
	     <div class="row">
          <!-- Box Comment -->
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="/resources/dist/img/user1-128x128.jpg" alt="User Image">
                <span class="read_title"><a>${board.title}</a></span>
                
                <span class="username"><a href="#">${board.writer}</a></span>
                
                <span class="description">${board.updatedate}</span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Mark as read">
                  <i class="fa fa-circle-o"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              

              <p>${board.content}</p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> Share</button>
              
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <sec:authorize access="isAuthenticated()">
	              <sec:authentication var="userName" property="principal.username"/>
	              <c:if test="${board.writer eq userName}">
	              	<button id='delBtn' type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>Delete</button>
	              	<button id='updBtn' type="button" class="btn btn-warning btn-xs"><i class="fa fa-wrench" aria-hidden="true"></i>Update</button>
	              </c:if>
              </sec:authorize>
              <button id="showFile" class="btn btn-primary btn-xs"><i class="fa fa-list" aria-hidden="true"></i>파일목록보기</button>
            </div>
            <!-- /.box-body -->
           
            <!-- /.box-footer -->
            <div class="box-footer">
              <sec:authorize access="isAnonymous()">
             	<span>로그인한 사용자만 작성할 수 있습니다.</span>
             </sec:authorize>
             
             <sec:authorize access="isAuthenticated()">
              <form id="rep_form">
                <img class="img-responsive img-circle img-sm" src="/resources/dist/img/user4-128x128.jpg" alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="writer-name"><sec:authentication property="principal.username"/></div>
                <br></br>
	                <div class="rep_wrap">
	                  <input type="hidden" name="bno" value="${option}"></input>
	                  <input id="textInput"type="text" name="content" placeholder="Press enter to post comment" style="width:88%;">
	                  <input type="hidden" name="writer" value="Test작성자">
	                  <button id="rep_input" class="btn btn-danger">입력</button>
	                </div>
              	<input id="randomUserValue" name='randomUser' type="hidden">
              </form>
             </sec:authorize>          
              <div style="width:100%;position:inherit;">
              	
              	<button id="toList" class="btn btn-success">리스트로</button>
              </div>
              	
            </div>
            <!-- /.box-footer -->
             <div id="comments"class="box-footer box-comments">
              
            </div>
            	<div class="reply-scroll">
					<i class="fa fa-chevron-down" aria-hidden="true"></i>
				</div>
            
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
</section>
<script src = "/resources/js/read.js"></script>
<script>
$(document).ready(function(){
	
	//댓글등록
	var um = new urlMaker(new pageChanger());
	var $bno = ${option};
	var defaultPageNum = 1;
	//var obj = {pageNum : 1,size : 5,option:$option};
	readPage.callReplyList({bno:$bno,um:um});
	readPage.callFileList({bno:$bno,um:new urlMaker()});
	
	$("#rep_input").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		console.log("in");
		var randomValue = Math.floor((Math.random()*5)+1);
		$("#randomUserValue").val(randomValue);
		var formData = $("#rep_form").serialize();
		new urlMaker(new pageChanger()).setDefaultUrl('/board/registReply')
									   .makeUrl()							   
									   .getPageChanger()
									   .setType('post')
									   .setSuccess(successFunctions.replySuccess,{fnc:readPage.callReplyList,obj:{bno:$bno,um:um},div:'comments'})
									   .setFail(failFunctions.replyFail)
									   .setData(formData)
									   .callAjax();
		$("#textInput").val("");
	});
	
	
	$(".reply-scroll").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		$("#comments").html("");
		readPage.getSize().incre(5);
		readPage.callReplyList({bno:$bno,um:um});
		console.log("size는?",readPage.getSize())
	});
	
	$("#delBtn").on('click',function(e){
		e.stopPropagation();
		e.preventDefault();
		var replyDeleteUrl = new urlMaker(new pageChanger(),'/board/delete',false);
		console.log(replyDeleteUrl);
		replyDeleteUrl.setParam('bno',$bno)
					  .makeUrl()
					  .getPageChanger()
					  .setType('delete')
					  .setSuccess(successFunctions.registSuccess)
					  .callAjax();
		
	});
	$("#toList").on('click',function(e){
		e.stopPropagation();
		e.preventDefault();
		new urlMaker(new pageChanger(),"/board/list",true).setParam('pageNum',${cri.pageNum})
												   .setParam('type',${cri.type})
												   .setParam('keyword',${cri.keyword})
												   .makeUrl()
												   .getPageChanger()
												   .redirect();
		
	});
	$('#showFile').on('click',function(e){
		e.stopPropagation();
		e.preventDefault();
		
		$('#fileListModal').modal({backdrop:'static'});
		
	});
	$("#updBtn").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		
		new urlMaker(new pageChanger(),'/board/registWithEditor',true).setParam("bno",$bno)
															  .makeUrl()
															  .getPageChanger()
															  .redirect();
		
	})
});





</script>
<%@include file="../include/footer.jsp" %>