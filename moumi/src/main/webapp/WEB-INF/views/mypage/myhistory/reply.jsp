<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">전체 
	<span style="color: green" >${dataCountR}</span>건
</p>
    
<table class="table myhistory-table">
	<thead class="fw-bold">
		<tr>
			<th>댓글<br></th>
			<th>게시판<br></th>
			<th colspan="4">제목<br></th>
			<th>작성일</th>
		</tr>
	</thead>

	<tbody class="text-center">
		<c:forEach var="dto" items="${reply}" varStatus="status">
			<tr class="historyPost-table-tr">
				<td colspan="1">${dto.content}</td>
				<td colspan="4">
						<a href="${pageContext.request.contextPath}/board/article?communityNum=${dto.communityNum}&page=1">${dto.subject}</a>
				</td>		
				<td colspan="1">${dto.regDate}</td>
		</c:forEach>
	</tbody>

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
