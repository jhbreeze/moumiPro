<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

.chatBtn { 	
	background-color: #ECF4EB;
	font-weight: 600;
	border: none;
	border-radius: 15px;
}

.chatBtn2 { 	
    -webkit-box-pack: center;
    width: 100%;
    padding: 10px;
    letter-spacing: -0.1px;
    font-weight: bold;
    border-radius: 17px;
    font-size: 1.5rem !important;
}

.modal-header{
	position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    min-height: 60px;
    padding-right: 14px;
    padding-bottom: 1px;
    padding-left: 22px;
    overflow: hidden;
}

.modal-content {
	background-color: #ECF4EB;
}

.modal-body-text {
	margin: 0px 22px 16px;
	color: #787878;
	font-weight: 530;
    
}

.modal-body-1 {
	background-color: white;
	border-radius: 18px;
	box-shadow: rgb(255 255 255 / 12%) 0px 0px 2px 0px inset, rgb(0 0 0 / 5%) 0px 0px 2px 1px, rgb(0 0 0 / 8%) 0px 2px 6px;
    padding: 6px 0px;
    overflow: hidden;
	
}

.dialog-list {
	color: #787878;
}

.callbtn {
	background-color: #429F6B;
	font: white;
	font-weight: 600;
}

</style>

<script type="text/javascript">
function chattingModal() {
	$("#exampleModalToggle").modal("show");	
}

});





</script>

<button type="button" class="btn chatBtn btn-lg shadow" id="chatViewerModalLabel" onclick="chattingModal();">문의하기
	<img style="height: 50px; width: 60px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
</button>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Modal 1</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Show a second modal and hide this one with the button below.
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Open second modal</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Modal 2</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Hide this modal and show the first with the button below.
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Back to first</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>
