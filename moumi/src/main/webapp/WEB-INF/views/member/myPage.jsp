﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
	max-height: 600px;
}
.title {
	font-weight: bold;
}
.row {
	width: 910px;
	height: 200px;
	margin-bottom: 10px;
}
.lbox {
	width: 600px;
	margin-right: 10px;
	background-color: #ECF4EB;
	border-radius: 8px;
}
.sbox {
	width: 300px;
	background-color: #ECF4EB;
	border-radius: 8px;
}
</style>





<div class="container">
	<div class="body-container">
		<h5 class="title"> MY PAGE </h5>
		
		<div class="body-main">
			<form name="memberForm" method="post">
			
			<div class="container">
				<div class="row">
					<div class="lbox">
						col1
					</div>
				
					<div class="sbox">
						col2
					</div>
				</div>	
	
				<div class="row">
					<div class="lbox">
						col3
					</div>
				
					<div class="sbox">
						col4
					</div>
				</div>	
			</div>	
			
			</form>
		</div>
	</div>
</div>

