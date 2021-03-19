<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="ko" dir="ltr">
<style>
.img {
	max-width: 100%;
	height: auto;
	display: block;
}

</style>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="keywords" content="">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@1,500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/assets/css/searchResult.css">
<link rel="icon" type="image/x-icon" sizes="16x16"
	href="resources/images/favicon.ico">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"">
	<link rel="preconnect" href="https://fonts.gstatic.com">

</head>

<body class="is-preload" onLoad="initUser();initResult()">
	<jsp:include page="header.jsp"></jsp:include>
	
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
	<h2 style="padding-top:90px;padding-left:30px; color: lightsalmon; position:relative; border: 4px solid; width: 32rem; height: 10rem">"${keyword }"의 검색결과입니다.</h2>
	<div class="image" id="sp_topimg"></div>
		<div class="inner">
			<div class="highlights" id="scDiv"></div>
			
		</div>
</body>
<script>
	function initUser() {
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

	function initResult() {
		let result = JSON.parse('${searchResult}');
		let scDiv = document.getElementById("scDiv");

		for (i = 0; i < result.length; i++) {
			let section = document.getElementById("wrapper");
			let section1 = document.createElement("section");

			let div1 = document.createElement("div");
			div1.className = "content";
			div1.textContent = result[i].spName;
			

			let div2 = document.createElement("div");
			div2.className = "image";
			
			
			let img = document.createElement("img");
			img.width = "300";
			img.height = "300";
			img.src = "resources/images/" + result[i].spImg;
			
			let spCode = result[i].spCode;
			img.addEventListener('click', function() {toSpaceDetail(spCode);});
			img.style.cursor = "pointer";

			let header = document.createElement("div");
			header.textContent = result[i].spLocation;

			div2.appendChild(img);
			header.appendChild(div2);
			div1.appendChild(header);
			section1.appendChild(div1);
			scDiv.appendChild(section1);
		}
	}
	
	function toSpaceDetail(spCode){
		var form = document.createElement("form");
	    form.action="SpaceDetail?sCode=SpaceDetail&spCode="+spCode;
	    form.method="post";
	   
	    document.body.appendChild(form);
	    form.submit();
	}

	function logInForm() {
		var form = document.createElement("form");
		form.action = "LogInForm?sCode=1&userId=" + '${accessInfo}';
		form.method = "post";

		document.body.appendChild(form);

		form.submit();
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