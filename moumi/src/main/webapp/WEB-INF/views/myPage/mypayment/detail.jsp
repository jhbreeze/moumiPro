<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<p class="text-end p-1 pb-0 fw-bold">전체 
	<span style="color: green" >${dataCount}</span>건
</p>
    
<table class="table mypayment-table">
	<thead class="fw-bold">
		<tr>
			<th>결제번호</th>
			<th>이용권</th>
			<th colspan="2">결제일</th>
			<th colspan="3">사용 기간 안내</th>
		</tr>
	</thead>

	<tbody class="text-center">
		<c:forEach var="dto" items="${detail}" varStatus="status">
			<tr class="paymentDetail-table-tr">
				<td colspan="1">${dto.paymentNum}</td>		
				<td colspan="1">${dto.subject}</td>		
				<td colspan="4">${dto.payDate}</td>		
				<td colspan="1">${dto.payDate}&nbsp;~&nbsp;${dto.endDate}</td>
		</c:forEach>
	</tbody>

</table>


<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>





