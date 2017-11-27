<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta  name="csrf_token" content="${_csrf.token}">
<meta  name="_csrf_header" content="${_csrf.headerName}">  
<title>Daum에디터 - 이미지 첨부</title> 
<script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
  <script src="/resources/utils/urlMaker.js"></script>
    <script src="/resources/utils/pageChanger.js"></script>
<link rel="stylesheet" href="../../css/popup.css" type="text/css"  charset="utf-8"/>
<script type="text/javascript">
// <![CDATA[
	function insertData(result){
		console.log(result);
	
		var _mockdata = {
				'imageurl': 'http://127.0.0.1:8081/board/display?fileName='+(result[0].src.replace("s_","")),
				'filename': result[0].originName,
				'filesize': result[0].fileSize,
				'imagealign': 'C',
				'originalurl':'http://127.0.0.1:8081/board/display?fileName='+result[0].src ,
				'thumburl':'http://127.0.0.1:8081/board/display?fileName='+(result[0].src)
			};
			execAttach(_mockdata);
			closeWindow();
	
	}
	function done() {
		var fileData = new FormData($("#imageDataForEditor")[0]);
		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		new urlMaker(new pageChanger(),'/board/fileUpload',false).makeUrl()
																 .getPageChanger()
																 .setType('post')
																 .setFileMode()
																 .setData(fileData)
																 .setSuccess(insertData)
																 .callAjax();
		
	}

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	}
	
// ]]>
</script>
</head>
<body onload="initUploader();">
<div class="wrapper">
	<div class="header">
		<h1>사진 첨부</h1>
	</div>	
	<div class="body">
		<dl class="alert">
		    <dt>사진 첨부 확인</dt>
		    <form id="imageDataForEditor">
		    	<input type="file" name="files[]"></input>
		    </form>
		</dl>
	</div>
	<div class="footer">
		<p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p>
		<ul>
			<li class="submit"><a href="#" onclick="done();" title="등록" class="btnlink">등록</a> </li>
			<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
		</ul>
	</div>
</div>
</body>
</html>