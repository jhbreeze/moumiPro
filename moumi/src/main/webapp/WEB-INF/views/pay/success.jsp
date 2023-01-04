<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.pay-success-content {
	width: 45rem;
	height: 50rem;
	border-radius: 6rem;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	margin: 5rem auto;
}
.pay-success-head {
	margin-top: 3rem;
	padding-top: 9rem;
}
.pay-success-head .bi-check-circle {
	font-size: 7rem;
	padding-left: 19rem;
	padding-top: 10rem;
}
.pay-success-head .color {
	color: #DC3545;
}
.pay-success-body span {
	padding-left: 12rem;
	font-size:2rem;
	font-weight: bold;
}
.pay-success-desc {
	margin-top:2rem;
	padding-left: 13rem;
}
.pay-success-desc-row {
	display: flex;
}
.pay-success-desc-tit {
	font-size:1.5rem;
	width:10rem;
}
.pay-success-desc-con {
	font-size:1.5rem;

}
.pay-success-footer {
	margin-left: 12rem;
	margin-top: 3rem;
	background: #198754;
	color: white;
	text-align: center;
	width: 20rem;
	height: 3.5rem;
	border-radius: 1.2rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div class="pay-success">
	<div class="pay-success-content">
		<div class="pay-success-head">
			<i class="bi bi-check-circle color"></i>
		</div>
		<div class="pay-success-body">
			<span>구매가 완료되었습니다</span>
		</div>
		<div class="pay-success-desc">
			<div class="pay-success-desc-row">
				<div class="pay-success-desc-tit">
					<p>이름</p>
				</div>
				<div class="pay-success-desc-con">
					${userName}
				</div>
			</div>
		</div>
		<div class="pay-success-desc">
			<div class="pay-success-desc-row">
				<div class="pay-success-desc-tit">
					<p>이용기간</p>
				</div>
				<div class="pay-success-desc-con">
					 ${subject}
				</div>
			</div>
		</div>
		<button type="button" class="pay-success-footer" onclick="location.href='${pageContext.request.contextPath}'">데이터 분석하러 가기</button>
	</div>
</div>
</body>
</html>