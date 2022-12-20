<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    const f = document.boardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/bbs/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(num) {
		if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
			return;
		}
		let url = "${pageContext.request.contextPath}/bbs/deleteFile?num=" + num + "&page=${page}";
		location.href = url;
	}
</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-dots"></i>&nbsp;&nbsp;브랜드 커뮤니티</h3>
		</div>
		
		<div class="body-main">
		
			<form name="boardForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="table-light col-sm-2" scope="row">닉네임</td>
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
						<td class="table-light col-sm-2">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
						<td> 
							<input type="file" name="selectFile" class="form-control">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">카테고리</td>
						<td>
							<select name="brand-category" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>나이키</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>삼성</option>
								<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>애플</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>디스커버리</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>구찌</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">브랜드명(기타)</td>
						<td>
							<input type="text" name="brand" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<tr>
							<td class="table-light col-sm-2" scope="row">첨부된파일</td>
							<td> 
								<p class="form-control-plaintext">
									<c:if test="${not empty dto.saveFilename}">
										<a href="javascript:deleteFile('${dto.num}');"><i class="bi bi-trash"></i></a>
										${dto.originalFilename}
									</c:if>
									&nbsp;
								</p>
							</td>
						</tr>
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-success" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
								<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>