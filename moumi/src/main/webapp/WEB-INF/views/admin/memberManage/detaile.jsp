<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 회원 정보</h3>
<table class="table td-border mx-auto my-10" style="width: 99%;">
	<tr>
		<td class="wp-15 text-center ">회원번호</td>
		<td class="wp-35 ps-5">${dto.userCode}</td>
		<td class="wp-15 text-center ">아이디</td>
		<td class="wp-35 ps-5">${dto.email}</td>
	</tr>
	<tr>
		<td class="text-center ">이 름</td>
		<td class="ps-5">${dto.userName}</td>
		<td class="text-center ">닉네임</td>
		<td class="ps-5">${dto.nickName}</td>
	</tr>
	<tr>
		<td class="text-center ">회원유형</td>
		<td class="ps-5">
			<c:if test="${dto.userType == 0}">
				관리자
			</c:if>
			<c:if test="${dto.userType == 1}">
				일반회원
			</c:if> 
			<c:if test="${dto.userType == 2}">
				유료회원
			</c:if>
			<c:if test="${dto.userType == 3}">
				기업회원
			</c:if>  
		</td>
		<td class="text-center ">구독상태</td>
		<td class="ps-5"> 
		<c:choose>
			<c:when test="${dto.endDate == null || dto.endDate < today}">
				미구독
			</c:when>
			<c:otherwise>
				구독
			</c:otherwise>
		</c:choose>
		&nbsp;<span class="btn" onclick="memberStateDetaileView2();" style="cursor: pointer;">자세히</span>
		</td>
	</tr>
	<tr>
		<td class="text-center ">회원가입일</td>
		<td class="ps-5">${dto.regDate}</td>
		<td class="text-center">성별</td>
		<td class="ps-5">${dto.gender}</td>
	</tr>
	
	<tr>
		<td class="text-center ">계정상태</td>
		<td colspan="3" class="ps-5">
			${dto.enabled==1?"활성":"잠금"}
			<c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			&nbsp;<span class="btn" onclick="memberStateDetaileView();" style="cursor: pointer;" id="btn">자세히</span>
		</td>
	</tr>
</table>

<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
	<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 유저 상태 변경</h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td class="wp-15 text-center bg-light">계정상태</td>
			<td class="ps-5">
				<select class="form-select change" name="stateCode" id="stateCode" onchange="selectStateChange()" style="width: auto; background-color: #ECF4EB; color: #198754;">
					<option value="">상태코드</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="2">불법적인 방법으로 로그인</option>
					<option value="3">불건전 게시물 등록</option>
					<option value="4">다른 유저 비방</option>
					<option value="5">타계정 도용</option>
					<option value="6">기타 약관 위반</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-light">메 모</td>
			<td class="ps-5">
				<input type="text" name="memo" id="memo" class="form-control" style="width: 95%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="userCode" value="${dto.userCode}">
	<input type="hidden" name="email" value="${dto.email}">
	<input type="hidden" name="registerCode" value="${sessionScope.member.userCode}">
</form>

<div id="memberStateDetaile" style="display: none;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr id="tabled">
				<th>내용</th>
				<th width="130">담당자</th>
				<th width="200">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr>
					<td class="ps-5">${vo.memo} (${vo.stateNum})</td>
					<td class="text-center">${vo.registerCode}</td>
					<td class="text-center">${vo.register_date}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>

<div id="memberSubDetaile" style="display: none;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr style="background-color: #ECF4EB;">
				<th>내용</th>
				<th width="130">담당자</th>
				<th width="200">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listSub}">
				<tr>
					<td class="text-center">${dto.startDate} ~ ${dto.endDate}</td>
					<td class="text-center">${vo.payDate}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listSub.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>
