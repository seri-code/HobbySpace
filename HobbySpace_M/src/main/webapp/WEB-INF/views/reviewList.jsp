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

.starR {
	color: gainsboro;
	font-size: 30px
}

.starR.on {
	background-position: 0 0;
	color: yellow;
	font-size: 30px
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<body class="is-preload" onLoad="init()">
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

	<section class="wrapper" id="wrapper">
		<div class="inner">
			<h2 style="color: #FF5E00; font-family: 'paybooc-Bold';">후기 관리</h2>
			<div class="highlights" id=Sdiv
				style="width: 1448px; align-items: left;"></div>
		</div>


	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	function init() {

		let review = JSON.parse('${ReviewList}');

		let Sdiv = document.getElementById("Sdiv");

		for (i = 0; i < review.length; i++) {

			let rev = document.createElement("section");
			rev.style.borderBottom = "4px solid #ffa07a";
			rev.style.borderTop = "4px solid #ffa07a";
			rev.style.borderRight = "4px solid #ffa07a";
			rev.style.borderLeft = "4px solid #ffa07a";
			rev.style.display = "inline";
			rev.style.width = "440px";
			rev.style.marginRight = "2%";
			rev.style.marginBottom = "3%";

			let rvCode = review[i].rdcode;

			let section = document.getElementById("wrapper");

			//let section1 = document.createElement("section");

			//리뷰 이미지가 없으면 띄어줄 이미지가 있어야함(리뷰 입력할때 이미지를 안 넣는경우)
			let img = document.createElement("img");
			img.width = "300";
			img.height = "300";
			img.src = "/resources/images/rvimg/" + review[i].rvImg;
			img.style.marginLeft = "11%";

			let content = document.createElement("header");
			content.textContent = "코멘트 : " + review[i].rvcontent;
			content.style.marginLeft = "35%";

			let rvstar = document.createElement("div");
			rvstar.textContent = "별점 : "; //+ review[i].rvstar;
			rvstar.style.marginLeft = "20%";
			rvstar.id = "stars" + i;

			let star1 = document.createElement("span");
			star1.textContent = "★";
			star1.id = "star1" + i;
			star1.style.display = "inline";
			star1.className = "starR";
			rvstar.appendChild(star1);
			let star2 = document.createElement("span");
			star2.textContent = "★";
			star2.id = "star2" + i;
			star2.style.display = "inline";
			star2.className = "starR";
			rvstar.appendChild(star2);
			let star3 = document.createElement("span");
			star3.textContent = "★";
			star3.id = "star3" + i;
			star3.style.display = "inline";
			star3.className = "starR";
			rvstar.appendChild(star3);
			let star4 = document.createElement("span");
			star4.textContent = "★";
			star4.id = "star4" + i;
			star4.style.display = "inline";
			star4.className = "starR";
			rvstar.appendChild(star4);
			let star5 = document.createElement("span");
			star5.textContent = "★";
			star5.id = "star5" + i;
			star5.style.display = "inline";
			star5.className = "starR";
			rvstar.appendChild(star5);

			//Button
			let footer = document.createElement("footer");
			let div2 = document.createElement("input");
			div2.type = "button";
			div2.value = "리뷰 수정";
			div2.textContent = "리뷰 수정하기";
			div2.style.cursor = "pointer";
			div2.style.backgroundColor = '#ecdbc7';
			div2.style.fontColor = '#000000';
			div2.style.position = "relative";
			div2.style.left = "25%";
			div2.addEventListener("click", function() {
				reservEditor(rvCode) //리뷰수정

			});

			let div3 = document.createElement("input");
			div3.type = "button";
			div3.value = "리뷰 삭제";
			div3.textContent = "리뷰 삭제하기";
			div3.style.cursor = "pointer";
			div3.style.backgroundColor = '#ecdbc7';
			div3.style.fontColor = '#000000';
			div3.style.position = "relative";
			div3.style.left = "30%";
			div3.addEventListener("click", function() {
				reservDelete(rvCode) //리뷰삭제

			});
			footer.appendChild(div2);
			footer.appendChild(div3);

			rev.appendChild(rvstar);
			rev.appendChild(img);
			rev.appendChild(content);
			rev.appendChild(footer);
			Sdiv.appendChild(rev);

		}

		for (i = 0; i < review.length; i++) {
			let rvstars = document.getElementById("stars" + i);
			for (j = 1; j <= review[i].rvstar; j++) {
				let rvstar = document.getElementById("star" + j + i);
				rvstar.className = "starR on";
			}
		}
	}

	function reservEditor(rvCode) { //리뷰수정
		var form = document.createElement("form");
		form.action = "ToEditReview";
		form.method = "post";

		//예약코드
		let inRdCode = document.createElement("input");
		inRdCode.type = "hidden";
		inRdCode.name = "rdCode";
		inRdCode.value = rvCode;
		form.appendChild(inRdCode);

		document.body.appendChild(form);
		form.submit();
	}

	function reservDelete(rvCode) { //리뷰삭제
		var form = document.createElement("form");
		form.action = "DeleteReview";
		form.method = "post";

		//예약코드
		let inRdCode = document.createElement("input");
		inRdCode.type = "hidden";
		inRdCode.name = "rdCode";
		inRdCode.value = rvCode;
		form.appendChild(inRdCode);

		document.body.appendChild(form);
		form.submit();
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
