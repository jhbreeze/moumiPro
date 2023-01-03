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
	border-radius: 13px;
	margin-bottom: 5px;
	font-size: 14px;
	width: 270px;
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
	border-radius: 13px;
	font-size: 14px;
}
.duplication {
	padding-left:5px;
	padding-right:5px;
	background-color: white;
}
.signUp {
	margin-top: 20px;
	padding-left:140px;
	padding-right:140px;
}
.division1 {
	width: 450px;
	text-align: center;
	padding: 0px;
	margin-bottom: 10px;
}
.userType {
	font-size: 13px;
	border-radius: 10px;
	width: 170px;
	margin-left: 0px;
	padding: 7px;
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
        f.email.focus();
        return;
    }

	str = f.email.value;
	if( !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(str) ) { 
		alert("이메일을 다시 입력 하세요. ");
		f.email.focus();
		return;
	}

	let mode = "${mode}";
	if(mode === "member" && f.emailValid.value === "false") {
		str = "이메일 중복 검사가 실행되지 않았습니다.";
		$("#email").parent().find(".help-block").html(str);
		f.email.focus();
		return;
	}
	
	str = f.pwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{8,16}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.pwd.focus();
		return;
	}

	if( str !== f.pwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.pwd2.focus();
        return;
	}

	str = f.nickName.value;
	if( !str ) {
		alert("닉네임을 입력하세요.");
		f.nickName.focus();
		return;
	}
	
	str = f.nickName.value;
    if( !/^[가-힣a-zA-z0-9]{3,10}$/.test(str) ) {
        alert("닉네임을 다시 입력하세요. ");
        f.nickName.focus();
        return;
    }

	
	if (!female.checked && !male.checked) {
	    alert("성별을 체크해 주세요.");
		f.female.focus();
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

function emailCheck() {
	// 아이디 중복 검사
	let email = $("#email").val();

	if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email)) { 
		let str = "이메일 주소가 올바르지 않습니다.";
		$("#email").focus();
		$("#email").parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/emailCheck";
	let query = "email=" + email;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + email + "</span> 사용할 수 있는 이메일입니다.";
				$(".email-box").find(".help-block").html(str);
				$("#emailValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + email + "</span> 사용할 수 없는 이메일입니다.";
				$(".email-box").find(".help-block").html(str);
				$("#email").val("");
				$("#emailValid").val("false");
				$("#email").focus();
			}
		}
	});
}

function nickNameCheck() {
	// 아이디 중복 검사
	let nickName = $("#nickName").val();

	if(!/^[가-힣a-zA-z0-9]{3,10}$/i.test(nickName)) { 
		let str = "특수문자와 공백은 사용할 수 없습니다.";
		$("#nickName").focus();
		$("#nickName").parent().find(".help-block").html(str);
		return;
	}
	
	let url = "${pageContext.request.contextPath}/member/nickNameCheck";
	let query = "nickName=" + nickName;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + nickName + "</span> 사용 가능한 닉네임입니다.";
				$(".nickName-box").find(".help-block").html(str);
				$("#nickNameValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + nickName + "</span> 사용할 수 없는 닉네입입니다.";
				$(".nickName-box").find(".help-block").html(str);
				$("#nickName").val("");
				$("#nickNameValid").val("false");
				$("#nickName").focus();
			}
		}
	});
}

$(function(){
	let userType = "${dto.userType}";
	if(userType==="3") {
		$("#userType3").prop("checked", true);
	}
	
	let gender = "${dto.gender}";
	if(gender==="여자") {
		$("#female").prop("checked", true);
	}
	
	
});



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
				
				<div class="division1" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="userType" id="userType1" checked="checked" value="1" ${mode=="update" ? "onclick=return(false);":""}>
				  <label class="userType btn btn-outline-success" for="userType1">개인 회원</label>
				
				  <input type="radio" class="btn-check" name="userType" id="userType3" value="3" ${mode=="update" ? "onclick=return(false);":""}>
				  <label class="userType btn btn-outline-success" for="userType3">기업 회원</label>
				
				</div>
				
				<div class="inputBox">
					<label class="form-label" for="userName" >이름</label>
				  	<input type="text" name="userName" id="userName" class="form-control"  value="${dto.userName}" 
				  			${mode=="update" ? "readonly='readonly' ":""} placeholder="한글 (2~10자 이상)">
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="email">이메일</label>
				  	<div class="email-box" style="width: 400px;">
				  		<input type="text" name="email" id="email" class="form-control" value="${dto.email}" ${mode=="update" ? "readonly='readonly' ":""} placeholder="이메일 형식" style="width: 270px; display: inline-block;">
						<c:if test="${mode=='member'}">
							<button type="button" class="duplication btn btn-outline-success" onclick="emailCheck();" style="width: 75px;">중복검사</button>
						</c:if>
						<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block"></small>
						</c:if>
					</div>
				</div>
				
				<div class="longinputBox">
				  <label class="form-label" for="pwd" >비밀번호</label>
				  <input type="password" name="pwd" id="pwd" class="form-control"  autocomplete="off" placeholder="영문/숫자/특수문자(8~16자 이상)">
				  <input type="password" name="pwd2" id="pwd2" class="form-control"  autocomplete="off" placeholder="비밀번호 확인">
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="nickName">닉네임</label>
				  	<div class="nickName-box" style="width: 400px;">
				  		<input type="text" name="nickName" id="nickName" class="form-control" value="${dto.nickName}" placeholder="한글/영문/숫자(3~10자)" style="width: 270px; display: inline-block;">
						<c:if test="${mode=='member'}">
							<button type="button" class="duplication btn btn-outline-success" onclick="nickNameCheck();" style="width: 75px;">중복검사</button>
						</c:if>
						<c:if test="${mode=='member'}">
							<small class="form-control-plaintext help-block"></small>
						</c:if>
					</div>
				</div>
				
				<div class="inputBox">
				  	<label class="form-label" for="gender">성별</label>
				  	<div>
						<label>
		                    <input type="radio" name="gender" value="남자" id="male" > 남자 
		                </label>
		                <label>
		                	<input type="radio" name="gender" value="여자" id="female"> 여자
		                </label>
				  	</div>
				</div>
				
				<div class="inputBox">
			        <label class="form-label" for="birth">생년월일</label>
		            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="1990-01-01">
			    </div> 
			     
			    <div>
			        <div class="text-center">
			            <button type="button" name="sendButton" class="signUp btn btn-success" onclick="memberOk();"> ${mode=="member"?"회 원 가 입":"정 보 수 정"} </button>
						<input type="hidden" name="emailValid" id="emailValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			    
			</form>
		</div>
	</div>
</div>

