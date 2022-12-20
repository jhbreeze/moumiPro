<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">



.body-container {
	margin-top: 30px;
	max-width: 400px;
	box-shadow: 1px 1px 3px 3px #d8d8d8;
	border-radius: 40px;
	
}
div {
    text-align: center;
}
</style>



<div class="container">
	<div class="body-container">	
		<div class="title">
			<h4 style="font-weight: bold;"> ${mode=="member"?"SIGN UP":"MODIFY"} </h4>
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/signup.png" style="width: 300px;" class="card-img-top">
			</div>	
		</div>
		
		<div class="body-main">
			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="userId">이메일</label>
					<div class="col-sm-10 userId-box">
						<div class="row">
							<div class="col-5 pe-1">
								<input type="text" name="userId" id="userId" class="form-control" value="${dto.userId}" 
										${mode=="update" ? "readonly='readonly' ":""}
										placeholder="아이디">
							</div>
							<div class="col-3 ps-1">
								<c:if test="${mode=='member'}">
									<button type="button" class="btn btn-light" onclick="userIdCheck();">아이디중복검사</button>
								</c:if>
							</div>
						</div>
						<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</small>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

