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

</style>

<div class="container body-container">
    <div class="body-main mx-auto">
    	<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link" aria-current="page" href="#">채용 진행중</a></li>
			<li class="nav-item"><a class="nav-link active" href="list2.do?page=1">채용 마감</a></li>
		</ul>
    
    	<p class="text-end m-2 fw-bold">전체 <span style="color: green">n</span>건</p>
    
		<table class="table ">
				<thead class="fw-bold">
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>회사명</th>
						<th colspan="2">공고명</th>
						<th colspan="2">모집기간</th>
					</tr>
				</thead>
				
				<tbody class="text-center">
					<tr>
						<td>1</td>
						<td>신입</td>
						<td>현대자동차</td>
						<td colspan="2">얄리얄리</td>
						<td colspan="2">2022.12.14 ~ 2022.12.31</td>
					</tr>
				</tbody>
		</table>
			
			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/recruit/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/bbs/list" method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>공고명</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>구분</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>회사명</option>
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
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/recruit/write';">글올리기</button>
				</div>
			</div>
    </div>
</div>