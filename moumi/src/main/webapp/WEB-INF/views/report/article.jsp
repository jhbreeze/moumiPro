<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<div class="container">
		<div class="body-container">
			<div class="body-title">

				<h2 style="margin-top: 10px;">
					<i class="fa-sharp fa-solid fa-gift"></i>&nbsp; MOUMI 분석 리포트
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
							<td colspan="2" valign="top" height="200"
								style="border-bottom: none;">${dto.content}</td>
						</tr>

					</tbody>

				</table>
			</div>
		</div>
	</div>

</body>
</html>