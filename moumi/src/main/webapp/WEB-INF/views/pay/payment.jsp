<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pay-content {
	width: 45rem;
	height: 60rem;
	border-radius: 6rem;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	margin: 5rem auto;
	padding: 1rem 1rem;
}
.pay-content-head {
	padding-left: 5rem;
	padding-top: 5rem;
	padding-bottom:2rem;
	border-bottom: 0.15rem solid #B0B0B0;
}
.pay-content-head .f-head {
	font-size: 2rem;
	font-weight: bold;
	line-height: 1;
}
.pay-content-detail {
	margin-top:2rem;
	padding-left: 3rem;
	border-bottom: 0.05rem solid #B0B0B0;
}
.pay-content-subject h6{
	font-size: 1.5rem;
	margin-bottom: 1.5rem;
}

.pay-detail-desc-row {
	display: flex;
	margin-bottom: 0.5rem;
}
.pay-detail-desc-tit {
	font-size:1rem;
	font-weight:400;
	width: 50%;
}
.pay-detail-desc-con {
	font-size:1rem;
	font-weight:400;
}
.pay-content-footer{
	margin-top: 5rem;
	margin-left: 5rem;
}
.pay-content-footer .pay {
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	background: #DC3545;
	color: white;
	text-align: center;
	width: 13rem;
	height: 2.5rem;
	border-radius: 0.5rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}
.pay-content-footer .back {
	margin-left: 2rem;
	line-height: 1;
	margin-bottom: 1rem;
	background: #198754;
	color: white;
	text-align: center;
	width: 13rem;
	height: 2.5rem;
	border-radius: 0.5rem;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 1.2rem;
	border: none;
	font-weight: bold;
}
</style>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div class="payment">
	<div class="pay-content">
		<div class="pay-content-head">
			<h6 class="f-head">결제하기</h6>
		</div>
		<div class="pay-content-body">
			<div class="pay-content-detail">
				<div class="pay-content-subject">
					<h6>구매자 정보</h6>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>이름</p>
						</div>
						<div class="pay-detail-desc-con">
							<p>이석준</p>
						</div>
					</div>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>이메일</p>
						</div>
						<div class="pay-detail-desc-con">
							<p>test@moumi.com</p>
						</div>
					</div>
				</div>
			</div>
			<div class="pay-content-detail">
				<div class="pay-content-subject">
					<h6>상품 정보</h6>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>상품명</p>
						</div>
						<div class="pay-detail-desc-con">
							<p>모으미 Basic</p>
						</div>
					</div>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>이용기간</p>
						</div>
						<div class="pay-detail-desc-con">
							<p>2023-01-02 ~ 2023-02-02</p>
						</div>
					</div>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>상품내용</p>
						</div>
						<div class="pay-detail-desc-con">
							<p>환불이 불가능하다</p>
						</div>
					</div>
				</div>
			</div>
			<div class="pay-content-detail">
				<div class="pay-content-subject">
					<h6>가격 정보</h6>
				</div>
				<div class="pay-detail-desc">
					<div class="pay-detail-desc-row">
						<div class="pay-detail-desc-tit">
							<p>결제금액</p>
						</div>
						<div class="pay-detail-desc-con">
							<p style="color: #198754; font-weight: bold;">15,000<span>원</span></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pay-content-footer">
			<button class="pay">결제하기</button>
			<button class="back"  onclick="location.href='${pageContext.request.contextPath}/pay/list'">결제취소</button>
		</div>
	</div>
</div>
</body>
</html>