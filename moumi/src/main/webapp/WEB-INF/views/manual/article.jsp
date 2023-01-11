<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
.body-container {
	max-width: 1200px;
}
</style>

<script type="text/javascript">
function deleteOk() {
	let query = "manualNum=${dto.manualNum}&${query}";
	let url = "${pageContext.request.contextPath}/manual/delete?" + query;
	location.href = url;
}
</script>


<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				사용 방법 게시판
			</h2>
		</div>

		<div class="body-main">
			<table class="table table-borderless">
				<thead>
					<tr>
						<td colspan="3">
							<div class="col lg-img box01" align="center">
								<h1>${dto.subject}</h1>
							</div>
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%" class="col-10">작성자 : 관리자</td>
						<td align="right" class="col-2">${dto.regDate}</td>
						<td align="right" class="col-2"></td>
					</tr>
					
					<tr>
					 <td>
					 	<c:forEach var="vo" items="${listFile}">
							<div class="col-md-auto sm-img">
								<img class="border rounded" src="${pageContext.request.contextPath}/uploads/manual/${vo.imageFilename}" style="width: -webkit-fill-available;">
							</div>
						</c:forEach>
					 </td>
					</tr>
					<tr>
						<td colspan="3" valign="top" height="200">${dto.content}</td>
					</tr>
					<tr>
						<td colspan="3">다음글 : <c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/manual/article?${query}&manualNum=${preReadDto.manualNum}" class="text-line">${preReadDto.subject}</a>
						</c:if></td>
					</tr>
					<tr>
						<td colspan="3">이전글 : <c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/manual/article?${query}&manualNum=${nextReadDto.manualNum}" class="text-line">${nextReadDto.subject}</a>
						</c:if></td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<c:if test="${sessionScope.member.userType == 0}">
					<td width="50%">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/manual/update?manualNum=${dto.manualNum}&page=${page}';">수정</button>
						<button type="button" class="btn btn-light"
											data-bs-toggle="modal" data-bs-target="#exampleModal">
											삭제 </button>
					</td>
					</c:if>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/manual/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">사용자 이용방법</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">게시글을 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">아니요</button>
									<button type="button" class="btn btn-primary"
										onclick="deleteOk();">예</button>
								</div>
							</div>
						</div>
					</div>
		</div>
	</div>
</div>
