<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style type="text/css">
.eventName {
	color: #363634;
	font-size: 16px;
	font-weight: 500;
}

.term {
	color: #6A6F77;
	font-size: 13px;
}

.deadLine {
	color: #fb4357;
	font-size: 13px;
	font-weight: 600;
}
</style>



<body>
	<div class="container">
		<div class="body-container">
			<div class="body-title">

				<h2 style="margin-top: 10px;">
					<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;MOUMI 이벤트
				</h2>
			</div>

			<div class="body-main">
				<form name="listForm" method="post">
					<div class="row board-list-header"></div>
					<div class="row">
						<c:forEach var="dto" items="${list}" varStatus="status">
								<div class="col-lg-4 col-sm-3">
									<div class="card" style="width: 20rem; overflow: hidden;"
										onclick="location.href='${pageContext.request.contextPath}/event/article?&eventNum=${dto.eventNum}'">
										<img style="height: 280px; width: 319px;"
											src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}" />
										<div class="card-body">
											<p class="card-text">
											<p class="eventName">${dto.subject}
											<p class="term">${dto.startDate}
												~ ${dto.endDate}&nbsp;<em class="deadLine">D-${dto.deadLine}</em>
											</p>
										</div>
									</div>
									<br>
								</div>
						</c:forEach>
					</div>
				</form>
			</div>
		</div>
	</div>