<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">


<div class="container">
	<div class="body-container">
		<div class="body-title">

			<h2 style="margin-top: 10px;">
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
			</h2>
		</div>


		<div class="body-main">
			<div>
				<img 
					src="${pageContext.request.contextPath}/resources/images/moumi/pick.png"
					style="width: 300px; margin-top: 20px; margin: auto;  display: block;" class="card-img-top" >
			</div>
			<div class="cong">

				<table class="table">
					<thead>
						<tr>
							<th scope="col">회원 코드</th>
							<th scope="col">닉네임</th>
							<th scope="col">사용자 이름</th>
							<th scope="col">이메일<th>
							
						</tr>
					</thead>
					<c:forEach var="dto" items="${listWinner}" varStatus="status">
						<tbody>
							<tr>
								<td>${dto.userCode}</td>
								<td>${dto.nickName}</td>
								<td>${dto.userName}</td>
								<td>${dto.email}</td>
							</tr>
						</tbody>

					</c:forEach>
				</table>


				<div class="button" align="center" >
					<button type="button" class="main btn btn-outline-success"
						onclick="location.href='${pageContext.request.contextPath}/admin/event/article?&eventNum=${dto.eventNum}';">이벤트로
						돌아가기</button>
					<button type="button" class="btn btn-success"
						onclick="location.href='${pageContext.request.contextPath}/admin/event/list';">&nbsp;&nbsp;이벤트
						목록&nbsp;&nbsp;</button>
				</div>
			</div>

		</div>
	</div>
</div>