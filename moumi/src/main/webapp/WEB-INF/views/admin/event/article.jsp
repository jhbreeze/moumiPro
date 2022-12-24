<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">


<div class="container">
	<div class="body-container">
		<div class="body-title">

			<h2 style="margin-top: 10px;">
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
			</h2>
		</div>


		<div class="body-main">

			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">${dto.subject}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td align="right">등록일 | ${dto.regDate}</td>
						
					</tr>
						<tr>
							<td width="50%"> ${dto.startDate}~${dto.endDate} </td>
						</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">${dto.content}</td>
					</tr>
				
				</tbody>
				
			</table>
			
			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%">
							<button type="button" class="btn btn-success"
									onclick="location.href='${pageContext.request.contextPath}/admin/event/update?eventNum=${dto.eventNum}';">수정</button>
						<button type="button" class="btn btn btn-outline-success"
									onclick="deleteEvent();">삭제</button>	
						<%-- <c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-success"
									onclick="location.href='${pageContext.request.contextPath}/bbs/update?num=${dto.num}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose> 
						
						<c:choose>
							<c:when
								test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
								<button type="button" class="btn btn btn-outline-success"
									onclick="deleteBoard();">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn btn-outline-success" disabled="disabled">삭제</button>
							</c:otherwise>
						</c:choose></td> --%>
						</td>
					<td class="text-end">
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/bbs/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			

		

		</div>
	</div>
</div>