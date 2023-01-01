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
			
		chartsDayOfWeek(data);
			
	});
	
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
<div class="body-container">
    <div class="body-main">
    	<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
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
					<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2">
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
			
			<div class="col p-2">
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
			
			<div class="col p-2">
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
		
		<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day border rounded" style="height: 500px;"></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2 "><i class="bi bi-chevron-right"></i> <label class="charts-dayOfWeek-title">전월 요일별 매출건수</label></div>
				<div class="charts-dayOfWeek border rounded" style="height: 500px;"></div>
			</div>
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 6개월 매출 현황</div>
				<div class="charts-month border rounded" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</div>