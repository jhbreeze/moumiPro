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
<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId||sessionScope.member.membership>50}">
	function deleteBoard() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
		    let query = "num=${dto.num}&${query}";
		    let url = "${pageContext.request.contextPath}/bbs/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

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
						<td colspan="2" align="center">{eventName}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td width="50%">이벤트명 {eventName}</td>
						<td align="right">{reg_date}| 조회 {hitCount}</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">{content}</td>
					</tr>
					
					<tr>
						<td colspan="2">파&nbsp;&nbsp;일 : <c:if
								test="${not empty dto.saveFilename}">
								<a
									href="${pageContext.request.contextPath}/bbs/download?num=${dto.num}">${dto.originalFilename}</a>
							</c:if>
						</td>
					</tr>

					<tr>
						<td colspan="2">이전글 : <c:if test="${not empty preReadDto}">
								<a
									href="${pageContext.request.contextPath}/bbs/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">다음글 : <c:if test="${not empty nextReadDto}">
								<a
									href="${pageContext.request.contextPath}/bbs/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%"><c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-success"
									onclick="location.href='${pageContext.request.contextPath}/bbs/update?num=${dto.num}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when
								test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
								<button type="button" class="btn btn btn-outline-success"
									onclick="deleteBoard();">삭제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn btn-outline-success" disabled="disabled">삭제</button>
							</c:otherwise>
						</c:choose></td>
					<td class="text-end">
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/bbs/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>


		</div>
	</div>
</div>