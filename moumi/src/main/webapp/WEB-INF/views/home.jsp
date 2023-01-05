<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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

.regionText {
	color: #198754;
	font-size: 70px;
	font-weigth: 900;
	margin-top: 130px;
	text-align: center;
	font-family: 'GmarketSansMedium';
}

.regionTextDetail {
	color: #363634;
	font-size: 17px;
	font-weigth: 100;
}


.farmText {
	color: #198754;
	font-size: 70px;
	font-weigth: 900;
	margin-top: 50px;
	font-family: 'GmarketSansMedium';
	padding-left: 160px;
	
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
	font-family: 'GmarketSansMedium';
	font-weight: 900;
}

.customInput {
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

.inputSearch {
	border: none;
}

.btnSearch {
	background: white;
	width: 60px;
	heigth: 20px;
	border-radius: 90px;
	padding: 10px;
	border: none;
}

.imageContent {
	height: 250px;
	width: 300px;
	border-radius: 25px;
	margin-left: 15px;
	padding: 20px;
	text-align: left;
	box-sizing: border-box;
	border-radius: 12px;
}

.recFont {
	font-family: 'GmarketSansMedium';
	color: #363634;
}

.recTitle {
	font-size: 28px;
	color: #363634;
}

.recEmTitle {
	font-size: 15px;
	color: #363634;
}

.map {
	width: 700px;
	height: 500px;
	padding: 160px;
	margin: 80px;
}

.selectBox {
	width: 350px;
	height: 50px;
	border-radius: 20px;
	background: #ECF4EB;
	border: 1px solid #198754;
	padding-left: 30px;
	padding-top: 8px;
}

.customSelect {
	width: 280px;
	height: 34px;
	font-size: 25px;
	background-color: transparent;
	margin-right: 30px;
	border: 0;
}

.eventLayout {
	width: 100%;
	height: 280px;
	background: #bbdefb;
}

.farmLayout {
	width: 100%;
	height: 500px;
	background: #fff;
}

.mapLayout {
	width: 100%;
	height: 700px;
}

.emptyLayout {
	width: 100%;
	height: 30px;
}

.eventText {
	color: #363634;
	text-align: center;
	font-size: 30px;
	width: 400px;
	height: 100px;
	margin: 0;
	padding-top: 70px;
}

.eventContent {
	float: left;
}

.farmButton {
	width: 230px;
	height: 50px;
	background: #198754;
	border-radius: 35px;
	color: white;
	border: 0;
	font-size: 20px;
	border: 0;
	margin:150px;
	
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa6aaed44dd9e24c37efe3f15fd439e7&libraries=services"></script>
<script>
	$(document).ready(function() {
		let regionCode = $("#regionCode").val(); // 지역코드
		let latitude = 37.557714093880406;
		let longitude = 126.9245098110579;

		map(latitude, longitude)

	});
</script>

<script>
	function map(latitude1, longitude1) {
		let latitude = latitude1;
		let longitude = longitude1;

		var mapContainer = document.getElementById('map');
		var mapOption = {
			// center: new kakao.maps.LatLng(37.557714093880406, 126.92450981105797),  // 지도의 중심좌표 : 위도(latitude), 경도(longitude)

			center : new kakao.maps.LatLng(latitude, longitude),
			level : 3
		// 지도의 레벨(확대, 축소 정도)
		};

		// 지도를 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성
		var geocoder = new kakao.maps.services.Geocoder();

		$
				.ajax({
					//ajax 옵션 설정 
					// 공공데이터 포털 인증키
					url : "https://api.odcloud.kr/api/3060388/v1/uddi:dacd930e-e26e-4f7c-bde7-ce2cfd272e16?page=1&perPage=1000&serviceKey=KAizYtDdo2AYzDzXklWBjNAnwBJq0%2BIahDUm%2FTZKLFK2Fh%2BrMgCMblxsG7mudwtZIqwWXC2XrpMZ9Ea77QWmOA%3D%3D",
					type : "GET",
					dataType : "json",
					// 요청이 성공시 할 일 처리 
					success : function(data) {
						data = JSON.stringify(data)
						data = JSON.parse(data) // String 

						createMarker(data);
					}
				});

		function createMarker(data) {
			$(data.data)
					.each(
							function(index, item) {
								var num = 1;
								var subject = item.브랜드명;
								var addr = item.소재지주소;

								if (subject != null && subject != "null"
										&& addr != null && addr != "null") {

									// 주소로 마커 찍기
									geocoder
											.addressSearch(
													addr,
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === kakao.maps.services.Status.OK) {

															var coords = new kakao.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시
															var infowindow = new kakao.maps.InfoWindow(
																	{
																		content : "<div class='marker-info'>"
																				+ subject
																				+ "</div>"
																	});

															// 지도의 중심을 결과값으로 받은 위치로 이동
															// map.setCenter(coords);

															kakao.maps.event
																	.addListener(
																			marker,
																			'mouseover',
																			makeOverListener(
																					map,
																					marker,
																					infowindow));
															kakao.maps.event
																	.addListener(
																			marker,
																			'mouseout',
																			makeOutListener(infowindow));
														}
													});

								}

								// 인포윈도우를 표시하는 클로저를 만드는 함수
								function makeOverListener(map, marker,
										infowindow) {
									return function() {
										infowindow.open(map, marker);
									};
								}

								// 인포윈도우를 닫는 클로저를 만드는 함수
								function makeOutListener(infowindow) {
									return function() {
										infowindow.close();
									};
								}

							});
		}
	}
