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
	padding-top: 90px;
	padding-left: inherit;
	padding-right: inherit;
	
}

tr {
	font-size: 15px;
	vertical-align : middle;
	height : 50px;
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
	width: 150px;
}

.date-div {
	text-align: center;
}

.hitCount-th {
	width: 150px;
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
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 공지사항
			</h2>
		</div>

		<div class="body-main">
			<form name="listForm" method="post">
				<div class="row board-list-header">
					<div class="col-auto me-auto">${dataCount}개(${page}/${total_page} 페이지)</div>
				</div>
				
				<table class="table">
					<tbody>
						<tr>
							<td scope="row" class="text-center sort-td"><div class="sort">번호</div></td>
							<td class="text-center"><a href="#" class="text-reset text-decoration-none">제목</a></td>
							<td class="text-center date-th"><div class="date-div">날짜</div></td>
							<td class="text-center hitCount-th" scope="row"><div class="hitCount-div">조회수</div></td>
						</tr>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td scope="row" class="text-center"><div>${dataCount - (page-1) * size - status.index}</div></td>
								<td class="left"><a href="${articleUrl}&noticeNum=${dto.noticeNum}" class="text-reset text-decoration-none">${dto.subject}</a></td>
								<td class="text-center date-th"><div class="date-div">${dto.regDate}</div></td>
								<td class="text-center hitCount-th" scope="row"><div class="hitCount-div">${dto.hitCount}</div></td>
							</tr>
						</c:forEach>
						
					</tbody>
				
				</table>
			</form>
			
			<div><span></span></div>
			<div class="row board-list-footer">
						<div class="col"></div>
						<div class="col"></div>
						<div class="col-6 text-center">
							<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/notice/list" method="post">
								<div class="col-auto p-1">
									<select name="condition" class="form-select form-select-sm">
										<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
										<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
										<option value="reg_date" ${condition=="regDate"?"selected='selected'":""}>등록일</option>
										<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
										<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
									</select>
								</div>
								<div class="col-auto p-1">
									<input type="text" name="keyword" value=""
										class="form-control form-control-sm">
								</div>
								<div class="col-auto p-1">
									<button type="button" class="btn btn-light btn-sm"
										onclick="searchList()">검색</button>
								</div>
							</form>
						</div>
						<div class="col text-end">
								<button type="button" class="btn btn-light btn-sm"
									onclick="location.href='${pageContext.request.contextPath}/admin/notice/write';">글올리기</button>
						</div>
					</div>
		</div>
	</div>
</div>
