<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush" style="clear: right;">
		<form name="faqForm" method="post">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none; overflow: hidden;">
				<h2 class="accordion-header mb-1" id="flush-heading-${status.index}" style="float: left; width: 95%;">
					<button class="accordion-button collapsed  backColor" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
						${dto.subject}
					</button>
				</h2>
				<div style="float: left; width: 5%; height: 54px; display: flex;">
					<input type="checkbox" class="form-check-input" name="faqNums" value="${dto.stopNum}" style="margin: auto;">
				</div>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush" style="clear: left;">
					<div class="accordion-body" style="clear: left; width: 95%;">
						<div class="row border-bottom pb-1"> <div  style="width: 90%;"> 분류 : ${dto.categoryName}</div><div class="col text-end" style="float: right; width: 10%">
							<a href="#" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/comment/update?stopNum=${dto.stopNum}';" class="text-line">수정</a>
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

<div class="row py-3">
	<div class="col">
		<button type="button" class="btn btn-light" onclick="reloadFaq();">새로고침</button>
	</div>
	
</div>
