<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
	$(function() {
		let url = "${pageContext.request.contextPath}/admin/charts";

		$.getJSON(url, function(data) {
			chartsDayOfWeek(data);

		});

		function chartsDayOfWeek(data) {
			let chartData = [];

			let m = new Date().getMonth() + 1;
			let m2 = data.dayOfWeek.month.substring(4);

			let title = m !== 1 && m > m2 ? "이번달 요일별 신규구독자 수"
					: "전월 요일별 신규구독자 수"

			console.log(title);

			document.querySelector(".charts-dayOfWeek-title").innerHTML = title;

			chartData.push(data.dayOfWeek.SUN);
			chartData.push(data.dayOfWeek.MON);
			chartData.push(data.dayOfWeek.TUE);
			chartData.push(data.dayOfWeek.WED);
			chartData.push(data.dayOfWeek.THU);
			chartData.push(data.dayOfWeek.FRI);
			chartData.push(data.dayOfWeek.SAT);

			const chartDom = document.querySelector(".charts-dayOfWeek");
			let myChart = echarts.init(chartDom);
			let option;

			option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : {
						type : 'shadow'
					}
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					data : [ '일', '월', '화', '수', '목', '금', '토' ],
					axisTick : {
						alignWithLabel : true
					}
				} ],
				yAxis : [ {
					type : 'value'
				} ],
				series : [ {
					name : '신규구독자 수',
					type : 'bar',
					barWidth : '60%',
					data : chartData
				} ]
			};

			option && myChart.setOption(option);
		}

	});
</script>

<style type="text/css">
.nav-link.active {
	background-color: #198754;
	color: white;
}
</style>

<style type="text/css">
main {
	position: relative;
	top: -55px;
	background: white;
}

.container {
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	margin: 100px auto;
	padding: 5px;
	height: 1100px;
}

tr {
	font-size: 15px;
}

tr:hover {
	background: #fff;
	box-shadow: 0px 0px 4px rgb(72, 92, 161, 0.4);
}

.sort {
	font-size: 10px;
	border: 1px solid #e2e2e2;
	width: 50px;
	height: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sort-td {
	width: 80px;
}

.date-th {
	width: 100px;
}

.date-div {
	text-align: center;
}

#container2 {
	 border : none;
	height: 50px;
	width: 100%;
	border: none; height : 50px; width : 100%;
	margin: 20px auto;
}

#container3 {
	border: none;
	height: 950px;
	width: 40%;
	float: left;
}

#container4 {
	border: none;
	width: 58%;
	float: left;
	margin-left: 20px;
}

#container5 {
	border: none;
	width: 58%;
	float: left;
	margin-left: 20px;
	margin-top: 20px;
	min-height: 510px;
}

.body-container {
	padding: 0;
}

#inner {
	margin: 40px;
	height: 45px;
	border: 1px solid #198754;
	border-radius: 30px;
	text-align: center;
	
	
}

.btn:active, .btn:focus, .btn:hover {
	color: #ECF4EB;
}

#accordion {
	background: #fff;
}

.backColor {
	background: #fff;
}

.text-line {
	text-decoration: none;
	color: green;
}

.dtab {
	margin: 50px 0;
}

.x1 {
	padding: 20px;
}

.line {
	padding: 10px 45px;
}

.nav-link {
	color: black;
}

#tab-1.active {
	color: green;
}

#tab-2.active {
	color: green;
}

#tab-3.active {
	color: green;
}

a {
	text-decoration: none;
	color: green;
}

