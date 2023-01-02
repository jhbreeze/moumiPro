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
	padding: 90px;
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
</style>

<script type="text/javascript">
$(function(){
	$(".report-item").click(function(){
		let reportNum = $(this).attr("data-reportNum");
		let url = "${articleUrl}&reportNum="+reportNum;
		location.href = url;
	});
});
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 분석 리포트 관리
			</h2>
		</div>

		<div class="body-main">
			<div class="row board-list-header">
				<div class="col-auto me-auto">
					<div>
						<p class="form-control-plaintext">${dataCount}개(${page}/${total_page}페이지)</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-1">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="col-md-4 col-lg-3 mt-4" style="width: 350px; margin:25px;" >
					<div class="border rounded report-item" data-reportNum="${dto.reportNum}">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/uploads/report/${dto.thumbnail}" style="width: -webkit-fill-available;">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								<a href="${articleUrl}&reportNum=${dto.reportNum}" class="text-reset" style="text-decoration-line: none;">${dto.subject}</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="page-navigation mt-5">
			${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
		</div>
		
		<div class="row board-list-footer">
			<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/report/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/report/list" method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date" ${condition=="regDate"?"selected='selected'":""}>등록일</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="keyword" value="${keyword}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>

				</div>
		<div class="col text-end">
			<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/report/write';">글올리기</button>
		</div>
		</div>
	</div>
</div>
