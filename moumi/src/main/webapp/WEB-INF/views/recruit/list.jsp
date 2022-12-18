<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

thead { 
	border-top: 1px solid green; 
	border-bottom: 1px solid green; 
	text-align: center; 
	color: green; 
}

</style>

<div class="container body-container">
    <div class="body-main mx-auto">
    	<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">채용 진행중</a></li>
			<li class="nav-item"><a class="nav-link" href="list2.do?page=1">채용 마감</a></li>
		</ul>
    
    	<p class="text-end m-3 p-2 fw-bold">전체 <span style="color: green">n</span>건</p>
    
		<table class="table">
				<thead class="fw-bold">
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>회사명</th>
						<th colspan="2">공고명</th>
						<th colspan="2">모집기간</th>
					</tr>
				</thead>
				
				<tbody class="text-center">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>
								<c:url var="url" value="/recruit/article">
									<c:param name="num" value="${dto.num}"/>
									<c:param name="page" value="${page}"/>
									<c:if test="${not empty keyword}">
										<c:param name="condition" value="${condition}"></c:param>
										<c:param name="keyword" value="${keyword}"></c:param>
									</c:if>
								</c:url>
								<a href="${url}" class="text-reset">${dto.subject}</a>
								<c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
							</td>
							<td>1</td>
							<td>${dto.career}</td>
							<td>${dto.corporation}</td>
							<td colspan="2">${dto.subject}</td>
							<td colspan="2">${dto.startDate} ~ ${dto.endDate}</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
			
			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/recruit/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/recruit/list" method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>공고명</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>구분</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>회사명</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="keyword" value="${keyword}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-success" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/recruit/write';">글올리기</button>
				</div>
			</div>
    </div>
</div>