<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="resources/assets/css/join.css" />

</head>
<body class="is-preload" onLoad="init()">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- Header -->
	<header id="header">

		<a class="logo" href="/" /> <img src="resources/images/logo2.png"
			alt="logo Image" width="80" height="90" />

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
		<table class="type05">
			<tr>
				<th scope="row">ID</th>
				<td><div class="formtag">
						<form action="#">
							<input type="text" name="userId">
						</form>
					</div></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td><div class="formtag">
						<form action="#">
							<input type="password" class="pw" id="pw1" name="userPw">
						</form>
					</div></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td><div class="formtag">
						<form action="#">
							<input type="password" class="pw" id="pw2" name="userPw">
						</form>
						<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
						<span id="alert-danger" style="display: none; color: #d92742; font-size:11pt; font-weight: bold;">
						비밀번호가 일치하지 않습니다.</span>
					</div></td>
			</tr>
			<tr>
				<th scope="row">닉네임</th>
				<td><div class="formtag">
						<form action="#">
							<input type="text" name="userNickname">
						</form>
					</div></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><div class="formtag">
						<form action="#">
							<input type="text" name="userEmail">
						</form>
					</div></td>
			</tr>
			<tr>
				<th scope="row">휴대폰</th>
				<td><div class="formtag">
						<form action="#">
							<input type="text" name="userMobile">
						</form>
					</div></td>
		</table>
	</div>

	<br>
	<br>
	<br>
	<div class="button1">
		<button type="button" onclick="join()">완료</button>
	</div>
	<br>
	<br>
	<br>
</body>
<script>
function init() {
	let loginInfo = document.getElementsByName("user")[0];
	let logOut = document.getElementsByName("logOut")[0];
	sessionStorage.setItem('nickname', '${nickname}');
	sessionStorage.setItem('accessInfo', '${accessInfo}');
	if (sessionStorage.getItem('nickname') == '') {
		loginInfo.textContent = "로그인";
		logOut.style.visibility = 'hidden';
	} else {
		loginInfo.textContent = '${nickname}' + "님";
	}
}

$('.pw').focusout(function () {
    var pwd1 = $("#pw1").val();
    var pwd2 = $("#pw2").val();

    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'inline-block');
            $("#alert-danger").css('display', 'none');
        } else {
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'inline-block');
        }
    }
});

	function logInForm() {
		if(sessionStorage.getItem('nickname')==''){
			var form = document.createElement("form");
			form.action = "LogInForm?sCode=1";
			form.method = "post";
			document.body.appendChild(form);
			form.submit();
		} else{
			var form = document.createElement("form");
			form.action = "manageProfile?sCode=toManageProfile&userId="+'${accessInfo}';
			form.method = "post";
			document.body.appendChild(form);
			form.submit();
		}
	}
	function ToReserveList() {
		var form = document.createElement("form");
		form.action = "ToReserveList?sCode=2&userId=" + '${accessInfo}';
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToReviewList() {
		var form = document.createElement("form");
		form.action = "ToReviewList?sCode=3&userId=" + '${accessInfo}';
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToZzimList() {
		var form = document.createElement("form");
		form.action = "ToZzimList?sCode=4&userId=" + '${accessInfo}';
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
	}
	function ToManageSpace() {
		var form = document.createElement("form");
		form.action = "ToManageSpace?sCode=5&userId=" + '${accessInfo}';
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
	
	function join(){
		var form = document.createElement("form");
		form.action = "Join?sCode=Join";
		form.method = "post";
		
		var userId = document.createElement("input");
		userId.type = "hidden";
		userId.name = "userId";
		userId.value = document.getElementsByName("userId")[0].value;
		form.appendChild(userId);
		
		var userPw = document.createElement("input");
		userPw.type = "hidden";
		userPw.name = "userPw";
		userPw.value = document.getElementsByName("userPw")[0].value;
		form.appendChild(userPw);

		var userNickname = document.createElement("input");
		userNickname.type = "hidden";
		userNickname.name = "userNickname";
		userNickname.value = document.getElementsByName("userNickname")[0].value;
		form.appendChild(userNickname);
		
		var userEmail = document.createElement("input");
		userEmail.type = "hidden";
		userEmail.name = "userEmail";
		userEmail.value = document.getElementsByName("userEmail")[0].value;
		form.appendChild(userEmail);
		
		var userMobile = document.createElement("input");
		userMobile.type = "hidden";
		userMobile.name = "userMobile";
		userMobile.value = document.getElementsByName("userMobile")[0].value;
		form.appendChild(userMobile);
		
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