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
			<tr class="historyPost-table-tr" data-rNum="${dto.communityNum}">
			<td colspan="1">${dto.tableName}</td>		
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
			onclick="reloadMyhistory();">새로고침</button>
	</div>




	<div class="col text-end">
	</div>
</div>
