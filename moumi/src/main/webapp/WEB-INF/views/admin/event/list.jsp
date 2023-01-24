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
	padding-left:10px;
}

.progressStatus {
	color: #fb4357;
	font-size: 13px;
	font-weight: 600;
}

.deadlineStatus {
	color: blue;
	font-size: 13px;
	font-weight: 600;
}

.waitingStatus {
	color: green;
	font-size: 13px;
	font-weight: 600;
}

.eventCard {
	width: 400px;
	height: 200px;
	margin-bottom: 20px;
		border: 1px solid blue;
	
}


.eventInfo{
	padding-left:10px;
	font-size:16px;
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
								<div 
									onclick="location.href='${pageContext.request.contextPath}/admin/event/article?&eventNum=${dto.eventNum}'"
									style ="border: 1px solid #DDD;">
									<img style="height: 300px; width: 400px; overflow:hidden;"
										src="${pageContext.request.contextPath}/uploads/event/${dto.thumbnail}" />
										<p class="eventInfo" >${dto.subject}
											<c:if test="${dto.startCheck >= 0 &&  dto.endCheck >= 0 }">
												<p class="term">${dto.startDate}
													~ ${dto.endDate}&nbsp;<em class="progressStatus"> 진행 중
														이벤트 D-${dto.endCheck}</em>
											</c:if>
											<c:if test="${dto.endCheck<0}">
												<p class="term">${dto.startDate}
													~ ${dto.endDate}&nbsp;<em class="deadlineStatus">만료된
														이벤트</em>
											</c:if>
											<c:if test="${dto.startCheck < 0 && dto.endCheck > 0}">
												<p class="term">${dto.startDate}
													~ ${dto.endDate}&nbsp;<em class="waitingStatus">대기 중
														이벤트</em>
											</c:if>
										</p>

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
				<div style="width:100px; height:50px;"></div>
			</div>
		</div>
	</div>