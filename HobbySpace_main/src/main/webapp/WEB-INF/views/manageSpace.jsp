<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html lang="ko" dir="ltr">
<style>
.img {
	max-width: 100%;
	height: auto;
	display: block;
}

div {
	display: inline-block;
}

div.button1{
	text-align: center;
}
</style>

<head>
<title>공간관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<link rel="icon" type="image/x-icon" sizes="16x16"
	href="resources/images/favicon.ico">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>

<body class="is-preload" onLoad="init()">

<jsp:include page="header.jsp"></jsp:include>
	
	<!-- Header -->
	
	


		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
			<li><a><div name="user" onClick="logInForm()" style="cursor:pointer"></div></a></li>
			<li><a><div name="res" onClick="ToReserveList()" style="cursor:pointer">예약리스트</div></a></li>
			<li><a><div name="review" onClick="ToReviewList()" style="cursor:pointer">후기관리</div></a></li>
			<li><a><div name="zzim" onClick="ToZzimList()" style="cursor:pointer">찜한 공간</div></a></li>
			<li><a><div name="msp" onClick="ToManageSpace()" style="cursor:pointer">공간관리</div></a></li>
			<li><a><div name="logOut" onClick="LogOut()" style="cursor:pointer">로그아웃</div></a></li>
				</ul>
			</nav>

	<section class="wrapper" id="wrapper">
		<div class="inner">
			<div class="highlights" id=Sdiv></div>
		</div>
	</section>
	
	<div class="button1">
<button onClick="toInputSpace()" style="position:relative; background-color: darksalmon; width:13rem; height:6rem; font-size:2rem; border: 4px solid;">공간등록</button>
</div>

</body>
	<jsp:include page="footer.jsp"></jsp:include>
<script src="resources/assets/js/jquery.min.js" ></script>
<script src="resources/assets/js/browser.min.js" ></script>
<script src="resources/assets/js/breakpoints.min.js"></script>
<script src="resources/assets/js/util.js" ></script>
<script src="resources/assets/js/main.js" ></script>
<script>
function toInputSpace(){
	
}


	function init() {
		let spList = JSON.parse('${ManageSpace}');

		let Sdiv = document.getElementById("Sdiv");

		for (i = 0; i < spList.length; i++) {
			let section = document.getElementById("wrapper");

			let section1 = document.createElement("section");

			let div1 = document.createElement("div");
			div1.className = "content";

			div1.textContent = spList[i].location;

			let header = document.createElement("header");
			header.textContent = spList[i].spctcode;

			let div2 = document.createElement("div");
			div2.className = "image";

			let img = document.createElement("img");
			img.width = "300";
			img.height = "300";
			img.src = "/resources/images/" + spList[i].topimg;
			div2.textContent = spList[i].spCode;

			div2.appendChild(img);
			header.appendChild(div2);
			div1.appendChild(header);
			section1.appendChild(div1);
			Sdiv.appendChild(section1);
		}
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

	function toInputSpace() {
		let form = document.createElement("form");
		form.action = "ToInputSpace?sCode=ToInputSpace";
		form.method = "post"
		document.body.appendChild(form);
		form.submit();
	}
</script>

<!-- Scripts -->
<script src="resources/assets/js/jquery.min.js" defer></script>
<script src="resources/assets/js/browser.min.js" defer></script>
<script src="resources/assets/js/breakpoints.min.js" defer></script>
<script src="resources/assets/js/util.js" defer></script>
<script src="resources/assets/js/main.js" defer></script>
</html>
