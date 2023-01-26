<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search.css"
	type="text/css">

<style>
.chooseInfoBox {
	width: 100%;
	height: 60px;
	background: white;
}

.chooseDate {
	padding: 20px;
	margin-left: 40px;
}

.chooseSNS {
	width: 600px;
	height: 60px;
	padding: 20px;
	margin: 0 auto;
	font-size: 16px;
}

.channelContent {
	width: 300px;
	height: 100px;
	margin: 0 auto;
	justify-content: center;
	font-size: 16px;
	font-weight: 700;
}

.channelImg {
	margin-left: 19px;
}

.analyzeLayoutContent {
	width: 1100px;
	height: 500px;
	border-radius: 15px;
	margin-bottom: 5px;
	padding: 50px;
	background: white;
	margin-bottom: 15px
}

.customInputDate {
	border: 1px solid #198754;
	width: 150px;
	height: 30px;
	border-radius: 30px;
	padding: 12px;
}


.menuTitle {
	font-size: 17px;
	margin: 15px;
	font-weight: 600;
	margin: 18px;
}

.wordCloudImg {
	width: -webkit-fill-available;
	height: -webkit-fill-available;
	margin: auto;
	overflow: hidden;
}

.tags {
	color: blue;
}

.youtubeImg {
	width: 250px;
	height: 150px;
	border-radius: 24px;
	margin-bottom: 3px;
}

.yotubeWriter {
	font-weight: 500;
}

.youtubeTitle {
	width: 250px;
	height: 50px;
}

.youtubeView {
	float: right;
	color: #808080;
	margin-bottom: 5px;
}

.layoutChart {
	background-color: #fff;
	border: 1px solid #ecedee;
	border-radius: 20px;
	width: 980px;
	height: 100%;
	overflow: hidden;
	padding: 25px;
}

ul {
	list-style: none;
}

ul li {
	list-style-type: none;
	float: left;
	margin-right: 15px;
}


.layoutshop {
	background-color: #fff;
	border: 1px solid #ecedee;
	border-radius: 20px;
	height: 350px;
	width: 1100px;
	overflow: hidden;
	padding: 25px;
}

body {
	background-color: #ECF4EB;
}
</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				//login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}
</script>
<script type="text/javascript">

$(function() {
	let url = "${pageContext.request.contextPath}/recommend";
	let query = "kwd=" + encodeURIComponent('${kwd}')+"&startDate="+encodeURIComponent('${startDate}')+"&endDate="+encodeURIComponent('${endDate}');

		const fn = function(data) {
			
		};
		ajaxFun(url, "get", query, "json", fn);

	function printJSON(data) {
		let out = "";
		console.log(data);
		let brand, grade, name, img, link;
		
		for(let item of data.list){
			brand = item.brand;			
			grade = item.grade;
			name= item.name;
			img = item.img;
			url = item.url;

			out += "<ul onclick=location.href='"+url+"'>";
			out += "<li sytle='margin-right:30px; margin-top:10px;'>"
			out += "<img style ='height:200px; width:200px' src ='"+ img + "'>";
			out += "<p style ='height:70px; width:200px;'><span style ='font-weight:600'>["+ brand +"]</span>&nbsp;"+name+"</p>";
			
			let bigStar = Math.floor(grade);
			let smallStar = grade - bigStar;

			for(let i = 0; i<bigStar; i++){
				out += "<img style ='height:15px; width:15px' src ='${pageContext.request.contextPath}/resources/images/moumi/star.png'>";
			
			}
			
			if(0<smallStar){
				out += "<img style ='height:15px; width:9px' src ='${pageContext.request.contextPath}/resources/images/moumi/halfstar.png'>";

			}
		
			
			
			out += "<p style ='float:right; color:#A9A9A9'>"+ grade+ "</p>";
			out += "</li>";

		}
	
		$("#recommendList").html(out);
	}
});
 

	


</script>
<script type="text/javascript">