.layoutBorder {
	border: 1px solid #f1f3f4;
}
</style>
<div class="container">
	<div id="container2">
		<div id="inner">
			<div style="float: left;" class="line fs-5">현재 접속자수 :
				${currentCount}</div>
			<div style="float: left;" class="line fs-5">오늘 접속자수 :
				${toDayCount}</div>
			<div style="float: left;" class="line fs-5">어제 접속자수 :
				${yesterDayCount}</div>
			<div style="float: left;" class="line fs-5">전체 접속자수 :

				${totalCount}</div>
		</div>
	</div>
	<div id="container3" >
		<div class="dtab col p-2 layoutBorder">
			<div class="fs-6 fw-semibold mb-2">
				<i class="bi bi-chevron-right"></i> 오늘 매출 현황
			</div>

			<ul class="nav nav-tabs" id="myTab" role="tablist"
				onchange="searchChart();">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
						data-bs-target="#nav-1" type="button" role="tab" aria-controls="1"
						aria-selected="true">모두</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-2" data-bs-toggle="tab"
						data-bs-target="#nav-2" type="button" role="tab" aria-controls="2"
						aria-selected="true" value="여자">여성</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-3" data-bs-toggle="tab"
						data-bs-target="#nav-3" type="button" role="tab" aria-controls="3"
						aria-selected="true">남성</button>
				</li>
			</ul>

			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-1" role="tabpanel"
					aria-labelledby="nav-tab-1">
					<div class="border rounded p-5 text-center">
						<div class="fs-5 mb-2">
							총 매출 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${today.COUNT}</span>
							<!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
						</div>
						<div class="fs-5">
							총 매출 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${today.TOTAL}" /></span>원
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-2" role="tabpanel"
					aria-labelledby="nav-tab-2">
					<div class="border rounded p-5 text-center">
						<div class="fs-5 mb-2">
							총 매출 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${todayW.COUNT}</span>
							<!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
						</div>
						<div class="fs-5">
							총 매출 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${todayW.TOTAL}" /></span>원
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="nav-3" role="tabpanel"
					aria-labelledby="nav-tab-3">
					<div class="border rounded p-5 text-center">
						<div class="fs-5 mb-2">
							총 매출 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${todayM.COUNT}</span>
							<!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
						</div>
						<div class="fs-5">
							총 매출 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${todayM.TOTAL}" /></span>원
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="dtab p-2 layoutBorder">
			<div class="fs-6 fw-semibold mb-2">
				<i class="bi bi-chevron-right"></i> 이번달 매출 현황
			</div>
			<div class="border rounded p-5 text-center">
				<div class="fs-5 mb-2">
					총 매출 건수 : <span
						class="product-totalAmount fw-semibold text-primary">${thisMonth.COUNT}</span>
				</div>
				<div class="fs-5">
					총 매출 금액 : <span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
							value="${thisMonth.TOTAL}" /></span>원
				</div>
			</div>
		</div>

		<div class="dtab p-2 layoutBorder">
			<div class="fs-6 fw-semibold mb-2 ">
				<i class="bi bi-chevron-right"></i> 이전달 매출 현황
			</div>
			<div class="border rounded p-5 text-center">
				<div class="fs-5 mb-2">
					총 매출 건수 : <span
						class="product-totalAmount fw-semibold text-primary">${previousMonth.COUNT}</span>
				</div>
				<div class="fs-5">
					총 매출 금액 : <span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
							value="${previousMonth.TOTAL}" /></span>원
				</div>
			</div>
		</div>
	</div>

	<div id="container4">
		<div class="x1 layoutBorder">
			<div class="fs-6 fw-semibold mb-2 ">
				<i class="bi bi-chevron-right"></i> <label
					class="charts-dayOfWeek-title">전월 요일별 판매건수</label>
			</div>
			<div class="charts-dayOfWeek border rounded" style="height: 350px;"></div>
		</div>
	</div>

	<div id="container5">
		<div class="dtab p-2 fs-6 fw-semibold mb-2 ">
			<i class="bi bi-chevron-right"></i> 신고댓글
		</div>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="border rounded" style="padding: 10px;">
						<div style="font-size: 15px;">${dataCount - (page-1) * size - status.index}.
							${dto.writeName}/${dto.regDate}</div>
						<div style="margin: 10px; font-size: 20px;">${dto.content}</div>
					</div>
				</c:forEach>
				<div class="text-center" style="margin: 25px; font-size: 20px;">
				
				<button class="btn btn-outline-success" type="button"
						onclick="location.href='${pageContext.request.contextPath}/admin/comment/main'">신고 댓글 관리</button>
						
				</div>
			</c:when>
			<c:otherwise>
				<div>&nbsp;신고된 댓글이 없습니다.</div>
			</c:otherwise>
		</c:choose>

	</div>
</div>

