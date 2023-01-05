<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	text-align: center;
	margin-bottom: 150px;
}

.welcome {
	font-size: 20px;
	font-weight: bold;
	letter-spacing: -1px;
	margin-top: 10px;
}

.ment {
	margin-top: 15px;
	font-size: 13px;
	font-weight: 500;
	letter-spacing: -1px;
}

.btn {
	border-radius: 0px;
	padding: 10px 50px;
	font-size: 13px;
	font-weight: 600;
}

.main:hover {
	background-color: white;
	color: green;
}
</style>

<div class="container">
	<div class="body-container">
		<div>
			<img
				src="${pageContext.request.contextPath}/resources/images/moumi/pick.png"
				style="width: 300px; margin-top: 20px;" class="card-img-top">
		</div>
		<div class="cong">
			<c:forEach var="dto" items="${listWinner}" varStatus="status">
				<div class="col-lg-4 col-sm-3">
					<p>${dto.nickName}</p>
					<br>
				</div>

			</c:forEach>

			<div class="button">
				<button type="button" class="main btn btn-outline-success"
					onclick="location.href='${pageContext.request.contextPath}/admin/event/article?&eventNum=${dto.eventNum}';">이벤트로 돌아가기</button>
				<button type="button" class="btn btn-success"
					onclick="location.href='${pageContext.request.contextPath}/admin/event/list';">&nbsp;&nbsp;이벤트 목록&nbsp;&nbsp;</button>
			</div>
		</div>

	</div>
</div>