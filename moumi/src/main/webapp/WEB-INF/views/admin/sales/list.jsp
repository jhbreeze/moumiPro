<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<style type="text/css">
.container {
	min-height: 800px;
}

main {
	position: relative;
	top: -55px;
	background: white;
}

.body-container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
	
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

</style>
<script type="text/javascript">
$(function(){
	
	function chartsDay(data) {

		var chartDom = document.querySelector(".charts-day");
		var myChart = echarts.init(chartDom);
		var option;
		

		option = {
		  title: {
		    text: 'Stacked Line'
		  },
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

$(function() {

    $("#sel").change(function() {

        var v = $("#sel").val();
        let url ="";
        if (v == 1){
        	url = "${pageContext.request.contextPath}/admin/sales/list";
        } else if (v == 2){
        	url = "${pageContext.request.contextPath}/admin/sales/list2";
        } else if (v == 3){
        	url = "${pageContext.request.contextPath}/admin/sales/list3";
        }
    	
        location.href = url;
        

    });

});

</script>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 매출 관리
			</h2>
		</div>
		<div class="row">
			<select class="col-6 form-select" aria-label="Default select example" id="sel" style="width: 200px;">
			  <option value="1" selected>One</option>
			  <option value="2">Two</option>
			  <option value="3">Three</option>
			</select>
		</div>

		<div class="body-main">
			<form name="listForm" method="post">
				<div class="row board-list-header"></div>
				

			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 최근 1주일 판매 현황</div>
				<div id="charts-day" class="charts-day border rounded" style="height: 500px;"></div>
			</div>
			</form>
		</div>
	</div>
</div>
