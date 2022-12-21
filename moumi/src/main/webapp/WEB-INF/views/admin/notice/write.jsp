<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<h3><i class="bi bi-clipboard"></i> 공지사항 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="noticeForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">공지여부</td>
						<td class="py-3">
							<input type="checkbox" name="notice" id="notice" class="form-check-input" value="1" ${dto.notice==1 ? "checked='checked' ":"" } >
							<label class="form-check-label" for="notice"> 공지</label>
						</td>
					</tr>        
        
					<tr>
						<td class="table-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">첨 부</td>
						<td> 
							<input type="file" name="selectFile" multiple="multiple" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr id="f${vo.fileNum}">
								<td class="table-light col-sm-2" scope="row">첨부된파일</td>
								<td> 
									<p class="form-control-plaintext">
										<a href="javascript:deleteFile('${vo.fileNum}');"><i class="bi bi-trash"></i></a>
										${vo.originalFilename}
									</p>
								</td>
							</tr>
						</c:forEach> 
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
