<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.fw-bold {
	color: #198754;
	font-weight: bold;
}

thead {
	border-top: 1px solid green;
	text-align: center;
	color: green;
}

tbody {
	border-bottom: 1px solid green;
}

th, td {
	padding: 35px 35px;
}
</style>




<c:choose>
	<c:when test="${current.size() > 0}">
		<table class="mypayment-table">
			<thead class="fw-bold">
				<tr>
					<th>NO</th>
					<th>이용권</th>
					<th colspan="4">이용 가능 서비스</th>
					<th>사용 기간 안내</th>
				</tr>
			</thead>

			<tbody class="text-center">
				<c:forEach var="dto" items="${current}" varStatus="status">
					<tr class="paymentCurrent-table-tr">
						<td colspan="1">${dto.paymentNum}</td>
						<td colspan="1">${dto.subject}</td>
						<td colspan="4">${dto.content}</td>
						<td colspan="1"><span
							style="color: #DC3545; font-weight: 700;">${dto.payDate}&nbsp;~&nbsp;${dto.endDate}</span></td>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
	<c:otherwise>
		구매하신 이용권이 없습니다.
	</c:otherwise>
</c:choose>

<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>





<!-- 엔드 날짜가 오늘보다 적은거 가져오기 -->