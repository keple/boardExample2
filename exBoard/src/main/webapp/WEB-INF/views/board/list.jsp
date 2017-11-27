<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp" %>
<link rel='stylesheet' href="/resources/css/list.css">
    <!-- Content Header (Page header) -->
   <!-- TABLE: LATEST ORDERS -->
   <div id="aniDiv" style="min-height:901px;">
          <div class="box box-info"style="min-height:800px;">
          
            <div class="box-header with-border">
              <h3 class="box-title">게시판</h3>

            
            </div>
            
            
            <!-- /.box-header -->
            <div class="box-body" style="min-height:600px;">
              <div class="table-responsive">
                <table id="board_table"class="table no-margin">
                  <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach items="${boardList}" var ="list">
                  <tr>  
                    <td><a>${list.bno}</a></td>
                    <td class="readLink">
                    <a class="hv">${list.title}</a>
                   	<span class="label label-default">${list.replyCount}</span>
                    </td>
                    <c:choose>
                    	<c:when test="${list.role eq 'user'}">
                    		<td><span class="label label-success">${list.writer}</span></td>
                    	</c:when>
                    	<c:when test="${list.role eq 'admin'}">
                    		<td><image src="/resources/img/crown.png">&nbsp;&nbsp;</image><span class="label label-danger">${list.writer}</span></td>
                    	</c:when>
                    </c:choose>
                    <td>
                      <div class="sparkbar" data-color="#00a65a" data-height="20">${list.viewcount}</div>
                    </td>
                  </tr>
                  </c:forEach>
                  
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            
            
            <!-- /.box-body -->
            <div class="box-footer clearfix" style="height:10%;">
            	<div id=pagination class="btn-group" style="margin-left:25%;margin-right:25%">
					            	
            	
            	</div>
              <button id="newBoard" class="btn btn-sm btn-info btn-flat pull-left">새 글 입력</button>
              
            </div>
            <!-- /.box-footer -->
           	
          </div>
          <div class="searchDiv">
                 <select class="type">
                 	<option value="x"${criteria.type eq 'x'?"selected":"" }>--조건없음--</option>
  					<option value="t"${criteria.type eq 't'?"selected":"" }>제목</option>
  					<option value="w"${criteria.type eq 'w'?"selected":"" }>작성자</option>
  					<option value="c"${criteria.type eq 'c'?"selected":"" }>내용</option>
  					<option value="tw"${criteria.type eq 'tw'?"selected":"" }>제목+작성자</option>
  					<option value="twc" ${criteria.type eq 'twc'?"selected":""}>제목+작성자+내용</option>
				</select>

       
                <!-- /btn-group -->
                <input id="keyword" type="text" value="${criteria.keyword}"></input>
                <button id="searchBtn"class="btn btn-success"><i class="fa fa-search" aria-hidden="true"></i></button>
		</div>
	</div>
<script>

  $.widget.bridge('uibutton', $.ui.button);
</script>
<script>

$("#aniDiv").addClass("fly-OutContent");
 $("#aniDiv").on("webkitAnimationEnd",function(e){
	$(this).removeClass("fly-OutContent");
	
});
</script>
<script>
$(document).ready(function(){

	var um = new urlMaker(new pageChanger(),'/board/pager'),
	 	$newButton = $("#newBoard"),
	 	$curpage = ${criteria.pageNum},
	 	$viewSize = ${criteria.size};
	um.setParam('pageNum',$curpage);
	um.setParam('size',$viewSize);
	um.changeState(false).makeUrl();
	um.getPageChanger().setType('get')
					   .setSuccess(successFunctions.pagenation,{pageDivId:'pagination',currentPage:$curpage})
					   .setFail(failFunctions.paginationFail)
					   .callAjax();
	
	
	//test
	var btnArr=$('#pagination').find('button');
	Array.prototype.forEach.call(btnArr,function(src,index){
		if(src.innerText = $curpage)
			$(src).addClass('currentPage');
		
	})
	
	
	
	$newButton.on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		//redirect 파라미터=> url;
		new urlMaker(new pageChanger(),'/board/registWithEditor',true).makeUrl()
															 .getPageChanger()
															 .redirect();//리다이렉트
		
	});
	
	
	$("#pagination").on("click","#pBtn",function(e){
		e.stopPropagation();
		e.preventDefault();
		var	$keyword = $("#keyword").val().trim()==""?"x":$("#keyword").val();
		var page = this.innerText;
		var newStart;
		console.log(page);
		var tempUrl = new urlMaker(new pageChanger(),'/board/list',true);
		
		if(page!='>>' && page!='<<'){
			
		}
		else if(page=='>>'){
			newStart = (($curpage*1)%$viewSize==0)?($curpage*1)+1:((parseInt(($curpage/$viewSize))+1)*$viewSize)+1;
			page = newStart;
		}
		else{

			if(($curpage*1)%$viewSize==0){
				newStart =((parseInt(($curpage/$viewSize))-2)*$viewSize)+1;
			}else{
				newStart = ((parseInt(($curpage/$viewSize))-1)*$viewSize)+1;
			}
			page = newStart;
		}
		tempUrl.setParam('pageNum',page,1)
			   .setParam('size',$viewSize,1)
			   .setParam('type',$('.type').val())
			   .setParam('keyword',$keyword)
		       .makeUrl()
		       .getPageChanger().redirect();
		
	});
	
	$("#board_table").on("click",".readLink .hv",function(e){
		e.stopPropagation();
		e.preventDefault();
		var	$keyword = $("#keyword").val().trim()==""?"x":$("#keyword").val();
		var $bno = $(this).parent().parent().children()[0].innerText;
		new urlMaker(new pageChanger(),'/board/read',true)
										.setParam('bno',$bno)
										.setParam('pageNum',$curpage)
										.setParam('type',$('.type').val())
										.setParam('keyword',$keyword)
										.makeUrl()
										.getPageChanger()
										.redirect();
		
	});
	$("#searchBtn").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		
	 	var	$keyword = $("#keyword").val().trim()==""?"x":$("#keyword").val();
		
		console.log("$keyword",$keyword);
		
		new urlMaker(new pageChanger(),'/board/list',true)
										.setParam('pageNum',$curpage)
										.setParam('size',$viewSize)
										.setParam('type',$(".type").val())
										.setParam('keyword',$keyword)
										.makeUrl()
										.getPageChanger().redirect();
	});

});

</script>




<%@include file="../include/footer.jsp" %>