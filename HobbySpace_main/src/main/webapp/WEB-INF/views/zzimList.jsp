<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
</style>
<head>
<title>하비스페이스</title>
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

</style>
<body class="is-preload" onLoad="init()">


	<!-- Header -->
	<header id="header">
		<a href="/"> <img
			src="resources/images/logo-removebg-preview.jpg" alt="logo Image"
			width="190" height="220">
		</a>
		<div class="search">
			<input type="text" placeholder="검색어를 입력해주세요.">
		</div>
		<div class="search__container">

			<input class="search__input" type="text" placeholder="Search">
		</div>

		<div class="credits__container"></div>

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
	<h2 style="padding-top:75px;padding-left:50px;color: #ecdbc7; font-size:75px">찜리스트</h2>
		<section class="wrapper" id="wrapper">
			<div class="inner">
				<div class="highlights" id=Sdiv>
		
				</div>
			</div>
		</section>
		</body>	
		<script> 
		function init(){
		let zList = JSON.parse('${ZzimList}');
		
		let Sdiv = document.getElementById("Sdiv");
	
		for(i=0;i<zList.length; i++){
			let section = document.getElementById("wrapper");
			let section1 = document.createElement("section");
			let footer = document.createElement("footer");
			let div1 = document.createElement("div");
			div1.className="content";
			div1.style.borderBottom = "5px solid #ecdbc7";
			div1.style.borderTop = "5px solid #ecdbc7";
			div1.style.borderRight = "5px solid #ecdbc7";
			div1.style.borderLeft = "5px solid #ecdbc7";
			let header = document.createElement("header");
			let div2 = document.createElement("div");
			div2.className="image";
			let img = document.createElement("img");
			img.width="300";
			img.height="300";
			img.src= "/resources/images/" + zList[i].sptopimg;
			
			let div3 = document.createElement("div");
			div3.textContent ="공간이름 : "+zList[i].spname;
			div3.style.backgroundColor ='#ecdbc7';
			div3.style.fontColor ='#000000';
			div3.style.position="relative";
			div3.style.width="17.3rem";
			div3.id="status"+i;
			div3.style.justifyContent="center";
			div3.style.alignItems="center";
			div3.style.right="2%";
			let div4 = document.createElement("div");
			div4.textContent ="주소 : "+zList[i].location;
			div4.style.backgroundColor ='#ecdbc7';
			div4.style.fontColor ='#000000';
			div4.style.position="relative";
			div4.style.width="17.3rem";
			div4.id="status"+i;
			div4.style.justifyContent="center";
			div4.style.alignItems="center";
			div4.style.right="2%";
			footer.appendChild(div4);
			footer.appendChild(div3);
			div2.appendChild(img);
			header.appendChild(div2);
			div1.appendChild(header);
			div1.appendChild(footer);
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

		</script>
		
		<!-- Scripts -->
<script src="resources/assets/js/jquery.min.js" defer></script>
<script src="resources/assets/js/browser.min.js" defer></script>
<script src="resources/assets/js/breakpoints.min.js" defer></script>
<script src="resources/assets/js/util.js" defer></script>
<script src="resources/assets/js/main.js" defer></script>
		</html>					
