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


</style>

<div class="container body-container modal" id="chatModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false" 
		aria-labelledby="chatModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    	<div class="modal-content">
    		<div class="modal-header">
		    	<button type="button" class="btn chatBtn btn-lg shadow" id="chatViewerModalLabel">문의하기
		    		<img style="height: 50px; width: 60px;" src="${pageContext.request.contextPath}/resources/moumi/logo/circle.png">
		    	</button>
    		</div>
    	</div>
    </div>
</div>