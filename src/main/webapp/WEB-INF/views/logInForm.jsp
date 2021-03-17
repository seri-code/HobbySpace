<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="resources/assets/css/logInForm.css" />
		
	</head>
	<body class="is-preload">
		<!-- Header -->
			<header id="header">
				<a class="logo" href="/">
<img src="resources/images/logo2.png" alt="logo Image" width="80" height="90" /></a>
				
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
			<li><a><div name="user" onClick="logInForm()" style="cursor:pointer"></div></a></li>
			<li><a><div name="res" onClick="ToReserveList()" style="cursor:pointer">예약리스트</div></a></li>
			<li><a><div name="review" onClick="ToReviewList()" style="cursor:pointer">후기관리</div></a></li>
			<li><a><div name="zzim" onClick="ToZzimList()" style="cursor:pointer">찜한 공간</div></a></li>
			<li><a><div name="msp" onClick="ToManageSpace()" style="cursor:pointer">공간관리</div></a></li>
			<li><a><div name="logOut" onClick="LogOut()" style="cursor:pointer"></div></a></li>
				</ul>
			</nav>
			
			
			
<div class="userId">
<table class="type05">
  <tbody> 
  <tr>
  <td><form action="#">ID<input type="text" name="userId"></form></td>
  </tr>
  <tr>
  <td><form action="#">PW<input type="password" name="userPw"></form></td>
  </tr>
  </tbody>
</table>
</div>

<div class="button1">
<button onClick="toJoin()">회원가입</button>
&nbsp;&nbsp;
<button onClick="submit()">로그인</button>
</div>

</body>

<script>
function toJoin(){
	var form = document.createElement("form");
	form.action = "ToJoin";
	form.method = "GET";
	
	var SCode = document.createElement("input");
	SCode.type = "hidden";
	SCode.name = "SCode";
	SCode.value = "ToJoin";
	form.appendChild(SCode);
	
	document.body.appendChild(form);
	form.submit();
}

function submit() {
	var userId = document.getElementsByName("userId")[0];
	var userPw = document.getElementsByName("userPw")[0];
	var form = document.createElement("form");
	form.action = "LogIn";
	form.method = "POST";
	
	var SCode = document.createElement("input");
	SCode.type = "hidden";
	SCode.name = "SCode";
	SCode.value = "LogIn";
	form.appendChild(SCode);
	   
	form.appendChild(userId);
	form.appendChild(userPw);
	document.body.appendChild(form);
	
	form.submit();
}

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


</script>

<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>

</html>	