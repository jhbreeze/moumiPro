<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
function deleteOk() {
	let query = "reportNum=${dto.reportNum}&${query}";
	let url = "${pageContext.request.contextPath}/admin/report/delete?" + query;
	location.href = url;
}
</script>

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
	padding-top: 90px;
	padding-left: inherit;
	padding-right: inherit;
	
}

tr {
	font-size: 15px;
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

.text-line{
	text-decoration : none;
	color : green;
}
 .box01{

        height: 300px; 
        position: relative;}
    .box01::before{
        content: "";
        background-image: url('${pageContext.request.contextPath}/uploads/report/${dto.thumbnail}'); 
        background-size: cover;
        width : 100%;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        background-position: center;
    }
    .box01 h1{
    color: green;
    text-align: center;
    line-height: 300px;  
    position: relative;}
.table{
	table-layout : fixed;
}

.btn{
	background-color: #ECF4EB;
	color: #198754;
}
</style>
<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h2>
				분석 리포트
			</h2>
		</div>

		<div class="body-main">
			<table class="table table-borderless">
				<thead>
					<tr>
						<td colspan="3">
							<div class="col lg-img box01" align="center">
								<h1>${dto.subject}</h1>
							</div>
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%" class="col-10">작성자 : 관리자</td>
						<td align="right" class="col-2">${dto.regDate}</td>
						<td align="right" class="col-2">조회수 : ${dto.hitCount}</td>
					</tr>
					
					<tr>
					 <td>
					 	<c:forEach var="vo" items="${listFile}">
							<div class="col-md-auto sm-img">
								<img class="border rounded" src="${pageContext.request.contextPath}/uploads/report/${vo.imageFilename}" style="width: -webkit-fill-available;">
							</div>
						</c:forEach>
					 </td>
					</tr>
					<tr>
						<td colspan="3" valign="top" height="200">${dto.content}</td>
					</tr>
					<tr>
						<td colspan="3">이전글 : <c:if test="${not empty preReadDto}">
							<a href="${pageContext.request.contextPath}/admin/report/article?${query}&reportNum=${preReadDto.reportNum}" class="text-line">${preReadDto.subject}</a>
						</c:if></td>
					</tr>
					<tr>
						<td colspan="3">다음글 : <c:if test="${not empty nextReadDto}">
							<a href="${pageContext.request.contextPath}/admin/report/article?${query}&reportNum=${nextReadDto.reportNum}" class="text-line">${nextReadDto.subject}</a>
						</c:if></td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/report/update?reportNum=${dto.reportNum}&page=${page}';">수정</button>
						<button type="button" class="btn btn-light"
											data-bs-toggle="modal" data-bs-target="#exampleModal">
											삭제 </button>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/report/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">분석 리포트</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">게시글을 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">아니요</button>
									<button type="button" class="btn btn-primary"
										onclick="deleteOk();">예</button>
								</div>
							</div>
						</div>
					</div>
		</div>
	</div>
</div>
