<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
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

$(function() {
	$("#chkAll2").click(function() {
		let b = $(this).is(":checked");
		$("form input[name=faqNums2]").prop("checked", b);
	});
	
	$("#btnDeleteList2").click(function() {
		let cnt = $("form input[name=faqNums2]:checked").length;
		if(cnt === 0){
			alert("삭제할 학생 정보를 먼저 선택하세요");
			return false;
		}
		
		if(confirm("선택한 학생 정보를 삭제하시겠습니까?")){
			const f= document.faqForm;
			f.action = "${pageContext.request.contextPath}/admin/faq/deleteList";
			f.submit();
		}
	});
});
</script>
	
<div class="container">

		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 자주하는 질문 관리
			</h2>
		</div>


		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="1" aria-selected="true">이용권</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="2" aria-selected="true">결제</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#nav-3" type="button" role="tab" aria-controls="3" aria-selected="true">기타</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-tab-1">
				<div class="body-main">
			<div>
				<div>${dataCount1}개(${page1}/${total_page1}페이지)</div>
				<div>&nbsp;</div>
				
				<div class="accordion accordion-flush" id="accordionFlush">
					<form name="faqForm" method="post">
							<input type="checkbox" class="form-check-input" name="chkAll"
								id="chkAll">
							<button type="button" class="btn btn-light"
								data-bs-toggle="modal" data-bs-target="#exampleModal" title="삭제">
								<i class="bi bi-trash"></i>
							</button>
						<c:forEach var="dto" items="${list1}" varStatus="status">
							<div class="accordion-item" id="accordion">
									<input type="checkbox" class="form-check-input" name="faqNums"
										value="${dto.faqNum}">
								<h2 class="accordion-header" id="flush-heading-${status.index}">
									<button class="accordion-button collapsed backColor" id="board"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#flush-collapse-${status.index}"
										aria-expanded="false"
										aria-controls="flush-collapse-${status.index}">
										${dto.subject}</button>
								</h2>
								<div id="flush-collapse-${status.index}"
									class="accordion-collapse collapse"
									aria-labelledby="flush-heading-${status.index}"
									data-bs-parent="#accordionFlush">
									<div class="accordion-body">${dto.content}<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/faq/update?faqNum=${dto.faqNum}&page1=${page1}';">수정</button></div>
								</div>
							</div>
						</c:forEach>
					</form>
				</div>
				
				<div class="page-navigation">
					${dataCount1 == 0 ? "등록된 게시물이 없습니다." : paging1}
				</div>
				
				<div class="row board-list-footer">
						<div class="col text-end">
							<button type="button" class="btn btn-light btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/faq/write';">글쓰기</button>
						</div>
				</div>
			</div>
		</div>
			</div>
			
			<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-tab-2">
				<div class="body-main">
			<div>
				<div>${dataCount2}개(${page2}/${total_page2}페이지)</div>
				<div>&nbsp;</div>
				
				<div class="accordion accordion-flush" id="accordionFlush2">
					<form name="faqForm2" method="post">
							<input type="checkbox" class="form-check-input" name="chkAll2"
								id="chkAll2">
							<button type="button" class="btn btn-light"
								data-bs-toggle="modal" data-bs-target="#exampleModal" title="삭제">
								<i class="bi bi-trash"></i>
							</button>
						<c:forEach var="dto" items="${list2}" varStatus="status">
							<div class="accordion-item" id="accordion">
									<input type="checkbox" class="form-check-input" name="faqNums2"
										value="${dto.faqNum}">
								<h2 class="accordion-header" id="flush-heading-${status.index}a">
									<button class="accordion-button collapsed backColor" id="board2"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#flush-collapse-${status.index}a"
										aria-expanded="false"
										aria-controls="flush-collapse-${status.index}a">
										${dto.subject}</button>
								</h2>
								<div id="flush-collapse-${status.index}a"
									class="accordion-collapse collapse"
									aria-labelledby="flush-heading-${status.index}a"
									data-bs-parent="#accordionFlush2">
									<div class="accordion-body">${dto.content} <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/faq/update?faqNum=${dto.faqNum}&page=${page2}';">수정</button> </div>
								</div>
							</div>
						</c:forEach>
					</form>
					
					
				</div>
				<div class="page-navigation">
					${dataCount2 == 0 ? "등록된 게시물이 없습니다." : paging2}
				</div>
				
				<div class="row board-list-footer">
						<div class="col text-end">
							<button type="button" class="btn btn-light btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/faq/write';">글쓰기</button>
						</div>
				</div>
			</div>
		</div>
		</div>
			</div>
			<div class="tab-pane fade" id="nav-3" role="tabpanel" aria-labelledby="nav-tab-2">
			
				<div>${dataCount3}개(${page3}/${total_page3}페이지)</div>
				<div>&nbsp;</div>
				
				<div class="accordion accordion-flush" id="accordionFlush3">
					<form name="faqForm3" method="post">
							<input type="checkbox" class="form-check-input" name="chkAll3"
								id="chkAll3">
							<button type="button" class="btn btn-light"
								data-bs-toggle="modal" data-bs-target="#exampleModal" title="삭제">
								<i class="bi bi-trash"></i>
							</button>
						<c:forEach var="dto" items="${list3}" varStatus="status">
							<div class="accordion-item" id="accordion">
									<input type="checkbox" class="form-check-input" name="faqNums3"
										value="${dto.faqNum}">
								<h2 class="accordion-header" id="flush-heading-${status.index}b">
									<button class="accordion-button collapsed backColor" id="board3"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#flush-collapse-${status.index}b"
										aria-expanded="false"
										aria-controls="flush-collapse-${status.index}b">
										${dto.subject}</button>
								</h2>
								<div id="flush-collapse-${status.index}b"
									class="accordion-collapse collapse"
									aria-labelledby="flush-heading-${status.index}b"
									data-bs-parent="#accordionFlush3">
									<div class="accordion-body">${dto.content} <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/faq/update?faqNum=${dto.faqNum}&page=${page3}';">수정</button> </div>
								</div>
							</div>
						</c:forEach>
					</form>
					
					
				</div>
				<div class="page-navigation">
					${dataCount3 == 0 ? "등록된 게시물이 없습니다." : paging3}
				</div>
				
				<div class="row board-list-footer">
						<div class="col text-end">
							<button type="button" class="btn btn-light btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/faq/write';">글쓰기</button>
						</div>
				</div>
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


