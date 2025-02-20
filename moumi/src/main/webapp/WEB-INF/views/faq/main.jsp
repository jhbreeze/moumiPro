<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.side {
list-style: none;
font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
font-size: 20px;

}
.side-menu1{
position:absolute;
top: 10rem;
left: 15rem;
background: #198754;
width: 9rem;
height: 3rem;
text-align: center;
color: white;
padding-top: 0.5rem;
}
.side-menu2{
position:absolute;
top: 14rem;
left: 15rem;

}
.side-menu2 a{
text-decoration: none;
color: gray;

}
.side-menu3{
position:absolute;
top: 17rem;
left: 15rem;

}
.side-menu3 a{
color: #198754;
font-weight: bold;
text-decoration: none;

}

.alert-info {
	background-color: #ECF4EB;
	border: none;
}

#tab-0.active {
	color : green;
}

#tab-1.active {
	color : green;
}

#tab-2.active {
	color : green;
}

#tab-3.active {
	color : green;
}

.nav-tabs .nav-link {
	color : black;
}

</style>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

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
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

//글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/faq/list";
	let query = "categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
		console.log(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.condition.value = $("#condition").val();
	f.keyword.value = $.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.condition.value = "all";
	f.keyword.value = "";
	
	listPage(1);
}


</script>
<script>
$(document).on('click', '.accordion-button', function(){
    $('.accordion-button').css('background-color', 'white');
    $('.accordion-button').css('color', 'black');
 });
</script>

<nav>
	<ul class="side">
		<li class="side-menu1">
			고객센터
		</li>
		<li class="side-menu2">
			<a href="${pageContext.request.contextPath}/notice/main">공지사항</a>
		</li>
		<li class="side-menu3">
			<a href="${pageContext.request.contextPath}/faq/main">자주 하는 질문</a>
		</li>
	</ul>
</nav>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-question-octagon"></i> 자주하는 질문 </h3>
		</div>
		
	    <div class="alert alert-info" role="alert">
	        <i class="bi bi-search"></i> 궁금한 문의 사항을 빠르게 검색 할 수 있습니다.
	    </div>
	    		
		<div class="body-main">
			
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-categoryNum="0">모두</button>
				</li>
				<c:forEach var="dto" items="${listCategory}" varStatus="status">
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" aria-selected="true" data-categoryNum="${dto.categoryNum}">${dto.categoryName}</button>
					</li>
				</c:forEach>
			</ul>
			
			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
				</div>
			</div>
			
		</div>
	</div>
</div>

<form name="faqSearchForm" method="post">
	<input type="hidden" name="condition" value="all">
    <input type="hidden" name="keyword" value="">
</form>
