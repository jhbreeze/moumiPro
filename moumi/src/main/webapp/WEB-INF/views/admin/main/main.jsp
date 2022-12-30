<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.0/echarts.min.js"></script>

<div class="body-container">
    <div class="body-main">
    	<div class="row g-1 mt-4 p-1">
			<div class="col p-2">
				<div class="fs-6 fw-semibold mb-2"><i class="bi bi-chevron-right"></i> 오늘 판매 현황</div>
				<div class="border rounded p-5 text-center">
					<div class="fs-5 mb-2">총 판매 건수 : 
						<span class="product-totalAmount fw-semibold text-primary">${today.COUNT}</span><!-- 오라클에서만 대문자로 보냄. console.log로 꼭 확인해볼것 -->
					</div>
					<div class="fs-5">총 판매 금액 : 
						<span class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber value="${today.TOTAL}"/></span>원
					</div>
				</div>
			</div>
		</div>
	</div>
</div>