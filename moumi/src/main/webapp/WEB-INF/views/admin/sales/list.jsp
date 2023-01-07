<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<script type="text/javascript">
$(function() {
	let url = "${pageContext.request.contextPath}/admin/sales/charts";
	
	$(".tab-pane").addClass("active");
	
	$.getJSON(url, function(data){
		// console.log(data);
		chartsDay(data);
		chartsDay1(data);
		chartsDay2(data);
		
		chartsMonth(data);
		chartsMonth1(data);
		chartsMonth2(data);
		
		chartspie(data);
		chartspie1(data);
		chartspie2(data);
		
		$("#nav-1").removeClass("active");
		$("#nav-2").removeClass("active");
		//$("#nav-3").removeClass("active");
		
		var firstTabEl = document.querySelector('#myTab li:first-child button')
		var firstTab = new bootstrap.Tab(firstTabEl)
	    firstTab.show()
	});
	
	// 1주일간 매출
	function chartsDay(data) {
		let chartData = [];
		let dateData = [];
		
		for(let item of data.days){
			let s = parseInt(item.PAYDATE.substring(5, 7))+'월 ';
			s += parseInt(item.PAYDATE.substring(8))+'일';
			dateData.push(s);
			
			let obj = item.PAYMENTPRICE;
			chartData.push(obj);
			
		}
		const chartDom = document.querySelector("#charts-day");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
		  tooltip: {
		    trigger: 'axis'
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
		      type: 'line',
		      stack: 'Total',
		      data: chartData
		    }
		  ]
		};

		option && myChart.setOption(option);
	};
	
	// 6개월간 매출
	function chartsMonth(data) {
		let chartData = [];
		let dateData = [];
		
		for(let item of data.months){
			let s = parseInt(item.PAYDATE.substring(4, 7))+'월';
			dateData.push(s);
			
			let obj = parseInt(item.PAYMENTPRICE);
			chartData.push(obj);
			
		}
		const chartDom = document.querySelector("#charts-month");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
		  tooltip: {
		    trigger: 'axis'
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
		      type: 'line',
		      stack: 'Total',
		      data: chartData
		    }
		  ]
		};

		option && myChart.setOption(option);
	};
	
	function chartspie(data) {
		let chartData = [];
		
		for(let item of data.pies){
			let s = parseInt(item.PAYDATE.substring(0, 4))+'년 ';
			s += parseInt(item.PAYDATE.substring(4,7))+'월';
			
			let obj = {value:item.COUNT, name:s};
			chartData.push(obj);
		}
		const chartDom = document.querySelector(".charts-pie");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
				  tooltip: {
				    trigger: 'item'
				  },
				  legend: {
				    top: '5%',
				    left: 'center'
				  },
				  series: [
				    {
				      name: '월별 구독건수',
				      type: 'pie',
				      radius: ['40%', '70%'],
				      avoidLabelOverlap: false,
				      itemStyle: {
				        borderRadius: 10,
				        borderColor: '#fff',
				        borderWidth: 2
				      },
				      label: {
				        show: false,
				        position: 'center'
				      },
				      emphasis: {
				        label: {
				          show: true,
				          fontSize: 40,
				          fontWeight: 'bold'
				        }
				      },
				      labelLine: {
				        show: false
				      },
				      data: chartData
				    }
				  ]
				};

				option && myChart.setOption(option);
	};
	
	// 1주일간 매출(성별)
	function chartsDay1(data) {
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
		
		const chartDom = document.querySelector("#charts-day1");
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
	};
	
	// 6개월간 매출
	function chartsMonth1(data) {
		let chartData = [];
		let chartData2 = [];
		let dateData = [];
		
		for(let item of data.Wmonths){
			let s = parseInt(item.PAYDATE.substring(4, 7))+'월';
			dateData.push(s);
			
			let obj = parseInt(item.PAYMENTPRICE);
			chartData.push(obj);
			
		}
		
		for(let item of data.Mmonths){
			let obj = parseInt(item.PAYMENTPRICE);
			chartData2.push(obj);
		}
		
		const chartDom = document.querySelector(".charts-month1");
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
	};
	
	function chartspie1(data) {
		let obj;
		let name;
		
		for(let item of data.Wpies){
			name =  parseInt(item.STARTMONTH.substring(2, 4))+'년 ';
			name += parseInt(item.STARTMONTH.substring(4,7))+'월';
			name += - parseInt(item.ENDMONTH.substring(2, 4))+'년 ';
			name += parseInt(item.ENDMONTH.substring(5,7))+'월';
			obj = parseInt(item.WOMAN);
		}
		let obj2;
		for(let item of data.Mpies){
			obj2 = item.MAN;
		}
		
		const chartDom = document.querySelector(".charts-pie1");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
				  tooltip: {
				    trigger: 'item'
				  },
				  legend: {
				    top: '5%',
				    left: 'center'
				  },
				  series: [
				    {
				      name: name +'간 구독 건수',
				      type: 'pie',
				      radius: ['40%', '70%'],
				      avoidLabelOverlap: false,
				      itemStyle: {
				        borderRadius: 10,
				        borderColor: '#fff',
				        borderWidth: 2
				      },
				      label: {
				        show: false,
				        position: 'center'
				      },
				      emphasis: {
				        label: {
				          show: true,
				          fontSize: 40,
				          fontWeight: 'bold'
				        }
				      },
				      labelLine: {
				        show: false
				      },
				      data: [
				    	  { value: obj, name: '여자' }, 
				    	  { value: obj2, name: '남자' }
				      ]
				    }
				  ]
				};

				option && myChart.setOption(option);
	};
	
	// 1주일 간 매출(연령별)
	function chartsDay2(data) {
		let chartData = [];
		let chartData1 = [];
		let chartData2 = [];
		let chartData3 = [];
		
		let dateData = [];
		for(let item of data.Tdays){
			let s = parseInt(item.PAYDATE.substring(5, 7))+'월 ';
			s += parseInt(item.PAYDATE.substring(8))+'일';
			dateData.push(s);
			
			let obj = item.PAYMENTPRICE;
			chartData.push(obj);
		}
		for(let item of data.Edays){
			let obj = item.PAYMENTPRICE;
			chartData1.push(obj);
		}
		for(let item of data.Sdays){
			let obj = item.PAYMENTPRICE;
			chartData2.push(obj);
		}
		for(let item of data.Fdays){
			let obj = item.PAYMENTPRICE;
			chartData3.push(obj);
		}
		const chartDom = document.querySelector("#charts-day2");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: ['20대 미만', '20대', '30대', '40대 이상']
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
		      name: '20대 미만',
		      type: 'line',
		      stack: 'Total',
		      data: chartData
		    },
		    {
		      name: '20대',
		      type: 'line',
		      stack: 'Total',
		      data: chartData1
		    },
		    {
		      name: '30대',
		      type: 'line',
		      stack: 'Total',
		      data: chartData2
		    },
		    {
		      name: '40대 이상',
		      type: 'line',
		      stack: 'Total',
		      data: chartData3
		    }
		  ]
		};

		option && myChart.setOption(option);
	}
	
	// 6개월간 매출
	function chartsMonth2(data) {
		let chartData = [];
		let chartData1 = [];
		let chartData2 = [];
		let chartData3 = [];
		let dateData = [];
		
		for(let item of data.Tmonths){
			let s = parseInt(item.PAYDATE.substring(4, 7))+'월';
			dateData.push(s);
			
			let obj = parseInt(item.PAYMENTPRICE);
			chartData.push(obj);
			
		}
		
		for(let item of data.Emonths){
			let obj = parseInt(item.PAYMENTPRICE);
			chartData1.push(obj);
		}
		
		for(let item of data.Smonths){
			let obj = parseInt(item.PAYMENTPRICE);
			chartData2.push(obj);
		}
		
		for(let item of data.Fmonths){
			let obj = parseInt(item.PAYMENTPRICE);
			chartData3.push(obj);
		}
		
		const chartDom = document.querySelector(".charts-month2");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
				  tooltip: {
				    trigger: 'axis'
				  },
				  legend: {
				    data: ['20대 미만', '20대', '30대', '40대 이상']
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
					      name: '20대 미만',
					      type: 'line',
					      stack: 'Total',
					      data: chartData
					    },
					    {
					      name: '20대',
					      type: 'line',
					      stack: 'Total',
					      data: chartData1
					    },
					    {
					      name: '30대',
					      type: 'line',
					      stack: 'Total',
					      data: chartData2
					    },
					    {
					      name: '40대 이상',
					      type: 'line',
					      stack: 'Total',
					      data: chartData3
					    }
				  ]
				};

		option && myChart.setOption(option);
	};
	
	function chartspie2(data) {
		let obj;
		let name;
		
		for(let item of data.Tpies){
			name =  parseInt(item.STARTMONTH.substring(2, 4))+'년 ';
			name += parseInt(item.STARTMONTH.substring(4,7))+'월';
			name += - parseInt(item.ENDMONTH.substring(2, 4))+'년 ';
			name += parseInt(item.ENDMONTH.substring(5,7))+'월';
			obj = parseInt(item.TEEN);
		}
		
		let obj1;
		for(let item of data.Epies){
			obj1 = item.TEEN;
		}
		
		let obj2;
		for(let item of data.Spies){
			obj2 = item.TEEN;
		}
		
		let obj3;
		for(let item of data.Fpies){
			obj3 = item.TEEN;
		}
		
		const chartDom = document.querySelector(".charts-pie2");
		let myChart = echarts.init(chartDom);
		let option;

		option = {
				  tooltip: {
				    trigger: 'item'
				  },
				  legend: {
				    top: '5%',
				    left: 'center'
				  },
				  series: [
				    {
				      name: name +'간 구독 건수',
				      type: 'pie',
				      radius: ['40%', '70%'],
				      avoidLabelOverlap: false,
				      itemStyle: {
				        borderRadius: 10,
				        borderColor: '#fff',
				        borderWidth: 2
				      },
				      label: {
				        show: false,
				        position: 'center'
				      },
				      emphasis: {
				        label: {
				          show: true,
				          fontSize: 40,
				          fontWeight: 'bold'
				        }
				      },
				      labelLine: {
				        show: false
				      },
				      data: [
				    	  { value: obj, name: '20대 미만' }, 
				    	  { value: obj1, name: '20대' },
				    	  { value: obj2, name: '30대' },
				    	  { value: obj3, name: '40대 이상' }
				      ]
				    }
				  ]
				};

				option && myChart.setOption(option);
	};
	
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
				<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="1" aria-selected="true">모두</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="2" aria-selected="true">성별</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-3" data-bs-toggle="tab" data-bs-target="#nav-3" type="button" role="tab" aria-controls="3" aria-selected="true">연령별</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day border rounded" style="height: 400px; " id="charts-day"></div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 6개월간 매출 현황</div>
				<div class="charts border rounded" style="width: 100%">
					<div class="charts-month" style="height: 400px; float: left; width: 70%" id="charts-month"></div>
					<div class="charts-pie" style="height: 400px; float: left; width: 30%" id="charts-pie"></div>
				</div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
			</div>
			<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day1 border rounded" style="height: 400px;" id="charts-day1"></div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 6개월간 매출 현황</div>
				<div class="charts border rounded" style="width: 100%">
					<div class="charts-month1" style="height: 400px; float: left; width: 70%"></div>
					<div class="charts-pie1" style="height: 400px; float: left; width: 30%"></div>
				</div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
			</div>
			<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 매출 현황</div>
				<div class="charts-day2 border rounded" style="height: 400px;" id="charts-day2"></div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 6개월간 매출 현황</div>
				<div class="charts border rounded" style="width: 100%">
					<div class="charts-month2" style="height: 400px; float: left; width: 70%"></div>
					<div class="charts-pie2" style="height: 400px; float: left; width: 30%"></div>
				</div>
				<div class="fs-6 fw-semibold mb-2"> &nbsp;</div>
			</div>
		</div>

	
	</div>
</div>