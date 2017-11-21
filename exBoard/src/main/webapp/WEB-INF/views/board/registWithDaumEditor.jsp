<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<!-- 에디터 시작 -->
<link rel="stylesheet" href="/resources/daumeditor/css/editor.css" type="text/css"/>
<script src="/resources/daumeditor/js/editor_loader.js"></script>
<script src="/resources/daumeditor/js/editor_creator.js"></script>
<section id="regSec"class="content">
	<div id= "wrapDiv">
		<form name="regForm" id="regForm" method="post",action="/board/register2">
			 <!-- text input -->
			 <!-- 제목  -->
                <div class="form-group">
                  <label>제목</label>
                  <input type="text" id="conTitle"class="form-control" name="title" placeholder="Enter ...">
                </div>
               
                <!-- 작성자는 자동으로, 유저닉네임 읽은 값으로 세팅. 유동닉도 고려해봄. -->
                <div class="form-group">
                 
                  <label>작성자.</label>
                  <input class="form-control" name="writer" type="text" class="form-control" value="Test사용자"placeholder="Enter ..." readonly="readonly">
                </div>
                 <div id="editMenu" class="tx-editor-container">
	                 
	       		 </div>
                 
                 <textarea rows="20" cols="70" id="realCon"class = "form-control" name = "content" style="display:none;"></textarea>
			  <a id="form_can" class="btn btn-app">
                <i class="fa fa-repeat"></i> Cancel
         </a>
        <a id="form_sub" class="btn btn-app">
                <i class="fa fa-save"></i> Save
         </a>

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
					txService: 'sample', /* 수정필요없음. */
					txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
					initializedId: "", /* 대부분의 경우에 빈문자열 */
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

         
        //form submit 버튼 클릭
        //save후 valid가 작동하지 않음
        //Editor.save사용안하고 새로만듬.
        $("#form_sub").click(function(e){
        	
			if(validForm(Editor)){
				var content = Editor.getContent();
				$("#realCon").text(content);
				var formData = $("#regForm").serialize();
				
				new urlMaker(new pageChanger(),'/board/register2',false)
													.makeUrl()
													.getPageChanger()
													.setType("post")
													.setData(formData)
													.callAjax();
			};
	        
            
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

});

		
</script>

<%@include file="../include/footer.jsp" %>
</html>