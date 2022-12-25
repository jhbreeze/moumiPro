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

</style>


<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">채용 진행중</a></li>
			<li class="nav-item"><a class="nav-link" href="list2.do?page=1">채용마감</a></li>
		</ul>

		<form name="recruitForm" method="post">
			<table class="table mt-5 recruit-table border-top">
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">공고명</td>
					<td class="ps-3" colspan="3">현대자동차 브랜드 디자인 담당자 채용</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">구분</td>
					<td class="ps-3" colspan="3">신입</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">회사명</td>
					<td class="ps-3" colspan="3">현대자동차</td>
				</tr>
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">접수 이메일</td>
					<td class="ps-3" colspan="3">hyundai@hyundai.com</td>
				</tr>
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">모집 기간</td>
					<td class="ps-3">2022.02.18&nbsp;~&nbsp;2022.03.18</td>
				</tr>

				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">내용</td>
					<td class="ps-3" colspan="3">
						<pre>
							content
							
							
							
							
							
							
							
						</pre>
					</td>
				</tr>
				<tr>
					<td class="col-sm-2 align-middle text-center" scope="row">파일 다운로드</td>
					<td class="ps-3" colspan="4">
						<c:if test="${not empty dto.imagefileName}">
							<a href="${pageContext.request.contextPath}/recruit/download?num=${dto.num}">${dto.imagefileName}</a>
						</c:if>
					</td>
				</tr>
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
							<a href="${pageContext.request.contextPath}/recruit/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">다음글 : <c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/recruit/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</table>

			<table class="table table-borderless mb-2">
				<tr>
					<td class="text-start">
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/recruit/list?${query}';">돌아가기</button>
					</td>
				
				</tr>
			</table>
		</form>
	</div>
</div>