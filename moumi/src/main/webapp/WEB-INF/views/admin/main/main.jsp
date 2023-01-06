<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/charts";
	
	$.getJSON(url, function(data){
		// console.log(data);
		chartsDay(data);
		//chartsDayOfWeek(data);
			
	});
	
	function chartsDay(data) {
		let chartData = [];
		let dateData = [];
		
		for(let item of data.Wdays){
			let s = parseInt(item.PAYDATE.substring(5, 7))+'월 ';
			s += parseInt(item.PAYDATE.substring(8))+'일';
			dateData.push(s);

			let obj = parseInt(item.PAYMENTPRICE);
			chartData.push(obj);
			console.log(chartData);
		}
		
		const chartDom = document.querySelector(".charts-day");
		let myChart = echarts.init(chartDom);
		let option;
		
		option = {
				  tooltip: {
				    trigger: 'axis'
				  },
				  legend: {
				    data: ['여자', '남자']
				  },
				  grid: {
				    left: '3%',
				    right: '4%',
				    bottom: '3%',
				    containLabel: true
				  },
				  toolbox: {
				    feature: {
				      saveAsImage: {}
				    }
				  },
				  xAxis: {
				    type: 'category',
				    boundaryGap: false,
				    data: dateData
				  },
				  yAxis: {
				    type: 'value'
				  },
				  series: [
				    {
				      name: '여자',
				      type: 'line',
				      stack: 'Total',
				      data: chartData
				    },
				    {
				      name: '남자',
				      type: 'line',
				      stack: 'Total',
				      data: chartData
				    }
				  ]
				};
	
				option && myChart.setOption(option);
	}
	
	function chartsDayOfWeek(data) {
		let chartData = [];
		
		let m = new Date().getMonth()+1;
		let m2 = data.dayOfWeek.month.substring(4);

		let title = m !== 1 && m > m2 ? "전월 요일별 매출건수" : "이번달 요일별 매출건수"
		
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
		  tooltip: {
		    trigger: 'item'
		  },
		  xAxis: {
		    type: 'category',
		    data: ['일', '월', '화', '수', '목', '금', '토']
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: [
		    {
		      data: chartData,
		      type: 'bar'
		    }
		  ]
		};
		
		option && myChart.setOption(option);
	}
	
});

</script>

<style type="text/css">
.nav-link.active{
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
	border-radius: 20px;
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

.container{
	min-height: 1000px;
}

#container2{
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	height: 50px;
	width: 100%;
	margin: 100px auto 20px;
}
#container3{
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	height: 950px;
	width: 40%;
	float: left;
}

#container4{
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	width: 58%;
	float: left;
	margin-left: 20px;
}

#container5{
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	width: 58%;
	float: left;
	margin-left: 20px;
	margin-top: 20px;
	min-height: 510px;
}

.body-container{
	padding: 0;
}
#inner{
	margin: 140px;
	height: 24px;
}

.btn:active, .btn:focus, .btn:hover {
	color: #ECF4EB;
}

#accordion {
	background: #fff;
}

.backColor{
	background: #fff;
}

.text-line{
	text-decoration : none;
	color : green;
}

.dtab{
	margin: 50px 0;
}

.x1{
	padding: 20px;
}

.line{
	padding: 10px 60px;
}
</style>
<div class="body-container">
    <div class="body-main">
    <div class="container">
    	<div id="container2">
    		<div id="inner">
	    		<div style="float: left;" class="line">현재 접속자수 : ${currentCount}</div>
				<div style="float: left;" class="line">오늘 접속자수 : ${toDayCount}</div>
				<div style="float: left;" class="line">어제 접속자수 : ${yesterDayCount}</div>
				<div style="float: left;" class="line">전체 접속자수 : ${totalCount}</div>
			</div>
    	</div>
    	<div id="container3">
			<div class="dtab col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 오늘 매출 현황</div>
				
				<ul class="nav nav-tabs" id="myTab" role="tablist" onchange="searchChart();">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="1" aria-selected="true">모두</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="2" aria-selected="true" value="여자">여성</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#nav-3" type="button" role="tab" aria-controls="3" aria-selected="true">남성</button>
					</li>
				</ul>
		
				<div class="tab-content pt-2" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1">
						<div class="border rounded p-5 text-center">
							<div class="fs-5 mb-2">총 매출 건수 : 
								<span class="product-totalAmount fw-semibold text-primary">${today.COUNT}</span><!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
							</div>
							<div class="fs-5">총 매출 금액 : 
								<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${today.TOTAL}"/></span>원
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2">
						<div class="border rounded p-5 text-center">
							<div class="fs-5 mb-2">총 매출 건수 : 
								<span class="product-totalAmount fw-semibold text-primary">${todayW.COUNT}</span><!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
							</div>
							<div class="fs-5">총 매출 금액 : 
								<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${todayW.TOTAL}"/></span>원
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-3">
						<div class="border rounded p-5 text-center">
							<div class="fs-5 mb-2">총 매출 건수 : 
								<span class="product-totalAmount fw-semibold text-primary">${todayM.COUNT}</span><!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
							</div>
							<div class="fs-5">총 매출 금액 : 
								<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${todayM.TOTAL}"/></span>원
							</div>
						</div>
					</div>
				</div>	
			</div>
			
			<div class="dtab p-2" >
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 이번달 매출 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 매출 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${thisMonth.COUNT}</span>
					</div>
					<div class="fs-5">총 매출 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${thisMonth.TOTAL}"/></span>원
					</div>
				</div>
			</div>
			
			<div class="dtab p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 이전달 매출 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 매출 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${previousMonth.COUNT}</span>
					</div>
					<div class="fs-5">총 매출 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${previousMonth.TOTAL}"/></span>원
					</div>
				</div>
			</div>
		</div>
		
		<div id="container4">
			<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <div class="x1">
					<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
					<div class="charts-day border rounded" style="height: 350px;"></div>
				</div>
			    </div>
			    <div class="carousel-item">
			     <div class="x1">
					<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
					<div class="charts-day border rounded" style="height: 350px;"></div>
				</div>
			    </div>
			    <div class="carousel-item">
			      <div class="x1">
					<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
					<div class="charts-day border rounded" style="height: 350px;"></div>
				</div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		
		<div id="container5">
			<div class="dtab p-2 fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 채팅</div>
		</div>
		</div>
	</div>
</div>