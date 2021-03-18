<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>

<head>
<title>프로필 정보 변경 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="resources/assets/css/manageProfile.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

</head>

<body class="is-preload" onload="init()">
	<!-- Header -->
	<header id="header">
		<!-- 				<a class="logo" href="./imgages/logo1.png">HobbySpace</a> -->

		<a class="logo" href="/"> <img src="resources/images/logo2.png"
			alt="logo Image" width="80" height="90" />
		</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a><div name="user" onClick="logInForm()"
						style="cursor: pointer"></div></a></li>
			<li><a><div name="res" onClick="ToReserveList()"
						style="cursor: pointer">예약리스트</div></a></li>
			<li><a><div name="review" onClick="ToReviewList()"
						style="cursor: pointer">후기관리</div></a></li>
			<li><a><div name="zzim" onClick="ToZzimList()"
						style="cursor: pointer">찜한 공간</div></a></li>
			<li><a><div name="msp" onClick="ToManageSpace()"
						style="cursor: pointer">공간관리</div></a></li>
			<li><a><div name="logOut" onClick="LogOut()"
						style="cursor: pointer">로그아웃</div></a></li>
		</ul>
	</nav>


	<div class="userId">
		<div class="h3">
			<h3>회원 정보 변경</h3>
		</div>
		<table class="type05">
			<tr>
				<th scope="row">닉네임</th>
				<td>
					<div class="formtag">
						<form action="#">
							<input type="text" id="name" name="닉네임" value="">
						</form>
					</div>

					<div class="button1">
						<button type="button" id="nameEdit"
							style="position: absolute; right: 20%; top: 5%; left: 80%;">정보변경</button>

					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">이메일</th>
				<td>
					<div class="formtag">
						<form action="#">
							<input type="text" id="email" name="edit" value="">
						</form>
					</div>
					<div class="button1">
						<button type="button" id="mailEdit"
							style="position: absolute; right: 20%; top: 38%; left: 80%;">정보변경</button>
					</div>
				</td>
			</tr>

			<tr>
				<th scope="row">휴대폰</th>
				<td>
					<div class="formtag">
						<form action="#">
							<input type="text" id="mobile" name="edit" value="">
						</form>
					</div>
					<div class="button1">
						<button type="button" id="mobileEdit"
							style="position: absolute; right: 20%; top: 70%; left: 80%;">정보변경</button>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<form action=""></form>
	<div class="button1">
		<button type="button" onclick="exit()">서비스 탈퇴</button>
	</div>

</body>
<script type="text/javascript">
	var UsInfo = JSON.parse('${UsInfo}');
	var usId;

	function init() {
		document.getElementById('name').value = UsInfo.us_Nickname;
		document.getElementById('email').value = UsInfo.us_Email;
		if (UsInfo.us_Mobile != undefined) {
			document.getElementById('mobile').value = UsInfo.us_Mobile;
		}
		usId = UsInfo.us_Id;

		let loginInfo = document.getElementsByName("user")[0];
		let logOut = document.getElementsByName("logOut")[0];
		sessionStorage.setItem('nickname', UsInfo.us_Nickname);
		sessionStorage.setItem('accessInfo', UsInfo.us_Id);
		if (sessionStorage.getItem('nickname') == '') {
			loginInfo.textContent = "로그인";
			logOut.style.visibility = 'hidden';
		} else {
			loginInfo.textContent = UsInfo.us_Nickname + "님";
		}
	}
	//nameEdit() Mailedit() mobileEdit()
	//닉네임
	$("#nameEdit").on("click", function(e) {
		var formData = new FormData();
		var inputName = document.getElementById('name').value
		//add filedate to formdata
		formData.append("us_Nickname", inputName);
		formData.append("us_Id", usId);

		$.ajax({
			url : '${pageContext.request.contextPath}/EditNickname',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				var item = result.message;
				// item = message; 
				alert(item);
			}
		}); //$.ajax

	});
	//이메일
	$("#mailEdit").on("click", function(e) {
		var formData = new FormData();
		var inputEmail = document.getElementById('email').value
		if (regEmail(inputEmail)) {
			//add filedate to formdata
			formData.append("us_Email", inputEmail);
			formData.append("us_Id", usId);

			$.ajax({
				url : '${pageContext.request.contextPath}/EditEmail',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					var item = result.message;
					// item = message; 
					alert(item);
				}
			}); //$.ajax

		} else {
			alert("이메일을 다시 입력해주십시오");
		}
	});

	function regEmail(inputEmail) {
		var tran = false;
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
		if (emailRule.test(inputEmail)) {
			tran = true;
		}
		return tran;
	}
	//모바일
	$("#mobileEdit").on("click", function(e) {
		var formData = new FormData();
		var inputMobile = document.getElementById('mobile').value
		if (regMobile(inputMobile)) {
			//add filedate to formdata
			formData.append("us_Mobile", inputMobile);
			formData.append("us_Id", usId);

			$.ajax({
				url : '${pageContext.request.contextPath}/EditMobile',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					var item = result.message;
					// item = message; 
					alert(item);
				}
			}); //$.ajax
		} else {
			alert("핸드폰번호를 다시 입력해주십시오");
		}

	});

	function regMobile(inputMobile) {
		var tran = false;
		var mobileRule = /^\d{3}\d{3,4}\d{4}$/; //모바일 정규식
		if (mobileRule.test(inputMobile)) {
			tran = true;
		}
		return tran;
	}

	function logInForm() {
		if (sessionStorage.getItem('nickname') == '') {
			var form = document.createElement("form");
			form.action = "LogInForm?sCode=1";
			form.method = "post";
			document.body.appendChild(form);
			form.submit();
		} else {
			var form = document.createElement("form");
			form.action = "manageProfile?sCode=toManageProfile&userId="
					+ UsInfo.us_Id;
			form.method = "post";
			document.body.appendChild(form);
			form.submit();
		}
	}
	function ToReserveList() {
		var form = document.createElement("form");
		form.action = "ToReserveList?sCode=2&userId=" + UsInfo.us_Id;
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToReviewList() {
		var form = document.createElement("form");
		form.action = "ToReviewList?sCode=3&userId=" + UsInfo.us_Id;
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToZzimList() {
		var form = document.createElement("form");
		form.action = "ToZzimList?sCode=4&userId=" + UsInfo.us_Id;
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToManageSpace() {
		var form = document.createElement("form");
		form.action = "ToManageSpace?sCode=5&userId=" + UsInfo.us_Id;
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function LogOut() {
		var form = document.createElement("form");
		form.action = "LogOut?sCode=LogOut";
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
</script>
<!-- Scripts -->
<script src="resources/assets/js/jquery.min.js"></script>
<script src="resources/assets/js/browser.min.js"></script>
<script src="resources/assets/js/breakpoints.min.js"></script>
<script src="resources/assets/js/util.js"></script>
<script src="resources/assets/js/main.js"></script>

</html>