</script>
<script>
	// 위도 경도 설정
	function myListener(obj) {
		alert(obj.value); // 선택된 option의 value가 출력된다!

		if (obj.value == 3) {
			latitude = 35.126033;
			alert(latitude)
			longitude = 126.831302;
			alert(longitude)

			map(latitude, longitude);
		}

	}
</script>

<div class="mainBox">
	<h3 class="mainText">MOUMI 분석 서비스</h3>
	<form class="d-flex searchBox" role="search">
		<div class="customInput">
			<input class="form-control mx-5 inputSearch" type="search"
				placeholder="궁금한 분석 단어를 입력하세요." aria-label="Search">
			<button class="btn btnSearch " type="submit">
				<i class="fa-solid fa-magnifying-glass"></i>
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



<div class="container body-container">
	<div class="inner-page">
		<br> <br> <br>
		<p class="title">분석 리포트</p>
		<a href="${pageContext.request.contextPath}/reportList" class="more">더보기</a>
		<br> <br>
		<div class="container text-center">
			<div class="row">
				<c:forEach var="dto" items="${listMainReport}" varStatus="status">
					<div class="col-md-4 col-lg-3 mt-4"
						style="width: 350px; margin: 25px;">
						<div class="card" style="width: 18rem;"
							data-reportNum="${dto.reportNum}"
							onclick="location.href='${pageContext.request.contextPath}/article?&reportNum=${dto.reportNum}'">
							<img style="height: 280px; width: 285px;"
								src="${pageContext.request.contextPath}/uploads/report/${dto.thumbnail}"
								style="width: -webkit-fill-available;">
							<div class="p-2">
								<div class="card-body">${dto.subject}</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<br> <br> <br> <br>

		<div class="imageLayout">
			<div class="banConWrap">
				<ul>
					<li class="imageContent" style="background: #faaaaa"><a
						href="${pageContext.request.contextPath}/admin/event/list"> <span
							class="recFont"> <strong class="recTitle">어서와!</strong><br>
								MOUMI는 처음이지?<br> <em class="recEmTitle">초보 MOUMI 유저를
									위한 이용방법</em>
						</span> <img style="height: 130px; width: 160px; float: right"
							src="${pageContext.request.contextPath}/resources/images/moumi/manual.png" />

					</a></li>

					<li class="imageContent" style="background: #7bc7e3"><a
						href="${pageContext.request.contextPath}/schedule/main"> <span
							class="recFont"> <strong class="recTitle">일정 관리!</strong><br>
								MOUMI는 처음이지?<br> <em class="recEmTitle">초보 MOUMI 유저를
									위한 이용방법</em>
						</span> <img style="height: 130px; width: 150px; float: right"
							src="${pageContext.request.contextPath}/resources/images/moumi/schedual.png" />
					</a></li>

				</ul>

			</div>
		</div>

		<div class="emptyLayout"></div>
		<div class="container text-center">
			<div class="container">


				<div class="row">
					<div class="col">
						<div id="map" class="map"></div>
					</div>

					<div class="col">
						<div class="search-container">
							<p class="regionText">
								우리 지역 <br>&nbsp;&nbsp;&nbsp; 살리기<br> <span
									class="regionTextDetail">지역 별 우수 프랜차이즈를 확인해보세요!</span>
							</p>
							<div class="col-auto p-1">
								<c:if test="${!empty listRegion}">
									<div class="selectBox">
										<select name="regionCode" id="regionCode" class="customSelect"
											onchange="javascript:myListener(this);">
											<c:forEach var="region" items="${listRegion}" varStatus="i">
												<option value="${region.regionCode}">${region.regionName}</option>
											</c:forEach>
										</select>
									</div>
								</c:if>

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>
</div>


<div class="eventLayout"
	onclick="location.href='${pageContext.request.contextPath}/event/list'">
	<div class="container">
		<div class="row">
			<div class="col">
				<img style="height: 250px; width: 300px; float: right"
					src="${pageContext.request.contextPath}/resources/images/moumi/pick.png" />
			</div>
			<div class="col">
				<p class="eventText">
					이벤트 참여하고,<br> <span style="font-size: 30px; font-weight: 600;">
						할인쿠폰 받자!</span> <br> <span style="font-size: 15px;"> 랜덤 쿠폰
						응모하고 MOUMI 서비스 이용하기</span>
				</p>
			</div>
		</div>
	</div>

</div>
<div class="container body-container">
	<div class="farmLayout">
		<div class="inner-page">
			<div class="row">

				<div class="col">
					<p class="farmText">
						우리 농가 <br>살리기<br> <span
							class="regionTextDetail">농촌진흥청에서 선별한 우리 지역의 농가 브랜드를 확인해보세요</span>
					</p>
				</div>

				<div class="col">
					<button class="farmButton" type="button"
						onclick="location.href='${pageContext.request.contextPath}/farm'">확인하기</button>
				</div>

			</div>

		</div>
	</div>
</div>