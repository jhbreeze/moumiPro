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
    if(!str || str === "<p><br></p>") {
        alert("내용을 입력하세요. ");
        alert(str);
        f.content.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/board/${mode}";
    return true;
}

<c:if test="${mode=='update'}">
	function deleteFile(num) {
		if( ! confirm("파일을 삭제하시겠습니까 ?") ) {
			return;
		}
		let url = "${pageContext.request.contextPath}/board/deleteFile?num=" + num + "&page=${page}";
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
							<p class="form-control-plaintext">관리자</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="width: 95%; height: 270px;">${dto.content}</textarea>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">카테고리</td>
						<td>
							<select name="category" class="form-select">
								<option value="fashion" ${category=="fashion"?"selected='selected'":""}>패션</option>
								<option value="food" ${category=="food"?"selected='selected'":""}>음식</option>
								<option value="electronic" ${category=="electronic"?"selected='selected'":""}>전자제품</option>
								<option value="car" ${category=="car"?"selected='selected'":""}>자동차</option>
								<option value="cosmetic" ${category=="cosmetic"?"selected='selected'":""}>화장품</option>
								<option value="furniture" ${category=="furniture"?"selected='selected'":""}>가구</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">브랜드명</td>
						<td>
							<input type="text" name="brandName" class="form-control" value="${dto.subject}">
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-success" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! sendOk()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>