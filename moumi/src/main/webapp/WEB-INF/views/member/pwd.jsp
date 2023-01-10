<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
.side {
list-style: none;
font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
font-size: 20px;

}
.side-menu1{
position:absolute;
top: 10rem;
left: 15rem;
background: #198754;
width: 9rem;
height: 3rem;
text-align: center;
color: white;
padding-top: 0.5rem;
}
.side-menu2{
position:absolute;
top: 14rem;
left: 15rem;
}
.side-menu2 a{
color: #198754;
font-weight: bold;
text-decoration: none;
}
.side-menu3{
position:absolute;
top: 17rem;
left: 15rem;
}
.side-menu3 a{
text-decoration: none;
color: gray;
}
.side-menu4{
position:absolute;
top: 20rem;
left: 15rem;
}
.side-menu4 a{
text-decoration: none;
color: gray;
}
.side-menu5{
position:absolute;
top: 23rem;
left: 15rem;
}
.side-menu5 a{
text-decoration: none;
color: gray;
}
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.pwd.value.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.pwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/pwd";
	f.submit();
}
</script>
<c:if test="${mode=='update'}">
	<nav>
		<ul class="side">
			<li class="side-menu1">
				마이페이지
			</li>
			<li class="side-menu2">
				<a href="${pageContext.request.contextPath}/member/pwd">회원 정보 수정</a>
			</li>
			<li class="side-menu3">
				<a href="${pageContext.request.contextPath}/mypage/mypayment/main">이용권 상세 내역</a>
			</li>
			<li class="side-menu4">
				<a href="${pageContext.request.contextPath}/mypage/mypick/main">관심 글</a>
			</li>
			<li class="side-menu5">
				<a href="${pageContext.request.contextPath}/mypage/myhistory/main">나의 활동 내역</a>
			</li>
		</ul>
	</nav>
</c:if>
<div class="container">
	<div class="body-container">	

        <div class="row justify-content-md-center">
            <div class="col-md-7">
                <div class="border mt-5 p-4">
                    <form name="pwdForm" method="post" class="row g-3">
                        <h3 class="text-center fw-bold">패스워드 재확인</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="text" name="email" class="form-control form-control-lg" placeholder="이메일"
                            		value="${sessionScope.member.email}" 
                            		readonly="readonly">
                        </div>
                        <div class="d-grid">
                            <input type="password" name="pwd" class="form-control form-control-lg" placeholder="패스워드">
                        </div>
                        <div class="d-grid">
                            <button type="button" class="btn btn-success" onclick="sendOk();">확인 <i class="bi bi-check2"></i> </button>
                            <input type="hidden" name="mode" value="${mode}">
                        </div>
                    </form>
                </div>

                <div class="d-grid">
					<p class="form-control-plaintext text-center">${message}</p>
                </div>
            </div>
        </div>
	        
	</div>
</div>