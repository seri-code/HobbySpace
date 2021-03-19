<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html lang="ko" dir="ltr">
<style>
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
<title>예약리스트</title>
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
			<input id="reserv" onClick="init()" type="button" value="빌린공간"
				style="position: relative; right: -83%; background-color: moccasin;">
			<input id="reserv1" onClick="reserv()" type="button" value="빌려준공간"
				style="position: relative; right: -83%; background-color: moccasin;">
			<div class="highlights" id="Sdiv"></div>
		</div>
	</section>
</body>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous"></script>
<script>

function init() {
	//요소를 지움 즉 에이작스 init을 지운다
	$("#Sdiv").empty();
	//버튼 비활성화
	document.getElementById("reserv").disabled = true;
	//버튼 활성화
	document.getElementById("reserv1").disabled = false;
	let reserv1 = JSON.parse('${loadReserve}');
	let Sdiv = document.getElementById("Sdiv");
	for (i = 0; i < reserv1.length; i++) {
		let section = document.getElementById("wrapper");
		let section1 = document.createElement("section");
		let div1 = document.createElement("div");
		div1.className = "content";
		div1.style.borderBottom = "5px solid #ecdbc7";
		div1.style.borderTop = "5px solid #ecdbc7";
		div1.style.borderRight = "5px solid #ecdbc7";
		div1.style.borderLeft = "5px solid #ecdbc7";
	
		let header = document.createElement("header");
		let footer = document.createElement("footer");
		let div2 = document.createElement("div");
		div2.style.backgroundColor ='#ecdbc7';
		div2.style.fontColor ='#000000';
		div2.style.position="relative";
		div2.style.width="17.3rem";
		div2.id="status"+i;
		div2.style.justifyContent="center";
		div2.style.alignItems="center";
		div2.style.right="2%";
		if(reserv1[i].rdstatus=="W"){
		div2.textContent = "예약상태: "+"승인대기";
		}
		if(reserv1[i].rdstatus=="N"){
		div2.textContent = "예약상태: "+"승인거절";
	    }
		if(reserv1[i].rdstatus=="P"){
		div2.textContent = "예약상태: "+"승인완료";
		}
		if(reserv1[i].rdstatus=="D"){
		div2.textContent = "예약상태: "+"예약취소";
		}
		if(reserv1[i].rdstatus=="F"){
		div2.textContent ="예약상태: "+ "이용완료";
		}
		//공간코드rospcode
		let rospcode =reserv1[i].rdrospCode;
		//예약코드
		let rdcode = reserv1[i].rdcode;
		//유저가 선택한날짜
		let frdusedateTest = reserv1[i].frdusedate;
		//유저가선택한 방 
		let ronum = reserv1[i].rdronum;
		
		let div4 = document.createElement("input");
		div4.type = "button";
		div4.value = "예약취소";
		div4.addEventListener("click",function(){Cancel(rospcode,rdcode,frdusedateTest,ronum)});
		div4.style.backgroundColor ='#ecdbc7';
		div4.style.fontColor ='#000000';
		div4.style.position="relative";
		div4.style.width="8.18rem";
		
		
		div2.className = "image";
		let img = document.createElement("img");
		img.width = "300";
		img.height = "300";
		img.src = "/resources/images/" + reserv1[i].sptopimg;
		let sptopimg13 = reserv1[i].sptopimg;
		//예약상세코드
		let getDrdcode = reserv1[i].rdcode;
// 		if(reserv1[i].rdstatus == "W" || reserv1[i].rdstatus == "P" || reserv1[i].rdstatus == "F" ){
			let div3 = document.createElement("input");
			div3.type = "button";
			div3.value = "상세보기";
			div3.textContent ="예약상세보기";
			div3.style.cursor = "pointer";
			div3.style.backgroundColor ='#ecdbc7';
			div3.style.fontColor ='#000000';
			div3.style.position="relative";
			div3.style.width="8.18rem";
			div3.addEventListener("click", function() {
				reservDetail(getDrdcode, sptopimg13)

			});	
			footer.appendChild(div3);
// 		}
		footer.appendChild(div4);
		div2.appendChild(img);
		header.appendChild(div2);
		//div2.appendChild(div3);
		div1.appendChild(header);
		section1.appendChild(div1);
		Sdiv.appendChild(section1);
		div1.appendChild(footer);

		
	}
}
function Cancel(rospcode,rdcode,frdusedateTest,ronum){
	//날짜타임변환
	alert(frdusedateTest);
	alert(rospcode);
	alert(rdcode);
	alert(ronum);
	let frdusedateTest1 = frdusedateTest.substring(0,10);
	let frdusedate = frdusedateTest1.replace(/-/g,'');
	let request = new XMLHttpRequest();
	request.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let jsonData = decodeURIComponent(request.response);
			let reserv3 = JSON.parse(jsonData);
			for (i = 0; i < reserv3.length; i++) {
				let div6 = document.getElementById("status"+i);
				if(reserv3[i].rdstatus == "N"){
					div6.textContent = "예약취소";
					
				}
// 				div6.textContent = "예약상태 : " + reserv3[i].frdstatus;
				alert("예약이취소되었습니다 새로고침을 눌러 확인해주세요!");
			}
		}
	};
	request.open("post", "Cancel", true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=10" + "&rdcode=" + rdcode + "&rospcode=" + rospcode + "&frdusedate=" + frdusedate + "&ronum=" + ronum);
}
function reserv() {
	//요소를 지움 즉 에이작스 init을 지운다
	$("#Sdiv").empty();
	//버튼 비활성화
	document.getElementById("reserv1").disabled = true;
	//버튼 활성화
	document.getElementById("reserv").disabled = false;
	let request = new XMLHttpRequest();
	request.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let jsonData = decodeURIComponent(request.response);
			let reserv1 = JSON.parse(jsonData);
			//비활성화
			const target = document.getElementById('reserv1');
			target.disabled = true;
			for (i = 0; i < reserv1.length; i++) {
				let Sdiv = document.getElementById("Sdiv");
				let section12 = document.createElement("wrapper");
				let section = document.getElementById("wrapper");
				let section1 = document.createElement("section");
				let footer = document.createElement("footer");
				let div1 = document.createElement("div");
				div1.className = "content";
				div1.style.borderBottom = "5px solid #ecdbc7";
				div1.style.borderTop = "5px solid #ecdbc7";
				div1.style.borderRight = "5px solid #ecdbc7";
				div1.style.borderLeft = "5px solid #ecdbc7";
				let rdcode = reserv1[i].rdcode;

				let div3 = document.createElement("input");
				div3.type = "button";
				div3.value = "승인";
				div3.style.backgroundColor = '#ecdbc7';
				div3.style.fontColor = '#000000';
				div3.style.position = "relative";
				div3.style.width = "6rem";
				div3.addEventListener("click", function() {
					OKStatus(rdcode)
				});
				let div4 = document.createElement("input");
				div4.type = "button";
				div4.value = "승인거절";
				div4.addEventListener("click", function() {
					NOStatus(rdcode)
				});
				div4.style.backgroundColor = '#ecdbc7';
				div4.style.fontColor = '#000000';
				div4.style.position = "relative";
				div4.style.width = "6rem";
				let header = document.createElement("header");
				let div2 = document.createElement("div");
				div2.className = "image";
				frdusedate1 = reserv1[i].frdusedate;
				frdusedate2 = frdusedate1.substring(0,10);
				let div5 = document.createElement("div");
				div5.textContent = "사용날짜 : " + frdusedate2;
				div5.style.backgroundColor ='#ecdbc7';
				div5.style.fontColor ='#000000';
				div5.style.position="relative";
				div5.style.width="17.6rem";
				div5.style.justifyContent="center";
				div5.style.alignItems="center";
				div5.style.right="2%";
				let div6 = document.createElement("div");
				div6.id = "status"+i;
// 				div6.style.backgroundColor ='#ecdbc7';
// 				div6.style.fontColor ='#000000';
// 				div6.style.position="relative";
// 				div6.style.width="17.6rem";
// 				div6.style.justifyContent="center";
// 				div6.style.alignItems="center";
// 				div6.style.right="2%";
// 				div6.textContent = "예약상태 : " + reserv1[i].frdstatus;
				if(reserv1[i].frdstatus=="W"){
					div6.textContent = "예약상태 : " + "승인대기";
					}
					if(reserv1[i].frdstatus=="N"){
					div6.textContent = "예약상태 : " + "승인거절";
				    }
					if(reserv1[i].frdstatus=="P"){
					div6.textContent = "예약상태 : " + "승인완료";
					}
					if(reserv1[i].frdstatus=="D"){
					div6.textContent ="예약상태 : " +  "예약취소";
					}
					if(reserv1[i].frdstatus=="F"){
					div6.textContent ="예약상태 : " +  "이용완료";
					}
				let img = document.createElement("img");
				img.width = "300";
				img.height = "300";
				img.src = "/resources/images/" + reserv1[i].sptopimg;
				
				div5.appendChild(div6);
				header.appendChild(div5);
				div2.appendChild(img);
				header.appendChild(div2);
				header.appendChild(div4);
				header.appendChild(div3);
				div1.appendChild(header);
				section1.appendChild(div1);
				Sdiv.appendChild(section1);
			}
		}
	};
	request.open("post", "ToHostReserveList", true);
	request.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=" + 7);
}
function OKStatus(rdcode) {
	let request = new XMLHttpRequest();
	request.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let jsonData = decodeURIComponent(request.response);
			let reserv2 = JSON.parse(jsonData);
			
			for (i = 0; i < reserv2.length; i++) {
				let div6 = document.getElementById("status"+i);
				if(reserv2[i].rdstatus == "P"){
					div6.textContent = "승인완료";
				}
// 				div6.textContent = "예약상태 : " + reserv2[i].frdstatus;
			}
		}
	};
	request.open("post", "OKStatus", true);
	request.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=8" + "&rdcode=" + rdcode);
}
function NOStatus(rdcode) {
	let request = new XMLHttpRequest();
	request.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let jsonData = decodeURIComponent(request.response);
			let reserv3 = JSON.parse(jsonData);
			for (i = 0; i < reserv3.length; i++) {
				let div7 = document.getElementById("status"+i);
				if(reserv3[i].rdstatus == "N"){
					div7.textContent = "승인거절";
				}
// 				div7.textContent = "예약상태 : " + reserv3[i].frdstatus;
			}
		}
	};
	request.open("post", "NOStatus", true);
	request.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=UTF-8");
	request.send("sCode=9" + "&rdcode=" + rdcode);
}

function reservDetail(getDrdcode, sptopimg13) {
	var form = document.createElement("form");
	form.action = "reservDetail?sCode=" + 6 + "&rdcode=" + getDrdcode
			+ "&sptopimg13=" + sptopimg13;
	form.method = "post";
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