$(function(){
 	youtube = ${youtube};
 	instagram = ${instagram};
 	blog = ${blog};
 	twitter = ${twitter};
 	startDate = ${startDate};
 	endDate = ${endDate};
 	
 	let uid = ${loginCheck};
 	let productCategory = ${productCategory};
 	console.log(uid);
 	if(endDate===0){
 		$('.end').val( new Date().toISOString().substring(0, 10));
 	}
 	
 	if(startDate===0){
 		$('.start').val(dateAdd($('.end').val(),30));
 	}
 	
 	
 	$('.start').prop("min",dateAdd(new Date().toISOString().substring(0, 10),30));
 	$('.start').prop("max",new Date().toISOString().substring(0, 10));
 	
 	$('.end').prop("min",dateAdd(new Date().toISOString().substring(0, 10),30));
 	$('.end').prop("max",new Date().toISOString().substring(0, 10));
 	
 
	$("body").one('load',function(){
		$(".blog").prop("checked",true);
		$(".twitter").prop("checked",true);
	}); 
 	
 	
 	if(uid === 0 || ! (productCategory === 1 || productCategory === 2)){
		$(".youtube").prop("checked",false);
		$(".youtube").attr("disabled",true);
		$(".instagram").prop("checked",false);
		$(".instagram").attr("disabled",true);
	}
	
	if(youtube === 0){
		$(".youtube").prop("checked",false)
	} else {
		$(".youtube").prop("checked",true)
	}
	
	if(instagram === 0){
		$(".instagram").prop("checked",false)
	} else {
		$(".instagram").prop("checked",true)
	}
	
	if(blog === 0){
		$(".blog").prop("checked",false)
	} else {
		$(".blog").prop("checked",true)
	}
	
	if(twitter === 0){
		$(".twitter").prop("checked",false)
	} else {
		$(".twitter").prop("checked",true)
	}
	
	let y_check = $(".youtube").is(":checked");
 	if (y_check == true){
		$(".youtubeLayout").show();
	} else {
		$(".youtubeLayout").hide();
	}
	
	$(".change").click(function(){
		let frm = $(".channelForm");
		let check = $(".channel");
	
		if(check.is(':checked')==false){
			alert("하나의 채널은 선택해야 합니다.");
			return false;
		}else {
			frm.submit();
		}
	});
});

function changeDate(productCategory){
	
 	if (! (productCategory === 1 || productCategory === 2)){
		alert("이용권을 구매해주세요");
		return;
	}

 	$('.end').val( new Date().toISOString().substring(0, 10));

 	$('.start').val(dateAdd($('.end').val(),90));
 	
	$('.start').prop("min",dateAdd(new Date().toISOString().substring(0, 10),90));
 	$('.start').prop("max",new Date().toISOString().substring(0, 10));
 	
 	$('.end').prop("min",dateAdd(new Date().toISOString().substring(0, 10),90));
 	$('.end').prop("max",new Date().toISOString().substring(0, 10));
}

//날짜 더하기
function dateAdd(date, addDays) {

    var datetmp = date.replace(/-/g,'');
    
    var y = parseInt(datetmp.substr(0, 4));
    var m = parseInt(datetmp.substr(4, 2));
    var d = parseInt(datetmp.substr(6,2));
 
    d = new Date(y, m - 1, d - addDays);
 
    y = d.getFullYear();
    m = d.getMonth() + 1; m = (m < 10) ? '0' + m : m;
    d = d.getDate(); d = (d < 10) ? '0' + d : d;
 
    return '' + y + '-' +  m  + '-' + d;		
}

function getCheckedCnt()  {
	
	  let instagram = ${instagram};
	  let blog = ${blog};
	  let twitter = ${twitter};
	  

	  let out = "";
	  if (instagram == 2 || blog ==3 || twitter == 4){
	  		out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud.png'>"
	  }
	  if ((instagram == 2 && blog ==3) ||(instagram == 2 && twitter ==4)||(twitter ==4  && blog ==3) ){
		  	out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud2.png'>"
		  }
	  if (instagram == 2 && blog ==3 && twitter == 4){
		  	out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud3.png'>"
		  }
	  // 출력
		document.querySelector('.wordCloudLayout').innerHTML = out;
	  console.log(out);
 	}
	

$(function(){
	let i_check = $(".instagram").is(":checked");
	let b_check = $(".blog").is(":checked");
	let t_check = $(".twitter").is(":checked");
	let word = $("input[name=kwd]").val();

	let url = "${pageContext.request.contextPath}/flask/wordcloud"
	let query = "instagram="+i_check+"&blog="+b_check+"&twitter="+t_check+"&word="+word;
	
	const fn = function(data){
		getCheckedCnt();
		
	};
	ajaxFun(url,"post",query,"json",fn);
	
	

}); 

