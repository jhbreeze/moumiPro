<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<div class="container body-container">
		<div class="inner-page">
			<br> <br> <br>
			<div class="row">
				<c:forEach var="item" begin="0" end="11" step="1" varStatus="status">
					<div class="col-lg-3 col-md-3">
						<div class="card" style="width: 18rem;">
							<img style="height: 280px; width: 285px;"
								src="${pageContext.request.contextPath}/resources/images/noimage.png" />
							<div class="card-body">
								<p class="card-text">분석 리포트 제목</p>
							</div>
						</div>
						<br>

					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
</html>