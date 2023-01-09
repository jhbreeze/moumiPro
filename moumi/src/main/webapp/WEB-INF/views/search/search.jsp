<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.searchBackGround {
	background: #ECF4EB;
}

.chooseInfoBox {
	width: 100%;
	height: 70px;
	background: #ECF4EB;
}

.chooseDate {
	padding: 20px;
	margin-left: 40px;
}

.chooseSNS {
	width: 500px;
	height: 60px;
	padding: 20px;
	margin: 0 auto;
}

.layoutSNS {
	width: 400px;
	height: 600px;
	background: blue;
	border-radius: 15px;
	margin: 2px;
	padding: 50px;
}

.layoutChannel {
	width: 400px;
	height: 70px;
	border-radius: 15px;
	margin: 2px;
	padding: 50px;
	background: blue;
	
}

.layoutMention {
	width: 800px;
	height: 500px;
	border-radius: 15px;
	margin: 5px;
	padding: 50px;
	background: blue;
	
}

.layoutYoutube{
	width: 1400px;
	height: 200px;
	border-radius: 15px;
	background: blue;
	

}
</style>


<div class="chooseInfoBox">
	<div class="container">
		<div class="row">

			<div class="col">
				<div class="chooseDate">
					시작일&nbsp;<input type="date">&nbsp;종료일&nbsp;<input
						type="date">

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
									<label class="form-check-label labelSNS"
										for="flexSwitchCheckDefault">유튜브</label>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-warning"
										type="checkbox" role="switch" id="flexSwitchCheckChecked"
										checked> <label class="form-check-label"
										for="flexSwitchCheckChecked">인스타</label>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-success"
										type="checkbox" role="switch" id="flexSwitchCheckDisabled">
									<label class="form-check-label" for="flexSwitchCheckChecked">블로그</label>
								</div>
							</div>
							<div class="col">
								<div class="form-check form-switch">
									<input class="form-check-input btn btn-outline-info"
										type="checkbox" role="switch"
										id="flexSwitchCheckCheckedDisabled" checked> <label
										class="form-check-label" for="flexSwitchCheckChecked">트위터</label>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>

		</div>
	</div>

</div>

<div class="container">
	<div class="row">
		<div class="col">
			<div class="layoutSNS"></div>
		</div>
		<div class="col">
			<div class="row">
				<div class="layoutChannel"></div>
				<div class="layoutChannel"></div>
			</div>
			<div class="layoutMention"></div>

		</div>

	</div>
	<div class="row">
		<div class="layoutYoutube"></div>
	</div>

</div>
