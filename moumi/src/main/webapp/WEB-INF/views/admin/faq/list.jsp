<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/bootstrap5/js/bootstrap.bundle.min.js"></script>
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
	
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				<i class="fa-brands fa-perbyte"></i> 자주하는 질문 관리
			</h2>
		</div>

		<div class="body-main">
			<div>
				<div>${dataCount}개(${page}/${total_page}페이지)</div>
				<div>&nbsp;</div>
			</div>

			<div class="accordion accordion-flush" id="accordionFlush">
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-heading-1">
					<button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-1" aria-expanded="false" aria-controls="flush-collapse-1">
					  자바란 ?
					</button>
				</h2>
				<div id="flush-collapse-1" class="accordion-collapse collapse" aria-labelledby="flush-heading-1" data-bs-parent="#accordionFlush">
					<div class="accordion-body">
						자바는 ...
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-heading-2">
					<button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-2" aria-expanded="false" aria-controls="flush-collapse-2">
						웹 프로그래밍이란 ?
					</button>
				</h2>
				<div id="flush-collapse-2" class="accordion-collapse collapse" aria-labelledby="flush-heading-2" data-bs-parent="#accordionFlush">
					<div class="accordion-body">
						자바는 ...
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-heading-3">
					<button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-3" aria-expanded="false" aria-controls="flush-collapse-3">
						스프링이란 ?
					</button>
				</h2>
				<div id="flush-collapse-3" class="accordion-collapse collapse" aria-labelledby="flush-heading-3" data-bs-parent="#accordionFlush">
					<div class="accordion-body">
						자바는 ...
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
