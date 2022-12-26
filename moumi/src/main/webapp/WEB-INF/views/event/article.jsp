<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<div class="container">
	<div class="body-container">
		<div class="body-title">

			<h2 style="margin-top: 10px;">
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp; MOUMI 이벤트
			</h2>
		</div>


		<div class="body-main">

			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">${dto.subject}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td align="right">등록일 | ${dto.regDate}</td>

					</tr>
					<tr>
						<td width="50%">${dto.startDate}~${dto.endDate}</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">${dto.content}</td>
					</tr>

				</tbody>

			</table>
			<div class="reply">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">댓글</span>
						<span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
					</div>

					<table class="table table-borderless reply-form">
						<tr>
							<td><textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td align='right'>
								<button type='button' class='btn btn-success btnSendReply'>댓글 등록</button>
							</td>
						</tr>
					</table>
				</form>

				<div id="listReply"></div>
			</div>

		</div>
	</div>
</div>