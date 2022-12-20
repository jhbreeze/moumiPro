﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">



.body-container {
	margin-top: 30px;
	max-width: 450px;
	box-shadow: 1px 1px 2px 2px #d8d8d8;
	border-radius: 40px;
	
}
.title {
    text-align: center;
}

.signupTitle {
	font-weight: bold;
	font-size: 30px;
}


.form-control {
	border-radius: 15px;
	margin-bottom: 5px;
}

.inputBox {
	margin-left: 50px;
	margin-right: 120px;
	margin-bottom: 10px;
}

.longinputBox {
	margin-left: 50px;
	margin-right: 60px;
}

label {
	color: #767676;
	font-weight: bold;
	margin-left: 10px;
}

.form-label {
	margin-bottom: 3px;
}


.card-img-top {
	margin-top: 25px;
	margin-bottom: 30px;
}

</style>



<div class="container">
	<div class="body-container">	
		<div class="title" >
			<h4 class="signupTitle"> ${mode=="member"?"SIGN UP":"MODIFY"} </h4>
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/signup.png" style="width: 250px; margin-top: 20px;" class="card-img-top">
			</div>	
		</div>
		
		<div class="body-main">
			<form name="memberForm" method="post">
			
				<div class="inputBox">
				  <label class="form-label" for="userName" >이름</label>
				  <input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="한글 (2~10자 이상)">
				</div>
				
				<div class="inputBox">
				  <label class="form-label" for="formGroupExampleInput2">이메일</label>
				  <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="이메일 형식">
				</div>
				
				<div class="longinputBox">
				  <label class="form-label" for="userName" >비밀번호</label>
				  <input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="영문/숫자/특수문자(8~16자 이상)">
				  <input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="비밀번호 확인">
				</div>
				
				
			</form>
		</div>
	</div>
</div>

