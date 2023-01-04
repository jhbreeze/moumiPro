<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<nav class="navbar navbar-expand-lg navbar-green">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
				<img style ="height:35px; width:160px;"src="${pageContext.request.contextPath}/resources/moumi/logo/white.png"/></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto flex-nowrap">
				
					<li class="nav-item">
						<a class="nav-link" href="#">채널별 분석</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" style="color:#fff" href="${pageContext.request.contextPath}/board/list">자유게시판</a>
					</li>
	 
					<li class="nav-item">
						<a class="nav-link" style="color:#fff"  href="${pageContext.request.contextPath}/pay/list">이용권</a>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" style="color:#fff" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							고객센터
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/main">공지사항</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/faq/main">자주 묻는 질문</a></li>
						</ul>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" style="color:#fff"  href="${pageContext.request.contextPath}/recruit/main">채용</a>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link" style="color:#fff" href="${pageContext.request.contextPath}/member/mypage" >마이페이지</a>
					</li>
					
				</ul>
				
				
			</div>
			<div class="d-flex justify-content-end m-0 p-0">
				<c:choose>
				
					<c:when test="${empty sessionScope.member}">
						<div class="p-2">
							<a href="${pageContext.request.contextPath}/member/login" title="로그인"><img style ="height:35px; width:30px;"src="${pageContext.request.contextPath}/resources/images/profile.png"/></a>
						</div>
					</c:when>
					
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.member.userType == 0}">
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><img style ="height:35px; width:30px;"src="${pageContext.request.contextPath}/resources/images/profile.png"/></a>
								</div>
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/admin" title="관리자"><i style="height: 35px; width: 35px;" class="bi bi-gear"></i></a>
								</div>
							</c:when>
							<c:otherwise>	
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><img style ="height:35px; width:30px;"src="${pageContext.request.contextPath}/resources/images/profile.png"/></a>
								</div>
							</c:otherwise>	
						</c:choose>	
					</c:otherwise>
					
				</c:choose>						
			</div>
				
		</div>
	</nav>
	
									