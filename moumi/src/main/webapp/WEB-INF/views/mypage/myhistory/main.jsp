<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sideMenu.css"
	type="text/css">

<script type="text/javascript">
	function login() {
		location.href = "${pageContext.request.contextPath}/member/login";
	}

	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status === 403) {
					login();
					return false;
				} else if (jqXHR.status === 400) {
					alert("요청 처리가 실패했습니다.");
					return false;
				}

				console.log(jqXHR.responseText);
			}
		});
	}

	$(function() {
		listPost(1);

		$("button[role='tab']").on("click", function(e) {
			let tab = $(this).attr("aria-controls");

			if (tab === "1") { // 내가 쓴 글
				listPost(1);
			} else if (tab === "2") { // 내가 쓴 댓글
				listReply(1)
			}
		});
	});

	// 글리스트 및 페이징 처리
	function listPost(page) {
		const $tab = $("button[role='tab'].active");

		div = $tab.attr("data-div");

		let url = "${pageContext.request.contextPath}/mypage/myhistory/post";
		let query = "div=" + div + "&pageNo=" + page;
		let selector = "#panel-" + div;

		const fn = function(data) {
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);
	}

	function listReply(page) {
		const $tab = $("button[role='tab'].active");

		div = $tab.attr("data-div");

		let url = "${pageContext.request.contextPath}/mypage/myhistory/reply";
		let query = "div=" + div + "&pageNo=" + page;

		let selector = "#panel-" + div;

		const fn = function(data) {
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);
	}
</script>


	
<nav>
	<ul class="side">
		<li class="side-menu1">마이페이지</li>
		<li class="side-menu2"><a
			href="${pageContext.request.contextPath}/member/pwd">회원 정보 수정</a></li>
		<li class="side-menu3"><a
			href="${pageContext.request.contextPath}/mypage/mypayment/main">이용권
				상세 내역</a></li>
		<li class="side-menu4"><a
			href="${pageContext.request.contextPath}/mypage/mypick/main">관심 글</a>
		</li>
		<li class="side-menu5"><a
			href="${pageContext.request.contextPath}/mypage/myhistory/main">나의
				활동 내역</a></li>
	</ul>
</nav>



<div class="container body-container">
	<div class="body-main mx-auto">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#panel-1" type="button" role="tab" data-div="1"
					aria-controls="1" aria-selected="true">내가 쓴 글</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#panel-2" type="button" role="tab" data-div="2"
					aria-controls="2" aria-selected="true">댓글 단 글</button>
			</li>
		</ul>

		<div class="tab-content pt-2" id="nav-tabContent">
			<div class="tab-pane fade show active" id="panel-1" role="tabpanel"
				aria-labelledby="tab-1"></div>
		</div>

		<div class="tab-content pt-2" id="nav-tabContent2">
			<div class="tab-pane fade show" id="panel-2" role="tabpanel"
				aria-labelledby="tab-2"></div>
		</div>


	</div>
</div>
