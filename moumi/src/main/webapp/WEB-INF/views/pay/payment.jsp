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
.payment input {
	border: none;
}
</style>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
var IMP = window.IMP;
IMP.init("imp68833433");

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes(); // 분
var seconds = today.getSeconds(); // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;

function requestPay() {
	const f = document.payForm;
	
	
	//결제 
	let paymentPrice = $("form[name=payForm] input[name=paymentPrice]").val();
	alert(paymentPrice);
	
	name = '${dto2.subject}';
	
	paymentPrice = 100; // 지우면 안 됨.
	IMP.request_pay({
		pg : 'html5_inicis.INIpayTest',
		pay_method : 'card',
		merchant_uid : "IMP" + makeMerchantUid,
		name : name, //클라이언트에게 보여주는 상품 이름 
		amount : paymentPrice, // 결제 금액 
		buyer_email : '${dto.email}', // 구매자 이메일 
		buyer_name : '${dto.userName}', // 구매자 이름 
		//buyer_tel : f.realUserTel.value, // 구매자 전화번호 
		//buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
		buyer_postcode : '123-456' //구매자 우편번호 
	},
	function(rsp) { // callback
		if (rsp.success) {
			console.log(rsp);
			f.action = "${pageContext.request.contextPath}/pay/payment";
			f.submit();
		} else {
			console.log(rsp);
			alert("결제를 실패했습니다");
			}
	});	

}
</script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<form name="payForm" method="post">
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
								<input type="text" name="userName" value="${dto.userName}">
							</div>
						</div>
					</div>
					<div class="pay-detail-desc">
						<div class="pay-detail-desc-row">
							<div class="pay-detail-desc-tit">
								<p>이메일</p>
							</div>
							<div class="pay-detail-desc-con">
								<input type="text" name="email" value="${dto.email}">
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
								<input type="text" name="subject" value="${dto2.subject}">
							</div>
						</div>
					</div>
					<div class="pay-detail-desc">
						<div class="pay-detail-desc-row">
							<div class="pay-detail-desc-tit">
								<p>이용기간</p>
							</div>
							<div class="pay-detail-desc-con">
								<input type="text" style="width:6rem;" name="payDate" value="${now}"> ~ <input type="text" style="width:6rem;" name="endDate" value="${enddate}">
							</div>
						</div>
					</div>
					<div class="pay-detail-desc">
						<div class="pay-detail-desc-row">
							<div class="pay-detail-desc-tit">
								<p>상품내용</p>
							</div>
							<div class="pay-detail-desc-con">
								<input type="text" style="width:20rem;" name="content" value="${dto2.content}">
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
								<p style="color: #198754; font-weight: bold;"><input type="text" name="paymentPrice" style="width: 3rem;" value="${price}"><span>원</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pay-content-footer">
				<button type="button" class="pay" onclick="requestPay();">결제하기</button>
				<button type="button" class="back"  onclick="location.href='${pageContext.request.contextPath}/pay/list'">결제취소</button>
			</div>
		</div>
	</div>
</form>
</body>
</html>