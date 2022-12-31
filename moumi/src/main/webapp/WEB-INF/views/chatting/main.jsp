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

.modal-content {
	background-color: #ECF4EB;
}

.modal-dialog-ing {
	background-color: white;
	border-radius: 10px;
	
}
.callbtn {
	background-color: #429F6B;
	font: white;
	font-weight: 600;
}

.callfont {
	font: #787878;
	
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
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h5 class="modal-title" id="chatViewerModalLabel">
						<img style="height: 50px; width: 60px;"
							src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
						&nbsp; MOUMI
					</h5>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<p class="callfont"> MOUMI 실시간 1:1 문의 채널입니다. </p>
				<section class="modal-dialog-list shadow-sm p-3 mb-5 bg-body rounded">
				</section>
				
				<section class="modal-dialog-ing shadow-sm p-3 mb-5 bg-body rounded">
						<img style="height: 50px; width: 60px;" src="${pageContext.request.contextPath}/resources/moumi/logo/callcenter.png">
					<div>
					<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="보조 아이콘">보조 아이콘  제작자: Freepik - Flaticon</a>  -->
						<label class="fw-bold">MOUMI</label></div>
					<div>
						안녕하세요, MOUMI입니다:) <br>
						궁금하신 사항을 남겨주시면 <br>
						자세히 안내 드릴게요! 
					</div>
					<div>
						<button class="btn callbtn"><img style="height: 50px; width: 60px;"src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
							<p>&nbsp; 문의하기&nbsp;&nbsp;&nbsp;&nbsp; >>>
						</button>
					</div>
					<div class="text-center callfont">
						운영시간 평일 9:00 ~ 18:00
					</div>
				</section>
			</div>
			
			 <div class="modal-footer">
	          <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
	        </div>
			
			
		</div>
	</div>
</div>

