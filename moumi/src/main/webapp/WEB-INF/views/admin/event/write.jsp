<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style type="text/css">
tr td:first-child {
	background: #ECF4EB;
	text-align: center;
}
</style>


<script type="text/javascript">
function check() {
	const f = document.eventForm;
	let str;

	if(! f.subject.value) {
		alert("이벤트명을 입력해주세요.");
		f.subject.focus();
		return false;
	}
	
	if(! f.content.value) {
		alert("내용 입력해주세요.");
		f.content.focus();
		return false;
	}
	
	
	if(! f.thumbnailFile.value) {
		alert("대표 이미지를 등록하세요.");
		f.thumbnailFile.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/event/${mode}";
	return true;
}
</script>


<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/event/"+img;
		$(".write-form .thumbnail-viewer").empty();
		$(".write-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .thumbnail-viewer").click(function(){
		$("form[name=eventForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=eventForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".write-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/event/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".write-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".write-form .thumbnail-viewer").empty();
			$(".write-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});


</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">

<body>
	<div class="container">
		<div class="body-container">
			<div class="body-title">

				<h2 style="margin-top: 10px;">
					<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
				</h2>
			</div>
			<div class="body-main">

				<form name="eventForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="table-light col-sm-2">이벤트</td>
							<td><input type="text" name="subject" value="${dto.subject}" class="form-control"
								style="width: 93%;">
						</tr>
						<tr>
							<td class="table-light col-sm-2">할인가</td>
							<td><input type="text" name="price"  value="${dto.price}" class="form-control"
								style="width: 93%;"></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">이벤트 시작일</td>
							<td><input type="date" name="startDate" value="${dto.startDate}" class="form-control"
								style="width: 93%;"></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">이벤트 종료일</td>
							<td><input type="date" name="endDate" value="${dto.endDate}" class="form-control"
								style="width: 93%;"></td>
						</tr>

						<tr>
							<td class="table-light col-sm-2">이벤트 내용</td>
							<td><textarea name="content"  id="ir1" class="form-control" style="width: 93%;"></textarea></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">대표이미지</td>
							<td>
								<div class="thumbnail-viewer"></div> 
								<input type="file"name="thumbnailFile"  accept="image/*" class="form-control">
							</td>
						</tr>
					</table>

					<table class="table table-borderless">
						<tr>
							<td class="text-center" style="background: white">
								<button type="button" class="btn btn-success"
									onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="btn btn btn-outline-success">다시입력</button>
								<button type="button" class="btn btn btn-outline-success" 
								onclick="location.href='${pageContext.request.contextPath}/admin/event/list';">${mode=="update"?"수정취소":"등록취소"}</button>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>

</body>

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
