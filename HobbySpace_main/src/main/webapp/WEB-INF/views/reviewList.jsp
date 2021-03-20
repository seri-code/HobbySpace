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
	display: inline;
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
<body class="is-preload" onLoad="init()">


	<!-- Header -->
	<header id="header">
		<a href="/"> <img src="resources/images/logo-removebg-preview.jpg"
			alt="logo Image" width="190" height="220">
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

	<section class="wrapper" id="wrapper">
		<div class="inner">
			<h2 style="color:#FF5E00; font-family: 'paybooc-Bold';">후기 관리</h2>
			<div class="highlights" id=Sdiv style="width:1448px; align-items:left;"></div>
			
		</div>
	
	
		</section>			  	
	
</body>
<script>
	function init() {
		
		let review = JSON.parse('${ReviewList}');
		
		let Sdiv = document.getElementById("Sdiv");
	
		
	
		
		for (i = 0; i < review.length; i++) {
			
			let rev = document.createElement("section");
			rev.style.borderBottom = "5px solid #ecdbc7";
			rev.style.borderTop = "5px solid #ecdbc7";
			rev.style.borderRight = "5px solid #ecdbc7";
			rev.style.borderLeft = "5px solid #ecdbc7";
			rev.style.display="inline";
		    rev.style.width="440px";
		    rev.style.marginRight="2%";
		    rev.style.marginBottom="3%";
			

			
			let section = document.getElementById("wrapper");
			
			//let section1 = document.createElement("section");
			
			
			
			//리뷰 이미지가 없으면 띄어줄 이미지가 있어야함(리뷰 입력할때 이미지를 안 넣는경우)
			let img = document.createElement("img");
			img.width = "300";
			img.height = "300";
			img.src = "/resources/images/rvimg/" + review[i].rvImg;
			img.style.marginLeft="11%";
			
			
			let content = document.createElement("header");
			content.textContent = "코멘트 : " + review[i].rvcontent;
			content.style.marginLeft="35%";
	
			
			let rvstar = document.createElement("div");
			rvstar.textContent = "별점 : " + review[i].rvstar;
			rvstar.style.marginLeft="40%";
			
			
			
			//Button
			let footer = document.createElement("footer");
			let div2 = document.createElement("input");
			div2.type = "button";
			div2.value = "리뷰 수정";
			div2.textContent ="리뷰 수정하기";
			div2.style.cursor = "pointer";
			div2.style.backgroundColor ='#ecdbc7';
			div2.style.fontColor ='#000000';
			div2.style.position="relative";
			div2.style.left="25%";
			div2.addEventListener("click", function() {
				reservDetail(getDrdcode, sptopimg13)

			});	
			
			let div3 = document.createElement("input");
			div3.type = "button";
			div3.value = "리뷰 삭제";
			div3.textContent ="리뷰 삭제하기";
			div3.style.cursor = "pointer";
			div3.style.backgroundColor ='#ecdbc7';
			div3.style.fontColor ='#000000';
			div3.style.position="relative";
			div3.style.left="30%";
			div3.addEventListener("click", function() {
				reservDetail(getDrdcode, sptopimg13)

			});	
			footer.appendChild(div2);
			footer.appendChild(div3);


			
			rev.appendChild(rvstar);
			rev.appendChild(img);
			rev.appendChild(content);
			rev.appendChild(footer);
			Sdiv.appendChild(rev);
			
		
			
		

		}
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
					+ '${accessInfo}';
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
