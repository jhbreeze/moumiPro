<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coupon</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
.couponName {
	font-size: 30px;
	font-weight: 300;

}

.couponBox {
	width: 700px;
	height: 250px;
	background: white;
	box-shadow: 3px 3px 3px 3px #A9A9A9;
	border-radius: 15px;
	padding: 50px;
	margin:0 auto; 
}

.couponDate {
	color: #A9A9A9;
	font-size: 16px;
}

.couponPrice {
	float: right;
	color: #198754;
	font-size: 40px;
	font-weight: 700;
}
</style>

</head>
<body>
	<div class="container">
		<div class="body-container">

			<c:forEach var="dto" items="${couponList}" varStatus="status">
				<div class="couponBox">

					<div class="row">
						<div class="col">

							<div class="row">
								<div class="col">
									<p class="couponName">${dto.couponName}<br><span class="couponDate">${dto.startDate}~${dto.endDate}</span></p>
								</div>
								<div class="col">
									<img style="width: 105px; height: 100px; float:right;"
										src="${pageContext.request.contextPath}/resources/images/moumi/circle1.png">
								</div>
							</div>

							<div class="row">
								<h1 class="couponPrice">₩${dto.couponPrice}</h1>
							</div>
							
						</div>
					</div>
				</div>


			</c:forEach>
		</div>
	</div>
</body>

</html>


