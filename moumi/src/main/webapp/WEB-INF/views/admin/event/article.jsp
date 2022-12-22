<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">


<div class="container">
	<div class="body-container">
		<div class="body-title">

			<h2 style="margin-top: 10px;">
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
			</h2>
		</div>


		<div class="body-main">

			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">${dto.subject}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td width="50%">${dto.subject}</td>
						<td align="right">${dto.regDate}| 조회 ${dto.hitCount}</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">${dto.content}</td>
					</tr>
				
				</tbody>
			</table>

		

		</div>
	</div>
</div>