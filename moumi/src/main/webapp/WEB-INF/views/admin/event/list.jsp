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

.deadLineEnd{
	color: blue;
	font-size: 13px;
	font-weight: 600;

}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
<body>
	<div class="container">
		<div class="body-container">
			<div class="body-title">

				<h2 style="margin-top: 10px;">
					<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
				</h2>
			</div>
			
			<div class="body-main">
			<div class="row board-list-header">
				<div class="col-auto me-auto">
					<div>
						<p class="form-control-plaintext">${dataCount}개(${page}/${total_page}페이지)</p>
					</div>
				</div>
			</div>
			</div>

			<div class="body-main">
				<form name="listForm" method="post">
					<div class="row board-list-header"></div>
					<div class="row">
						<c:forEach var="dto" items="${list}" varStatus="status">
								<div class="col-lg-4 col-sm-3">
									<div class="card" style="width: 20rem; overflow: hidden;"
										onclick="location.href='${pageContext.request.contextPath}/admin/event/article?&eventNum=${dto.eventNum}'">
										<img style="height: 280px; width: 319px;"
											src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}" />
										<div class="card-body">
											<p class="card-text">
											<p class="eventName">${dto.subject}
											<c:if test="${dto.deadLine > 0 }">
												<p class="term">${dto.startDate}
												~ ${dto.endDate}&nbsp;<em class="deadLineEnd"> 종료된 이벤트</em></c:if>
											<c:if test="${dto.deadLine < 0 }">
												<p class="term">${dto.startDate}
												~ ${dto.endDate}&nbsp;<em class="deadLine">D-${dto.deadLineABS}</em></c:if>
											</p>
										</div>
									</div>
									<br>
								</div>
							
						</c:forEach>
					</div>
				</form>

				<div class="page-navigation mt-5">${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
				</div>


				<button type="button" class="btn btn-success" style="float: right;"
					onclick="location.href='${pageContext.request.contextPath}/admin/event/write'">이벤트
					등록</button>
			</div>
		</div>
	</div>