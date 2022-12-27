<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

.recruit-table tr>td:first-child {
	background-color: #ECF4EB;
	font-weight: 600;
	font: #545454;
}

.table tr {height: 40px; }
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

<c:if test="${sessionScope.member.userCode==dto.userCode||sessionScope.member.userType==0}">
	function deleteRecruit() {
	    if(confirm("게시글을 삭제 하시겠습니까 ? ")) {
		    let query = "recruitNum=${dto.recruitNum}&${query}";
		    let url = "${pageContext.request.contextPath}/recruit/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>

</script>



<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation"><a class="nav-link active" aria-current="page"
				 href="${pageContext.request.contextPath}/recruit/main">진행중인 공고</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link" 
				href="${pageContext.request.contextPath}/recruit/main">마감된 공고</a></li>
		</ul>
		
		<form name="recruitForm" method="post">
			<table class="table mt-5 recruit-table border-top">
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">공고명</td>
					<td class="ps-3" colspan="3">${dto.subject}</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">구분</td>
					<td class="ps-3" colspan="3">${dto.career}</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">회사명</td>
					<td class="ps-3" colspan="3">${dto.corporation}</td>
				</tr>
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">접수 이메일</td>
					<td class="ps-3" colspan="3">${dto.email}</td>
				</tr>
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">모집 기간</td>
					<td class="ps-3">${dto.startDate}&nbsp;~&nbsp;${dto.endDate}</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row" valign="top">내용</td>
					<td class="ps-3" colspan="3">
						<div style="height:400px;" class="editor">
							${dto.content}
						</div>
					</td>
				</tr>
				
				<c:if test="${dto.fileCount != 0}">
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row" valign="top"> 전체 파일<br> 다운로드 </td>
						<td>
								<a href="${pageContext.request.contextPath}/recruit/zipdownload?fileNum=${dto.fileNum}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
						</td>
					</tr>	
				</c:if>
				
				<c:forEach var="vo" items="${listFile}">
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">파일 다운로드</td>
						<td>
							<a href="${pageContext.request.contextPath}/recruit/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
							(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00" />kb)
						</td>
					</tr>
				</c:forEach>

			</table>

			<div class="text-center">
				<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요">
					<i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>
						&nbsp;&nbsp;<span id="recruitLikeCount">${dto.recruitLikeCount}</span>
				</button>
			</div>

			<table class="table mt-5 border-top">
				<tr>
					<td colspan="2">이전글 : <c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/recruit/article?${query}&recruitNum=${preReadDto.recruitNum}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">다음글 : <c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/recruit/article?${query}&recruitNum=${nextReadDto.recruitNum}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</table>

			<table class="table table-borderless mb-2">
				<tr>
					<td class="text-start">
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/recruit/main?${query}';">돌아가기</button>
					</td>
					<td class="text-end">
					<c:choose>
						<c:when test="${sessionScope.member.userType==0 || sessionScope.member.userType==3}">
							<button type="button" class="btn btn-success"
								onclick="location.href='${pageContext.request.contextPath}/recruit/update?recruitNum=${dto.recruitNum}&page=${page}';">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-success" disabled="disabled">수정</button>
						</c:otherwise>
					</c:choose> 
					<c:choose>
						<c:when test="${sessionScope.member.userType==0 || sessionScope.member.userType==3}">
							<button type="button" class="btn btn-success"
								onclick="deleteRecruit();">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-success" disabled="disabled">삭제</button>
						</c:otherwise>
					</c:choose>
				</td>
				</tr>
			</table>
		</form>
	</div>
</div>