</script>
<form class="channelForm">
	<div class="chooseInfoBox">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="chooseDate">
						시작일&nbsp;<input type="date" name="startDate" value="${startDate}"
							class="customInputDate start">&nbsp;종료일&nbsp;<input
							type="date" name="endDate" value="${endDate}"
							class="customInputDate end">
						<button type="button" class="btn btn-success"
							onclick="changeDate(${productCategory})">3개월</button>
					</div>
				</div>
				<div class="col">
					<div class="chooseSNS" style="width: max-content; display: flex;">
						<div class="container">
							<div class="row" style="display: flex; align-items: center;">
								<div class="col">
									<div class="form-check form-switch ">
										<input
											class="form-check-input btn btn-outline-danger channel youtube"
											type="checkbox" role="switch" id="flexSwitchCheckDefault"
											name="youtube" value="1">
										<div class="row" style="width: max-content;">
											<label class="form-check-label labelSNS"
												for="flexSwitchCheckDefault">유튜브</label>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="form-check form-switch">
										<input
											class="form-check-input btn btn-outline-warning channel instagram"
											type="checkbox" role="switch" id="flexSwitchCheckChecked"
											name="instagram" value="2">
										<div class="row" style="width: max-content;">
											<label class="form-check-label" for="flexSwitchCheckChecked">인스타</label>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="form-check form-switch">
										<input
											class="form-check-input btn btn-outline-success channel blog"
											type="checkbox" role="switch" id="flexSwitchCheckDisabled"
											name="blog" value="3">
										<div class="row" style="width: max-content;">
											<label class="form-check-label" for="flexSwitchCheckChecked">블로그</label>
										</div>
									</div>


								</div>

								<div class="col">
									<div class="form-check form-switch">
										<input
											class="form-check-input btn btn-outline-info channel twitter"
											type="checkbox" role="switch"
											id="flexSwitchCheckCheckedDisabled" name="twitter" value="4">
										<div class="row">
											<label class="form-check-label" for="flexSwitchCheckChecked">트위터</label>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
										<button class="btn btn-success change" type="button"
											style="width: max-content;">날짜 및 채널적용</button>
									</div>
								</div>
								<input type="hidden" name="kwd" value="${kwd}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<div class="searchLayout">
	<div class="row">

		<div style="height: 860px; width: 1000px; margin-right: 20px">

			<div class="row">
				<div class="mentionChannelLayout">
					<p class="searchTitle">언급량이 가장 많았던 채널</p>
					<c:if test="${topChannel eq '인스타그램'}">
						<p class="topChannelNameDate">${startDate}~${endDate}</p>
						<img alt="채널 이미지" class="topChannelImg"
							src="${pageContext.request.contextPath}/resources/images/moumi/sns/instagram.png">
						<p class="topChannelName">인스타그램</p>
					</c:if>

					<c:if test="${topChannel eq '트위터'}">
						<p class="topChannelNameDate">${startDate}~${endDate}</p>

						<img alt="채널 이미지" class="topChannelImg"
							src="${pageContext.request.contextPath}/resources/images/moumi/sns/twitter.png">
						<p class="topChannelName">트위터</p>
					</c:if>

					<c:if test="${topChannel eq '블로그'}">
						<p class="topChannelNameDate">${startDate}~${endDate}</p>
						<div class="row" style="align-items: center">
							<img alt="채널 이미지" class="topChannelImg"
								src="${pageContext.request.contextPath}/resources/images/moumi/sns/blog.png">
							<p class="topChannelName" style="width: 110px;">네이버 블로그
							<p>
						</div>
					</c:if>
				</div>
				<div class="mentionDateLayout">
					<p class="searchTitle">언급량이 가장 많았던 날짜</p>
					<p class="topDay"><i class="fa-sharp fa-solid fa-calendar"></i>&nbsp;${topDay}</p>
				</div>
			</div>

			<div class="row">

				<div class="mentionGraphLayout">
					<p class="searchTitle">
						언급량 추이
						<button type="button" onclick="downloadExcel();"
							class="btn btn-outline-success"
							style="border-radius: 30px; float: right;">EXCEL</button>
					</p>

					<div class="layoutChart" id="crawlingChart" style="height: 500px;"></div>

				</div>
			</div>

		</div>
	</div>


	<div style="height: 300px; width: 670px;">
		<div class="SNSLayout">
			<p class="searchTitle">${kwd}</p>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="row" style="margin: 2px;">
					<div class="col ms-auto me-auto">
						<c:if test="${dto.sns eq 'Twitter'}">
							<img alt="채널 이미지" class="snsImg"
								style="margin-left: 2px; margin-top: 5px;"
								src="${pageContext.request.contextPath}/resources/images/moumi/sns/twitter.png">
						</c:if>


						<c:if test="${dto.sns eq 'instagram'}">
							<img alt="채널 이미지" class="snsImg"
								style="margin-left: 2px; margin-top: 5px;"
								src="${pageContext.request.contextPath}/resources/images/moumi/sns/instagram.png">
						</c:if>


						<c:if test="${dto.sns eq 'blog'}">
							<img alt="채널 이미지" class="snsImg"
								style="margin-left: 2px; margin-top: 5px;"
								src="${pageContext.request.contextPath}/resources/images/moumi/sns/blog.png">

						</c:if>


					</div>
					<div class="col">
						<div class="snsContent" onclick="location.href='${dto.url}'">
							<div class="snsDate">${dto.date}</div>
							<div class="col-20 text-truncate">${dto.content}</div>
							<div class="col-20 text-truncate tags">${dto.tags}</div>

						</div>

					</div>
				</div>
			</c:forEach>

		</div>
		<div class="wordCloudLayout">
			<p class="searchTitle">워드 클라우드</p>
		</div>
	</div>

