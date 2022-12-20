<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-2" id="accordionFlush">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none;">
				<h2 class="accordion-header mb-1 border" id="flush-heading-${status.index}">
					<button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
						${dto.subject}
					</button>
				</h2>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
					<div class="accordion-body">

						<div class="row border-bottom pb-1">분류 : ${dto.category}</div>
						<div class="row p-2">
							${dto.content}
						</div>
						<c:if test="${sessionScope.member.membership>50}">
							<div class="row py-1">
								<div class="col text-end">
									<a href="#" onclick="javascript:location.href='${pageContext.request.contextPath}/faq/update?num=${dto.num}&pageNo=${pageNo}';">수정</a>&nbsp;|
									<a href="#" onclick="deleteFaq('${dto.num}', '${pageNo}');">삭제</a>
								</div>
							</div>
						</c:if>

					</div>
				</div>
			</div>		
		</c:forEach>
	</div>
</c:if> --%>
<style type="text/css">
/* nav{
float: left;
} */
ul {
display:block;
list-style: none;
}

</style>

<nav>
	<ul>
		<li>
			<a class="active">공지사항</a>
		</li>
		<li>
			<a>자주 묻는 질문</a>
		</li>
	</ul>
</nav>
 <div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-question-octagon"></i> 공지사항 </h3>
		</div>
	<div class="accordion accordion-flush mt-5" id="accordionFlushExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	        [공지] MOUMI 이용 안내<br>
	        2022.12.24
	        
	      </button>
	    </h2>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body" style="background: #ECF4EB">
	      		안녕하세요. MOUMI 입니다.
				MOUMI 이용권에 관해 설명드립니다.
				MOUMI BASIC 기본권을 구매하신 회원들께서는  다양한 SNS 채널 별 검색 기능을  사용할 수 있습니다.  
				안녕하세요. MOUMI 입니다.
				MOUMI 이용권에 관해 설명드립니다.
		  </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	        Accordion Item #2
	      </button>
	    </h2>
	    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	        Accordion Item #3
	      </button>
	    </h2>
	    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
	    </div>
	  </div>
	</div>
	</div>
</div>
 
