<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">

.img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	cursor: pointer;
}
</style>
<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
	
		<tr class='border bg-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.nickName}</div>
						<div class='date'>${vo.regDate}</div>
					</div>
				</div>
			</td>
			<td width='50%' align='right' class='align-middle'>
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				<div class="reply-menu">
					<c:choose>
					 	<c:when test="${sessionScope.member.userCode == vo.userCode}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
							<div class='notifyReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' onclick="notify(${vo.replyNum});">신고</div>
						</c:when>
						<c:when test="${sessionScope.member.userType == 0}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
							<div class='notifyReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}'  onclick="notify(${vo.replyNum});">신고</div>
						</c:when>
						<c:otherwise>
							<div class="notifyReply reply-menu-item"  onclick="notify(${vo.replyNum});">신고</div>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top' <%-- class="${vo.showReply==0?'text-primary text-opacity-50':'' }" --%>>
				${vo.content}
				<c:if test="${not empty vo.fileName}">
					<img src="${pageContext.request.contextPath}/uploads/reply/${vo.fileName}" style="width: 10rem; height: 10rem;">
				</c:if>
			</td>
		</tr>

		<tr>
			<td>
				<button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
			</td>
			<td align='right'>
				<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> <span>${vo.likeCount}</span></button>
				<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> <span>${vo.disLikeCount}</span></button>	        
			</td>
		</tr>
	
	    	<tr class='reply-answer'>
		        <td colspan='2'>
		        <form name="replyAnswerForm">
		        	<div class='border rounded replyAnswer-form'>
			            <div id='listReplyAnswer${vo.replyNum}' class='answer-list'></div>
			            <div>
			                <textarea class="form-control m-2" name="content"></textarea>
			            </div>
			            <div class="img-grid">
							<img class="item img-replyadd" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
						</div>
						<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						<div class='text-end pe-2 pb-1'>
							<button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
			            </div>
		            </div>
		            <input type="hidden" name="communityNum" value="${vo.communityNum}">
					<input type="hidden" name="parent" value="${vo.replyNum}">
		            </form>
				</td>
	    	</tr>
	    	
	</c:forEach>
</table>
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
        		<input type="hidden" name="parent">
        		<input type="hidden" name="page" value="${pageNo}">
        		<input type="hidden" name="communityNum" value="${communityNum}">
      		</form>
      	</div>
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-success" onclick="sendModalNotify();">신고하기</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
function notify(num) {
	  $("form[name=notifyForm] input[name=userName]").val("");
	    $("form[name=notifyForm] input[name=notifyContent]").val("");
	    
	    $("form[name=notifyForm] input[name=parent]").val(num)
	    
		$("#notifyModal").modal("show");	
		
	    $("form[name=notifyForm] input[name=userName]").focus();
}
function sendModalNotify() {
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
	
	    f.action = "${pageContext.request.contextPath}/board/notify";
	    f.submit();
}
</script>

<div class="page-navigation">
	${paging}
</div>			