</div>


<div class="searchLayout">

	<div style="height: 850px; width: 1700px; justify-content: center;">

		<div class="recommendLayout">
			<p class="searchTitle">추천 상품</p>
			<div class="recommendList" id ="recommendList">
			</div>
		</div>

		<div class="youtubeLayout">
			<p class="searchTitle">유튜브 반응 확인하기</p>
			<c:forEach var="dto" items="${youtubeList}" varStatus="status">
				<ul class="youtube" onclick="location.href='${dto.url}'">
					<li><c:if test="${dto.thumbnail != 'noImg'}">
							<img alt="썸네일" class="youtubeImg" src="${dto.thumbnail}">
						</c:if> <c:if test="${dto.thumbnail eq 'noImg'}">
							<img alt="썸네일" class="youtubeImg"
								src="${pageContext.request.contextPath}/resources/images/moumi/sns/youtube.png">
						</c:if>
						<div class="yotubeWriter">${dto.writer}</div>
						<div class="youtubeTitle text-truncate">${dto.title}</div>
						<div class="youtubeView">
							<i class="fa-regular fa-circle-play"></i>${dto.view}</div></li>

				</ul>
			</c:forEach>
		</div>
	</div>
</div>




<input type="hidden" id="analyzeKwd" value="${kwd}">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>
<script type="text/javascript">

$(function(){
	let startDate = $("form input[name=startDate]").val();
	let endDate = $("form input[name=endDate]").val();
 	let kwd = $("#analyzeKwd").val();
 	
 	
 	query = kwd+"&startDate="+startDate+"&endDate="+endDate;
 	
	let url = "${pageContext.request.contextPath}/analyze/chart?kwd="+query;
	
	$.getJSON(url, function(data){
		let dataBlog = [];
		let dataTwit = [];
		let dataInsta = [];
		
		if( $(".blog").prop("checked") == true )  {
			for (let _data of data.blogCountList){
				dataBlog.push([_data.id, _data.result]);
			}
		} else {
			dataBlog = [];
		}
		
		if( $(".twitter").prop("checked") == true )  {
			for (let _data of data.twitCountList){
				dataTwit.push([_data.id, _data.result]);
			}
		} else {
			dataTwit = [];
		}
		
		if( $(".instagram").prop("checked") == true )  {
			for (let _data of data.instaCountList){
				dataInsta.push([_data.id, _data.result]);
			}
		} else {
			dataInsta = [];
		}
		
		var chartDom = document.getElementById('crawlingChart');
		var myChart = echarts.init(chartDom);
		var option;
	
		option = {
		  title: {
			  text: '채널별 건수'
		  },
		  tooltip: {
		    trigger: 'axis'
		  },
		  
		  legend: {
			  data: ['Blog', 'Twit', 'Insta']
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
		    type: 'time',
		    boundaryGap: false,
		    axisLabel: {
	          formatter: '{yyyy}-{MM}-{dd}'
		    }
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: [
		    {
		      name: 'Blog',
		      type: 'line',
		      data: dataBlog
		    },
		    {
		      name: 'Twit',
		      type: 'line',
		      data: dataTwit
		    },
		    {
		      name: 'Insta',
		      type: 'line',
		      data: dataInsta
		    }
		  ]
		};
	
		option && myChart.setOption(option);
	});
		
});
</script>

<script type="text/javascript">
function downloadExcel() {
	
	let uid = ${loginCheck};
	let productCategory = ${productCategory};
	if(uid == 0) {
		alert("  로그인 후 사용 가능합니다 :-) ");
		return false;
	}
	
	if (! (productCategory === 1 || productCategory === 2)){
		alert("이용권을 구매해주세요");
		return;
	}
	
	let startDate = $("form input[name=startDate]").val();
	let endDate = $("form input[name=endDate]").val();
 	let kwd = $("#analyzeKwd").val();
 	
 	let channels = [];
	if( $(".twitter").prop("checked") == true )  {
 		channels.push("twitter");
	}
	
 	if( $(".blog").prop("checked") == true )  {
 		channels.push("blog");
	} 
	
	if( $(".instagram").prop("checked") == true )  {
 		channels.push("instagram");
	}
	
	query = kwd+"&startDate="+startDate+"&endDate="+endDate+"&channels="+channels;
	let url = "${pageContext.request.contextPath}/analyze/excel?kwd="+query;
	
	location.href = url;
	
};
</script>