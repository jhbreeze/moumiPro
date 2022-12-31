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
	$("#chatModal").modal("show");	
}
</script>

<button type="button" class="btn chatBtn btn-lg shadow" id="chatViewerModalLabel" onclick="chattingModal();">문의하기
	<img style="height: 50px; width: 60px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
</button>

<div class="modal fade" id="chatModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
	aria-labelledby="chatModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="width: 400px;">
		<div class="modal-content">
			<div class="modal-header">
				<div class="mb-2">
					<h4 class="modal-title" id="chatViewerModalLabel">
						<img class="mb-2" style="height: 30px; width: 40px;"
							src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
						&nbsp; MOUMI
					</h4>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body pt-1">
				<p class="modal-body-text m-1 fw-semibold"> MOUMI 실시간 1:1 문의 채널입니다. </p>
				<section class="modal-body-1 mt-2 mb-4 pt-1 ps-2 pe-2 pb-2">
					<div class="modal-body-text fw-semibold ms-2 mt-1"> 문의 내역 &nbsp; >>> </div>
					<div class="d-flex mb-1">
						<div class="align-middle" >
						<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="보조 아이콘">보조 아이콘  제작자: Freepik - Flaticon</a>  -->
						<img class="m-1 me-2" style="height: 36px; width: 36px;" src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
						</div>
						<div class="pb-2 dialog-list">
							<label class="fw-bold">MOUMI</label><span>&nbsp;15:30 PM</span><br>
							 추가 문의 사항이 있으신가요?
						</div>
					</div>
					
					<div class="d-flex mb-2">
						<div class="align-middle" >
						<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="보조 아이콘">보조 아이콘  제작자: Freepik - Flaticon</a>  -->
						<img class="m-1 me-2" style="height: 36px; width: 36px;" src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
						</div>
						<div class="pb-2 dialog-list">
							<label class="fw-bold">MOUMI</label><span>&nbsp;22/12/20</span><br>
							 답변이 없어 5분 후에 자동으로 채팅이 종료됩니다. 
						</div>
					</div>
				
				
				</section>
				
				<section class="modal-body-1 p-3 mb-3">
					<div class="d-flex">
						<div class="align-middle" >
						<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="보조 아이콘">보조 아이콘  제작자: Freepik - Flaticon</a>  -->
						<img class="m-1 me-2" style="height: 36px; width: 36px;" src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
						</div>
						<div class="pb-2">
							<label class="fw-bold">MOUMI</label><br>
							안녕하세요, <b>MOUMI</b>입니다 :) <br>
							궁금하신 사항을 남겨주시면 <br>
							자세히 안내 드릴게요! 
						</div>
					</div>
					
					<div class="pb-2">
						<button type="button" class="btn btn-success btn-lg shadow chatBtn2" id="chatViewerModalLabel">
							<img class="me-1" style="height: 40px; width: 50px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
							  문의하기&nbsp;&nbsp;>>>
						</button>
						
					</div>
					<div class="text-center callfont pt-2">
						운영시간 평일 9:00 ~ 18:00
					</div>
					
				</section>
			</div>
			
			
			
		</div>
	</div>
</div>

