<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col ms-2 align-self-center'>
						<div class='name'>${vo.nickName}</div>
						<div class='date'>${vo.regDate}</div>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end'>
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				<div class='reply-menu'>
					<c:choose>
						<c:when test="${sessionScope.member.userCode == vo.userCode }">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.parent}'>삭제</div>
							<div class='notifyReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.parent}'>신고</div>
						</c:when>
						<c:when test="${sessionScope.member.userType == 0 }">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.parent}'>삭제</div>
							<div class='notifyReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.parent}'>신고</div>
						</c:when>
						<c:otherwise>
							<div class='notifyReplyAnswer reply-menu-item'>신고</div>
						</c:otherwise>
					</c:choose>
							
				</div>
			</div>
		</div>

		<div class='p-2'>
			${vo.content}
			<c:if test="${not empty vo.fileName}">
				<img src="${pageContext.request.contextPath}/uploads/reply/${vo.fileName}" style="width: 10rem; height: 10rem;">
			</c:if>
		</div>
	</div>
</c:forEach>