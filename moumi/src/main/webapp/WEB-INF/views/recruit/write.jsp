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

</style>

<script type="text/javascript">
function sendOk() {
	const f = document.recruitForm;
	let str;
	
	str = f.subject.value.trim();
	if(! str) {
		alert("공고명을 입력하세요.");
		f.subject.focus();
		return;
	}
	
	str = f.selectCareer.value; // option값 선택하지 않았을 때
	if(! str){
		alert("구분을 선택하세요.");
		return;
	}
	
	str = f.corporation.value; 
	if(! str){
		alert("회사명을 입력하세요.");
		f.corporation.focus();
		return;
	}
	
	str = f.email.value; 
	if(! str){
		alert("이메일을 입력하세요.");
		f.email.focus();
		return;
	}
	
	// 모집기간 설정 
	
	
	str = f.content.value; 
	if(! str){
		alert("내용을 입력하세요.");
		f.content.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/recruit/${mode}";
    f.submit();
	
}


</script>


<div class="container body-container">
    <div class="body-main mx-auto">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">공고 등록 | 수정</a></li>
		</ul>
		
		<form name="recruitForm" method="post">
				<table class="table mt-5 recruit-table">
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">공고명</td>
						<td colspan="3">
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
        
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">구분</td>
 						<td colspan="3">
							<select name="selectCareer" id="selectCareer" class="form-select">
								<option value="">: : 선택 : :</option>
								<option value="1" ${dto.career=="1" ? "selected='selected'" : ""}>인턴</option>
								<option value="2" ${dto.career=="2" ? "selected='selected'" : ""}>신입</option>
								<option value="3" ${dto.career=="3" ? "selected='selected'" : ""}>경력3년 이하</option>
								<option value="4" ${dto.career=="4" ? "selected='selected'" : ""}>경력5년 이하</option>
								<option value="5" ${dto.career=="5" ? "selected='selected'" : ""}>경력7년 이하</option>
								<option value="6" ${dto.career=="6" ? "selected='selected'" : ""}>경력7년 이상</option>
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
							<label>모집시작일</label>
							<input type="date" name="startDate" id="startDate" class="form-control" value="${dto.startDate}">
						</td>
						 <td >&nbsp;~&nbsp; </td>
						 <td>
						 	<label>모집마감일</label>
							<input type="date" name="endDate" id="endDate" class="form-control" value="${dto.endDate}">
						</td>
					</tr>
					
					
					<tr>
						<td class="col-sm-2 align-middle text-center" scope="row">내용</td>
						<td colspan="3">
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
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
							<button type="button" class="btn btn-success" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
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