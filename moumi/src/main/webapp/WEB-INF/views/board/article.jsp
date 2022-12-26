<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
.img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
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
		
		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		
		content = encodeURIComponent(content);
		let url = "${pageContext.request.contextPath}/board/insertReply";
		let query = "communityNum="+num+"&content="+content+"&parent=0";
		
		const fn = function(data){
			$tb.find("textarea").val("");
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else {
				alert("댓글 등록이 실패했습니다.");
			}
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});

//삭제 신고메뉴
$(function(){
	$("body").on("click",".reply-dropdown",function(){
		const $m = $(this).next(".reply-menu");
		if($m.is(":visible")){
			$m.fadeOut(100);
		} else {
			$(".reply-menu").hide();
			$m.fadeIn(100);
			
			let pos = $(this).offset();
			$m.offset({left:pos.left-70, top:pos.top+20});
		}
	});
	
	$("body").click(function(){
		if($(event.target.parentNode).hasClass("reply-dropdown")){
			return false;
		}
		
		$(".reply-menu").hide();
	});
});
/*
// 댓글별 답글 리스트
function listReplyAnswer(answer){
	let url = "${pageContext.request.contextPath}/bbs/listReplyAnswer";
	let query = "answer=" + answer;
	let selector = "#listReplyAnswer" + answer;
	
	const fn = function(data){
		$(selector).html(data);
	}
	ajaxFun(url,"get",query,"html",fn);
}

// 댓글별 답글 개수
function countReplyAnswer(answer){
	let url = "${pageContext.request.contextPath}/bbs/countReplyAnswer";
	let query = "answer="+answer;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+answer;
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
		
		let content = $td.find("textarea").val().trim();
		
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		
		content = encodeURIComponent(content);
		let url = "${pageContext.request.contextPath}/bbs/insertReply";
		let query = "num=${dto.communityNum}&content="+content+"&answer="+replyNum;
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		ajaxFun(url,"post",query,"json",fn);
		
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
		
		let url = "${pageContext.request.contextPath}/bbs/deleteReply";
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
		
		let url = "${pageContext.request.contextPath}/bbs/deleteReply";
		let query = "replyNum="+replyNum+"&mode=answer";
		
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
		let replyLike = $(this).attr("data-replyLike");
		const $btn = $(this);
		
		let msg = "게시글이 마음에 들지 않으십니까?";
		if(replyLike === "1") {
			msg = "게시글에 공감하십니까?";
		}
		if(! confirm(msg)) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/bbs/insertReplyLike";
		let query = "replyNum="+replyNum+"&replyLike="+replyLike;
		
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


// 댓글의 답글 숨김
$(function(){
	$("body").on("click",".hideReplyAnswer",function(){
		let $menu = $(this);
		
		let replyNum = $(this).attr("data-replyNum");
		let showReply = $(this).attr("data-showReply");
		let msg = "댓글을 숨기시겠습니까?";
		if(showReply === "0"){
			msg = "댓글 숨김을 해제 하시겠습니까?";
		}
		if(! confirm(msg)) {
			return false;
		}
	
		showReply = showReply === "1" ? "0" : "1";
		
		let url = "${pageContext.request.contextPath}/bbs/replyShowHide";
		let query = "replyNum="+replyNum+"&showReply="+showReply;
		
		const fn = function(data){
			if(data.state === "true") {
				let $item = $($menu).closest(".row").next("div");
				if(showReply === "1") {
					$item.removeClass("text-primary").removeClass("text-opacity-50");
					$menu.attr("data-showReply","1");
					$menu.html("숨김");
				} else {
					$item.addClass("text-primary").addClass("text-opacity-50");
					$menu.attr("data-showReply","0");
					$menu.html("표시");
				}
			}
		};
		ajaxFun(url,"post",query,"json",fn);
	});
});


//댓글 숨김
$(function(){
	$("body").on("click",".hideReply",function(){
		let $menu = $(this);
		
		let replyNum = $(this).attr("data-replyNum");
		let showReply = $(this).attr("data-showReply");
		let msg = "댓글을 숨기시겠습니까?";
		if(showReply === "0"){
			msg = "댓글 숨김을 해제 하시겠습니까?";
		}
		if(! confirm(msg)) {
			return false;
		}
	
		showReply = showReply === "1" ? "0" : "1";
		
		let url = "${pageContext.request.contextPath}/bbs/replyShowHide";
		let query = "replyNum="+replyNum+"&showReply="+showReply;
		
		const fn = function(data){
			if(data.state === "true") {
				let $item = $($menu).closest("tr").next("tr").find("td");
				if(showReply === "1") {
					$item.removeClass("text-primary").removeClass("text-opacity-50");
					$menu.attr("data-showReply","1");
					$menu.html("숨김");
				} else {
					$item.addClass("text-primary").addClass("text-opacity-50");
					$menu.attr("data-showReply","0");
					$menu.html("표시");
				}
			}
		};
		ajaxFun(url,"post",query,"json",fn);
	});
}); */
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
				<form name="replyForm" method="post">
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
							<td align='left' style="">
								<div class="img-viewer"></div>
								<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
							</td>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
				<div id="listReply"></div>
			</div>

		</div>
	</div>
</div>