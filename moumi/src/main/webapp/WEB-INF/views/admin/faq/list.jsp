<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#chkAll").click(function() {
		let b = $(this).is(":checked");
		$("form input[name=faqNums]").prop("checked", b);
	});
	
	$("#btnDeleteList").click(function() {
		let cnt = $("form input[name=faqNums]:checked").length;
		if(cnt === 0){
			alert("삭제할 학생 정보를 먼저 선택하세요");
			return false;
		}
		
		const f= document.faqForm;
		f.action = "${pageContext.request.contextPath}/admin/faq/deleteList";
		f.submit();
		
	});
});

</script>
<style type="text/css">


h2 button[aria-expanded="true"]{
    background: #ECF4EB;
}

accordion-button{
	background: #ECF4EB;
}

.btn{
	background-color: #ECF4EB;
	color: #198754;
}

</style>
<div style="float: right; width: 5%; text-align: center;">
	<input type="checkbox" class="form-check-input" name="chkAll" id="chkAll">
</div>
<div style="float: right; width: 5%; text-align: right;">
	<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" title="삭제">
		<i class="bi bi-trash"></i>
	</button>
</div>
<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush" style="clear: right;">
		<form name="faqForm" method="post">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none; overflow: hidden;">
				<h2 class="accordion-header mb-1" id="flush-heading-${status.index}" style="float: left; width: 95%;">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
						${dto.subject}
					</button>
				</h2>
				<div style="float: left; width: 5%; height: 54px; display: flex;">
					<input type="checkbox" class="form-check-input" name="faqNums" value="${dto.faqNum}" style="margin: auto;">
				</div>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush" style="clear: left;">
					<div class="accordion-body" style="clear: left; width: 95%;">
						<div class="row border-bottom pb-1"> <div  style="width: 90%;"> 분류 : ${dto.categoryName}</div><div class="col text-end" style="float: right; width: 10%">
							<a href="#" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/faq/update?faqNum=${dto.faqNum}';" class="text-line">수정</a>
						</div></div>
						
						<div class="row p-2">
							${dto.content}
						</div>
					</div>
				</div>
			</div>		
		</c:forEach>
		</form>
	</div>
</c:if>
 
<div class="page-navigation">
	${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">자주하는 질문</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">게시글을 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">아니요</button>
								<button type="button" class="btn btn-primary" id="btnDeleteList">예</button>
							</div>
						</div>
					</div>
				</div>

<div class="row py-3">
	<div class="col">
	</div>
	<div class="col text-end">
			<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/faq/write';">글올리기</button>
	</div>
</div>
