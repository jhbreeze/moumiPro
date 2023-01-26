<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	text-align: center;
	margin-bottom: 150px;
}

.welcome {
	font-size: 20px;
	font-weight: bold;
	letter-spacing: -1px;
	margin-top: 10px;
}
.ment {
	margin-top: 15px;
	font-size: 13px;
	font-weight: 500;
	letter-spacing: -1px;

}
.btn {
	border-radius: 0px;
	padding: 10px 50px;
	font-size: 13px;
	font-weight: 600;
}
.main:hover {
	background-color: white;
	color: green;
}

</style>

<div class="container">
	<div class="body-container">	
		<div>
			<img src="${pageContext.request.contextPath}/resources/images/complete.png" style="width: 300px; margin-top: 20px;" class="card-img-top">
		</div>	
        <div class="cong">
        	<h4 class="welcome">${title}</h4>
            
			<p class="ment">회원가입이 완료되었습니다</p>
                   
	        <div class="button">
	            <button type="button" class="main btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/';">메인화면</button>
	            <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/member/login';">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
	        </div>
        </div>
	        
	</div>
</div>