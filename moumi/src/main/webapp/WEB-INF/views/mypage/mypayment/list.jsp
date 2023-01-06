<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">전체 
	<span style="color: green" >${dataCount}</span>건
</p>
    
<table class="table myhistory-table">
	<thead class="fw-bold">
		<tr>
			<th>NO</th>
			<th>게시판</th>
			<th colspan="4">제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	
	<c:if test="${list.size() > 0}">
	<tbody class="text-center">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr class="historyPost-table-tr" data-rNum="${dto.recruitNum}">
			<td colspan="1">${dto.게시판}</td>		
			<td colspan="4">${dto.subject}</td>		
			<td colspan="1">${dto.regDate}</td>		
		</c:forEach>
	</tbody>
	</c:if>
	
			
</table>


<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>


<div class="row py-3">
	<div class="col">
		<button type="button" class="btn btn-success"
			onclick="reloadRecruit();">새로고침</button>
	</div>


	<div class="col-6 text-center" >
		<form class="row" name="searchForm" method="post">
			<div class="col-auto p-1">
				<select name="condition" id="condition" class="form-select">
					<option value="subject"
						${condition=="subject"?"selected='selected'":""}>제목</option>
					<option value="career"
						${condition=="career"?"selected='selected'":""}>내용</option>
					<option value="corporation"
						${condition=="corporation"?"selected='selected'":""}>글쓴이</option>
				</select>
			</div>

			<div class="col-auto p-1">
				<input type="text" name="keyword" id="keyword" value="${keyword}"
					class="form-control">
			</div>
			<div class="col-auto p-1">
				<button type="button" class="btn btn-success" onclick="searchList()">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
	</div>


	<div class="col text-end">
		<c:if test="${sessionScope.member.userType==0 || sessionScope.member.userType==3}">
			<button type="button" class="btn btn-success"
				onclick="location.href='${pageContext.request.contextPath}/recruit/write';">글올리기</button>
		</c:if>
	</div>
</div>
