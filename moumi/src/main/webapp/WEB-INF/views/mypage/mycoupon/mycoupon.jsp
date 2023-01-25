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
	<c:forEach var="dto" items="${couponList}" varStatus="status">
		<p>쿠폰 이름${dto.couponName}</p>
		<p>쿠폰 가격${dto.couponPrice}</p>
		<p>쿠폰 가격${dto.startDate}</p>
		<p>쿠폰 가격${dto.endDate}</p>


	</c:forEach>

</body>

</html>


