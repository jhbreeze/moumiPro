<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	margin-top: 30px;
	max-width: 450px;
	box-shadow: 1px 1px 2px 2px #d8d8d8;
	border-radius: 40px;
	padding-bottom: 20px;
	text-align: center;
}
.title {
    text-align: center;
}
.loginTitle {
	font-weight: bold;
	font-size: 30px;
}
.form-control {
	border-radius: 13px;
	margin-bottom: 10px;
	font-size: 14px;
	width: 300px;
}
.inputBox {
	margin-top: 30px;
	margin-left: 75px;
}
.btn {
	border-radius: 13px;
	font-size: 14px;
}
.login {
	margin-top: 20px;
	padding-left:125px;
	padding-right:125px;
	font-weight: bold;
}

</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.email.value.trim();
    if(!str) {
        f.email.focus();
        return;
    }

    str = f.pwd.value.trim();
    if(!str) {
        f.pwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		
		<div class="title" >
			<h4 class="loginTitle"> LOGIN </h4>
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/signup.png" style="width: 250px; margin-top: 20px;" class="card-img-top">
			</div>	
		</div>
        <form name="loginForm" action="" method="post" class="loginf">
            <div class="inputBox">
                <input type="text" name="email" class="form-control" placeholder="&nbsp;이메일">
                <input type="password" name="pwd" class="form-control" autocomplete="off" 
                	placeholder="&nbsp;비밀번호">
            </div>
            <div>
                <button type="button" class="login btn btn-success m-1" onclick="sendLogin();">로 그 인</button>
            </div>
        </form>
        <hr class="mt-4" >
            <p class="text-center mb-0">
            	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
            </p>

        <div class="d-grid">
			<p class="form-control-plaintext text-center text-primary">${message}</p>
     	</div>


	</div>
</div>