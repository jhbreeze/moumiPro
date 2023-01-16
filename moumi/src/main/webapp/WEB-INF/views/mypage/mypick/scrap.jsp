<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">전체 
	<span style="color: green" >${dataCount}</span>건
</p>
    
<table class="table mypicktable">
	<thead class="fw-bold">
		<tr>
			<th>글번호</th>
			<th colspan="4">제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	
	<tbody class="text-center">
		<c:forEach var="dto" items="${scrap}" varStatus="status">
			<tr class="pickScrap-table-tr">
				<td>${dto.communityNum}</td>		
				<td colspan="4"><a href="${pageContext.request.contextPath}/board/article?communityNum=${dto.communityNum}&page=1">${dto.subject}</a></td>		
				<td>${dto.nickName}</td>		
				<td>${dto.regDate}</td>		
		</c:forEach>
	</tbody>
	
			
</table>


<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

