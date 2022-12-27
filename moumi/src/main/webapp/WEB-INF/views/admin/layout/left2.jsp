<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function(){
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");
    
    try {
    	$('nav ul>li>a').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    	if($('nav ul>li>a').hasClass("active_menu")) return false;
    	
    	$('nav ul>.menu--item__has_sub_menu').each(function() {
    		if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
    			$(this).addClass('active_menu');
    			return false;
    		}
    	});
    }catch(e) {
    }
});

$(function(){
	$('nav ul>.menu--item__has_sub_menu ul>li>a').each(function() {
		if($(this).hasClass('active_menu')) {
			$(this).closest(".menu--item__has_sub_menu").addClass('menu--subitens__opened');
			return false;
		}
	});
});
</script>
<style type="text/css">
.menu--label{
color : white
}

.active_menu > .menu--icon, .active_menu > .menu--label {
 background-color: white;
 color: #198754;
}

.navbar-green {
background-color: #198754
}

.menu--icon{
color: white;
}

.menu--subitens__opened > .menu--link, .menu--subitens__opened > .menu--label{
color: #198754;
}
.menu-side{
 `	position: -webkit-sticky;
    position: sticky;
    align-self: flex-end;
    bottom: 0;
    padding : 17px 0;
    }
}
</style>

<header class="header clearfix">
	<button type="button" id="toggleMenu" class="toggle_menu">
		<i class="fa-solid fa-bars"></i>
	</button>
	
	<!-- 헤더 -->
	<div class="header-container" style="background-color: white;">
		<div class="header-left">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<img style ="height:35px; width:160px;"src="${pageContext.request.contextPath}/resources/moumi/logo/green.png"/></a>
		</div>
		<div class="header-right">
			<span class="img" style="background-image: url('${pageContext.request.contextPath}/resources/images/person.png');"></span>
			<span class="roll-user">
				<label class="roll">관리자</label>
				<label class="user">
					<span class="name">관리자 님</span>
					<a href="${pageContext.request.contextPath}/"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
				</label>
			</span>
		</div>
	</div>

</header>

<nav class="vertical_nav navbar-green" style="min-height: 1100px;">
	<ul id="js-menu" class="menu menu-side ">
	
		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin" class="menu--link" title="Home">
				<i class="menu--icon  fa-fw fa-solid fa-house"></i>
				<span class="menu--label">Home</span>
			</a>
		</li>

		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/memberManage/list" class="menu--link" title="회원 관리">
				<i class="menu--icon  fa-fw fa-solid fa-user-group"></i>
				<span class="menu--label">회원 관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/sales/list" class="menu--link" title="매출 관리">
				<i class="menu--icon  fa-fw fa-solid bi-receipt"></i>
				<span class="menu--label">매출 관리</span>
			</a>
		</li>
		
		<li class="menu--item">
	        <a href="${pageContext.request.contextPath}/admin/report/list" class="menu--link" title="분석 리포트 관리">
				<i class="menu--icon  fa-fw fa-solid bi-pen-fill"></i>
				<span class="menu--label">분석 리포트 관리</span>
			</a>
		</li>
	
		<li class="menu--item menu--item__has_sub_menu">
		
			<label class="menu--link" title="공지 사항 관리">
				<i class="menu--icon  fa-fw fa-solid fa-person-circle-question"></i>
				<span class="menu--label">공지사항 관리</span>
			</label>

			<ul class="sub_menu">
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/notice/list" class="sub_menu--link">공지사항</a>
				</li>
				<li class="sub_menu--item">
					<a href="${pageContext.request.contextPath}/admin/faq/main" class="sub_menu--link">자주하는 질문</a>
				</li>
			</ul>
		</li>

		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin/community/list" class="menu--link" title="질문게시판 관리">
				<i class="menu--icon  fa-fw fa-regular bi-patch-question-fill"></i>
				<span class="menu--label">브랜드 커뮤니티 관리</span>
			</a>
		</li>
		
		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin/chatting/list" class="menu--link" title="채팅 관리">
				<i class="menu--icon  fa-fw fa-solid bi-chat-dots-fill"></i>
				<span class="menu--label">채팅 관리</span>
			</a>
		</li>

		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin/comment/list" class="menu--link" title="신고댓글 관리">
				<i class="menu--icon  fa-fw bi-filter-left"></i>
				<span class="menu--label">신고댓글 관리</span>
			</a>
		</li>

		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/admin/event/list" class="menu--link" title="이벤트 관리">
				<i class="menu--icon  fa-fw fa-solid bi-calendar2-event-fill"></i>
				<span class="menu--label">이벤트 관리</span>
			</a>
		</li>

		<li class="menu--item">
			<a href="${pageContext.request.contextPath}/member/logout" class="menu--link" title="Logout">
				<i class="menu--icon fa-fw fa-solid fa-lock-open"></i>
				<span class="menu--label">Logout</span>
			</a>
		</li>
	</ul>

	<button id="collapse_menu" class="collapse_menu">
		<i class="collapse_menu--icon fa fa-fw"></i>
	</button>

</nav>
