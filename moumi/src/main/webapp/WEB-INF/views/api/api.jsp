<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript"
	src="http://api.nongsaro.go.kr/js/framework.js"></script>
<script type="text/javascript"
	src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>

<script type="text/javascript">
	nongsaroOpenApiRequest.apiKey = "20221216AK1MXVA9FRV2EBTZJ6GZ1G";
	nongsaroOpenApiRequest.serviceName = "areaBrand";
	nongsaroOpenApiRequest.operationName = "selectSclCodeLst";
	nongsaroOpenApiRequest.htmlArea = "nongsaroApiLoadingArea";
	nongsaroOpenApiRequest.callback = "http://localhost:9090/app/call/ajax_local_callback.jsp";
</script>

<div class="container body-container">
	<div class="inner-page">
		<br> <br> <br>

		<div class="container text-center">

			<div class="container">
				<p class="title">우리 농가 살리기</p>


				<div id="nongsaroApiLoadingArea"></div>
				<div id="nongsaroApiLoadingAreaResult"></div>

				<br> <br>
			</div>

			<div id="map" class="map"></div>

		</div>
	</div>
</div>


