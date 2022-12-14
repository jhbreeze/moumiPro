<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
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

.title {
	color: #198754;
	font-size: 20px;
	font-weight: 700;
}

.keywordDiv {
	height: 100px;
	width: 800px;
	margin: auto;
	margin-top: 200px;
}

.keyword {
	height: 40px;
	width: 90px;
	background: #66A889;
	border-radius: 35px;
	float: left;
	margin-left: 10px;
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

.mainText {
	font-size: 40px;
	text-align: center;
	margin-top: 50px;
	color: white;
	text-weight: bold;
}
</style>

<div class="mainBox">
	<h3 class="mainText">MOUMI 분석 서비스</h3>
	<form class="d-flex searchBox" role="search">
		<input class="form-control me-2 " type="search"
			placeholder="궁금한 분석 단어를 입력하세요." aria-label="Search">
		<button class="btn btn-light searchBtn" type="submit">검색</button>

	</form>

	<div class="keywordDiv">
		<c:forEach var="item" begin="0" end="12" step="1" varStatus="status">
			<ul>
				<li><p class="keyword">키워드</p></li>
			</ul>
		</c:forEach>
	</div>
</div>

<div class="container body-container">
	<div class="inner-page"></div>
	<br>
	<br>
	<br>
	<p class="title">분석 리포트</p>
	<a href="#" class="more">더보기</a> <br> <br>
	<div class="container text-center">
		<div class="row">
			<c:forEach var="item" begin="0" end="7" step="1" varStatus="status">
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
	<br>
	<br>
	<br>
	<br>

	<p class="title">분석 리포트</p>
	<div class="container text-center">
		<div class="row">

			<div class="col-lg-2 col-md-2">
				<p class="title">우리 농가 살리기</p>
				<p class="title">우리 지역 살리기</p>
				<br>

			</div>

		</div>
	</div>
</div>