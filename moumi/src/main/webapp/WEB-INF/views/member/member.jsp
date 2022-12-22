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
	color: #767676;
	font-size: 15px;
}
.inputBox {
	margin-left: 50px;
	margin-right: 120px;
	margin-bottom: 10px;
}
.longinputBox {
	margin-left: 50px;
	margin-right: 60px;
	margin-bottom: 10px;
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
	font-size: 15px;
}
.btn-outline-success {
	padding-left:5px;
	padding-right:5px;
	background-color: white;
}
.btn-success {
	margin-top: 20px;
	padding-left:140px;
	padding-right:140px;
}
</style>


<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;

	str = f.userName.value;
    if( !/^[가-힣]{2,10}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.userName.focus();
        return;
    }
	
    str = f.email.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

	str = f.email.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("이메일을 다시 입력 하세요. ");
		f.userId.focus();
		return;
	}

	let mode = "${mode}";
	if(mode === "member" && f.userIdValid.value === "false") {
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#userId").parent().find(".help-block").html(str);
		f.userId.focus();
		return;
	}
	
	str = f.userPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.userPwd.focus();
		return;
	}

	if( str !== f.userPwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd.focus();
        return;
	}

	str = f.userNickname.value;
	if( !str ) {
		alert("닉네임을 입력하세요.");
		f.userNickname.focus();
		return;
	}
	
	str = f.userGender.value;
	if( !str ) {
		alert("성별을 입력하세요.");
		f.userGender.focus();
		return;
	}
	

    str = f.birth.value;
    if( !str ) {
        alert("생년월일를 입력하세요. ");
        f.birth.focus();
        return;
    }
    

   	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
}

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
				  	<div style="width: 400px;">
				  		<input type="text" name="email" id="email" class="form-control" value="${dto.email}" placeholder="이메일 형식" style="width: 280px; display: inline-block;">
						<c:if test="${mode=='member'}">
							<button type="button" class="btn btn-outline-success" onclick="userIdCheck();" style="width: 75px;">중복검사</button>
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
				  	<div style="width: 400px;">
				  		<input type="text" name="email" id="email" class="form-control" value="${dto.email}" placeholder="한글/영문/숫자(3~10자)" style="width: 280px; display: inline-block;">
						<c:if test="${mode=='member'}">
							<button type="button" class="btn btn-outline-success" onclick="userIdCheck();" style="width: 75px;">중복검사</button>
						</c:if>
					</div>
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="gender">성별</label>
				  	<div>
						<label>
		                    <input type="radio" name="gender" value="${dto.gender}"/> 남자 
		                </label>
		                <label>
		                	<input type="radio" name="gender" value="${dto.gender}"/> 여자
		                </label>
				  	</div>
				</div>
				
				<div class="inputBox">
			        <label class="form-label" for="birth">생년월일</label>
		            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="1990-01-01">
			    </div> 
			     
			    <div>
			        <div class="text-center">
			            <button type="button" name="sendButton" class="btn btn-success" onclick="memberOk();"> ${mode=="member"?"회원가입":"정보수정"} </button>
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			    
			</form>
		</div>
	</div>
</div>

