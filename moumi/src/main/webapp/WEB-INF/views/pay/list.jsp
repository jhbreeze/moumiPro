<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<style type="text/css">
.mainBox {
	margin-top: 25px;
	border: none;
	width: 100%;
	height: 450px;
	/* background: #ECF4EB; */
	background: #198754;
}

.searchBox {
	height: 50px;
	width: 650px;
	position: absolute;
	left: 50%;
	margin-top: 90px;
	transform: translateX(-50%);
}

.searchBtn {
	height: 50px;
	width: 70px;
}

.keywordDiv {
	height: 100px;
	width: 800px;
	margin: auto;
	padding: 20px;
	margin-top: 160px;
}

.keyword {
	height: 40px;
	width: 90px;
	background: #66A889;
	border-radius: 35px;
	float: left;
	margin-left: 10px;
	padding: 5px;
	color: white;
	font-size: 17px;
	text-align: center;
}

li {
	float: left;
	list-style: none;
	margin: 1px;
}

.more {
	font-size: 18px;
	float: right;
	margin-right: 30px;
}

.title {
	color: #198754;
	font-size: 20px;
}

.mainText {
	font-size: 40px;
	text-align: center;
	padding-top: 80px;
	margin-top: 50px;
	color: white;
	text-weight: bold;
}

.customInput{
	position: relative;
    width: 100%;
    height: 48px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    border-radius: 24px;
    border: 0.3px solid white;
    background-color: white;
	

}

.inputSearch{
	border: none;	

}

.btnSearch{
	background: white;
	width: 60px;
	heigth: 20px;
	border-radius: 90px;
	padding: 10px;
	border:none; 
}
.pay {
	display: flex;
}
.paybox{
	display: flex;
}
.content {
	width: 20rem;
	height: 15rem;
	background: #FFFFFF;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
	display: flex;
	margin-right: 2rem;
}
.paycontent {
	width: 87rem;
	height: 50rem;
	background: #FFFFFF;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
	margin-top: 7rem;
}
</style>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div class="mainBox">
	<h3 class="mainText">MOUMI 분석 서비스</h3>
	<form class="d-flex searchBox" role="search">
	<div class="customInput">
		<input class="form-control mx-3 inputSearch" type="search"
			placeholder="궁금한 분석 단어를 입력하세요." aria-label="Search">
		<button class="btn btnSearch " type="submit">
			<i class="fa-solid fa-magnifying-glass"></i>검색
		</button>
		</div>

	</form>

	<div class="keywordDiv">
		<c:forEach var="item" begin="0" end="12" step="1" varStatus="status">
			<ul>
				<li><p class="keyword">키워드</p></li>
			</ul>
		</c:forEach>
	</div>
</div>
<div class="container body-container" style="margin-left:15rem;">
	<div class="pay">
		<div class="paybox">
			<div class="paylist">
				<div class="content">
					<p>Free</p>
					
				</div>
			</div>
			<div class="paylist">
				<div class="content">
					<p>Free</p>
					
				</div>
			</div>
			<div class="paylist">
				<div class="content">
					<p>Free</p>
					
				</div>
			</div>
			<div class="paylist">
				<div class="content">
					<p>Free</p>
					
				</div>
			</div>
		</div>
	</div>
	<div class="paycontent">
			이용권 비교
		</div>
</div>
</body>
</html>