<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
$(function() {
	$("#tab-0").addClass("active");
	
	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function() {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
	});
});

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend : function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error  : function(jqXHR){
			if(jqXHR.status === 403){
				location.href="${pageContext.request.contextPath}/member/login";
			} else if(jqXHR.status === 400){
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList() {
	const f = document.searchForm;
	f.enatbled.value = $("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";
	f.submit();
}

function detailMember(email){
	let dig = $("#member-dialog").dialog({
		autoOpen: false,
		model: true,
		buttons: {
			" 수정 " : function() {
				updateOk();
			},
			" 삭제 " : function() {
				deleteOk(email);
			},
			" 닫기 " : function() {
				$(this).dialog("close");
			}
		},
		height: 550,
		width: 800,
		title: "회원상세정보",
		close: function(event, ui) {
		}
	});
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/detail";
	let query = "userCode="+userCode;
	
	const fn = function(data) {
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk() {
	const f = document.detailMemberForm;
	
	if(! f.stateCode.value){
		f.stateCode.focus();
		return;
	}
	if(!$.trim(f.memo.value)){
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";
	let query = $("#detailMemberForm").sereialize();
	
	const fn = function(data) {
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFum(url, "post", query, "json", fn);
	
	$('#member-dialog').dialog("close");
}
</script>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 회원관리
			</h2>
		</div>

		<div class="body-main">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i> 회원 리스트</li>
					<li id="tab-1" data-tab="1"><i class="fa-solid fa-chart-column"></i> 회원 분석</li>
				</ul>
			</div>
			
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
		
			<table class="table">
				<tr>
					<td align="left" width="50%">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
						<select id="selectEnabled" class="form-select" onchange="searchList();">
							<option value="" ${enabled=="" ? "selected='selected'":""}>::계정상태::</option>
							<option value="0" ${enabled=="0" ? "selected='selected'":""}>잠금 계정</option>
							<option value="1" ${enabled=="1" ? "selected='selected'":""}>활성 계정</option>
						</select>
					</td>
				</tr>
			</table>
				
			<table class="table table-border table-list">
				<thead>
					<tr> 
						<th class="wx-60">번호</th>
						<th class="wx-100">아이디</th>
						<th class="wx-100">이름</th>
						<th class="wx-100">생년월일</th>
						<th class="wx-120">회원유형</th>
						<th class="wx-60">상태</th>
						<th>이메일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr class="hover" onclick="detailMember('${dto.email}');"> 
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td>${dto.email}</td>
							<td>${dto.userName}</td>
							<td>${dto.birth}</td>
							<td>${dto.userType}</td>
							<td>${dto.enabled==1?"활성":"잠금"}</td>
							<td>${dto.email}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
					
			<table class="table">
				<tr>
					<td align="left" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/list';">새로고침</button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post">
							<select name="condition" class="form-select">
								<option value="email"     ${condition=="userCode" ? "selected='selected'":""}>아이디</option>
								<option value="userName"   ${condition=="userName" ? "selected='selected'":""}>이름</option>
								<option value="email"      ${condition=="email" ? "selected='selected'":""}>이메일</option>
								<option value="tel"        ${condition=="userType" ? "selected='selected'":""}>회원유형</option>
							</select>
							<input type="text" name="keyword" class="form-control" value="${keyword}">
							<input type="hidden" name="enabled" value="${enabled}">
							<input type="hidden" name="page" value="1">
							<button type="button" class="btn" onclick="searchList()">검색</button>
						</form>
					</td>
					<td align="right" width="100">&nbsp;</td>
				</tr>
			</table>
		
		</div>
		</div>
	</div>
</div>
