<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-main {
	max-width: 800px;
}

.chatBtn { 	
	background-color: #ECF4EB;
	font-weight: 600;
	border: none;
	border-radius: 15px;
	
}

.chatBtn:hover {
	background-color: #ECF4EB;
	font-weight: 600;
}

</style>

<div class="container body-container">
    <div>
    	<button type="button" class="btn chatBtn btn-lg shadow">문의하기
    		<img style="height: 50px; width: 50px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle.png">
    	</button>
    
    
    </div>
</div>