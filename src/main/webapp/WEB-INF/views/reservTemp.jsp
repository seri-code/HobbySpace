<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html lang="ko" dir="ltr">
<style>
HTML CSSResult Skip Results Iframe
EDIT ON
body {
	font-family: Arial, sans-serif;
	position: relative;
	background: #40464b;
	height: 100%;
	padding: 40px 30%;
	margin: 0;
}

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
	href="resources/img/favicon.ico">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

</head>
<body class="is-preload" onLoad="init()">


	<!-- Header -->
	<header id="header">
		<a href="http://192.168.0.246/main"> <img
			src="resources/img/logo-removebg-preview.jpg" alt="logo Image"
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



	<section class="wrapper" id="wrapper">
		<div class="inner">
			<input onClick="reserv()" type="button" value="예약하기"
				style="position: relative; right: -83%; background-color: moccasin;">
			<div class="highlights" id="Sdiv"></div>
		</div>
	</section>
</body>
<script>
	let loadTemp = JSON.parse('${loadTemp}');
	
	function init() {
		let Sdiv = document.getElementById("Sdiv");

		for (i = 0; i < loadTemp.length; i++) {
			let section = document.getElementById("wrapper");
			let section1 = document.createElement("section");
			let div1 = document.createElement("div");
			div1.className = "content";
			let header = document.createElement("header");
			let div2 = document.createElement("div");
			div2.className = "image";
			let img = document.createElement("img");
			img.width = "400";
			img.height = "400";
			img.src = "/resources/images/" + loadTemp[i].sptopimg;

			let div3 = document.createElement("div");
			div3.textContent = "방번호 : " + loadTemp[i].teronum;
			let div4 = document.createElement("div");
			div4.textContent = "예약날짜 : " + loadTemp[i].teusedate;
			let div5 = document.createElement("div");
			div5.textContent = "인원 : " + loadTemp[i].tepeople;
			let div6 = document.createElement("input");
			div6.name = "phone";
			div6.type = "text";
			div6.placeholder = "전화번호를 입력해주세요 ex)010-xxxx-xxxx";
			let div7 = document.createElement("input");
			div7.name = "email";
			div7.type = "text";
			div7.placeholder = "이메일을 입력해주세요 ex)Hobbyspace@~~";

			let checkbox = document.createElement("input");
			checkbox.type = "checkbox";
			checkbox.name = "checkbox";
			checkbox.id = "ex_chk" + i;

			let label = document.createElement("label");
			label.setAttribute("for", "ex_chk" + i);
			label.id = "ex_chk";
			checkbox.addEventListener("change", function() {
				checkState(this);
			});
			div5.appendChild(div7);
			div5.appendChild(div6);
			div4.appendChild(div5);
			div3.appendChild(div4);
			header.appendChild(img);
			header.appendChild(div3);
			div1.appendChild(div2);
			div1.appendChild(header);
			section1.appendChild(div1);
			Sdiv.appendChild(section1);
			header.appendChild(checkbox);
			header.appendChild(label);

		}
	}
	var checkCount = 0;
	function checkState(obj) {
		checkCount += (obj.checked ? 1 : -1);
	}

	function reserv() {
		let checkbox = document.getElementsByName("checkbox");
		
		let count = 0;
		for (i = 0; i < checkbox.length; i++) {
			if (checkbox[i].checked) {
				count++;
				let phone = document.getElementsByName("phone")[i];
				let email = document.getElementsByName("email")[i];
				 rstedate = loadTemp[i].tedate;
				
				 rsterospCode = loadTemp[i].terospCode;
				 rsteronum = loadTemp[i].teronum;
				 rsusedate = loadTemp[i].teusedate;
				 rstepeople = loadTemp[i].tepeople;
				
				rsphone = phone.value;
				rsemail = email.value;
			}
		} 
		if (count == 0) {
			alert("하나 이상의 방을 체크해주세요.");
		} else {
// 			rstedate0.replace(/ /gi, "");
// 			alert(rstedate0);
// 			let rstedate = rstedate0.split("-");
//  			let rstedate = rstedate1.split(":");
// 			alert(rstedate);
			
			let form = document.createElement("form");
			form.action = "Reserve?sCode=" + 5 +"&rstedate=" + rstedate +"&rsphone="+rsphone+"&rsemail="+rsemail + 
			"&rsterospCode=" + rsterospCode + "&rsteronum=" + rsteronum + "&rsusedate=" + rsusedate+ "&rstepeople=" + rstepeople;
					
// 			form.action = "Reserve?checkboxInfo=" + checkboxInfo;
			form.method = "post";
			document.body.appendChild(form);
			form.submit();
		}	
	}
</script>

<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
</html>


