<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
  <script src="/resources/js/register.js"></script>
<!-- 에디터 시작 -->
<link rel="stylesheet" href="/resources/daumeditor/css/editor.css" type="text/css"/>
<script src="/resources/daumeditor/js/editor_loader.js"></script>
<script src="/resources/utils/mimeType.js"></script>
  <script type="text/javascript" src="/resources/kepEditor/editorControll.js"></script>
<script src="/resources/daumeditor/js/editor_creator.js"></script>
<section id="regSec"class="content">
	<div id= "wrapDiv">
		<form name="regForm" id="regForm">
		<c:if test= "${!empty board.bno}">
				<input type="hidden" name="bno" id="bno" value='${board.bno}'></input>
			</c:if>
			 <!-- text input -->
			 <!-- 제목  -->
                <div class="form-group">
                  <label>제목</label>
                 <c:choose>
                 	<c:when test="${!empty board.title}">
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
                 <sec:authorize access="isAnonymous()">
                  <input class="form-control" name="writer" type="text" class="form-control" value="anonymous"placeholder="Enter ..." readonly="readonly">
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">  
                    <input class="form-control" name="writer" type="text" class="form-control" value=<sec:authentication property="principal.username"/> placeholder="Enter ..." readonly="readonly">
                
                </sec:authorize>
               
                </div>
                 <div id="editMenu" class="tx-editor-container">
	                 
	       		 </div>
               <c:choose>
               <c:when test="${!empty board.content}">
                 <textarea rows="20" cols="70" id="realCon"class = "form-control" name = "content"style="display:none;">
         
                 		${board.content}
                 </textarea>
                 <div id="filehelperDiv" style="display:none">
                 		${board.content}
                 </div>
			  </c:when>
			  <c:otherwise>
			  	 <textarea rows="20" cols="70" id="realCon"class = "form-control" name = "content"style="display:none;">
        
                 </textarea>
			  	<div id="editContent" style="display:none">
			  		
			  	
			  	</div>
			  </c:otherwise>
			  </c:choose>
			  	<a id="form_can" class="btn btn-app">
                	<i class="fa fa-repeat"></i> Cancel
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
		</form>
		
       
        
	</div>
</section>
<script>
$(document).ready(function(){
	$.ajax({
		url:'/resources/daumeditor/editor_frame.html',
		success:function(result){
			$("#editMenu").html(result);
				var config = {
					txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
					txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
					txService: 'sample',
					txProject: 'sample',
					initializedId: "", 
					wrapper: "editMenu", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
					form: 'regForm'+"", /* 등록하기 위한 Form 이름 */
					txIconPath: "/resources/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
					txDecoPath: "/resources/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
					canvas: {
			            exitEditor:{
			                /*
			                desc:'빠져 나오시려면 shift+b를 누르세요.',
			                hotKey: {
			                    shiftKey:true,
			                    keyCode:66
			                },
			                nextElement: document.getElementsByTagName('button')[0]
			                */
			            },
						styles: {
							color: "#123456", /* 기본 글자색 */
							fontFamily: "굴림", /* 기본 글자체 */
							fontSize: "10pt", /* 기본 글자크기 */
							backgroundColor: "#fff", /*기본 배경색 */
							lineHeight: "1.5", /*기본 줄간격 */
							padding: "8px" /* 위지윅 영역의 여백 */
						},
						showGuideArea: false
					},
					events: {
						preventUnload: false
					},
					sidebar: {
						attachbox: {
							show: true,
							confirmForDeleteAll: true
						}
					},
					size: {
						contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
					}
				};
		
					new Editor(config);
				}
	});

	function validForm(editor) {
    	console.log("isCalled?");
        var validator = new Trex.Validator();
        var content = editor.getContent();
        var title = $("#conTitle").val();
        if (!validator.exists(content)) {
            alert('내용을 입력하세요');
            return false;
        }
        if(title.trim()==""){
        	alert('제목을 입력하세요');
        	return false;
        }
        return true;
    }
        //form submit 버튼 클릭
        //save후 valid가 작동하지 않음
        //Editor.save사용안하고 새로만듬.
        $("#form_sub").click(function(e){
        	
			if(validForm(Editor)){
				var content = Editor.getContent();
				$("#editContent").html(content);
				EditControll.scanElementForDaumEditor($('#editContent'),'regForm');
				$("#realCon").text(content);
				var formData = $("#regForm").serialize();
				new urlMaker(new pageChanger(),"/board/registWithEditor",false).makeUrl()
				 															   .getPageChanger()
				 															   .setType("post")
				 															   .setSuccess(successFunctions.registSuccess)
				 															   .setData(formData)
				 															   .callAjax();
			};
	        
            
        });
    	$("#form_upd").on("click",function(e){
    		e.stopPropagation();
    		e.preventDefault();
    		var $content=Editor.getContent();
    		$("#filehelperDiv").html($content);
    		$("#realCon").text($content);
    		EditControll.scanElementForDaumEditor($('#filehelperDiv'),'regForm');
    		
    		
    		var formData = $("#regForm").serialize();
    		new urlMaker(new pageChanger(),"/board/update",false).makeUrl()
    															 .getPageChanger()
    															 .setType("post")
    															 .setSuccess(successFunctions.registSuccess)
    															 .setData(formData)
    															 .callAjax();
    	});
        $title = $("#conTitle").val();
    	if(RegistPage.isEnterForUpdate($title)){
    		
    		var $bno = $("#bno").val();
    		
    	}
});

		
</script>
<script type="text/javascript">
	function scanElementForEditor(helperDiv){
		var classifyImage = $("#"+helperDiv).find(".txc-image");
		var classifyFile = $("#"+helperDiv).find('a');
		console.log("classifyArr",classifyImage);
		console.log("classifyArr",classifyFile);
		Array.prototype.forEach.call(classifyImage,function(src,index){
			console.log("원본",src);
			
			
			
			
		});
		Array.prototype.forEach.call(classifyFile,function(src,index){
			console.log("파일형 원본",src);
			
			
		});
		return {imgArr:classifyImage,fileArr:classifyFile}

	}
	function loadContent() {
		var obj = scanElementForEditor('filehelperDiv');
		
		var attachments = {};
		
		attachments['image'] = [];
		Array.prototype.forEach.call(obj.imgArr,function(src,index){
			
			attachments['image'].push({
				'attacher': 'image',
				'data': {
					'imageurl': src.src,
					'filename': src.src.substring(src.src.lastIndexOf("_")+1),
					'originalurl': src.src,
					'thumburl': src.src.replace("_","s_"),
					'filesize':200
				}
				
	
			});
		
		});
	
		attachments['file'] = [];
		Array.prototype.forEach.call(obj.fileArr,function(src,index){
			
			attachments['file'].push({
				'attacher': 'file',
				'data': {
					'attachurl': src.href,
					'filemime': MimeType.getMime(src.href.substring(src.href.lastIndexOf('.')+1)),
					'filename': src.href.substring(src.href.lastIndexOf('_')+1),
					'filesize':600
				}
			});
		});
		
		
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": document.getElementById("realCon") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	}
	
	loadContent();
	
</script>
<%@include file="../include/footer.jsp" %>
</html>