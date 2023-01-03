<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
.reply-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.reply-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
<c:if test="${sessionScope.member.userCode==dto.userCode||sessionScope.member.userType==0}">
	function deleteBoard() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
		    let query = "communityNum=${dto.communityNum}&${query}";
		    let url = "${pageContext.request.contextPath}/board/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

function ajaxFileFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		processData: false, // file 전송시 필수, 서버로전송하는 데이터를 쿼리문자열로변환여부
		contentType: false, // file 전송시 필수, 서버에전송할 데이터의 Content-Type. 기본은 application/x-www-urlencoded
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
$(function(){
	$(".btnSendBoardLike").click(function(){
		const $i = $(this).find("i");
		let userLiked = $i.hasClass("bi-hand-thumbs-up-fill");
		let msg = userLiked ? "게시글 공감을 취소하시겠습니까?" :"게시글에 공감하시겠습니까?";
		
		if(! confirm(msg)) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/board/insertBoardLike";
		let query = "communityNum=${dto.communityNum}&userLiked="+userLiked;
		
		const fn = function(data) {
			let state = data.state;
			if(state == "true") {
				if(userLiked){
					$i.removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
				} else {
					$i.removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
				}
				var count = data.boardLikeCount;
				$("#boardLikeCount").text(count);
				
			} else {
				alert("공감 여부 처리가 실패했습니다.")
			}
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});


// 댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page){
	let url = "${pageContext.request.contextPath}/board/listReply";
	let query = "communityNum=${dto.communityNum}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url,"get",query,"html",fn);
}
// 댓글 등록
$(function(){
	$(".btnSendReply").click(function(){
		let num = "${dto.communityNum}";
		const $tb = $(this).closest("table");
		const f = this.closest("form");
		
		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		
		content = encodeURIComponent(content);
		let url = "${pageContext.request.contextPath}/board/insertReply";
		//let query = "communityNum="+num+"&content="+content+"&parent=0";
		
		let query = new FormData(f); 
		
		const fn = function(data){
			$tb.find("textarea").val("");
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else {
				alert("댓글 등록이 실패했습니다.");
			}
		};
		ajaxFileFun(url,"post",query,"json",fn);
	});
});

//삭제 신고메뉴
$(function(){
	$("body").on("click", ".reply-dropdown", function(){
		const $menu = $(this).next(".reply-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	$("body").on("click", function() {
		if($(event.target.parentNode).hasClass("reply-dropdown")) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 사진
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".reply-form .img-add", function(){
		$(this).closest(".reply-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=replyForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;
	});
	
	$("body").on("click", ".review-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});
});

//대댓글 사진
$(function(){
	var sel_files = []; 
	
	$("body").on("click", ".reply-answer .img-replyadd", function(){
		$(this).closest(".reply-answer").find("input[name=selectFile]").trigger("click");
	});
	
	$("body").on("change","form[name=replyAnswerForm] input[name=selectFile]",function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
	
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;

	});
	
	$("body").on("click", ".replyAnswer-form.img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});
});


// 댓글별 답글 리스트
function listReplyAnswer(parent){
	let url = "${pageContext.request.contextPath}/board/listReplyAnswer";
	let query = "parent=" + parent;
	let selector = "#listReplyAnswer" + parent;
	
	const fn = function(data){
		$(selector).html(data);
	}
	ajaxFun(url,"get",query,"html",fn);
}

// 댓글별 답글 개수
function countReplyAnswer(parent){
	let url = "${pageContext.request.contextPath}/board/countReplyAnswer";
	let query = "parent="+parent;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+parent;
		$(selector).html(count);
	};
	ajaxFun(url,"post",query,"json",fn);
}

// 답글버튼 - 댓글별 답글 등록 폼 및 답글 리스트
$(function(){
	$("body").on("click",".btnReplyAnswerLayout",function(){
		const $tr = $(this).closest("tr").next();
		
		let isVisible = $tr.is(":visible");
		let replyNum = $(this).attr("data-replyNum");
		if(isVisible) {
			$tr.hide();
		} else {
			$tr.show();
			
			// 답글리스트
			listReplyAnswer(replyNum);
			
			// 답글개수
			countReplyAnswer(replyNum);
		}
	});
});

// 댓글별 답글 등록
$(function(){
	$("body").on("click",".btnSendReplyAnswer",function(){
		let replyNum = $(this).attr("data-replyNum");
		const $td = $(this).closest("td");
		const f = this.closest("form");
		
		let content = $td.find("textarea").val().trim();
		
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		let url = "${pageContext.request.contextPath}/board/insertReply";
		// let query = "communityNum=${dto.communityNum}&content="+content+"&parent="+replyNum;
		let query = new FormData(f); 
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		ajaxFileFun(url,"post",query,"json",fn);
		
	});
});

// 댓글 삭제
$(function(){
	$("body").on("click",".deleteReply",function(){
		if(! confirm("게시글을 삭제하시겠습니까?")) {
			return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/board/deleteReply";
		let query = "replyNum="+replyNum+"&mode=reply";
		
		const fn = function(data){
			listPage(page);
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});

// 댓글별 답글 삭제
$(function(){
	$("body").on("click",".deleteReplyAnswer",function(){
		if(! confirm("답글을 삭제하시겠습니까?")) {
			return false;
		}
		let replyNum = $(this).attr("data-replyNum");
		let answer = $(this).attr("data-answer");
		
		let url = "${pageContext.request.contextPath}/board/deleteReply";
		let query = "replyNum="+replyNum+"&mode=parent";
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		ajaxFun(url,"post",query,"json",fn);
		
	});
});

// 댓글 공감/비공감
$(function(){
	$("body").on("click",".btnSendReplyLike",function(){
		let replyNum = $(this).attr("data-replyNum");
		let answerLike = $(this).attr("data-replyLike");
		const $btn = $(this);
		
		let msg = "게시글이 마음에 들지 않으십니까?";
		if(answerLike === "1") {
			msg = "게시글에 공감하십니까?";
		}
		if(! confirm(msg)) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/board/insertReplyLike";
		let query = "replyNum="+replyNum+"&answerLike="+answerLike;
		
		const fn = function(data){
			let state = data.state;
			let likeCount = data.likeCount;
			let disLikeCount = data.disLikeCount;
			
			$btn.parent("td").children().eq(0).find("span").html(likeCount);
			$btn.parent("td").children().eq(1).find("span").html(disLikeCount);
			
			if(state === "liked") {
				alert("게시글 공감 여부는 한번만 가능합니다 !!");
			} 
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});

// 댓글모달
$(function(){
	$("body").on("click",".notifyReply",function(){
		$("form[name=notifyForm] input[name=userName]").val("");
	    $("form[name=notifyForm] input[name=notifyContent]").val("");
	    
	    let replyNum = $(this).attr("data-replyNum");
	    
	    $("form[name=notifyForm] input[name=parent]").val(replyNum)
	    
	    
		$("#notifyModal").modal("show");	
		
	    $("form[name=notifyForm] input[name=userName]").focus();
	});
});
// 대댓글모달
$(function(){
	$("body").on("click",".notifyReplyAnswer",function(){
		$("form[name=notifyForm] input[name=userName]").val("");
	    $("form[name=notifyForm] input[name=notifyContent]").val("");
	    
	    let replyNum = $(this).attr("data-replyNum");
	    let parentNum = $(this).attr("data-answer");
	    
	    $("form[name=notifyForm] input[name=parent]").val(replyNum)
	    $("form[name=notifyForm] input[name=parentNum]").val(parentNum)
	    
	    
		$("#notifyModal").modal("show");	
		
	    $("form[name=notifyForm] input[name=userName]").focus();
	});
});
// 모달값 보내기
$(function(){
	$("body").on("click",".sendModalNotify",function() {
		var f = document.notifyForm;
		var str;
		
		
		str = f.userName.value;
	    if(!str) {
	        f.userName.focus();
	        return;
	    }
		
	    str = f.notifyContent.value;
	    if(!str) {
	        f.notifyContent.focus();
	        return;
	    }
	    
	    let query = $("form[name=notifyForm]").serialize();
	    let url = "${pageContext.request.contextPath}/board/notify";
	    
	    const fn = function(data) {
	    	let state = data.state;
	    	if(state === "true") {
	    		$("#notifyModal").modal("hide");
	    		alert("신고가 완료되었습니다."); 
	    	}
	    };
	    ajaxFun(url,"post",query,"json",fn);
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-dots"></i>&nbsp;&nbsp;브랜드 커뮤니티 </h3>
		</div>
		
		<div class="body-main">

			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">
							${dto.subject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							닉네임 : ${dto.nickName}
						</td>
						<td align="right">
							${dto.regDate} | 조회 ${dto.hitCount}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top">
							브랜드명 : ${dto.brandName}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="200" style="border-bottom: none;">
							${dto.content}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="text-center p-3">
							<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&communityNum=${preReadDto.communityNum}">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<a href="${pageContext.request.contextPath}/board/article?${query}&communityNum=${nextReadDto.communityNum}">${nextReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userCode==dto.userCode}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/update?communityNum=${dto.communityNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userCode==dto.userCode || sessionScope.member.userType==0}">
				    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="reply">
				<form name="replyForm">
					<div class='form-header'>
						<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
					</div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td colspan="2">
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td align='left'>
								<div class="img-grid">
									<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								</div>
								<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
							</td>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply' onclick="sendOk();">댓글 등록</button>
						    </td>
						 </tr>
					</table>
						 <input type="hidden" name="communityNum" value="${dto.communityNum}">
				</form>
				
				<div id="listReply"></div>
			</div>

		</div>
	</div>
</div>

<!-- Notify Modal -->
<div class="modal fade" id="notifyModal" tabindex="-1" aria-labelledby="notifyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body modal-notify">
      	<div class = "p-3">
      	    <form name="notifyForm" method="post" class="row g-3">
        		<div class="mt-0">
        			<input type="text" name="userName" class="form-control" placeholder="신고자">
        		</div>
        		<div class="mt-0">
        			<input type="text" name="notifyContent" class="form-control mt-3" placeholder="신고내용" style="height: 10rem;">
        		</div>
        		<input type="hidden" name ="parentNum">
        		<input type="hidden" name="parent">
        		<input type="hidden" name="communityNum" value="${dto.communityNum}">
      		</form>
      	</div>
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-success sendModalNotify">신고하기</button>
      </div>
    </div>
  </div>
</div>
