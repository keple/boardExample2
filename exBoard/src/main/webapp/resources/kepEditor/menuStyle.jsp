<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script id="original" type="text/x-handlebars-template">
	<div id="editMenu_ori" style="border-top-right-radius:7px;border-top-left-radius: 7px;background-color: #D8D8D8;">
    <button id="img_add"class="ori_btn" style="margin:1%;background-color: #D8D8D8;height:40px;width:40px;" title="이미지추가">
        <i class="fa fa-file-image-o" aria-hidden="true"></i>
    </button>
    <button id="link_add" class="ori_btn" style="margin:1%;background-color: #D8D8D8;height:40px;width:40px;">
       <i class="fa fa-link" aria-hidden="true"></i>
    </button>
</div>
</script>
<script id="thumnail" type="text/x-handlebars-template">
	<img src="{{fileUrl}}" style="width:50px;height:50px">

</script>
<script id="fileInput" type="text/x-handlebars-template">

<div class="wrap" style="display: -webkit-inline-flex">
	<input class="input-group"name="files[]" type="file"/>
	<a class="delElement"><i class="fa fa-minus-circle"/></a>
<div>


</script>
<script id="fileAdder" type="text/x-handlebars-template">
<div id= "editF" style="-webkit-transform-style: preserve-3d;background:white">
	<div class="header">

	</div>
	<div id="fbody" class="body">
	<form id='fileForm' enctype="multipart/form-data">
	

	</form>
	</div>
	<div id=viewPort>
	
	</div>
    <div class="footer">
        <button id="fileCancel" class="btn btn-secondary">취소</button>
        <button id="fileAdd"class="btn btn-primary">파일추가</button>
		<button id="upFile" class="btn btn-success">업로드</button>
        <button id="intoContent"class="btn btn-warning"style="float:right">본문에 추가</button>
      </div>	
</div>
</script>

<script id="insertImageTag" type="text/-x-handlebars-template">
{{#each imgArr}}
	{{#isOctet src}}
		<div class="fWrapper">
			<img src="/board/display?fileName={{src}}" data-compare="{{src}}" style="width:100px;height:100px"/>
			<span>{{originName}}</span>
			<a href="#" class ="delThumb">X</a>
		</div>
		{{else}}
		<div class="nifWrapper">
			<a href="/board/display?fileName={{src}}" data-name='{{src}}'>
				<img src="/board/display?fileName=tt.jpg" data-compare='tt' style="width:100px;height:100px"/>
			</a>
			<span>{{originName}}</span>			
			<a href="#" class="delThumb">X</a>
		</div>
	{{/isOctet}}
{{/each}}

</script>
<script id="linkAdder" type="text/x-handlebars-template">
<div id="linkForm" style="background:white;transform-style:preserve-3d">
	<div id="linkWrapper" class="input-group">
        <div class="input-group-btn">
            <button class="btn btn-success">URL:</button>
        </div>
        <input id="linkText" type="text" class="form-control">
    </div>     

 <div class="box-header with-border" style="padding:25px;">
        <br>링크를 작성하실 수 있습니다.</br>
		<br>Save하시면 본문에 삽입됩니다.</br>
    </div>
    
   		<a id="linkCancel" class="btn btn-app">
                <i class="fa fa-repeat"></i> Cancel
         </a>
		<a id="insertLink" class="btn btn-app">
                <i class="fa fa-save"></i> Save
         </a>
		

	<div id='helpText' class="form-controll">
        <span>URL을 작성해 주세요.</span>
    </div>
</div>
</script>
<script id='formInput' type="text/x-handlebars-template">
<input type='hidden' name="fileNames" value='{{data}}'></input>

</script>