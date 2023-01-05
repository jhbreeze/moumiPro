<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush" style="clear: right;">
		<form name="commentForm" method="post">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="overflow: hidden; border-bottom-color: ">
				<h2 class="accordion-header mb-1" id="flush-heading-${status.index}" style="height: 90px;">
					<button class="accordion-button collapsed  backColor" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}" style="height: 100%;">
						<div style="width: 100%;">
							<div style="font-size: 15px;">
								${dataCount - (page-1) * size - status.index}. ${dto.writeName}/${dto.regDate}
							</div>
							<div style="margin: 10px; font-size: 20px;">
								${dto.content}
							</div>
						</div>
					</button>
				</h2>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse pp" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush" style="clear: left;">
					<div class="accordion-body" style="clear: left;">
						<div class="row border-bottom pb-1"> 
							<div> 카테고리 : ${dto.bigBrandName}>${dto.smallBrandName}</div>
							<div>
								<c:url var="url" value="/board/article">
									<c:param name="communityNum" value="${dto.communityNum}"/>
									<c:param name="page" value="${page}"/>
									<c:if test="${not empty keyword}">
										<c:param name="condition" value="${condition}"/>
										<c:param name="keyword" value="${keyword}"/>
									</c:if>
								</c:url>
								<a href="${url}" class="noline">본문 : ${dto.subject}</a>
							</div>
						<div class="col text-end" style="float: left;">
							<c:if test="${dto.status == 0}">
								<a href="#" onclick="updateReply('${dto.replyNum}', '${pageNo}', 1);" class="text-line">댓글 숨김</a>
							</c:if>
							<c:if test="${dto.status == 1}">
								<a href="#" onclick="updateReply('${dto.replyNum}', '${pageNo}', 0);" class="text-line">댓글 보임</a>
							</c:if>
						</div>
				</div>
						
						<div class="row p-2">
						<div>
							└신고자 : ${dto.sendName}
						</div>
							신고사유 : ${dto.notifyContent}
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
