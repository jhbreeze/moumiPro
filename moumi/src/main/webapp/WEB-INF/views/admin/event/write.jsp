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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">

</head>
<body>
	<div class="container">
		<div class="body-container">
			<div class="body-main">

				<form name="productForm" method="post" enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="table-light col-sm-2">상품명</td>
							<td><input type="text" name="productName"
								class="form-control"></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">가격</td>
							<td><input type="text" name="price" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">상품설명</td>
							<td><textarea name="content" id="ir1" class="form-control"
									style="width: 93%;"></textarea></td>
						</tr>
						<tr>
							<td class="table-light col-sm-2">대표이미지</td>
							<td>
								<div class="thumbnail-viewer"></div> <input type="file"
								name="thumbnailFile" accept="image/*" class="form-control"
								style="display: none;">
							</td>
						</tr>

						<tr>
							<td class="table-light col-sm-2">추가이미지</td>
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
							<td class="text-center">
								<button type="button" class="btn btn-dark"
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
</html>