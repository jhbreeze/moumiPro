<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
				<form name="listForm" method="post">
					<div class="row board-list-header"></div>
					<div class="row">
						<c:forEach var="item" begin="0" end="11" step="1"
							varStatus="status">
							<div class="col-lg-3 col-sm-3">
								<div class="card" style="width: 18rem;">
									<img style="height: 280px; width: 285px;"
										src="${pageContext.request.contextPath}/resources/images/noimage.png" />
									<div class="card-body">
										<p class="card-text">이벤트 제목</p>
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