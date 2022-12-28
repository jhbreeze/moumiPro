<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

thead { 
	border-top: 1px solid green; 
	border-bottom: 1px solid green; 
	text-align: center; 
	color: green; 
}

tbody tr:hover {
	cursor: pointer;
	background-color: #ECF4EB;
	box-shadow: 1px 1px 5px -5px;
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
    	listPage(1);
    	
    });
});

//글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	
	let url = "${pageContext.request.contextPath}/recruit/list";
	let query = "pageNo="+page;
	let search = $('form[name=recruitSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	const f = document.recruitSearchForm;
	f.condition.value = $("#condition").val();
	f.keyword.value = $.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadRecruit() {
	const f = document.recruitSearchForm;
	f.condition.value = "all";
	f.keyword.value = "";
	
	listPage(1);
}

</script>

<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-content" 
					type="button" role="tab" aria-controls="tabpanel" aria-selected="true" >진행중인 공고</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-2"
					type="button" role="tab" aria-controls="tabpanel" aria-selected="true">마감된 공고</button>
			</li>
		</ul>
		
		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
			
			</div>
		</div>
		
		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show active" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2">
			sss
			</div>
		</div>
		

	</div>
</div>

<form name="recruitSearchForm" method="post">
	<input type="hidden" name="condition" value="all">
    <input type="hidden" name="keyword" value="">
</form>
