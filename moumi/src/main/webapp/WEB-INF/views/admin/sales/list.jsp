<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function() {
	let url = "${pageContext.request.contextPath}/admin/sales/charts";
	
	$.getJSON(url, function(data){
		console.log(data);
		chartsDay(data);
		chartsDay1(data);
		chartsDay2(data);
		//chartsDayOfWeek(data);
			
	});
	
	function chartsDay1(data) {
		var chartDom = document.querySelector("#charts-day1");
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
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
		    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: [
		    {
		      name: 'Email',
		      type: 'line',
		      stack: 'Total',
		      data: [120, 132, 101, 134, 90, 230, 210]
		    },
		    {
		      name: 'Union Ads',
		      type: 'line',
		      stack: 'Total',
		      data: [220, 182, 191, 234, 290, 330, 310]
		    },
		    {
		      name: 'Video Ads',
		      type: 'line',
		      stack: 'Total',
		      data: [150, 232, 201, 154, 190, 330, 410]
		    },
		    {
		      name: 'Direct',
		      type: 'line',
		      stack: 'Total',
		      data: [320, 332, 301, 334, 390, 330, 320]
		    },
		    {
		      name: 'Search Engine',
		      type: 'line',
		      stack: 'Total',
		      data: [820, 932, 901, 934, 1290, 1330, 1320]
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
	function chartsDay(data) {
		let chartData = [];
		let chartData2 = [];
		let dateData = [];
		
		for(let item of data.Wdays){
			let s = parseInt(item.PAYDATE.substring(5, 7))+'월 ';
			s += parseInt(item.PAYDATE.substring(8))+'일';
			dateData.push(s);

			let obj = parseInt(item.PAYMENTPRICE);
			chartData.push(obj);
		}
		
		for(let item of data.Mdays){
			let obj = item.PAYMENTPRICE;
			chartData2.push(obj);
		}
		
		const chartDom = document.querySelector("#charts-day");
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
		      data: chartData2
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
	function chartsDay2(data) {
		var chartDom = document.querySelector("#charts-day2");
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
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
		    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: [
		    {
		      name: 'Email',
		      type: 'line',
		      stack: 'Total',
		      data: [120, 132, 101, 134, 90, 230, 210]
		    },
		    {
		      name: 'Union Ads',
		      type: 'line',
		      stack: 'Total',
		      data: [220, 182, 191, 234, 290, 330, 310]
		    },
		    {
		      name: 'Video Ads',
		      type: 'line',
		      stack: 'Total',
		      data: [150, 232, 201, 154, 190, 330, 410]
		    },
		    {
		      name: 'Direct',
		      type: 'line',
		      stack: 'Total',
		      data: [320, 332, 301, 334, 390, 330, 320]
		    },
		    {
		      name: 'Search Engine',
		      type: 'line',
		      stack: 'Total',
		      data: [820, 932, 901, 934, 1290, 1330, 1320]
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
});


</script>

<style type="text/css">
.container {
	min-height: 800px;
}
main {
	position: relative;
	top: -55px;
	background: white;
}

.btn{
	background-color: #ECF4EB;
	color: #198754;
}
.form-select.change {
	-webkit-appearance:none;
	moz-appearance:none;
	appearance:none;
	background:#fff;
	text-align-last: center;
}
select::-ms-expand {opacity:0;}

.body-container {
	max-width: 1200px;
	margin: auto;
	padding-top: 90px;
	padding-left: inherit;
	padding-right: inherit;
	
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

.container {
	box-shadow: 4px 4px 4px rgb(72, 92, 161, 0.2);
	border: none;
	border-radius: 30px;
	background-color: white;
	margin: 100px auto;
}

.btn:active, .btn:focus, .btn:hover {
	color: #eee;
}

#tablec{
	background-color: #ECF4EB;
}

#tabled{
	background-color: #ECF4EB;
}

#tablee{
	background-color: #ECF4EB;
}
td{
	vertical-align: middle;
}
</style>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 매출 관리
			</h2>
		</div>

		

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="1" aria-selected="true">모두</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="2" aria-selected="true">성별</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#nav-3" type="button" role="tab" aria-controls="3" aria-selected="true">연령별</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day border rounded" style="height: 500px;" id="charts-day"></div>
			</div>
			<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day1 border rounded" style="height: 500px;" id="charts-day1"></div>
			</div>
			<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day2 border rounded" style="height: 500px;" id="charts-day2"></div>
			</div>
		</div>

	
	</div>
</div>