<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">전체 
	<span style="color: green" >${dataCountR}</span>건
</p>
    
<table class="table mypick-table">
	<thead class="fw-bold">
		<tr>
			<th colspan="1">글번호</th>
			<th colspan="1">회사명</th>
			<th colspan="4">공고명</th>
			<th colspan="2">모집기간</th>
		</tr>
	</thead>
	
	<tbody class="text-center">
		<c:forEach var="dto" items="${recruit}" varStatus="status">
			<tr class="pickRecruit-table-tr">
				<td colspan="1">${dto.recruitNum}</td>		
				<td colspan="1">${dto.corporation}</td>		
				<td colspan="4">${dto.subject}</td>		
				<td colspan="2">${dto.startDate}&nbsp;~&nbsp;${dto.endDate}</td>		
		</c:forEach>
	</tbody>
	
			
</table>


<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

