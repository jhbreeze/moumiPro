<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

thead { 
	text-align: center; 
	background-color: #ECF4EB
}

tbody tr:hover {
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
	
	div = $tab.attr("data-div");
	
	let url = "${pageContext.request.contextPath}/recruit/list";
	let query = "pageNo="+page+"&div="+div;
	let search = $('form[name=recruitSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#panel-"+div;
	
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
function reloadMyHistory() {
	const f = document.myhistorySearchForm;
	f.condition.value = "subject";
	f.keyword.value = "";
	
	listPage(1);
}

</script>

<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#panel-1" 
					type="button" role="tab" data-div="1" aria-controls="panel-1" aria-selected="true">내가 쓴 글</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#panel-2"
					type="button" role="tab" data-div="2" aria-controls="panel-2" aria-selected="true">댓글 단 글</button>
			</li>
		</ul>
		
		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="panel-1" role="tabpanel" aria-labelledby="tab-1">
			
			</div>
		</div>
		
		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show active" id="panel-2" role="tabpanel" aria-labelledby="tab-2">

			</div>
		</div>
		

	</div>
</div>

<form name="myhistorySearchForm" method="post">
	<input type="hidden" name="condition" value="subject">
    <input type="hidden" name="keyword" value="">
</form>
