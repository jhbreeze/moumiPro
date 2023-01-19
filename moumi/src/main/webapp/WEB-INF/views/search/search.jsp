<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.marginBox {
	width: 100%;
	height: 20px;
	background: #ECF4EB;
}

.analyzeLayout {
	width: 90%;
	height: 2000px;
	margin: auto;
}

.searchBackGround {
	background: #ECF4EB;
}

.searchMainLayout {
	width: 100%;
	height: 2200px;
	background: #ECF4EB;
}

.chooseInfoBox {
	width: 100%;
	height: 60px;
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

.layoutSNS {
	width: 600px;;
	height: 400px;
	background: white;
	border-radius: 15px;
	margin: 4px;
	padding: 10px;
	border-radius: 15px;
	overflow: scroll;
}

.layoutChannel {
	width: 500px;
	height: 120px;
	border-radius: 15px;
	background: white;
	padding: 5px;
	background: white;
	text-align: center;
	vertical-align: middle;
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

.layoutYoutube {
	width: 1100px;
	height: 700px;
	border-radius: 15px;
	background: white;
}

.customInputDate {
	border: 1px solid #198754;
	width: 150px;
	height: 30px;
	border-radius: 30px;
	padding: 12px;
}

.snsContent {
	width: 480px;
	height: 100px;
	border-radius: 15px;
	padding: 17px;
	background: #f8f9fa;
	float: right;
	margin-bottom: 1px;
}

.snsInfo {
	width: 490px;
	height: 100px;
	border: 1px solid red;
	border-radius: 15px;
}

.snsImg {
	width: 35px;
	height: 30px;
	margin: 0 auto;
}

.menuTitle {
	font-size: 17px;
	margin: 15px;
	font-weight: 600;
	margin: 18px;
}

.wordCloudLayout {
	font-weight: 300px;
	width: 600px;
	height: 550px;
	background: white;
	border-radius: 15px;
	height: 500px;
	overflow: hidden;
	text-align: center;
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
	width: 1100px;
	height: 100%;
	overflow: hidden;
	padding: 25px;
}

.topChannelImg {
	width: 90px;
	hegiht: 90px;
}

ul {
	list-style: none;
}

ul li {
	list-style-type: none;
	float: left;
	margin-right: 15px;
}

.topDay {
	color: #198754;
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
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


$(function(){
 	payCheck = ${payCheck};
 	youtube = ${youtube};
 	instagram = ${instagram};
 	blog = ${blog};
 	twitter = ${twitter};
 	startDate = ${startDate};
 	endDate = ${endDate};
 	
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
 	
 	
	if(payCheck == 0){
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
		$(".layoutYoutube").show();
	} else {
		$(".layoutYoutube").hide();
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
	  // 선택된 목록 가져오기
	  const query = 'input[type=checkbox]:checked';
	  const selectedElements = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록의 갯수 세기
	  const selectedElementsCnt =
	        selectedElements.length;
	  
	  let out = "";
	  if (selectedElementsCnt ==1){
	  		out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud.png'>11"
	  }
	  if (selectedElementsCnt ==2){
		  	out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud2.png'>22"
		  }
	  if (selectedElementsCnt ==3){
		  	out = "<img alt='채널 이미지' class='wordCloudImg' src='${pageContext.request.contextPath}/uploads/wordcloud3.png'>33"
		  }
	  // 출력
	  document.querySelector('.wordCloudLayout').innerHTML
	    = out;
	}
	

$(function(){
	let i_check = $(".instagram").is(":checked");
	let b_check = $(".blog").is(":checked");
	let t_check = $(".twitter").is(":checked");
	let word = $("input[name=kwd]").val();

	let url = "${pageContext.request.contextPath}/flask/wordcloud"
	let query = "instagram="+i_check+"&blog="+b_check+"&twitter="+t_check+"&word="+word;
	alert(query);
	
	const fn = function(data){
		getCheckedCnt();
		
	};
	ajaxFun(url,"post",query,"json",fn);
	
	

});

</script>
<form class="channelForm" method="post">
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
					<div class="chooseSNS">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="form-check form-switch ">
										<input
											class="form-check-input btn btn-outline-danger channel youtube"
											type="checkbox" role="switch" id="flexSwitchCheckDefault"
											name="youtube" value="1">
										<div class="row">
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
											name="instagram" value="2" checked>
										<div class="row">
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
										<div class="row">
											<label class="form-check-label" for="flexSwitchCheckChecked">블로그</label>
										</div>
									</div>


								</div>

								<div class="col">
									<div class="form-check form-switch">
										<input
											class="form-check-input btn btn-outline-info channel twitter"
											type="checkbox" role="switch"
											id="flexSwitchCheckCheckedDisabled" name="twitter" value="4"
											checked>
										<div class="row">
											<label class="form-check-label" for="flexSwitchCheckChecked">트위터</label>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
										<button class="btn btn-success change" type="button">날짜
											및 채널적용</button>
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

<div class="marginBox"></div>


<div class="searchMainLayout">
	<div class="analyzeLayout ">
		<div class="inner-page">
			<div class="row">
				<div class="col" style="margin-top : 100px;">
					<div class="container1" style="width : 1850px; height:1010px; margin: auto;">
					<div class="right" style="float: left;">
						<div class="box1">
							<div class="" style="width: 500px; float: left;">
								<div class="layoutChannel">
									<p class="channelContent">
										언급량이 가장 많았던 채널

										<c:if test="${topChannel eq '인스타그램'}">
											<img alt="채널 이미지" class="topChannelImg"
												src="${pageContext.request.contextPath}/resources/images/moumi/sns/instagram.png">
										</c:if>

										<c:if test="${topChannel eq '트위터'}">
											<img alt="채널 이미지" class="topChannelImg"
												src="${pageContext.request.contextPath}/resources/images/moumi/sns/twitter.png">
										</c:if>

										<c:if test="${topChannel eq '블로그'}">
											<img alt="채널 이미지" class="topChannelImg"
												src="${pageContext.request.contextPath}/resources/images/moumi/sns/instagram.png">
										</c:if>
								</div>
							</div>
							<div style="width: 100px; float: left; height: 120px;"></div>
							<div class="" style="width: 500px; float: left;">
								<div class="layoutChannel">
									언급량이 가장 많았던 날 <br>
									<div class="topDay">${topDay}</div>

								</div>
							</div>

							<div class="marginBox" style="clear: left; width: 1100px;"></div>

							<div>
								<div class="fw-bold h4">언급량 추이
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/analyze/excel';" 
											class="btn btn-success">EXCEL</button>
								</div>
								<div class="layoutChart" id="crawlingChart"
									style="height: 500px;">
								</div>
								
							</div>
							<div class="marginBox"></div>


						</div>
						<div>
							<div class="layoutYoutube">
								<p class="menuTitle">유튜브 반응 확인하기</p>
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
						
						<div class="marginBox"></div>
						
								<div class="layoutshop ">
									<p>추천 브랜드 & 상품</p>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
									<div style="float: left; height: 100%; margin-right: 20px;">
										<a href="https://www.11st.co.kr/products/1757604255?inpu=&trTypeCd=22&trCtgrNo=895019">
											<img alt="상품이미지" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/pd/v2/6/0/4/2/5/5/dmLSK/1757604255_B.jpg" height="50%">
										</a>
											<div>> 브랜드명</div>
											<div>> 상품명</div>
											<div>리뷰평점 : </div>
									</div>
									
								</div>
								
						</div>
								
						<div style="float: left; margin-left:100px;" class="left">
								<div class="layoutSNS">
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
		
											</div>
											<div class="col">
												<div class="snsContent" onclick="location.href='${dto.url}'">
													<div class="date">${dto.date}</div>
													<div class="col-20 text-truncate">${dto.content}</div>
													<div class="col-20 text-truncate tags">${dto.tags}</div>
		
												</div>
		
											</div>
										</div>
									</c:forEach>
		
								</div>
							
							<div class="marginBox"></div>
		
							<div class="row">
								<div class="wordCloudLayout" style="margin-top: 100px;">
								</div>
		
							</div>
		
						</div>

					</div>
							
							
							
							
				</div>

				
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="analyzeKwd" value="${kwd}">

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>
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

</script>