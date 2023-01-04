<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">

<script type="text/javascript">
	function deleteEvent() {
	    if(confirm("이벤트를 삭제 하시겠습니까 ? ")) {
		   	let query = "eventNum=${dto.eventNum}"
		    let url = "${pageContext.request.contextPath}/admin/event/delete?"+query
	    	location.href = url;
	    }
	}
	

	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type:method,
			url:url,
			data:query,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend:function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error:function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert("요청 처리가 실패 했습니다.");
					return false;
				}
		    	
				console.log(jqXHR.responseText);
			}
		});
	}
	
	//페이징 처리
	$(function(){
		listPage(1);
	});

	function listPage(page) {
		let url = "${pageContext.request.contextPath}/admin/event/listReply";
		let query = "eventNum=${dto.eventNum}&pageNo="+page;
		let selector = "#listReply";
		
		const fn = function(data){
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);
	}

</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">

			<h2 style="margin-top: 10px;">
				<i class="fa-sharp fa-solid fa-gift"></i>&nbsp;이벤트 관리
			</h2>
		</div>


		<div class="body-main">

			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">${dto.subject}</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td align="right">등록일 | ${dto.regDate}</td>

					</tr>
					<tr>
						<td width="50%">${dto.startDate}~${dto.endDate}</td>
					</tr>

					<tr>
						<td width="50%">${dto.pickCount}</td>
					</tr>

					<tr>
						<td colspan="2" valign="top" height="200"
							style="border-bottom: none;">${dto.content}</td>
					</tr>

				</tbody>

			</table>

			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%">
						<button type="button" class="btn btn-success"
									onclick="location.href='${pageContext.request.contextPath}/admin/event/update?&eventNum=${dto.eventNum}';">수정</button>
						<button type="button" class="btn btn btn-outline-success"
									onclick="deleteEvent()">삭제</button>	
						
						<c:choose>
							<c:when test="${dto.status == 0 }">
								<button type="button" class="btn btn-success"
								onclick="location.href='${pageContext.request.contextPath}/admin/event/pick?&eventNum=${dto.eventNum}';">추첨</button>
							</c:when>
							<c:when test="${dto.status == 1 }">
								<button type="button" class="btn btn-success"
								onclick="location.href='${pageContext.request.contextPath}/admin/event/pick?&eventNum=${dto.eventNum}';">당첨 결과</button>
							</c:when>
						</c:choose>
						</td>
						
					<td class="text-end">
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/admin/event/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>

		</div>
		<div id="listReply"></div>
	</div>
</div>
