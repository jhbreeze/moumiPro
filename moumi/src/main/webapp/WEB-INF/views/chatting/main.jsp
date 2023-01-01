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

.content-frame {
	background-color: white;
}

.dialog-list {
	color: #787878;
}

.callbtn {
	background-color: #429F6B;
	font: white;
	font-weight: 600;
}


.chat-msg-container { display: flex; flex-direction:column; height: 310px; overflow-y: scroll; }
.chat-connection-list { height: 355px; overflow-y: scroll; }
.chat-connection-list span { display: block; cursor: pointer; margin-bottom: 3px; }
.chat-connection-list span:hover { color: #0d6efd }

.user-left {
	color: #0d6efd;
	font-weight: 700;
	font-size: 10px;
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
    background-color: #f5f5f5;
}

.chat-info {
    background: #f8f9fa;
    color: #333;
    margin-right: auto;
    margin-left: 3px;
    margin-bottom: 5px;
}
.msg-left {
    margin-right: auto;
    margin-bottom: 7px;
    background-color: #f5f5f5;
}
.msg-right {
	margin-left: auto;
    margin-bottom: 7px;
    background-color: #429F6B;
    color: white;
}
</style>

<script type="text/javascript">
function chattingModal() {
	$("#chatModalToggle").modal("show");	
}
</script>

<button type="button" class="btn chatBtn btn-lg shadow" id="chatViewerModalLabel" onclick="chattingModal();">문의하기
	<img style="height: 50px; width: 60px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle1.png">
</button>


<div class="modal fade" id="chatModalToggle" aria-hidden="true" aria-labelledby="chatModalToggleLabel" tabindex="-1" data-bs-backdrop="static" >
  <div class="modal-dialog" style="width: 400px;">
    <div class="modal-content">
      <div class="modal-header">
		<div class="mb-2">
			<h4 class="modal-title" id="chatModalToggleLabel">
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
						<button class="btn btn-success btn-lg shadow chatBtn2" data-bs-target="#chatModalToggle2" data-bs-toggle="modal">
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


<div class="modal fade" id="chatModalToggle2" aria-hidden="true" aria-labelledby="chatModalToggleLabel2" tabindex="-1"  data-bs-backdrop="static">
  <div class="modal-dialog" style="width: 400px;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="mb-2">
        	<h4 class="modal-title" id="chatModalToggleLabel"> 
	        	<a data-bs-target="#chatModalToggle" data-bs-toggle="modal"> <i class="bi bi-box-arrow-left"></i> </a>
				&nbsp;&nbsp;MOUMI 
			</h4>
		</div>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="background-color: white;">
		<div class="content-frame">
			<div class="p-3 chat-msg-container"></div>
			<div class="mt-2">
				<input type="text" id="chatMsg" class="form-control msg-box" placeholder="메시지를 입력하세요">
			</div>
		</div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(function(){
	var socket = null;
	
	// - 채팅창을 실행할 때 다음과 같이 ip로 실행
	//   http://아이피주소:포트번호/cp/chat/main

	// - 채팅서버
	//   ws://ip주소:포트번호/cp/chat.msg
	var host="${wsURL}";
	// var host='wss://' + window.location.host + '/wchat.msg';  // https
	
	if ('WebSocket' in window) {
		socket = new WebSocket(host);
    } else if ('MozWebSocket' in window) {
    	socket = new MozWebSocket(host);
    } else {
    	writeToScreen("<div class='chat-info'>브라우저의 버전이 낮아 채팅이 불가능 합니다.</div>");
        return false;
    }

	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	
	function onOpen(evt) {
	    let email = "${sessionScope.member.email}";
	    let nickName = "${sessionScope.member.nickName}";
	    if( ! email ) {
	    	location.href="${pageContext.request.contextPath}/member/login";
	    	return;
	    }
	    
		writeToScreen("<div class='msg-left'> 안녕하세요, MOUMI입니다 :) <br> 어떤 점이 궁금하신가요? </div>");
	    
	    // 서버 접속이 성공 하면 아이디와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = "connect";
	    obj.email = email;
	    obj.nickName = nickName;
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
	    
	    $("#chatMsg").on("keydown",function(evt) {
	    	let key = evt.key || evt.keyCode;
	        if (key === "Enter" || key === 13) {
	            sendMessage();
	        }
	    });
	}

	function onClose(evt) {
		// 채팅 입력창 이벤트를 제거 한다.
       	$("#chatMsg").off("keydown");
       	writeToScreen("<div class='chat-info'> 답변이 없어 5분뒤, 자동으로 상담이 종료됩니다. <br> 감사합니다 :D </div>");
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	// console.log(evt.data);
    	
    	// 전송 받은 JSON 문자열을 자바 객체로 변환
    	let data = JSON.parse(evt.data); // JSON 파싱
    	let cmd = data.type;
    	
    	if(cmd === "userDisconnect") { // 접속자가 나갔을 때
    		let email = data.email;
    		let nickName = data.nickName;
    		
    		let out = "<div class='chat-info'>"+nickName+"님이 나갔습니다.</div>";
    		writeToScreen(out);
    		
    		$("#user-"+email).remove();

    	} else if(cmd === "message") { // 메시지를 받은 경우
    		let email = data.email;
    		let nickName = data.nickName;
    		let msg = data.chatMsg;
    		
    		let out = "<div class='user-left'>" + nickName + "</div>";
    		out += "<div class='msg-left'>" + msg + "</div>";
    		writeToScreen(out);
    		
    	}  else if(cmd === "time") {
    		// console.log(evt.data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {
		writeToScreen("<div class='chat-info'>Info: WebSocket error.</div>");
	}
	
	// 채팅 메시지 전송
	function sendMessage() {
		let msg = $("#chatMsg").val().trim();
	    if(! msg ) {
	    	$("#chatMsg").focus();
	    	return;
	    }
	    
	    let obj = {};
        obj.type = "message";
        obj.chatMsg = msg;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);

        $("#chatMsg").val("");
        writeToScreen("<div class='msg-right'>" + msg +"<div>");
	}
	
	// -----------------------------------------
	// 채팅 참여자 리스트를 클릭한 경우 위스퍼(귓속말, dm) 대화상자 열기
	$("body").on("click", ".chat-connection-list span", function(){
		let email = $(this).attr("data-email");
		let nickName = $(this).text();
		
		$('#chatOneMsg').attr("data-email", email);
		$('#chatOneMsg').attr("data-nickName", nickName);
		
		$("#myDialogModalLabel").html("귓속말-"+nickName);
		$("#myDialogModal").modal("show");
	});
	
	const modalEl = document.getElementById("myDialogModal");
	modalEl.addEventListener("show.bs.modal", function(){
		// 모달 대화상자가 보일때
		$("#chatOneMsg").on("keydown", function(evt){
			let key = evt.key || evt.keyCode;
			if(key === 'Enter' || key === 13) {
				sendOneMessage();
			}
		});
	});
	modalEl.addEventListener("hidden.bs.modal", function(){
		// 모달 대화상자가 사라질때
		$("#chatOneMsg").off("keydown");
		$("#chatOneMsg").val("");
	});
	
});

//---------------------------------------------
// 채팅 메시지를 출력하기 위한 함수
function writeToScreen(message) {
    const $msgContainer = $(".chat-msg-container");
    $msgContainer.append(message);

    // 스크롤을 최상단에 있도록 설정함
    $msgContainer.scrollTop($msgContainer.prop("scrollHeight"));
}
</script>

