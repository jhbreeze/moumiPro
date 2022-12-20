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
		
		
		</div>
	</div>
</div>

