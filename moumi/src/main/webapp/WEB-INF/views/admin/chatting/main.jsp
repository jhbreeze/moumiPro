<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.container {
	min-height: 800px;	
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	margin: 100px auto;
}

main {
	position: relative;
	top: -55px;
	background: white;
}

.body-container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

.user-left {
	color: #198754;
	font-weight: 700;
	font-size: 12px;
	margin-left: 3px;
	margin-bottom: 1px;
}

.chat-info, .msg-left, .msg-right {
	max-width: 350px;
	line-height: 1.5;
	font-size: 13px;
    padding: 0.35em 0.65em;
    border: 1px solid #ccc;
    color: #333;
    white-space: pre-wrap;
    vertical-align: baseline;
    border-radius: 0.5rem;
}

.msg-box {
    background-color: #f8f9fa;
}

.chat-info {
    background: #f8f9fa;
    color: #333;
    margin-right: auto;
    margin-bottom: 7px;
}
.msg-left {
    margin-right: auto;
    margin-bottom: 7px;
    background-color: #f8f9fa;
    font-size: 14px;
}

.msg-right {
	margin-left: auto;
    margin-bottom: 7px;
    background-color: #429F6B;
    color: white;
    font-size: 14px;
}

.myDialogList {
    display: flex;
    padding: 16px 0;
    align-items: stretch;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border-bottom: 1px solid #f1f3f5;
}

.myDialogList:hover {
	cursor: pointer;
	background-color: #ECF4EB;
	box-shadow: 2px 2px 2px 0;
	border-radius: 20px;
}

.myDialogListInfo {
	display: flex;
    flex-direction: column;
    width: 90%;
}

.myDialogListDate {
	font-weight: 400;
    line-height: 1.43;
    letter-spacing: -.3px;
    font-size: 14px;
    min-width: 150px;
    text-align: center;
    vertical-align: middle;
}

.chatBtn3 { 	
	font-weight: 600;
	border: none;
	border-radius: 15px;
	margin-left: auto;
	width: 400px;
}

</style>


<div class="container">
	<div class="body-container">	
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#panel-1" 
					type="button" role="tab" data-div="1" aria-controls="panel-1" aria-selected="true">실시간 상담</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#panel-2"
					type="button" role="tab" data-div="2" aria-controls="panel-2" aria-selected="true">상담 완료</button>
			</li>
		</ul>
		
		
		<div class="tab-content pt-3" id="nav-tabContent">
			<div class="tab-pane fade show active" id="panel-1" role="tabpanel" aria-labelledby="tab-1">
				
						
				
			</div>
		</div>
		
		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show active" id="panel-2" role="tabpanel" aria-labelledby="tab-2">
				
			</div>
		</div>
		

	</div>
</div>

<!-- 모달 대화상자 -->
<div class="modal fade" id="adminchatModalToggle" aria-hidden="true"
	aria-labelledby="chatModalToggleLabel" tabindex="-1"
	data-bs-backdrop="static">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<div class="mb-2">
					<h4 class="modal-title" id="adminchatModalToggleLabel">
						<img style="height: 30px; width: 40px;"
							src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
						&nbsp; 실시간 상담
					</h4>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body pt-1">
				<div class="modal-body" style="background-color: white;">
					<div class="content-frame">
						<div class="p-3 chat-msg-container"></div>
						<div class="mt-2">
							<input type="text" id="adminChatMsg" class="form-control msg-box" placeholder="메시지를 입력하세요">
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

