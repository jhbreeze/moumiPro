<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.searchBackGround {
	background: #ECF4EB;
}

.searchMainLayout {
	background: #ECF4EB;
	width: 100%;
	height: 2200px;
}

.chooseInfoBox {
	width: 100%;
	height: 60px;
}

.chooseDate {
	padding: 20px;
	margin-left: 40px;
}

.chooseSNS {
	width: 600px;
	height: 60px;
	padding: 20px;
	margin: 0 auto;
	font-size: 16px;
}

.layoutSNS {
	width: 455px;
	height: 635px;
	background: white;
	border-radius: 15px;
	margin: 3px;
	padding: 50px;
	border-radius: 15px;
}

.layoutChannel {
	width: 400px;
	height: 120px;
	border-radius: 15px;
	margin-right: 4px;
	margin-left: 10px;
	background: white;
	padding: 5px;
}

.channelContent {
	width: 300px;
	height: 100px;
	margin: 0 auto;
	justify-content: center;
	font-size: 16px;
	font-weight: 700;
}

.channelImg {
	margin-left: 19px;
}

.layoutMention {
	width: 811px;
	height: 500px;
	border-radius: 15px;
	margin-top: 15px;
	margin-bottom: 15px;
	padding: 50px;
	background: white;
}

.layoutYoutube {
	width: 1295px;
	height: 200px;
	border-radius: 15px;
	background: white;
	margin-left: 15px;
}

.customInputDate {
	border: 1px solid #198754;
	width: 150px;
	height: 30px;
	border-radius: 30px;
	padding: 12px;
}
</style>


<div class="chooseInfoBox">
	<div class="container">
		<div class="row">

			<div class="col">
				<div class="chooseDate">
					시작일&nbsp;<input type="date" class="customInputDate">&nbsp;종료일&nbsp;<input
						type="date" class="customInputDate">

				</div>
			</div>

			<div class="col">
				<div class="chooseSNS">

					<div class="container">
						<div class="row">
							<div class="col">
								<div class="form-check form-switch ">
									<input class="form-check-input btn btn-outline-danger"
										type="checkbox" role="switch" id="flexSwitchCheckDefault">
									<div class="row">
										<label class="form-check-label labelSNS"
											for="flexSwitchCheckDefault">유튜브</label>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-warning"
										type="checkbox" role="switch" id="flexSwitchCheckChecked"
										checked>
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">인스타</label>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-success"
										type="checkbox" role="switch" id="flexSwitchCheckDisabled">
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">블로그</label>
									</div>
								</div>


							</div>

							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-info"
										type="checkbox" role="switch"
										id="flexSwitchCheckCheckedDisabled" checked>
									<div class="row">
										<label class="form-check-label" for="flexSwitchCheckChecked">트위터</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</div>


<div class="searchMainLayout">
	<div class="container body-container">
		<div class="inner-page">
			<div class="row">
				<div class="col">
					<div class="layoutSNS">
					
						<c:forEach var="dto" items="${list}" varStatus="status">
								<div class="col-lg-4 col-sm-3">
											<p class="eventName">${dto.sns}
											<p class="term">${dto.date}></p>
											<p class="term">${dto.content}></p>
											<p class="term">${dto.url}></p>
											
										</div>
									
						</c:forEach>
					
					
					
					
					</div>
				</div>
				<div class="col">
					<div class="row">
						<div class="layoutChannel">
							<p class="channelContent">
								언급량이 가장 많았던 채널 <img alt="채널 이미지" class="channelImg"
									src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</p>

						</div>
						<div class="layoutChannel">
							<p class="channelContent">
								언급량이 가장 많았던 날짜 <img alt="채널 이미지" class="channelImg"
									src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</p>
						</div>
					</div>
					<div class="layoutMention"></div>

				</div>

			</div>
			<div class="row">
				<div class="layoutYoutube"></div>
			</div>
		</div>
	</div>
</div>