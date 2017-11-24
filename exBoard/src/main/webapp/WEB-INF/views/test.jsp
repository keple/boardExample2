<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <script src="/resources/utils/mimeType.js"></script>
<script src="/resources/utils/QueryToServer.js"></script>
  <script src="/resources/utils/urlMaker.js"></script>
   <script src="/resources/utils/pageChanger.js"></script>
   <script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
	var tempArr=[{src:'1.png'},{src:'2.jpg'}];
	var tempLinkArr=[{href:''},{href:'4.html'}];
	var transAr = QueryToServer.makeObject.initFn(tempArr,tempLinkArr);
	QueryToServer.findFileInfo.initFn(transAr);
	console.log(QueryToServer);


</script>

</html>