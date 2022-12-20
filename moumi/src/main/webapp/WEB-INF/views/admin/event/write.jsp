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

				<form name="productForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="table-light col-sm-2">이벤트</td>
							<td><input type="text" name="eventName" class="form-control"></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">할인가</td>
							<td><input type="text" name="price" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">이벤트 시작일</td>
							<td><input type="date" name="statdate" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">이벤트 종료일</td>
							<td><input type="date" name="endDate" class="form-control">
							</td>
						</tr>

						<tr>
							<td class="table-light col-sm-2">이벤트 내용</td>
							<td><textarea name="content" id="ir1" class="form-control"
									style="width: 93%;"></textarea></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">대표 이미지</td>
							<td>
								<div class="thumbnail-viewer"></div> <input type="file"
								name="thumbnailFile" accept="image/*" class="form-control"
								style="display: none;">
							</td>
						</tr>

						<tr>
							<td class="table-light col-sm-2">추가 이미지</td>
							<td>
								<div class="img-grid">
									<img class="item img-add"
										src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								</div> <input type="file" name="addFiles" accept="image/*"
								multiple="multiple" class="form-control" style="display: none;">
							</td>
						</tr>

					</table>

					<table class="table table-borderless">
						<tr>
							<td class="text-center" style="background: white">
								<button type="button" class="btn btn-success"
									onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light"
									onclick="location.href='${pageContext.request.contextPath}/admin/product/main';">${mode=="update"?"수정취소":"등록취소"}</button>
							</td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>

</body>
