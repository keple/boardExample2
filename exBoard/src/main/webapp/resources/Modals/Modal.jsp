<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="registModal" class="modal fade">
  <div class="modal-dialog" style="z-index:1060;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="success-body" class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="confirm" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>


<div id="replyModal" class="modal fade">
  <div class="modal-dialog" style="z-index:1060;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
      </div>
      <div id="rep-success-body" class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
    </div>
  </div>
</div>

<div id="fileListModal"class="modal fade"  role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document" style="z-index:1060;">
    <div class="modal-content">
      <div class="modal-header"style="background: #f266FF">
        <h5 class="modal-title" >파일리스트</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="file-list-body"class="modal-body">
          
      </div>
      <div class="modal-footer">
     
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$("#confirm").on("click",function(e){
		e.stopPropagation();
		e.preventDefault();
		new urlMaker(new pageChanger(),'/board/list',true).makeUrl()
														  .getPageChanger()
														  .redirect();
		
	})
	
	
})



</script>