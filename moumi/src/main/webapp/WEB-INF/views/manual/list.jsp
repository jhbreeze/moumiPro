<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1200px;
}
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}
.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
}
.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
</style>

<script type="text/javascript">
$(function(){
	$(".manual-item").click(function(){
		let manualNum = $(this).attr("data-manualNum");
		let url = "${articleUrl}&manualNum="+manualNum;
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
				사용 방법 안내
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
					<div class="border rounded manual-item" data-manualNum="${dto.manualNum}">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/uploads/manual/${dto.thumbnail}" style="width: -webkit-fill-available;">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								<a href="${articleUrl}&manualNum=${dto.manualNum}" class="text-reset" style="text-decoration-line: none;">${dto.subject}</a>
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
			<div class="col" style="width: 300"></div>
			<div class="col"></div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/manual/list" method="post">
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
			<c:if test="${sessionScope.member.userType == 0}">
				<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/manual/write';">글올리기</button>
			</c:if>
		</div>
		</div>
	</div>
</div>
