<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}


.recruit-table tr>td:first-child{
	background-color: #ECF4EB;
	font-weight: 600;
	font: #545454;
}

.r-date { align-items: center; }

</style>
<script type="text/javascript">
function check() {
	const f = document.recruitForm;
	let str;
	
	str = f.subject.value.trim();
	if(! str) {
		alert("공고명을 입력하세요.");
		f.subject.focus();
		return false;
	}
	
	str = f.categoryNum.value;
	if(! str){
		alert("구분을 선택하세요.");
		return false;
	}
	
	str = f.corporation.value.trim(); 
	if(! str){
		alert("회사명을 입력하세요.");
		f.corporation.focus();
		return false;
	}
	
	str = f.email.value.trim(); 
	if(! str){
		alert("이메일을 입력하세요.");
		f.email.focus();
		return false;
	}
	
	str = f.startDate.value;
	if(! str){
		alert("모집시작일을 선택하세요.");
		f.startDate.focus();
		return false;
	}
	
	str = f.endDate.value;
	if(! str){
		alert("모집마감일을 선택하세요.");
		f.endDate.focus();
		return false;
	}
	
	// 마감일부터 입력하고 시작일 입력하는 경우, 서버로 전송할 때 check
	sDate = f.startDate.value;
	eDate = f.endDate.value;
	if( sDate > eDate ) {
		alert("마감일은 모집 시작일 이후로 설정해야 합니다.^^");
		return false;
	}
	
	str = f.content.value.trim(); 
	if(! str || str === "<p><br></p>") {
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/recruit/${mode}";
    return true;
	
}

function compareDate(){
	let startDate = $("input[name=startDate]").val();
	let endDate = $("input[name=endDate]").val(); // yyyy-mm-dd 형식으로 반환 
	
	// 조건 1) 마감일은 모집 시작일 이후
	if(startDate > endDate) { // 마감일이 시작일보다 이전의 경우
		alert("마감일은 모집 시작일 이후로 설정해야 합니다.");
		document.getElementById("endDate").value = ""; // 값 초기화
	}
	
	// 조건 2) 마감일은 현재 날짜 이후
	let day = new Date();
	let today = getToday(day);
	
	if(today >= endDate) { // 마감일이 현재 날짜보다 이전의 경우
		alert("마감일은 오늘 이후로 설정 가능합니다.");
		document.getElementById("endDate").value = ""; // 값 초기화
	}
}

function getToday(day){
	// 현재 날짜 구하기 : 'yyyy-mm-dd' 형식으로 변환
	let today1 = new Date();
	let year = today1.getFullYear();
	let month = today1.getMonth()+1;
	let date = today1.getDate();
	
	let today = year + "-" + month + "-" + date; 
	return today;
}

</script>


<div class="container body-container">
    <div class="body-main mx-auto">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">공고 등록 | 수정</a></li>
		</ul>
		
		<form name="recruitForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 recruit-table border-top">
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">공고명</td>
						<td colspan="3">
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">구분</td>
 						<td colspan="3">
							<select name="categoryNum" id="categoryNum" class="form-select" style="width: 25%;">
								<option value="">: : 선택 : :</option>
								<c:forEach var="vo" items="${listCategory}">
									<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum? "selected='selected'" : ""}>${vo.career}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">회사명</td>
						<td colspan="3">
							<input type="text" name="corporation" class="form-control" value="${dto.corporation}">
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">접수 이메일</td>
						<td colspan="3">
							<input type="text" name="email" class="form-control" value="${dto.email}">
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">모집 기간</td>
						<td>
							<div class="d-flex r-date">
								<label class="ms-2">모집 시작일</label>
								<input type="date" name="startDate" id="startDate"
									class="form-control ms-3" style="width: 60%" value="${dto.startDate}">
							</div>
						</td>
						 <td class="align-middle">&nbsp;~&nbsp; </td>
						 <td>
							<div class="d-flex r-date">
						 		<label class="ms-2">모집 마감일</label>
								<input type="date" name="endDate" id="endDate" class="form-control ms-3" 
								style="width: 60%" value="${dto.endDate}" onchange="compareDate();">
							</div>
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">내용</td>
						<td colspan="3">
							<textarea class="form-control" name="content" id="ir1" style="width: 93%;">
								${dto.content}
							</textarea> 
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">파일첨부</td>
						<td class="recruit-file" colspan="4">
							<input type="file" name="selectFile" class="form-control">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-success" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-success">다시입력</button>
							<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/recruit/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="size" value="${size}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
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
		if(! check()) {
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