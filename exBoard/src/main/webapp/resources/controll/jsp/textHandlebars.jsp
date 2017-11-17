<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script id="success" type="text/x-handlebars-template">
	<p>{{data}}</p>

</script>
<script id="fail" type="text/x-handlebars-template">
	<p>{{data}}</p>
</script>
<script id="page-btn" type="text/x-handlebars-template">
	
{{#buttons}}
	<button id="pBtn" class ="{{className}}">{{num}}</button>
{{/buttons}}

</script>

<script id="reply-div" type="text/x-handlebars-template">
{{#replies}}
<div class="box-comment">
<!-- User image -->
<img class="img-circle img-md" src="/resources/img/user-temp{{randomUser}}.jpg" alt="User Image">

<div class="comment-text">
      <span class="username">
       {{writer}}
        <span class="text-muted pull-right">{{updatedate}}</span>
    </span><!-- /.username -->
	{{content}}
</div>

<!-- /.comment-text -->
</div>
{{/replies}}
</script>
<script id="readPageFiles" type="text/x-handlebars-template">
{{#files}}
	{{#isOctet fileName}}
		<div class="fileContent">
		<a href="/board/display/oct?fileName={{fileName}}">
			<img src="/board/display?fileName={{fileName}}" data-compare="{{fileName}}" style="width:100px;height:100px"/>

		</a>			
		<span>{{fileName}}</span>
			
		</div>
		{{else}}
		<div class="fileContent">
			<a href="/board/display/oct?fileName={{fileName}}">
				<img src="/board/display?fileName=tt.jpg" data-compare='tt' style="width:100px;height:100px"/>
			</a>
		<span>{{fileName}}</span>			
			
		</div>
	{{/isOctet}}

{{/files}}
</script>
<script id="searchScript" type="text/x-handlebars-template">
	


</script>