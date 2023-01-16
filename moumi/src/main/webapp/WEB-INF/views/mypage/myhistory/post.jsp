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
			<th>글번호</th>
			<th>게시판</th>
			<th colspan="4">제목</th>
			<th>작성일</th>
		</tr>
	</thead>

	<tbody class="text-center">
		<c:forEach var="dto" items="${post}" varStatus="status">
			<tr class="historyPost-table-tr">
				<td colspan="1">${dto.communityNum}</td>		
				<td colspan="1">${dto.tableName=="community"?"자유게시판":"채용"}</td>		
				<td colspan="4">
					<c:if test="${dto.tableName=='community'}">
						<a href="${pageContext.request.contextPath}/board/article?communityNum=${dto.communityNum}&page=1">${dto.subject}</a>
					</c:if>
					<c:if test="${dto.tableName=='recruit'}">
						${dto.subject}
					</c:if>
				</td>		
				<td colspan="1">${dto.regDate}</td>
		</c:forEach>
	</tbody>

</table>


<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>





