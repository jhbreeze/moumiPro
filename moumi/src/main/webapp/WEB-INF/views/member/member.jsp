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
	padding-bottom: 50px;
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
.btn {
	border-radius: 15px;
	padding-left:5px;
	padding-right:5px;
	background-color: white;
}
</style>


<script type="text/javascript">
function userIdCheck() {
	// 아이디 중복 검사
	let userId = $("#userId").val();

	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		let str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#userId").focus();
		$("#userId").parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/userIdCheck";
	let query = "userId=" + userId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + userId + "</span> 사용할 수 있는 이메일입니다..";
				$(".userId-box").find(".help-block").html(str);
				$("#userIdValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + userId + "</span> 사용할 수 없는 이메일입니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userId").val("");
				$("#userIdValid").val("false");
				$("#userId").focus();
			}
		}
	});
}

</script>



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
				  	<label class="form-label" for="selectEmail">이메일</label>
				  	<div>
				  		<input type="text" name="email" id="email" class="form-control" value="${dto.email}" placeholder="이메일 형식">
				  	</div>
				  	<div class="check">
						<c:if test="${mode=='member'}">
							<button type="button" class="btn btn-outline-success" onclick="userIdCheck();">중복검사</button>
						</c:if>
					</div>
				</div>
				
				<div class="longinputBox">
				  <label class="form-label" for="userName" >비밀번호</label>
				  <input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="영문/숫자/특수문자(8~16자 이상)">
				  <input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="비밀번호 확인">
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="selectEmail">닉네임</label>
				  	<div>
				  		<input type="text" name="email" id="email" class="form-control" value="${dto.email}" placeholder="한글/영문/숫자(3~10자)">
				  	</div>
				  	<div class="check">
						<c:if test="${mode=='member'}">
							<button type="button" class="btn btn-outline-success" onclick="userIdCheck();">중복검사</button>
						</c:if>
					</div>
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="gender">성별</label>
				  	<div>
				  		<input type="checkbox" name="gender" id="gender" class="form-control" value="${dto.email}" placeholder="한글/영문/숫자(3~10자)">
				  	</div>
				  	<div class="check">
						<c:if test="${mode=='member'}">
							<button type="button" class="btn btn-outline-success" onclick="userIdCheck();">중복검사</button>
						</c:if>
					</div>
				</div>
				
				<div class="inputBox">
			        <label class="form-label" for="birth">생년월일</label>
		            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="1990-01-01">
			    </div>
				
				
			</form>
		</div>
	</div>
</div>

